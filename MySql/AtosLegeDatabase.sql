CREATE DATABASE  IF NOT EXISTS `i545709_atosproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `i545709_atosproject`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 192.168.15.55    Database: i545709_atosproject
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `afmeting`
--

DROP TABLE IF EXISTS `afmeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `afmeting` (
  `formaatId` int NOT NULL,
  `formaat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artikel`
--

DROP TABLE IF EXISTS `artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artikel` (
  `Artikel groep` int NOT NULL,
  `Artikelsubgroep` int NOT NULL,
  `Artikelnummer` varchar(20) NOT NULL,
  `Omschrijving` varchar(50) DEFAULT NULL,
  `Omschrijving lang` varchar(255) DEFAULT NULL,
  `Omschrijving voor koppeling` varchar(50) DEFAULT NULL,
  `formaatId` int DEFAULT NULL,
  `mastId` int DEFAULT NULL,
  `Prijs` decimal(65,4) DEFAULT NULL,
  `Actieprijs` decimal(65,4) DEFAULT NULL,
  `inkoopprijs` decimal(65,4) DEFAULT NULL,
  `Webwinkel` varchar(3) DEFAULT NULL,
  `VoorraadArtikel` varchar(25) DEFAULT NULL,
  `Afbeelding` varchar(20) DEFAULT NULL,
  `Aantal` int DEFAULT NULL,
  `Actievan` datetime DEFAULT NULL,
  `Actietot` datetime DEFAULT NULL,
  `Verzendkosten` varchar(5) DEFAULT NULL,
  `DatumWijziging` datetime DEFAULT NULL,
  PRIMARY KEY (`Artikelnummer`),
  KEY `artikel_artikelgroep_FK` (`Artikel groep`),
  KEY `artikel_artikelsubgroep_FK` (`Artikelsubgroep`),
  CONSTRAINT `artikel_artikelgroep_FK` FOREIGN KEY (`Artikel groep`) REFERENCES `artikelgroep` (`Artikel groep`),
  CONSTRAINT `artikel_artikelsubgroep_FK` FOREIGN KEY (`Artikelsubgroep`) REFERENCES `artikelsubgroep` (`Artikelsubgroep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artikelgroep`
--

DROP TABLE IF EXISTS `artikelgroep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artikelgroep` (
  `Artikel groep` int NOT NULL,
  `Omschrijving` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Artikel groep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artikelsubgroep`
--

DROP TABLE IF EXISTS `artikelsubgroep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artikelsubgroep` (
  `Artikelsubgroep` int NOT NULL,
  `Omschrijving` varchar(50) DEFAULT NULL,
  `Sorteervolgorde` int DEFAULT NULL,
  PRIMARY KEY (`Artikelsubgroep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beeldmateriaal`
--

DROP TABLE IF EXISTS `beeldmateriaal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beeldmateriaal` (
  `BeeldmateriaalId` int NOT NULL AUTO_INCREMENT,
  `Beeldmateriaal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BeeldmateriaalId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `betalingsvorm`
--

DROP TABLE IF EXISTS `betalingsvorm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `betalingsvorm` (
  `BetalingsvormId` int NOT NULL,
  `Betalingsvorm` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`BetalingsvormId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brief`
--

DROP TABLE IF EXISTS `brief`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brief` (
  `BriefId` int NOT NULL,
  `KlantId` int NOT NULL,
  `Briefdatum` datetime NOT NULL,
  `BriefTerAttentieVan` varchar(50) DEFAULT NULL,
  `Onderwerp` varchar(50) DEFAULT NULL,
  `BriefText` text,
  `WerknemerId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doeksoort`
--

DROP TABLE IF EXISTS `doeksoort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doeksoort` (
  `DoeksoortId` int NOT NULL,
  `Doeksoort` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `druk type`
--

DROP TABLE IF EXISTS `druk type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `druk type` (
  `typeId` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `typeCode` varchar(2) DEFAULT NULL,
  `marge` double DEFAULT NULL,
  `korting` double DEFAULT NULL,
  `LeverancierId` int DEFAULT NULL,
  PRIMARY KEY (`typeId`),
  KEY `druk_type_leverancier_FK` (`LeverancierId`),
  CONSTRAINT `druk_type_leverancier_FK` FOREIGN KEY (`LeverancierId`) REFERENCES `leverancier` (`LeverancierId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factuur`
--

DROP TABLE IF EXISTS `factuur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factuur` (
  `FactuurId` int NOT NULL,
  `Factuurnummer` int NOT NULL,
  `Order` int DEFAULT NULL,
  `Huurcontract` int DEFAULT NULL,
  `KlantId` int NOT NULL,
  `Factuurdatum` datetime NOT NULL,
  `Vervaldatum` datetime NOT NULL,
  `Betaling` varchar(255) DEFAULT NULL,
  `BTW` double DEFAULT NULL,
  `Geprint` varchar(3) DEFAULT NULL,
  `DigitaalGeprint` varchar(3) DEFAULT NULL,
  `FactuurAdres` varchar(50) DEFAULT NULL,
  `FactuurWoonplaats` varchar(50) DEFAULT NULL,
  `FactuurPostcode` varchar(50) DEFAULT NULL,
  `FactuurContactpersoon` varchar(50) DEFAULT NULL,
  `FactuurNaam` varchar(50) DEFAULT NULL,
  `FactuurReferentie` varchar(50) DEFAULT NULL,
  `FactuurText` varchar(255) DEFAULT NULL,
  `Betaald` varchar(3) DEFAULT NULL,
  `OpenstaandBedrag` decimal(65,4) DEFAULT NULL,
  `E-mail adres` varchar(50) DEFAULT NULL,
  `Contactpersoon` varchar(50) DEFAULT NULL,
  `BTWnummer` varchar(16) DEFAULT NULL,
  `Verstuurd` varchar(3) DEFAULT NULL,
  `HerinneringId` int DEFAULT NULL,
  PRIMARY KEY (`FactuurId`),
  KEY `factuur_herinnering_factuur_FK` (`HerinneringId`,`FactuurId`),
  KEY `factuur_klant_FK` (`KlantId`),
  CONSTRAINT `factuur_klant_FK` FOREIGN KEY (`KlantId`) REFERENCES `klant` (`Klantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factuur regels`
--

DROP TABLE IF EXISTS `factuur regels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factuur regels` (
  `FactuurregelId` int NOT NULL AUTO_INCREMENT,
  `FactuurId` int NOT NULL,
  `Artikelnummer` varchar(20) DEFAULT NULL,
  `Hoeveelheid` smallint NOT NULL,
  `Omschrijving` varchar(70) DEFAULT NULL,
  `Prijs` decimal(65,4) DEFAULT NULL,
  `Sorteervolgorde` int DEFAULT NULL,
  PRIMARY KEY (`FactuurregelId`),
  KEY `factuur_regels_factuur_FK` (`FactuurId`),
  CONSTRAINT `factuur_regels_factuur_FK` FOREIGN KEY (`FactuurId`) REFERENCES `factuur` (`FactuurId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factuur text`
--

DROP TABLE IF EXISTS `factuur text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factuur text` (
  `FactuurTextId` int NOT NULL,
  `FactuurText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FactuurTextId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `herinnering`
--

DROP TABLE IF EXISTS `herinnering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `herinnering` (
  `HerinneringId` int NOT NULL,
  `KlantId` int NOT NULL,
  `BriefTerAttentieVan` varchar(50) DEFAULT NULL,
  `Herinneringdatum` datetime NOT NULL,
  `Onderwerp` varchar(50) DEFAULT NULL,
  `HerinneringText` text,
  `WerknemerId` int NOT NULL,
  `FactuurAdres` varchar(50) DEFAULT NULL,
  `FactuurWoonplaats` varchar(50) DEFAULT NULL,
  `FactuurPostcode` varchar(50) DEFAULT NULL,
  `FactuurNaam` varchar(50) DEFAULT NULL,
  `E-mail adres` varchar(50) DEFAULT NULL,
  `FactuurId` int DEFAULT NULL,
  PRIMARY KEY (`HerinneringId`),
  KEY `herinnering_factuur_FK` (`FactuurId`),
  KEY `herinnering_werknemers_FK` (`WerknemerId`),
  KEY `herinnering_klant_FK` (`KlantId`),
  CONSTRAINT `herinnering_klant_FK` FOREIGN KEY (`KlantId`) REFERENCES `klant` (`Klantid`),
  CONSTRAINT `herinnering_werknemers_FK` FOREIGN KEY (`WerknemerId`) REFERENCES `werknemers` (`WerknemerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `herinnering factuur`
--

DROP TABLE IF EXISTS `herinnering factuur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `herinnering factuur` (
  `HerinneringId` int NOT NULL,
  `FactuurId` int NOT NULL,
  `OpenstaandBedrag` decimal(65,4) DEFAULT NULL,
  `FactuurBedrag` decimal(65,4) DEFAULT NULL,
  PRIMARY KEY (`HerinneringId`,`FactuurId`),
  KEY `herinnering_factuur_factuur_FK` (`FactuurId`),
  CONSTRAINT `herinnering_factuur_factuur_FK` FOREIGN KEY (`FactuurId`) REFERENCES `factuur` (`FactuurId`),
  CONSTRAINT `herinnering_factuur_herinnering_FK` FOREIGN KEY (`HerinneringId`) REFERENCES `herinnering` (`HerinneringId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `herinnering text`
--

DROP TABLE IF EXISTS `herinnering text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `herinnering text` (
  `HerinneringTextId` int NOT NULL,
  `HerinneringText` varchar(255) DEFAULT NULL,
  `HerinneringTextBrief` text,
  PRIMARY KEY (`HerinneringTextId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `huurcontract`
--

DROP TABLE IF EXISTS `huurcontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huurcontract` (
  `HuurcontractId` int NOT NULL,
  `KlantId` int NOT NULL,
  `Huren vanaf` datetime NOT NULL,
  `Huren tot` datetime NOT NULL,
  `Orderdatum` datetime NOT NULL,
  `Acceptatie` varchar(255) DEFAULT NULL,
  `BTW` double DEFAULT NULL,
  `Betaling` varchar(255) DEFAULT NULL,
  `Bijzonderheden` varchar(50) DEFAULT NULL,
  `Notities` text,
  `Geprint` varchar(3) DEFAULT NULL,
  `Afgeleverd` varchar(255) DEFAULT NULL,
  `Gefactureerd` varchar(15) DEFAULT NULL,
  `AfleverAdres` varchar(50) DEFAULT NULL,
  `AfleverWoonplaats` varchar(50) DEFAULT NULL,
  `AfleverPostcode` varchar(50) DEFAULT NULL,
  `AfleverContactpersoon` varchar(50) DEFAULT NULL,
  `AfleverTelefoon` varchar(15) DEFAULT NULL,
  `AfleverNaam` varchar(50) DEFAULT NULL,
  `Offerte info` text,
  `WerknemerId` int NOT NULL,
  `E-mail adres` varchar(50) DEFAULT NULL,
  `Contactpersoon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`HuurcontractId`),
  KEY `huurcontract_werknemers_FK` (`WerknemerId`),
  KEY `huurcontract_klant_FK` (`KlantId`),
  CONSTRAINT `huurcontract_klant_FK` FOREIGN KEY (`KlantId`) REFERENCES `klant` (`Klantid`),
  CONSTRAINT `huurcontract_werknemers_FK` FOREIGN KEY (`WerknemerId`) REFERENCES `werknemers` (`WerknemerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `huurcontract regels`
--

DROP TABLE IF EXISTS `huurcontract regels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huurcontract regels` (
  `HuurcontractRegelId` int NOT NULL,
  `HuurcontractId` int NOT NULL,
  `Artikelnummer` varchar(20) DEFAULT NULL,
  `Omschrijving` varchar(50) DEFAULT NULL,
  `Hoeveelheid` smallint NOT NULL,
  `Prijs` decimal(65,4) DEFAULT NULL,
  `Notities` text,
  `Sorteervolgorde` int DEFAULT NULL,
  PRIMARY KEY (`HuurcontractRegelId`),
  KEY `huurcontract_regels_huurcontract_FK` (`HuurcontractId`),
  CONSTRAINT `huurcontract_regels_huurcontract_FK` FOREIGN KEY (`HuurcontractId`) REFERENCES `huurcontract` (`HuurcontractId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `internetofferte`
--

DROP TABLE IF EXISTS `internetofferte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internetofferte` (
  `OfferteId` int NOT NULL,
  `KlantId` int NOT NULL,
  `WerknemerId` int DEFAULT NULL,
  `Datum offerte` timestamp NULL DEFAULT NULL,
  `Afwerking` varchar(50) DEFAULT NULL,
  `Verpakking` varchar(50) DEFAULT NULL,
  `Levertijd` varchar(50) DEFAULT NULL,
  `Geprint` varchar(3) DEFAULT NULL,
  `Bijzonderheden` varchar(255) DEFAULT NULL,
  `E-mail adres` varchar(50) DEFAULT NULL,
  `Betaling` varchar(255) DEFAULT NULL,
  `Contactpersoon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `internetofferteregels`
--

DROP TABLE IF EXISTS `internetofferteregels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internetofferteregels` (
  `OfferteRegelId` int NOT NULL,
  `OfferteId` int NOT NULL,
  `Hoogte` double DEFAULT NULL,
  `Breedte` double DEFAULT NULL,
  `Aantal` smallint NOT NULL,
  `Stuksprijs` decimal(65,4) DEFAULT NULL,
  `Omschrijving` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kiezen`
--

DROP TABLE IF EXISTS `kiezen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kiezen` (
  `Kiezen` varchar(3) NOT NULL,
  PRIMARY KEY (`Kiezen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kiezenii`
--

DROP TABLE IF EXISTS `kiezenii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kiezenii` (
  `Kiezen` varchar(15) NOT NULL,
  PRIMARY KEY (`Kiezen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `klant`
--

DROP TABLE IF EXISTS `klant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klant` (
  `Klantid` int NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) DEFAULT NULL,
  `Adres` varchar(50) DEFAULT NULL,
  `Woonplaats` varchar(50) DEFAULT NULL,
  `Postcode` varchar(50) DEFAULT NULL,
  `Telefoon` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `E-mail adres` varchar(50) DEFAULT NULL,
  `Contactpersoon` varchar(50) DEFAULT NULL,
  `BTWnummer` varchar(16) DEFAULT NULL,
  `Notities` text,
  `Debiteurnummer` smallint DEFAULT NULL,
  `FactuurNaam` varchar(50) DEFAULT NULL,
  `FactuurAdres` varchar(50) DEFAULT NULL,
  `FactuurWoonplaats` varchar(50) DEFAULT NULL,
  `FactuurPostcode` varchar(50) DEFAULT NULL,
  `FactuurContactpersoon` varchar(50) DEFAULT NULL,
  `NotitiesContactpersoon` text,
  `GevondenIn` varchar(50) DEFAULT NULL,
  `FactuurEmail` varchar(50) DEFAULT NULL,
  `Geblokkeerd` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`Klantid`)
) ENGINE=InnoDB AUTO_INCREMENT=37385 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leverancier`
--

DROP TABLE IF EXISTS `leverancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leverancier` (
  `LeverancierId` int NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) DEFAULT NULL,
  `Adres` varchar(50) DEFAULT NULL,
  `Woonplaats` varchar(50) DEFAULT NULL,
  `Postcode` varchar(50) DEFAULT NULL,
  `Telefoon` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `E-mail adres` varchar(50) DEFAULT NULL,
  `Contactpersoon` varchar(50) DEFAULT NULL,
  `Notities` text,
  PRIMARY KEY (`LeverancierId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `levering`
--

DROP TABLE IF EXISTS `levering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levering` (
  `LeveringId` int NOT NULL AUTO_INCREMENT,
  `Levering` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LeveringId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `levertijd`
--

DROP TABLE IF EXISTS `levertijd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levertijd` (
  `LevertijdId` int NOT NULL,
  `Levertijd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LevertijdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mast stok lengte`
--

DROP TABLE IF EXISTS `mast stok lengte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mast stok lengte` (
  `mastId` int NOT NULL,
  `lengte` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `my company information`
--

DROP TABLE IF EXISTS `my company information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my company information` (
  `SetupID` int NOT NULL,
  `SalesTaxRate` double DEFAULT NULL,
  `CompanyName` varchar(50) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `StateOrProvince` varchar(20) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(30) DEFAULT NULL,
  `FaxNumber` varchar(30) DEFAULT NULL,
  `e-mail adres` varchar(255) DEFAULT NULL,
  `DefaultInvoiceDescription` text,
  `Factuurnummer` int DEFAULT NULL,
  `KassaBonnummer` int DEFAULT NULL,
  PRIMARY KEY (`SetupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order bedrukte vlaggen`
--

DROP TABLE IF EXISTS `order bedrukte vlaggen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order bedrukte vlaggen` (
  `OrderId` int NOT NULL AUTO_INCREMENT,
  `Ordernummer` varchar(10) DEFAULT NULL,
  `Orderdatum` datetime DEFAULT NULL,
  `Afleverdatum` datetime DEFAULT NULL,
  `Produktiedatum` datetime DEFAULT NULL,
  `KlantId` int NOT NULL,
  `LeverancierId` int NOT NULL,
  `NaamVlag` varchar(60) DEFAULT NULL,
  `Materiaal` varchar(60) DEFAULT NULL,
  `Afwerking` varchar(255) DEFAULT NULL,
  `Betaling` varchar(255) DEFAULT NULL,
  `Bevestiging` varchar(255) DEFAULT NULL,
  `Verpakking` varchar(60) DEFAULT NULL,
  `Beeldmateriaal` varchar(50) DEFAULT NULL,
  `PrijsopgaveId` int DEFAULT NULL,
  `HerhaalOrderId` int DEFAULT NULL,
  `Notities` text,
  `Notities inkoop` text,
  `Bijzonderheden` varchar(50) DEFAULT NULL,
  `Geprint` varchar(3) DEFAULT NULL,
  `Produktie klaar` varchar(3) DEFAULT NULL,
  `Afgeleverd` varchar(3) DEFAULT NULL,
  `Gefactureerd` varchar(15) DEFAULT NULL,
  `WerknemerId` int NOT NULL,
  `LokatieVlag` varchar(255) DEFAULT NULL,
  `Label` varchar(5) DEFAULT NULL,
  `Levering` varchar(50) DEFAULT NULL,
  `Sticker` varchar(50) DEFAULT NULL,
  `E-mail adres` varchar(50) DEFAULT NULL,
  `Contactpersoon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `order_bedrukte_vlaggen_klant_FK` (`KlantId`),
  CONSTRAINT `order_bedrukte_vlaggen_klant_FK` FOREIGN KEY (`KlantId`) REFERENCES `klant` (`Klantid`)
) ENGINE=InnoDB AUTO_INCREMENT=28831 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order bedrukte vlaggen regels`
--

DROP TABLE IF EXISTS `order bedrukte vlaggen regels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order bedrukte vlaggen regels` (
  `OrderRegelId` int NOT NULL AUTO_INCREMENT,
  `OrderId` int NOT NULL,
  `Formaat` varchar(255) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Kleuren` varchar(255) DEFAULT NULL,
  `Afbeelding` varchar(60) DEFAULT NULL,
  `Hoeveelheid` smallint NOT NULL,
  `Prijs` decimal(65,4) DEFAULT NULL,
  `Inkoopprijs` decimal(65,4) DEFAULT NULL,
  `BTW` double DEFAULT NULL,
  `Notities` text,
  `ExtraLevering` varchar(70) DEFAULT NULL,
  `ExtraLeveringPrijs` decimal(65,4) DEFAULT NULL,
  PRIMARY KEY (`OrderRegelId`),
  KEY `order_bedrukte_vlaggen_regels_order_bedrukte_vlaggen_FK` (`OrderId`),
  CONSTRAINT `order_bedrukte_vlaggen_regels_order_bedrukte_vlaggen_FK` FOREIGN KEY (`OrderId`) REFERENCES `order bedrukte vlaggen` (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=28327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order betaling`
--

DROP TABLE IF EXISTS `order betaling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order betaling` (
  `BetalingId` int NOT NULL AUTO_INCREMENT,
  `Betaling` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BetalingId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order bevestiging`
--

DROP TABLE IF EXISTS `order bevestiging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order bevestiging` (
  `BevestigingId` int NOT NULL AUTO_INCREMENT,
  `Bevestiging` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BevestigingId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order vlaggen en masten`
--

DROP TABLE IF EXISTS `order vlaggen en masten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order vlaggen en masten` (
  `OrderId` int NOT NULL AUTO_INCREMENT,
  `Ordernummer` varchar(10) DEFAULT NULL,
  `Orderdatum` datetime DEFAULT NULL,
  `Afleverdatum` datetime NOT NULL,
  `KlantId` int NOT NULL,
  `Betaling` varchar(255) DEFAULT NULL,
  `Bevestiging` varchar(255) DEFAULT NULL,
  `PrijsopgaveId` int DEFAULT NULL,
  `BTW` double DEFAULT NULL,
  `Bijzonderheden` varchar(50) DEFAULT NULL,
  `Notities` text,
  `Geprint` varchar(3) DEFAULT NULL,
  `Afgeleverd` varchar(255) DEFAULT NULL,
  `Gefactureerd` varchar(15) DEFAULT NULL,
  `AfleverAdres` varchar(50) DEFAULT NULL,
  `AfleverWoonplaats` varchar(50) DEFAULT NULL,
  `AfleverPostcode` varchar(50) DEFAULT NULL,
  `AfleverContactpersoon` varchar(50) DEFAULT NULL,
  `AfleverTelefoon` varchar(15) DEFAULT NULL,
  `AfleverNaam` varchar(50) DEFAULT NULL,
  `WerknemerId` int NOT NULL,
  `E-mail adres` varchar(50) DEFAULT NULL,
  `Contactpersoon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `order_vlaggen_en_masten_klant_FK` (`KlantId`),
  CONSTRAINT `order_vlaggen_en_masten_klant_FK` FOREIGN KEY (`KlantId`) REFERENCES `klant` (`Klantid`)
) ENGINE=InnoDB AUTO_INCREMENT=29608 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order vlaggen en masten regels`
--

DROP TABLE IF EXISTS `order vlaggen en masten regels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order vlaggen en masten regels` (
  `OrderRegelId` int NOT NULL AUTO_INCREMENT,
  `OrderId` int NOT NULL,
  `Artikelnummer` varchar(20) DEFAULT NULL,
  `Omschrijving` varchar(50) DEFAULT NULL,
  `Hoeveelheid` smallint NOT NULL,
  `Prijs` decimal(65,4) DEFAULT NULL,
  `Inkoopprijs` decimal(65,4) DEFAULT NULL,
  `Notities` text,
  `Sorteervolgorde` int DEFAULT NULL,
  PRIMARY KEY (`OrderRegelId`),
  KEY `order_vlaggen_en_masten_regels_order_vlaggen_en_masten_FK` (`OrderId`),
  CONSTRAINT `order_vlaggen_en_masten_regels_order_vlaggen_en_masten_FK` FOREIGN KEY (`OrderId`) REFERENCES `order vlaggen en masten` (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=113792 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prijslijst`
--

DROP TABLE IF EXISTS `prijslijst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prijslijst` (
  `formaatId` int NOT NULL,
  `hoeveelheid` smallint NOT NULL,
  `typeid` int NOT NULL,
  `kleuren` double NOT NULL,
  `prijs` decimal(65,4) DEFAULT NULL,
  `artikelCode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prijsopgavebedrukt vlaggenregels`
--

DROP TABLE IF EXISTS `prijsopgavebedrukt vlaggenregels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prijsopgavebedrukt vlaggenregels` (
  `PrijsopgaveRegelId` int NOT NULL AUTO_INCREMENT,
  `PrijsopgaveId` int DEFAULT NULL,
  `formaat` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `kleuren` varchar(6) DEFAULT NULL,
  `hoeveelheid` smallint NOT NULL,
  `prijs` decimal(65,4) DEFAULT NULL,
  `inkoopprijs` decimal(65,4) DEFAULT NULL,
  PRIMARY KEY (`PrijsopgaveRegelId`),
  KEY `prijsopgavebedrukt_vlaggenregels_prijsopgavebedrukte_vlaggen_FK` (`PrijsopgaveId`),
  CONSTRAINT `prijsopgavebedrukt_vlaggenregels_prijsopgavebedrukte_vlaggen_FK` FOREIGN KEY (`PrijsopgaveId`) REFERENCES `prijsopgavebedrukte vlaggen` (`PrijsopgaveId`)
) ENGINE=InnoDB AUTO_INCREMENT=58980 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prijsopgavebedrukte vlaggen`
--

DROP TABLE IF EXISTS `prijsopgavebedrukte vlaggen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prijsopgavebedrukte vlaggen` (
  `PrijsopgaveId` int NOT NULL AUTO_INCREMENT,
  `Afwerking` varchar(50) DEFAULT NULL,
  `Bijzonderheden` varchar(50) DEFAULT NULL,
  `Datum prijsopgave` datetime DEFAULT NULL,
  `KlantId` int NOT NULL,
  `Levertijd` varchar(50) DEFAULT NULL,
  `Materiaal` varchar(50) DEFAULT NULL,
  `Verpakking` varchar(50) DEFAULT NULL,
  `WerknemerId` int NOT NULL,
  `BTW` double DEFAULT NULL,
  `Notities` text,
  `Geprint` varchar(3) DEFAULT NULL,
  `Offerte info` text,
  `E-mail adres` varchar(50) DEFAULT NULL,
  `Contactpersoon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PrijsopgaveId`),
  KEY `prijsopgavebedrukte_vlaggen_klant_FK` (`KlantId`),
  KEY `prijsopgavebedrukte_vlaggen_werknemers_FK` (`WerknemerId`),
  CONSTRAINT `prijsopgavebedrukte_vlaggen_klant_FK` FOREIGN KEY (`KlantId`) REFERENCES `klant` (`Klantid`),
  CONSTRAINT `prijsopgavebedrukte_vlaggen_werknemers_FK` FOREIGN KEY (`WerknemerId`) REFERENCES `werknemers` (`WerknemerId`)
) ENGINE=InnoDB AUTO_INCREMENT=18140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prijsopgavevlaggenenmasten`
--

DROP TABLE IF EXISTS `prijsopgavevlaggenenmasten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prijsopgavevlaggenenmasten` (
  `PrijsopgaveId` int NOT NULL AUTO_INCREMENT,
  `Bijzonderheden` varchar(50) DEFAULT NULL,
  `Datum prijsopgave` datetime DEFAULT NULL,
  `KlantId` int NOT NULL,
  `Levertijd` varchar(50) DEFAULT NULL,
  `BTW` double DEFAULT NULL,
  `WerknemerId` int NOT NULL,
  `Notities` text,
  `Geprint` varchar(3) DEFAULT NULL,
  `Offerte info` text,
  `E-mail adres` varchar(50) DEFAULT NULL,
  `Contactpersoon` varchar(50) DEFAULT NULL,
  `Template` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`PrijsopgaveId`),
  KEY `prijsopgavevlaggenenmasten_werknemers_FK` (`WerknemerId`),
  KEY `prijsopgavevlaggenenmasten_klant_FK` (`KlantId`),
  CONSTRAINT `prijsopgavevlaggenenmasten_klant_FK` FOREIGN KEY (`KlantId`) REFERENCES `klant` (`Klantid`),
  CONSTRAINT `prijsopgavevlaggenenmasten_werknemers_FK` FOREIGN KEY (`WerknemerId`) REFERENCES `werknemers` (`WerknemerId`)
) ENGINE=InnoDB AUTO_INCREMENT=16423 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prijsopgavevlaggenenmastenregels`
--

DROP TABLE IF EXISTS `prijsopgavevlaggenenmastenregels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prijsopgavevlaggenenmastenregels` (
  `PrijsopgaveRegelId` int NOT NULL AUTO_INCREMENT,
  `PrijsopgaveId` int DEFAULT NULL,
  `Hoeveelheid` smallint NOT NULL,
  `Prijs` decimal(65,4) DEFAULT NULL,
  `Artikelnummer` varchar(20) DEFAULT NULL,
  `Omschrijving` varchar(50) DEFAULT NULL,
  `inkoopprijs` decimal(65,4) DEFAULT NULL,
  `Sorteervolgorde` int DEFAULT NULL,
  PRIMARY KEY (`PrijsopgaveRegelId`),
  KEY `prijsopgavevlaggenenmastenregels_prijsopgavevlaggenenmasten_FK` (`PrijsopgaveId`),
  CONSTRAINT `prijsopgavevlaggenenmastenregels_prijsopgavevlaggenenmasten_FK` FOREIGN KEY (`PrijsopgaveId`) REFERENCES `prijsopgavevlaggenenmasten` (`PrijsopgaveId`)
) ENGINE=InnoDB AUTO_INCREMENT=103037 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referentie text`
--

DROP TABLE IF EXISTS `referentie text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referentie text` (
  `referentieId` int NOT NULL AUTO_INCREMENT,
  `referentieText` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`referentieId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sticker`
--

DROP TABLE IF EXISTS `sticker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sticker` (
  `StickerId` int NOT NULL AUTO_INCREMENT,
  `Sticker` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StickerId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transactie`
--

DROP TABLE IF EXISTS `transactie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactie` (
  `TransactieId` int NOT NULL,
  `TransactieDatum` datetime DEFAULT NULL,
  `TransactieBedrag` decimal(65,4) DEFAULT NULL,
  `Kassabonnummer` int DEFAULT NULL,
  `Beschrijving` varchar(255) DEFAULT NULL,
  `BetalingsvormId` int NOT NULL,
  `OrderIdVlaggenenMasten` int DEFAULT NULL,
  `OrderIdBedrukteVlaggen` int DEFAULT NULL,
  `FactuurId` int DEFAULT NULL,
  `HuurcontractId` int DEFAULT NULL,
  `WinkelVerkoopId` int DEFAULT NULL,
  `WerknemerId` int NOT NULL,
  `Verwerkt` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`TransactieId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vlag afwerking`
--

DROP TABLE IF EXISTS `vlag afwerking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vlag afwerking` (
  `AfwerkingId` int NOT NULL AUTO_INCREMENT,
  `Afwerking` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AfwerkingId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vlag formaat`
--

DROP TABLE IF EXISTS `vlag formaat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vlag formaat` (
  `formaatId` int NOT NULL AUTO_INCREMENT,
  `formaat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`formaatId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vlag materiaal`
--

DROP TABLE IF EXISTS `vlag materiaal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vlag materiaal` (
  `MateriaalId` int NOT NULL AUTO_INCREMENT,
  `Materiaal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MateriaalId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vlag verpakking`
--

DROP TABLE IF EXISTS `vlag verpakking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vlag verpakking` (
  `VerpakkingId` int NOT NULL AUTO_INCREMENT,
  `Verpakking` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`VerpakkingId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voorraad text`
--

DROP TABLE IF EXISTS `voorraad text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voorraad text` (
  `VoorraadTextId` int NOT NULL,
  `VoorraadText` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `werknemers`
--

DROP TABLE IF EXISTS `werknemers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `werknemers` (
  `WerknemerId` int NOT NULL,
  `Werknemer` varchar(50) DEFAULT NULL,
  `Ondergetekende` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `PHC` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `FirstTimeLoggingIn` binary(1) DEFAULT NULL,
  PRIMARY KEY (`WerknemerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `winkelverkoop`
--

DROP TABLE IF EXISTS `winkelverkoop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `winkelverkoop` (
  `WinkelVerkoopId` int NOT NULL,
  `DatumWinkelverkoop` datetime NOT NULL,
  `Kassabonnummer` int DEFAULT NULL,
  `Referentie` varchar(50) DEFAULT NULL,
  `Notities` text,
  `KlantId` int NOT NULL,
  `Naam` varchar(50) DEFAULT NULL,
  `Adres` varchar(50) DEFAULT NULL,
  `Woonplaats` varchar(50) DEFAULT NULL,
  `Postcode` varchar(50) DEFAULT NULL,
  `Geprint` varchar(3) DEFAULT NULL,
  `Betalingsvorm` varchar(50) DEFAULT NULL,
  `Werknemer` varchar(50) DEFAULT NULL,
  `BTW` double DEFAULT NULL,
  PRIMARY KEY (`WinkelVerkoopId`),
  KEY `winkelverkoop_klant_FK` (`KlantId`),
  CONSTRAINT `winkelverkoop_klant_FK` FOREIGN KEY (`KlantId`) REFERENCES `klant` (`Klantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `winkelverkoopregels`
--

DROP TABLE IF EXISTS `winkelverkoopregels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `winkelverkoopregels` (
  `WinkelVerkoopRegelId` int NOT NULL,
  `WinkelVerkoopId` int NOT NULL,
  `Artikelnummer` varchar(20) DEFAULT NULL,
  `Hoeveelheid` smallint NOT NULL,
  `Omschrijving` varchar(60) DEFAULT NULL,
  `Prijs` decimal(65,4) DEFAULT NULL,
  `Sorteervolgorde` int DEFAULT NULL,
  PRIMARY KEY (`WinkelVerkoopRegelId`),
  KEY `winkelverkoopregels_winkelverkoop_FK` (`WinkelVerkoopId`),
  CONSTRAINT `winkelverkoopregels_winkelverkoop_FK` FOREIGN KEY (`WinkelVerkoopId`) REFERENCES `winkelverkoop` (`WinkelVerkoopId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-06  0:44:31
