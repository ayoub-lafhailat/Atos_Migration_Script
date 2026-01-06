#!/usr/bin/env python3
import argparse
import pyodbc
import mysql.connector
from mysql.connector import errorcode
import os
from glob import glob

# -------------------------------------------------
# Type mapping Access -> MySQL (simpel maar bruikbaar)
# -------------------------------------------------
def map_access_type_to_mysql(col):
    """
    col is een pyodbc.Row uit cursor.columns()
    Belangrijkste attributen:
        col.type_name, col.column_size, col.decimal_digits, col.nullable
    """
    t = (col.type_name or "").upper()
    size = col.column_size or 0
    scale = col.decimal_digits if col.decimal_digits is not None else 0

    # Tekst-types
    if t in ("VARCHAR", "CHAR", "TEXT", "LONGCHAR", "MEMO"):
        if 0 < size <= 65535:
            return f"VARCHAR({size})"
        else:
            return "TEXT"

    # Numeriek
    if t in ("BYTE", "TINYINT"):
        return "TINYINT"
    if t in ("SMALLINT",):
        return "SMALLINT"
    if t in ("INTEGER", "LONG", "COUNTER"):
        # COUNTER (AutoNumber) als gewone INT bewaren
        return "INT"
    if t in ("DOUBLE", "FLOAT", "REAL"):
        return "DOUBLE"
    if t in ("NUMERIC", "DECIMAL", "CURRENCY"):
        if size == 0:
            size = 18
        if scale == 0:
            scale = 2
        return f"DECIMAL({size},{scale})"

    # Datum/tijd
    if "DATE" in t or "TIME" in t:
        return "DATETIME"

    # Boolean
    if t in ("BIT", "YESNO"):
        return "TINYINT(1)"

    # Fallback
    return "TEXT"


def create_mysql_table_for_access_table(access_conn, mysql_conn, table_name, drop_existing=False):
    access_cur = access_conn.cursor()
    mysql_cur = mysql_conn.cursor()

    # Haal kolominformatie op
    columns = list(access_cur.columns(table=table_name))
    if not columns:
        print(f"[WARN] Geen kolommen gevonden voor tabel {table_name}, overslaan.")
        return

    column_defs = []
    for col in columns:
        col_name = col.column_name
        mysql_type = map_access_type_to_mysql(col)
        nullable = "NULL" if (col.nullable or col.nullable is None) else "NOT NULL"
        column_defs.append(f"`{col_name}` {mysql_type} {nullable}")

    if drop_existing:
        print(f"[INFO] DROP TABLE `{table_name}` (als hij bestaat)...")
        mysql_cur.execute(f"DROP TABLE IF EXISTS `{table_name}`;")

    create_sql = f"CREATE TABLE IF NOT EXISTS `{table_name}` (\n  " + ",\n  ".join(column_defs) + "\n);"

    print(f"[INFO] Maak tabel `{table_name}` in MySQL...")
    mysql_cur.execute(create_sql)
    mysql_conn.commit()


def copy_table_data(access_conn, mysql_conn, table_name, batch_size=1000):
    access_cur = access_conn.cursor()
    mysql_cur = mysql_conn.cursor()

    cols = list(access_cur.columns(table=table_name))
    col_names = [c.column_name for c in cols]

    if not col_names:
        print(f"[WARN] Geen kolommen gevonden in {table_name}, overslaan.")
        return

    access_cols_str = ", ".join(f"[{c}]" for c in col_names)
    mysql_cols_str = ", ".join(f"`{c}`" for c in col_names)
    placeholders = ", ".join(["%s"] * len(col_names))

    select_sql = f"SELECT {access_cols_str} FROM [{table_name}]"
    insert_sql = f"INSERT INTO `{table_name}` ({mysql_cols_str}) VALUES ({placeholders})"

    print(f"[INFO] Kopieer data uit `{table_name}`...")
    access_cur.execute(select_sql)

    total = 0
    while True:
        rows = access_cur.fetchmany(batch_size)
        if not rows:
            break
        mysql_cur.executemany(insert_sql, [tuple(r) for r in rows])
        mysql_conn.commit()
        total += len(rows)

    print(f"[INFO] Data kopiëren voor `{table_name}` afgerond, {total} rijen.")


def migrate_single_file(access_file, mysql_conn, only_tables=None, drop_existing=False):
    # -----------------------------
    # 1. Connectie naar Access
    # -----------------------------
    access_conn_str = (
        r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};"
        rf"DBQ={access_file};"
    )

    print(f"\n[===] Migreren van Access-bestand: {access_file}")
    access_conn = pyodbc.connect(access_conn_str)
    access_cur = access_conn.cursor()

    # -----------------------------
    # 2. Alle tabellen ophalen
    # -----------------------------
    print("[INFO] Ophalen lijst met tabellen uit Access...")
    tables = []
    for row in access_cur.tables(tableType='TABLE'):
        tname = row.table_name
        if tname.upper().startswith("MSYS"):
            continue
        tables.append(tname)

    if only_tables:
        tables = [t for t in tables if t in only_tables]

    if not tables:
        print("[WARN] Geen niet-systeemtabellen gevonden in dit bestand.")
        access_conn.close()
        return

    print("[INFO] Tabellen die gemigreerd worden:")
    for t in tables:
        print("   -", t)

    # -----------------------------
    # 3. Per tabel: aanmaken en vullen
    # -----------------------------
    for t in tables:
        create_mysql_table_for_access_table(access_conn, mysql_conn, t, drop_existing=drop_existing)
        copy_table_data(access_conn, mysql_conn, t)

    access_conn.close()
    print(f"[===] Migratie van {access_file} voltooid.\n")


def migrate_folder(folder, mysql_host, mysql_port, mysql_db, mysql_user, mysql_password,
                   only_tables=None, drop_existing=False):
    # -----------------------------
    # MySQL connectie
    # -----------------------------
    print(f"[INFO] Verbinden met MySQL: {mysql_user}@{mysql_host}:{mysql_port}/{mysql_db}")
    mysql_conn = mysql.connector.connect(
        host=mysql_host,
        port=mysql_port,
        user=mysql_user,
        password=mysql_password,
        database=mysql_db,
        charset="utf8mb4",
        use_unicode=True,
    )

    # Alle .mdb en .accdb bestanden in folder
    pattern_mdb = os.path.join(folder, "*.mdb")
    pattern_accdb = os.path.join(folder, "*.accdb")
    files = glob(pattern_mdb) + glob(pattern_accdb)

    if not files:
        print(f"[WARN] Geen .mdb/.accdb bestanden gevonden in map: {folder}")
        mysql_conn.close()
        return

    print("[INFO] Gevonden Access-bestanden:")
    for f in files:
        print("   -", f)

    for f in files:
        migrate_single_file(f, mysql_conn, only_tables=only_tables, drop_existing=drop_existing)

    mysql_conn.close()
    print("[INFO] Alle bestanden zijn gemigreerd.")


def parse_args():
    parser = argparse.ArgumentParser(
        description="Migreer alle MS Access databases (.mdb/.accdb) in een map naar MySQL."
    )
    parser.add_argument("--access-folder", required=True, help="Map waarin de MS Access bestanden staan")
    parser.add_argument("--mysql-host", default="localhost", help="MySQL host (standaard: localhost)")
    parser.add_argument("--mysql-port", default=3306, type=int, help="MySQL port (standaard: 3306)")
    parser.add_argument("--mysql-db", required=True, help="Naam van de MySQL database")
    parser.add_argument("--mysql-user", required=True, help="MySQL gebruikersnaam")
    parser.add_argument("--mysql-password", required=True, help="MySQL wachtwoord")
    parser.add_argument(
        "--only-tables",
        nargs="*",
        help="Optioneel: lijst van specifieke tabellen om te migreren (anders: alle tabellen).",
    )
    parser.add_argument(
        "--drop-existing",
        action="store_true",
        help="Als gezet: drop bestaande tabellen in MySQL voordat ze opnieuw worden aangemaakt."
    )
    return parser.parse_args()


if __name__ == "__main__":
    args = parse_args()
    migrate_folder(
        folder=args.access_folder,
        mysql_host=args.mysql_host,
        mysql_port=args.mysql_port,
        mysql_db=args.mysql_db,
        mysql_user=args.mysql_user,
        mysql_password=args.mysql_password,
        only_tables=args.only_tables,
        drop_existing=args.drop_existing,
    )
