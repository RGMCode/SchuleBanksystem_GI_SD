-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 13. Feb 2023 um 08:24
-- Server-Version: 8.0.32
-- PHP-Version: 8.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `bank`
--
CREATE DATABASE IF NOT EXISTS `bank` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `bank`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `AccountID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `Balance` decimal(10,0) NOT NULL,
  `Dispositions` decimal(10,0) NOT NULL,
  `AccountTypID` int NOT NULL,
  `AccStatusID` int NOT NULL,
  `CardID` int NOT NULL,
  `IBAN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `account`
--

TRUNCATE TABLE `account`;
--
-- Daten für Tabelle `account`
--

INSERT DELAYED IGNORE INTO `account` (`AccountID`, `CustomerID`, `Balance`, `Dispositions`, `AccountTypID`, `AccStatusID`, `CardID`, `IBAN`) VALUES
(1, 1, '73740', '500', 1, 1, 1, 'US1234567890123456789'),
(2, 2, '39550', '700', 2, 1, 2, 'GB2345678901234567890'),
(3, 3, '35948', '800', 3, 2, 3, 'FR3456789012345678901'),
(4, 4, '62081', '900', 1, 3, 4, 'DE4567890123456789012'),
(5, 5, '61839', '1000', 2, 1, 5, 'IT5678901234567890123'),
(6, 6, '4782', '1200', 3, 2, 6, 'NL6789012345678901234'),
(7, 7, '99073', '1300', 1, 1, 7, 'RU7890123456789012345'),
(8, 8, '61296', '1400', 2, 2, 8, 'NO8901234567890123456'),
(9, 9, '370', '1500', 3, 3, 9, 'CA9012345678901234567'),
(10, 10, '52205', '1700', 1, 1, 10, 'IE0123456789012345678');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounttyp`
--

DROP TABLE IF EXISTS `accounttyp`;
CREATE TABLE `accounttyp` (
  `AccountTypID` int NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `accounttyp`
--

TRUNCATE TABLE `accounttyp`;
--
-- Daten für Tabelle `accounttyp`
--

INSERT DELAYED IGNORE INTO `accounttyp` (`AccountTypID`, `Description`) VALUES
(1, 'Girokonto'),
(2, 'Sparkonto'),
(3, 'Festgeldkonto'),
(4, 'Aktienkonto'),
(5, 'Währungskonto'),
(6, 'Kreditkonto'),
(7, 'Baufinanzierung'),
(8, 'Versicherung'),
(9, 'Altersvorsorge'),
(10, 'Investmentfonds');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accstatus`
--

DROP TABLE IF EXISTS `accstatus`;
CREATE TABLE `accstatus` (
  `AccStatusID` int NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `accstatus`
--

TRUNCATE TABLE `accstatus`;
--
-- Daten für Tabelle `accstatus`
--

INSERT DELAYED IGNORE INTO `accstatus` (`AccStatusID`, `Description`) VALUES
(1, 'aktiv'),
(2, 'gesperrt'),
(3, 'überziehung'),
(4, 'beendet'),
(5, 'ruhend'),
(6, 'verzögert'),
(7, 'offen'),
(8, 'in Bearbeitung'),
(9, 'abgelehnt');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `acctypstaff`
--

DROP TABLE IF EXISTS `acctypstaff`;
CREATE TABLE `acctypstaff` (
  `AccTypStaffID` int NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `acctypstaff`
--

TRUNCATE TABLE `acctypstaff`;
--
-- Daten für Tabelle `acctypstaff`
--

INSERT DELAYED IGNORE INTO `acctypstaff` (`AccTypStaffID`, `Description`) VALUES
(1, 'Mitarbeiter'),
(2, 'Manager'),
(3, 'Entwickler'),
(4, 'Admin');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bank`
--

DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `BankID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `BIC` varchar(255) NOT NULL,
  `CityID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `bank`
--

TRUNCATE TABLE `bank`;
--
-- Daten für Tabelle `bank`
--

INSERT DELAYED IGNORE INTO `bank` (`BankID`, `Name`, `BIC`, `CityID`) VALUES
(1, 'Dietrich Bonhoeffer Bank', 'DBBGER1N', 1),
(2, 'Barclays', 'BARCGB22', 2),
(3, 'Crédit Agricole', 'AGRIFRPP', 3),
(4, 'Deutsche Bank', 'DEUTDEFF', 4),
(5, 'Mitsubishi UFJ Financial Group', 'BOTKJPJT', 5),
(6, 'Westpac', 'WPACAU2S', 6),
(7, 'Sberbank', 'SBRFRUMM', 7),
(8, 'Industrial and Commercial Bank of China', 'ICBKCNBJ', 8),
(9, 'Royal Bank of Canada', 'ROYCCAT2', 9),
(10, 'Unicredit', 'UNCRITMM', 10),
(11, 'Bank of America', 'BOFAUS3N', 11);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `CardID` int NOT NULL,
  `CardTyp` varchar(255) NOT NULL,
  `ValidityDate` datetime NOT NULL,
  `Cardnumber` varchar(255) NOT NULL,
  `Serial` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `card`
--

TRUNCATE TABLE `card`;
--
-- Daten für Tabelle `card`
--

INSERT DELAYED IGNORE INTO `card` (`CardID`, `CardTyp`, `ValidityDate`, `Cardnumber`, `Serial`) VALUES
(1, 'Visa', '2025-06-01', '1234567890123456', 'A1B2C3D4E5'),
(2, 'Mastercard', '2024-12-31', '2345678901234567', 'B2C3D4E5F6'),
(3, 'American Express', '2024-08-15', '3456789012345678', 'C3D4E5F6G7'),
(4, 'Visa', '2025-02-01', '4567890123456789', 'D4E5F6G7H8'),
(5, 'Mastercard', '2024-09-01', '5678901234567890', 'E5F6G7H8I9'),
(6, 'American Express', '2024-06-01', '6789012345678901', 'F6G7H8I9J0'),
(7, 'Visa', '2025-01-01', '7890123456789012', 'G7H8I9J0K1'),
(8, 'Mastercard', '2024-12-01', '8901234567890123', 'H8I9J0K1L2'),
(9, 'American Express', '2024-07-01', '9012345678901234', 'I9J0K1L2M3'),
(10, 'Visa', '2025-05-01', '0123456789012345', 'J0K1L2M3N4');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `CityID` int NOT NULL,
  `ZIP` int NOT NULL,
  `City` varchar(255) NOT NULL,
  `CountryID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `city`
--

TRUNCATE TABLE `city`;
--
-- Daten für Tabelle `city`
--

INSERT DELAYED IGNORE INTO `city` (`CityID`, `ZIP`, `City`, `CountryID`) VALUES
(1, 10001, 'New York', 21),
(2, 20002, 'London', 9),
(3, 30003, 'Paris', 4),
(4, 40004, 'Berlin', 1),
(5, 50005, 'Rom', 5),
(6, 60006, 'Amsterdam', 7),
(7, 70007, 'Moscow', 15),
(8, 80008, 'Oslo', 12),
(9, 90009, 'Toronto', 22),
(10, 10010, 'Dublin', 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `ContactID` int NOT NULL,
  `Mail` varchar(255) NOT NULL,
  `Phonenumber` varchar(255) NOT NULL,
  `Street` varchar(255) NOT NULL,
  `Housenumber` varchar(255) NOT NULL,
  `CityID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `contact`
--

TRUNCATE TABLE `contact`;
--
-- Daten für Tabelle `contact`
--

INSERT DELAYED IGNORE INTO `contact` (`ContactID`, `Mail`, `Phonenumber`, `Street`, `Housenumber`, `CityID`) VALUES
(1, 'Daniel.Brill@gmail.com', '12345678', 'Brill Weg', '11', 1),
(2, 'Lorenzo.von-Althoff@DBB.com', '23456789', 'Althof', '12', 2),
(3, 'Rene.Mengedoth@aol.com', '34567890', 'Der Weg', '23', 3),
(4, 'Piet.Limpke@volvo.com', '45678901', 'Volvo Straße', '45', 4),
(5, 'julia.wagner@gmail.com', '56789012', 'Lemgoer Straße', '54', 5),
(6, 'jan.becker@aol.com', '67890123', 'Hamelner Straße', '69', 6),
(7, 'jana.bauer@freemail.com', '78901234', 'Münster Weg', '76', 7),
(8, 'lena.hoffmann@gmx.com', '89012345', 'DBB Straße', '89', 8),
(9, 'philipp.schmitz@freemail.com', '90123456', 'Münchener Straße', '96', 9),
(10, 'sarah.friedrich@gmx.com', '01234567', 'Vilsa Straße', '101', 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `CountryID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ISO2` varchar(2) NOT NULL,
  `ISO3` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `country`
--

TRUNCATE TABLE `country`;
--
-- Daten für Tabelle `country`
--

INSERT DELAYED IGNORE INTO `country` (`CountryID`, `Name`, `ISO2`, `ISO3`) VALUES
(1, 'Deutschland', 'DE', 'DEU'),
(2, 'Österreich', 'AT', 'AUT'),
(3, 'Schweiz', 'CH', 'CHE'),
(4, 'Frankreich', 'FR', 'FRA'),
(5, 'Italien', 'IT', 'ITA'),
(6, 'Spanien', 'ES', 'ESP'),
(7, 'Niederlande', 'NL', 'NLD'),
(8, 'Belgien', 'BE', 'BEL'),
(9, 'Vereinigtes Königreich', 'GB', 'GBR'),
(10, 'Irland', 'IE', 'IRL'),
(11, 'Schweden', 'SE', 'SWE'),
(12, 'Norwegen', 'NO', 'NOR'),
(13, 'Dänemark', 'DK', 'DNK'),
(14, 'Finnland', 'FI', 'FIN'),
(15, 'Russland', 'RU', 'RUS'),
(16, 'Ukraine', 'UA', 'UKR'),
(17, 'Polen', 'PL', 'POL'),
(18, 'Tschechische Republik', 'CZ', 'CZE'),
(19, 'Ungarn', 'HU', 'HUN'),
(20, 'Rumänien', 'RO', 'ROU'),
(21, 'USA', 'US', 'USA'),
(22, 'Kanada', 'CA', 'CAN');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `ContactID` int NOT NULL,
  `BankID` int NOT NULL,
  `Birthdate` text NOT NULL,
  `StaffID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `customer`
--

TRUNCATE TABLE `customer`;
--
-- Daten für Tabelle `customer`
--

INSERT DELAYED IGNORE INTO `customer` (`CustomerID`, `LastName`, `FirstName`, `ContactID`, `BankID`, `Birthdate`, `StaffID`) VALUES
(1, 'Brill', 'Daniel', 1, 1, '01.01.1997', 1),
(2, 'von Althoff', 'Lorenzo', 2, 1, '01.01.1995', 2),
(3, 'Mengedoth', 'René', 3, 2, '27.10.1989', 3),
(4, 'Lipke', 'Piet', 4, 2, '31.05.1993', 4),
(5, 'Wagner', 'Julia', 5, 3, '05.05.2000', 5),
(6, 'Becker', 'Jan', 6, 3, '06.06.2005', 5),
(7, 'Bauer', 'Jana', 7, 4, '07.07.2010', 4),
(8, 'Hoffmann', 'Lena', 8, 4, '08.08.2001', 3),
(9, 'Schmitz', 'Kim', 9, 5, '09.09.1980', 2),
(10, 'Friedrich', 'Sarah', 10, 5, '10.10.2005', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `LoginID` int NOT NULL,
  `LoginTyp` int NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `PIN` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `StaffID` int DEFAULT NULL,
  `CardID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `login`
--

TRUNCATE TABLE `login`;
--
-- Daten für Tabelle `login`
--

INSERT DELAYED IGNORE INTO `login` (`LoginID`, `LoginTyp`, `Password`, `PIN`, `CustomerID`, `StaffID`, `CardID`) VALUES
(1, 1, 'password1', NULL, 1, NULL, NULL),
(2, 1, 'password2', NULL, 2, NULL, NULL),
(3, 1, 'password3', NULL, 3, NULL, NULL),
(4, 1, 'password4', NULL, 4, NULL, NULL),
(5, 1, 'password5', NULL, 5, NULL, NULL),
(6, 1, 'password6', NULL, 6, NULL, NULL),
(7, 1, 'password7', NULL, 7, NULL, NULL),
(8, 1, 'password8', NULL, 8, NULL, NULL),
(9, 1, 'password9', NULL, 9, NULL, NULL),
(10, 1, 'password10', NULL, 10, NULL, NULL),
(11, 3, NULL, 1234, NULL, NULL, 1),
(12, 3, NULL, 2345, NULL, NULL, 2),
(13, 3, NULL, 3456, NULL, NULL, 3),
(14, 3, NULL, 4567, NULL, NULL, 4),
(15, 3, NULL, 5678, NULL, NULL, 5),
(16, 3, NULL, 6789, NULL, NULL, 6),
(17, 3, NULL, 7890, NULL, NULL, 7),
(18, 3, NULL, 8901, NULL, NULL, 8),
(19, 3, NULL, 9012, NULL, NULL, 9),
(20, 3, NULL, 123, NULL, NULL, 10),
(21, 2, 'password11', NULL, NULL, 1, NULL),
(22, 2, 'password12', NULL, NULL, 2, NULL),
(23, 2, 'password13', NULL, NULL, 3, NULL),
(24, 2, 'password14', NULL, NULL, 4, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logintyp`
--

DROP TABLE IF EXISTS `logintyp`;
CREATE TABLE `logintyp` (
  `LoginTyp` int NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `logintyp`
--

TRUNCATE TABLE `logintyp`;
--
-- Daten für Tabelle `logintyp`
--

INSERT DELAYED IGNORE INTO `logintyp` (`LoginTyp`, `Description`) VALUES
(1, 'Customer'),
(2, 'Staff'),
(3, 'Card');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL,
  `LastName` text NOT NULL,
  `FirstName` text NOT NULL,
  `Birthdate` text NOT NULL,
  `AccTypStaffID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `staff`
--

TRUNCATE TABLE `staff`;
--
-- Daten für Tabelle `staff`
--

INSERT DELAYED IGNORE INTO `staff` (`StaffID`, `LastName`, `FirstName`, `Birthdate`, `AccTypStaffID`) VALUES
(1, 'Brill', 'Daniel', '23.09.1998', 4),
(2, 'von Althoff', 'Lorenzo', '01.01.1995', 3),
(3, 'Lipke', 'Piet', '31.05,1993', 2),
(4, 'Mengedoth', 'René', '01.01.1993', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `staffcontact`
--

DROP TABLE IF EXISTS `staffcontact`;
CREATE TABLE `staffcontact` (
  `StaffID` int NOT NULL,
  `Phonenumber` varchar(255) NOT NULL,
  `Mail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `staffcontact`
--

TRUNCATE TABLE `staffcontact`;
--
-- Daten für Tabelle `staffcontact`
--

INSERT DELAYED IGNORE INTO `staffcontact` (`StaffID`, `Phonenumber`, `Mail`) VALUES
(1, '213456', 'Brill.Daniel@dbb.com'),
(2, '765454', 'vonAlthof.Lorenzo@dbb.com'),
(3, '765454', 'Lipke.Piet@dbb.com'),
(4, '765454', 'Mengedoth.Rene@dbb.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `TransactionID` int NOT NULL,
  `FromAccountID` int NOT NULL,
  `ToAccountID` int NOT NULL,
  `Amount` decimal(10,0) NOT NULL,
  `Description` text NOT NULL,
  `TranTypID` int NOT NULL,
  `TransactionDateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `transactions`
--

TRUNCATE TABLE `transactions`;
-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `transactionstyp`
--

DROP TABLE IF EXISTS `transactionstyp`;
CREATE TABLE `transactionstyp` (
  `TranTypID` int NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- TRUNCATE Tabelle vor dem Einfügen `transactionstyp`
--

TRUNCATE TABLE `transactionstyp`;
--
-- Daten für Tabelle `transactionstyp`
--

INSERT DELAYED IGNORE INTO `transactionstyp` (`TranTypID`, `Description`) VALUES
(1, 'Einzahlung'),
(2, 'Auszahlung'),
(3, 'Überweisen');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`AccountID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `AccountTypID` (`AccountTypID`),
  ADD KEY `AccStatusID` (`AccStatusID`),
  ADD KEY `CardID` (`CardID`);

--
-- Indizes für die Tabelle `accounttyp`
--
ALTER TABLE `accounttyp`
  ADD PRIMARY KEY (`AccountTypID`);

--
-- Indizes für die Tabelle `accstatus`
--
ALTER TABLE `accstatus`
  ADD PRIMARY KEY (`AccStatusID`);

--
-- Indizes für die Tabelle `acctypstaff`
--
ALTER TABLE `acctypstaff`
  ADD PRIMARY KEY (`AccTypStaffID`);

--
-- Indizes für die Tabelle `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`BankID`),
  ADD KEY `CityID` (`CityID`);

--
-- Indizes für die Tabelle `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`CardID`);

--
-- Indizes für die Tabelle `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`CityID`),
  ADD KEY `CountryID` (`CountryID`);

--
-- Indizes für die Tabelle `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ContactID`),
  ADD KEY `CityID` (`CityID`);

--
-- Indizes für die Tabelle `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`CountryID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `ContactID` (`ContactID`),
  ADD KEY `BankID` (`BankID`);

--
-- Indizes für die Tabelle `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`LoginID`),
  ADD KEY `CardID` (`CardID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `LoginTyp` (`LoginTyp`);

--
-- Indizes für die Tabelle `logintyp`
--
ALTER TABLE `logintyp`
  ADD PRIMARY KEY (`LoginTyp`);

--
-- Indizes für die Tabelle `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `AccTypStaffID` (`AccTypStaffID`);

--
-- Indizes für die Tabelle `staffcontact`
--
ALTER TABLE `staffcontact`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indizes für die Tabelle `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `FromAccountID` (`FromAccountID`),
  ADD KEY `ToAccountID` (`ToAccountID`),
  ADD KEY `TranTypID` (`TranTypID`);

--
-- Indizes für die Tabelle `transactionstyp`
--
ALTER TABLE `transactionstyp`
  ADD PRIMARY KEY (`TranTypID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `account`
--
ALTER TABLE `account`
  MODIFY `AccountID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `bank`
--
ALTER TABLE `bank`
  MODIFY `BankID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `card`
--
ALTER TABLE `card`
  MODIFY `CardID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `city`
--
ALTER TABLE `city`
  MODIFY `CityID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `contact`
--
ALTER TABLE `contact`
  MODIFY `ContactID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `country`
--
ALTER TABLE `country`
  MODIFY `CountryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `login`
--
ALTER TABLE `login`
  MODIFY `LoginID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT für Tabelle `logintyp`
--
ALTER TABLE `logintyp`
  MODIFY `LoginTyp` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TransactionID` int NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `account_ibfk_2` FOREIGN KEY (`AccountTypID`) REFERENCES `accounttyp` (`AccountTypID`),
  ADD CONSTRAINT `account_ibfk_3` FOREIGN KEY (`AccStatusID`) REFERENCES `accstatus` (`AccStatusID`),
  ADD CONSTRAINT `account_ibfk_4` FOREIGN KEY (`CardID`) REFERENCES `card` (`CardID`);

--
-- Constraints der Tabelle `bank`
--
ALTER TABLE `bank`
  ADD CONSTRAINT `bank_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`);

--
-- Constraints der Tabelle `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`);

--
-- Constraints der Tabelle `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`ContactID`) REFERENCES `contact` (`ContactID`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`BankID`) REFERENCES `bank` (`BankID`);

--
-- Constraints der Tabelle `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`CardID`) REFERENCES `card` (`CardID`),
  ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `login_ibfk_3` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`),
  ADD CONSTRAINT `login_ibfk_4` FOREIGN KEY (`LoginTyp`) REFERENCES `logintyp` (`LoginTyp`);

--
-- Constraints der Tabelle `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`AccTypStaffID`) REFERENCES `acctypstaff` (`AccTypStaffID`);

--
-- Constraints der Tabelle `staffcontact`
--
ALTER TABLE `staffcontact`
  ADD CONSTRAINT `staffcontact_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`);

--
-- Constraints der Tabelle `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`FromAccountID`) REFERENCES `account` (`AccountID`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`ToAccountID`) REFERENCES `account` (`AccountID`),
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`TranTypID`) REFERENCES `transactionstyp` (`TranTypID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
