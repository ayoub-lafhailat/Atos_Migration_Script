#!/usr/bin/env python3
import argparse
import pyodbc
import mysql.connector
import decimal
import datetime


# ----------------------
# Access connectie
# ----------------------
def connect_access(path):
    conn_str = (
        r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};"
        rf"DBQ={path};"
    )
    return pyodbc.connect(conn_str)


# ----------------------
# MySQL connectie
# ----------------------
def connect_mysql(host, port, db, user, password):
    return mysql.connector.connect(
        host=host,
        port=port,
        database=db,
        user=user,
        password=password,
        charset="utf8mb4",
        use_unicode=True
    )


# ----------------------
# Kolomnamen + types uit Access halen via SELECT
# (om UnicodeDecodeError te voorkomen)
# ----------------------
def get_columns_via_select(access_cursor, table_name):
    """
    Gebruikt SELECT * WHERE 1=0 om kolomnamen + type-info
    uit cursor.description te halen.
    """
    access_cursor.execute(f"SELECT * FROM [{table_name}] WHERE 1=0")
    if not access_cursor.description:
        raise RuntimeError(f"Geen kolominformatie gevonden voor tabel '{table_name}'")

    cols = []
    for d in access_cursor.description:
        # d = (name, type_code, display_size, internal_size, precision, scale, null_ok)
        name = d[0]
        type_code = d[1]
        precision = d[4]
        scale = d[5]

        cols.append({
            "name": name,
            "type_code": type_code,
            "precision": precision,
            "scale": scale,
        })
    return cols


def infer_mysql_type(col):
    """
    Probeer MySQL type te raden op basis van type_code.
    Valt terug op TEXT als we het niet weten.
    """
    t = col["type_code"]
    precision = col["precision"]
    scale = col["scale"]

    # Bij veel drivers is type_code een Python type (int, str, float, datetime, Decimal, bool)
    if t in (int,):
        return "INT"
    if t in (float,):
        return "DOUBLE"
    if t in (bool,):
        return "TINYINT(1)"
    if t in (decimal.Decimal,):
        # gebruik precision/scale als die bestaan
        p = precision if precision and precision > 0 else 18
        s = scale if scale and scale >= 0 else 2
        return f"DECIMAL({p},{s})"
    if t in (datetime.date, datetime.datetime):
        return "DATETIME"
    if t in (str,):
        # simpele safe keuze
        return "TEXT"

    # fallback als we type niet herkennen
    return "TEXT"


# ----------------------
# Maak MySQL tabel aan
# ----------------------
def create_mysql_table(mysql_conn, columns, table_name):
    cursor = mysql_conn.cursor()

    col_defs = []
    for col in columns:
        name = col["name"]
        mysql_type = infer_mysql_type(col)
        col_defs.append(f"`{name}` {mysql_type}")

    create_sql = f"""
    CREATE TABLE IF NOT EXISTS `{table_name}` (
        {", ".join(col_defs)}
    );
    """

    cursor.execute(create_sql)
    mysql_conn.commit()
    print(f"[INFO] Tabel '{table_name}' aangemaakt of bestond al.")
    print(f"[INFO] Kolommen: {', '.join(c['name'] + ' (' + infer_mysql_type(c) + ')' for c in columns)}")


# ----------------------
# Data kopiëren
# ----------------------
def copy_data(access_conn, mysql_conn, table_name, columns):
    access_cursor = access_conn.cursor()
    mysql_cursor = mysql_conn.cursor()

    column_names = [c["name"] for c in columns]

    select_sql = f"SELECT {', '.join('[' + c + ']' for c in column_names)} FROM [{table_name}]"
    insert_sql = (
        f"INSERT INTO `{table_name}` "
        f"({', '.join('`' + c + '`' for c in column_names)}) "
        f"VALUES ({', '.join(['%s'] * len(column_names))})"
    )

    print(f"[INFO] Select query: {select_sql}")
    access_cursor.execute(select_sql)
    rows = access_cursor.fetchall()

    print(f"[INFO] {len(rows)} rijen gevonden in Access...")

    if not rows:
        print("[WARN] Geen rijen om te kopiëren.")
        return

    # Beter performance met executemany
    mysql_cursor.executemany(insert_sql, [tuple(r) for r in rows])
    mysql_conn.commit()

    print(f"[INFO] {len(rows)} rijen succesvol naar MySQL gekopieerd.")


# ----------------------
# Main migratie
# ----------------------
def migrate(access_file, table_name, mysql_host, mysql_port, mysql_db, mysql_user, mysql_password):
    print(f"[INFO] Verbindt met Access: {access_file}")
    access_conn = connect_access(access_file)
    access_cursor = access_conn.cursor()

    print(f"[INFO] Verbindt met MySQL")
    mysql_conn = connect_mysql(mysql_host, mysql_port, mysql_db, mysql_user, mysql_password)

    print(f"[INFO] Lees kolominformatie voor tabel '{table_name}' (via SELECT)")
    columns = get_columns_via_select(access_cursor, table_name)

    create_mysql_table(mysql_conn, columns, table_name)
    copy_data(access_conn, mysql_conn, table_name, columns)

    access_conn.close()
    mysql_conn.close()
    print("[DONE] Migratie voltooid.")


# ----------------------
# CLI arguments
# ----------------------
def main():
    parser = argparse.ArgumentParser(description="Migreer alleen de Klant-tabel van Access naar MySQL.")
    parser.add_argument("--access-file", required=True)
    parser.add_argument("--table-name", default="Klant")
    parser.add_argument("--mysql-host", default="localhost")
    parser.add_argument("--mysql-port", default=3306, type=int)
    parser.add_argument("--mysql-db", required=True)
    parser.add_argument("--mysql-user", required=True)
    parser.add_argument("--mysql-password", required=True)

    args = parser.parse_args()

    migrate(
        access_file=args.access_file,
        table_name=args.table_name,
        mysql_host=args.mysql_host,
        mysql_port=args.mysql_port,
        mysql_db=args.mysql_db,
        mysql_user=args.mysql_user,
        mysql_password=args.mysql_password,
    )


if __name__ == "__main__":
    main()
