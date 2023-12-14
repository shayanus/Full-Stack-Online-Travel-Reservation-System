CREATE DATABASE  IF NOT EXISTS `flightreservationsystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `flightreservationsystem`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: flightreservationsystem
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `accountID` varchar(20) NOT NULL,
  `loginDetails` varchar(50) DEFAULT NULL,
  `flightHistory` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('Customer1','CustomerPassword',NULL),('Customer12','CustomerPassword12',NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminticket`
--

DROP TABLE IF EXISTS `adminticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminticket` (
  `ticketnumber` int NOT NULL,
  `seatNumber` varchar(3) DEFAULT NULL,
  `total_fare` float DEFAULT NULL,
  `bookingFee` float DEFAULT NULL,
  `purchaseDateTime` datetime DEFAULT NULL,
  `Passenger_Name` varchar(50) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `isEconomy` tinyint(1) DEFAULT NULL,
  `changeCancelFee` float DEFAULT NULL,
  PRIMARY KEY (`ticketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminticket`
--

LOCK TABLES `adminticket` WRITE;
/*!40000 ALTER TABLE `adminticket` DISABLE KEYS */;
-- INSERT INTO `adminticket` VALUES ('T1010',NULL,300,NULL,'2023-01-01 10:00:00','John Doe',NULL,NULL,'Economy',NULL,NULL),('T1011',NULL,300,NULL,'2023-01-02 10:00:00','Jane Doe',NULL,NULL,'Economy',NULL,NULL),('T1012',NULL,300,NULL,'2023-01-03 10:00:00','Jim Beam',NULL,NULL,'Economy',NULL,NULL),('T1013',NULL,300,NULL,'2023-01-04 10:00:00','Jill Hill',NULL,NULL,'Economy',NULL,NULL),('T1014',NULL,300,NULL,'2023-01-05 10:00:00','Jack Black',NULL,NULL,'Economy',NULL,NULL),('T1015',NULL,350,NULL,'2023-01-06 10:00:00','Sam Smith',NULL,NULL,'Economy',NULL,NULL),('T1016',NULL,350,NULL,'2023-01-07 10:00:00','Sara Stone',NULL,NULL,'Economy',NULL,NULL),('T1017',NULL,350,NULL,'2023-01-08 10:00:00','Sue Sand',NULL,NULL,'Economy',NULL,NULL),('T1018',NULL,320,NULL,'2023-01-09 10:00:00','Mike Mountain',NULL,NULL,'Economy',NULL,NULL),('T1019',NULL,320,NULL,'2023-01-10 10:00:00','Molly Mole',NULL,NULL,'Economy',NULL,NULL),('T1020',NULL,320,NULL,'2023-01-11 10:00:00','Marge Major',NULL,NULL,'Economy',NULL,NULL),('T1021',NULL,320,NULL,'2023-01-12 10:00:00','Matt Minor',NULL,NULL,'Economy',NULL,NULL),('T1022',NULL,320,NULL,'2023-01-13 10:00:00','Martha Mars',NULL,NULL,'Economy',NULL,NULL),('T1023',NULL,320,NULL,'2023-01-14 10:00:00','Martin Moon',NULL,NULL,'Economy',NULL,NULL),('T1024',NULL,320,NULL,'2023-01-15 10:00:00','Megan Meteor',NULL,NULL,'Economy',NULL,NULL);
/*!40000 ALTER TABLE `adminticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminticketflightassociatedwith`
--

DROP TABLE IF EXISTS `adminticketflightassociatedwith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminticketflightassociatedwith` (
  `ticketNumber` int NOT NULL,
  `flightNumber` varchar(5) NOT NULL,
  `fromAirport` varchar(3) DEFAULT NULL,
  `toAirport` varchar(3) DEFAULT NULL,
  `departureDate` date DEFAULT NULL,
  `departureTime` time DEFAULT NULL,
  PRIMARY KEY (`ticketNumber`,`flightNumber`),
  KEY `flightNumber` (`flightNumber`),
  KEY `fromAirport` (`fromAirport`),
  KEY `toAirport` (`toAirport`),
  CONSTRAINT `adminticketflightassociatedwith_ibfk_1` FOREIGN KEY (`ticketNumber`) REFERENCES `ticket` (`ticketNumber`),
  CONSTRAINT `adminticketflightassociatedwith_ibfk_2` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`),
  CONSTRAINT `adminticketflightassociatedwith_ibfk_3` FOREIGN KEY (`fromAirport`) REFERENCES `airport` (`ThreeLetterID`),
  CONSTRAINT `adminticketflightassociatedwith_ibfk_4` FOREIGN KEY (`toAirport`) REFERENCES `airport` (`ThreeLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminticketflightassociatedwith`
--

LOCK TABLES `adminticketflightassociatedwith` WRITE;
/*!40000 ALTER TABLE `adminticketflightassociatedwith` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminticketflightassociatedwith` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `AircraftID` varchar(10) NOT NULL,
  `seats` int DEFAULT NULL,
  `operation_days` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`AircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES ('A001',150,'Monday,Wednesday,Friday'),('A002',200,'Tuesday,Thursday,Saturday,Sunday'),('A003',180,'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday'),('A004',160,'Monday,Thursday,Saturday'),('A005',190,'Tuesday,Friday,Sunday'),('A006',170,'Monday,Tuesday,Thursday,Saturday,Sunday'),('A007',220,'Wednesday,Saturday,Sunday'),('A008',140,'Tuesday,Wednesday,Friday,Saturday'),('A009',210,'Monday,Wednesday,Saturday,Sunday'),('A010',180,'Tuesday,Thursday,Sunday'),('A011',150,'Monday,Wednesday,Friday,Saturday'),('A012',190,'Tuesday,Thursday,Sunday'),('A013',180,'Monday,Wednesday,Saturday,Sunday'),('A014',170,'Tuesday,Thursday,Friday,Sunday'),('A015',200,'Monday,Wednesday,Friday,Sunday');
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airlineairportassociatedwith`
--

DROP TABLE IF EXISTS `airlineairportassociatedwith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airlineairportassociatedwith` (
  `ThreeLetterID` varchar(3) NOT NULL,
  `TwoLetterID` varchar(2) NOT NULL,
  PRIMARY KEY (`ThreeLetterID`,`TwoLetterID`),
  KEY `TwoLetterID` (`TwoLetterID`),
  CONSTRAINT `airlineairportassociatedwith_ibfk_1` FOREIGN KEY (`ThreeLetterID`) REFERENCES `airport` (`ThreeLetterID`),
  CONSTRAINT `airlineairportassociatedwith_ibfk_2` FOREIGN KEY (`TwoLetterID`) REFERENCES `airlinecompany` (`TwoLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlineairportassociatedwith`
--

LOCK TABLES `airlineairportassociatedwith` WRITE;
/*!40000 ALTER TABLE `airlineairportassociatedwith` DISABLE KEYS */;
INSERT INTO `airlineairportassociatedwith` VALUES ('DFW','AA'),('JFK','AA'),('LHR','BA'),('ATL','DL'),('LAX','DL'),('DXB','EK'),('EWR','UA'),('ORD','UA'),('PEK','UA'),('SFO','UA');
/*!40000 ALTER TABLE `airlineairportassociatedwith` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airlinecompany`
--

DROP TABLE IF EXISTS `airlinecompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airlinecompany` (
  `TwoLetterID` varchar(2) NOT NULL,
  PRIMARY KEY (`TwoLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlinecompany`
--

LOCK TABLES `airlinecompany` WRITE;
/*!40000 ALTER TABLE `airlinecompany` DISABLE KEYS */;
INSERT INTO `airlinecompany` VALUES ('AA'),('AF'),('BA'),('DL'),('EK'),('LH'),('QF'),('SQ'),('UA');
/*!40000 ALTER TABLE `airlinecompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `ThreeLetterID` varchar(3) NOT NULL,
  PRIMARY KEY (`ThreeLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('AMD'),('AMS'),('ARN'),('ATL'),('AUH'),('BCN'),('BLR'),('BOM'),('BOS'),('BWI'),('CAN'),('CCU'),('CDG'),('CLT'),('COK'),('CPH'),('CTU'),('DCA'),('DEL'),('DEN'),('DFW'),('DMM'),('DOH'),('DTW'),('DUB'),('DXB'),('EWR'),('FCO'),('FLL'),('FRA'),('GOI'),('HEL'),('HKG'),('HNL'),('HYD'),('IAD'),('IAH'),('IST'),('JED'),('JFK'),('KMG'),('LAS'),('LAX'),('LGA'),('LHR'),('MAA'),('MAD'),('MCO'),('MDW'),('MIA'),('MSP'),('MUC'),('ORD'),('OSL'),('PDX'),('PEK'),('PHX'),('PNQ'),('PVG'),('RUH'),('SAN'),('SEA'),('SFO'),('SHA'),('SLC'),('SVO'),('SZX'),('TPA'),('XIY'),('ZRH');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assists`
--

DROP TABLE IF EXISTS `assists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assists` (
  `CustomerIdentifier` varchar(50) NOT NULL,
  `RepresentativeIdentifier` varchar(20) NOT NULL,
  `makeReservation` varchar(50) DEFAULT NULL,
  `questions` varchar(20) DEFAULT NULL,
  `editReservation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CustomerIdentifier`,`RepresentativeIdentifier`),
  KEY `RepresentativeIdentifier` (`RepresentativeIdentifier`),
  CONSTRAINT `assists_ibfk_1` FOREIGN KEY (`CustomerIdentifier`) REFERENCES `customer` (`UserID`),
  CONSTRAINT `assists_ibfk_2` FOREIGN KEY (`RepresentativeIdentifier`) REFERENCES `customerrepresentative` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assists`
--

LOCK TABLES `assists` WRITE;
/*!40000 ALTER TABLE `assists` DISABLE KEYS */;
/*!40000 ALTER TABLE `assists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `UserID` varchar(30) NOT NULL,
  `CustomerIdentifier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Customer1','Customer1'),('Customer12','Customer12');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerrepresentative`
--

DROP TABLE IF EXISTS `customerrepresentative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerrepresentative` (
  `UserID` varchar(30) NOT NULL,
  `RepresentativeIdentifier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `customerrepresentative_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerrepresentative`
--

LOCK TABLES `customerrepresentative` WRITE;
/*!40000 ALTER TABLE `customerrepresentative` DISABLE KEYS */;
INSERT INTO `customerrepresentative` VALUES ('Rep1','Rep1'),('Rep3','Rep3');
/*!40000 ALTER TABLE `customerrepresentative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customersearchesfor`
--

DROP TABLE IF EXISTS `customersearchesfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customersearchesfor` (
  `customeridentifier` varchar(50) NOT NULL,
  `flightdate` date DEFAULT NULL,
  `isflexible` tinyint(1) DEFAULT NULL,
  `flightnumber` varchar(10) DEFAULT NULL,
  `airline` varchar(2) DEFAULT NULL,
  `takeofftime` time DEFAULT NULL,
  `landingtime` time DEFAULT NULL,
  `numberstops` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `departureairport` varchar(3) DEFAULT NULL,
  `arrivalairport` varchar(3) DEFAULT NULL,
  `flight_type` varchar(30) DEFAULT NULL,
  `flightduration` time DEFAULT NULL,
  PRIMARY KEY (`customeridentifier`),
  KEY `flightnumber` (`flightnumber`),
  KEY `departureairport` (`departureairport`),
  KEY `arrivalairport` (`arrivalairport`),
  KEY `airline` (`airline`),
  CONSTRAINT `customersearchesfor_ibfk_1` FOREIGN KEY (`customeridentifier`) REFERENCES `customer` (`UserID`),
  CONSTRAINT `customersearchesfor_ibfk_2` FOREIGN KEY (`flightnumber`) REFERENCES `flightservices` (`flightNumber`),
  CONSTRAINT `customersearchesfor_ibfk_3` FOREIGN KEY (`departureairport`) REFERENCES `airport` (`ThreeLetterID`),
  CONSTRAINT `customersearchesfor_ibfk_4` FOREIGN KEY (`arrivalairport`) REFERENCES `airport` (`ThreeLetterID`),
  CONSTRAINT `customersearchesfor_ibfk_5` FOREIGN KEY (`airline`) REFERENCES `airlinecompany` (`TwoLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customersearchesfor`
--

LOCK TABLES `customersearchesfor` WRITE;
/*!40000 ALTER TABLE `customersearchesfor` DISABLE KEYS */;
/*!40000 ALTER TABLE `customersearchesfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departurearrival`
--

DROP TABLE IF EXISTS `departurearrival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departurearrival` (
  `flightNumber` varchar(5) NOT NULL,
  `DepartureThreeLetterID` varchar(3) NOT NULL,
  `ArrivalThreeLetterID` varchar(3) NOT NULL,
  PRIMARY KEY (`flightNumber`,`DepartureThreeLetterID`,`ArrivalThreeLetterID`),
  KEY `DepartureThreeLetterID` (`DepartureThreeLetterID`),
  KEY `ArrivalThreeLetterID` (`ArrivalThreeLetterID`),
  CONSTRAINT `departurearrival_ibfk_1` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`),
  CONSTRAINT `departurearrival_ibfk_2` FOREIGN KEY (`DepartureThreeLetterID`) REFERENCES `airport` (`ThreeLetterID`),
  CONSTRAINT `departurearrival_ibfk_3` FOREIGN KEY (`ArrivalThreeLetterID`) REFERENCES `airport` (`ThreeLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departurearrival`
--

LOCK TABLES `departurearrival` WRITE;
/*!40000 ALTER TABLE `departurearrival` DISABLE KEYS */;
/*!40000 ALTER TABLE `departurearrival` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (2,'How do I create a new account?','Log out. In the login page, click the register icon hyperlink. In the registration form, enter your new Username, Password, and choose customer account');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightservices`
--

DROP TABLE IF EXISTS `flightservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flightservices` (
  `flightNumber` varchar(5) NOT NULL,
  `AircraftID` varchar(10) DEFAULT NULL,
  `origin_airport` varchar(3) NOT NULL,
  `destination_airport` varchar(3) NOT NULL,
  `economy_fare` float DEFAULT NULL,
  `business_fare` float DEFAULT NULL,
  `first_class_fare` float DEFAULT NULL,
  `airline` varchar(2) DEFAULT NULL,
  `number_of_stops` int DEFAULT NULL,
  `flight_type` enum('domestic','international') NOT NULL DEFAULT 'domestic',
  `departure_date` date DEFAULT NULL,
  `departure_times` time DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `arrival_times` time DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `is_full` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`flightNumber`),
  KEY `AircraftID` (`AircraftID`),
  CONSTRAINT `flightservices_ibfk_1` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightservices`
--

LOCK TABLES `flightservices` WRITE;
/*!40000 ALTER TABLE `flightservices` DISABLE KEYS */;
INSERT INTO `flightservices` VALUES ('F001','A001','JFK','LAX',300,600,1000,'AA',0,'domestic','2023-12-06','12:00:00','2023-12-06','18:00:00','06:00:00',0),('F002','A010','LAX','JFK',200,400,1100,'AA',1,'domestic','2023-12-08','08:00:00','2023-12-08','18:00:00','10:00:00',0),('F003','A003','JFK','AMS',500,900,1500,'BA',1,'international','2023-12-12','07:00:00','2023-12-12','14:00:00','02:00:00',1),('F100','A001','JFK','LAX',250,500,800,'AA',0,'domestic','2023-12-10','15:00:00','2023-12-10','21:00:00','06:00:00',0),('F101','A002','LAX','JFK',260,520,820,'DL',1,'domestic','2023-12-11','16:00:00','2023-12-11','22:00:00','06:00:00',0),('F102','A003','JFK','AMS',300,600,900,'BA',0,'international','2023-12-12','17:00:00','2023-12-13','07:00:00','14:00:00',0);
/*!40000 ALTER TABLE `flightservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `getrevenuesummary`
--

DROP TABLE IF EXISTS `getrevenuesummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `getrevenuesummary` (
  `UserID` varchar(30) NOT NULL,
  `AdminIdentifier` varchar(20) NOT NULL,
  `TwoLetterID` varchar(2) NOT NULL,
  `MonthlySalesReport` varchar(200) DEFAULT NULL,
  `MostRevenueCustomer` varchar(50) DEFAULT NULL,
  `MostActiveFlightList` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`UserID`,`AdminIdentifier`,`TwoLetterID`),
  KEY `TwoLetterID` (`TwoLetterID`),
  CONSTRAINT `getrevenuesummary_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `siteadmin` (`UserID`),
  CONSTRAINT `getrevenuesummary_ibfk_2` FOREIGN KEY (`TwoLetterID`) REFERENCES `airlinecompany` (`TwoLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `getrevenuesummary`
--

LOCK TABLES `getrevenuesummary` WRITE;
/*!40000 ALTER TABLE `getrevenuesummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `getrevenuesummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifnoseat`
--

DROP TABLE IF EXISTS `ifnoseat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ifnoseat` (
  `ticketnumber` int NOT NULL,
  `accountID` varchar(20) NOT NULL,
  PRIMARY KEY (`ticketNumber`,`accountID`),
  KEY `accountID` (`accountID`),
  CONSTRAINT `ifnoseat_ibfk_1` FOREIGN KEY (`ticketNumber`) REFERENCES `ticket` (`ticketNumber`),
  CONSTRAINT `ifnoseat_ibfk_2` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifnoseat`
--

LOCK TABLES `ifnoseat` WRITE;
/*!40000 ALTER TABLE `ifnoseat` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifnoseat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list`
--

DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list` (
  `flightNumber` varchar(5) NOT NULL,
  `flightAirline` varchar(2) DEFAULT NULL,
  `AdminIdentifier` varchar(20) NOT NULL,
  `RepresentativeIdentifier` varchar(20) NOT NULL,
  `CustomerIdentifier` varchar(50) NOT NULL,
  `retrieve` tinyint(1) DEFAULT NULL,
  `produce` tinyint(1) DEFAULT NULL,
  `request` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`flightNumber`,`AdminIdentifier`,`RepresentativeIdentifier`,`CustomerIdentifier`),
  KEY `flightAirline` (`flightAirline`),
  KEY `AdminIdentifier` (`AdminIdentifier`),
  KEY `RepresentativeIdentifier` (`RepresentativeIdentifier`),
  KEY `CustomerIdentifier` (`CustomerIdentifier`),
  CONSTRAINT `list_ibfk_1` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`),
  CONSTRAINT `list_ibfk_2` FOREIGN KEY (`flightAirline`) REFERENCES `airlinecompany` (`TwoLetterID`),
  CONSTRAINT `list_ibfk_3` FOREIGN KEY (`AdminIdentifier`) REFERENCES `siteadmin` (`UserID`),
  CONSTRAINT `list_ibfk_4` FOREIGN KEY (`RepresentativeIdentifier`) REFERENCES `customerrepresentative` (`UserID`),
  CONSTRAINT `list_ibfk_5` FOREIGN KEY (`CustomerIdentifier`) REFERENCES `customer` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onewayticket`
--

DROP TABLE IF EXISTS `onewayticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `onewayticket` (
  `ticketnumber` int NOT NULL,
  `DepartureFlightNumber` varchar(5) NOT NULL,
  PRIMARY KEY (`ticketNumber`),
  KEY `DepartureFlightNumber` (`DepartureFlightNumber`),
  CONSTRAINT `onewayticket_ibfk_1` FOREIGN KEY (`ticketNumber`) REFERENCES `ticket` (`ticketNumber`),
  CONSTRAINT `onewayticket_ibfk_2` FOREIGN KEY (`DepartureFlightNumber`) REFERENCES `flightservices` (`flightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onewayticket`
--

LOCK TABLES `onewayticket` WRITE;
/*!40000 ALTER TABLE `onewayticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `onewayticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operates`
--

DROP TABLE IF EXISTS `operates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operates` (
  `TwoLetterID` varchar(2) NOT NULL,
  `flightNumber` varchar(5) NOT NULL,
  PRIMARY KEY (`TwoLetterID`,`flightNumber`),
  KEY `flightNumber` (`flightNumber`),
  CONSTRAINT `operates_ibfk_1` FOREIGN KEY (`TwoLetterID`) REFERENCES `airlinecompany` (`TwoLetterID`),
  CONSTRAINT `operates_ibfk_2` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operates`
--

LOCK TABLES `operates` WRITE;
/*!40000 ALTER TABLE `operates` DISABLE KEYS */;
/*!40000 ALTER TABLE `operates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owns`
--

DROP TABLE IF EXISTS `owns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owns` (
  `TwoLetterID` varchar(2) NOT NULL,
  `AircraftID` varchar(10) NOT NULL,
  PRIMARY KEY (`TwoLetterID`,`AircraftID`),
  KEY `AircraftID` (`AircraftID`),
  CONSTRAINT `owns_ibfk_1` FOREIGN KEY (`TwoLetterID`) REFERENCES `airlinecompany` (`TwoLetterID`),
  CONSTRAINT `owns_ibfk_2` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owns`
--

LOCK TABLES `owns` WRITE;
/*!40000 ALTER TABLE `owns` DISABLE KEYS */;
INSERT INTO `owns` VALUES ('AA','A001'),('AF','A002'),('BA','A003'),('DL','A004'),('EK','A005'),('LH','A006'),('QF','A007'),('SQ','A008'),('UA','A009'),('AA','A010'),('AF','A011'),('BA','A012'),('DL','A013'),('EK','A014'),('LH','A015');
/*!40000 ALTER TABLE `owns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `reservationID` int NOT NULL AUTO_INCREMENT,
  `flightNumber` varchar(10) DEFAULT NULL,
  `customerID` varchar(30) DEFAULT NULL,
  `customerName` varchar(100) DEFAULT NULL,
  `reservationDate` date DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `seatNumber` varchar(10) DEFAULT NULL,
  `totalFare` decimal(10,2) DEFAULT NULL,
  `bookingDate` datetime DEFAULT NULL,
  PRIMARY KEY (`reservationID`),
  KEY `flightNumber` (`flightNumber`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`),
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'F001','Customer1','John Doe','2023-12-15','Economy','Confirmed','12A',300.00,'2023-11-01 10:30:00'),(2,'F001','Customer12','Jane Smith','2023-12-15','Business','Confirmed','1B',600.00,'2023-11-02 11:00:00'),(3,'F002','Customer1','John Doe','2023-12-18','Economy','Cancelled','14C',200.00,'2023-11-05 09:15:00'),(4,'F002','Customer12','Jane Smith','2023-12-18','Business','Confirmed','2D',400.00,'2023-11-06 08:45:00');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roundtripticket`
--

DROP TABLE IF EXISTS `roundtripticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roundtripticket` (
  `ticketnumber` int NOT NULL,
  `DepartureFlightNumber` varchar(5) NOT NULL,
  `ReturnFlightNumber` varchar(5) NOT NULL,
  PRIMARY KEY (`ticketNumber`),
  KEY `DepartureFlightNumber` (`DepartureFlightNumber`),
  KEY `ReturnFlightNumber` (`ReturnFlightNumber`),
  CONSTRAINT `roundtripticket_ibfk_1` FOREIGN KEY (`ticketNumber`) REFERENCES `ticket` (`ticketNumber`),
  CONSTRAINT `roundtripticket_ibfk_2` FOREIGN KEY (`DepartureFlightNumber`) REFERENCES `flightservices` (`flightNumber`),
  CONSTRAINT `roundtripticket_ibfk_3` FOREIGN KEY (`ReturnFlightNumber`) REFERENCES `flightservices` (`flightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roundtripticket`
--

LOCK TABLES `roundtripticket` WRITE;
/*!40000 ALTER TABLE `roundtripticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `roundtripticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siteadmin`
--

DROP TABLE IF EXISTS `siteadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siteadmin` (
  `UserID` varchar(30) NOT NULL,
  `AdminIdentifier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `siteadmin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteadmin`
--

LOCK TABLES `siteadmin` WRITE;
/*!40000 ALTER TABLE `siteadmin` DISABLE KEYS */;
INSERT INTO `siteadmin` VALUES ('Admin1','Admin1');
/*!40000 ALTER TABLE `siteadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticketNumber` INT NOT NULL AUTO_INCREMENT,
  `seatNumber` varchar(3) DEFAULT NULL,
  `total_fare` float DEFAULT NULL,
  `purchasedOn` datetime DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ticketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
-- INSERT INTO `ticket` VALUES ('G42','A9',300,100,'2023-12-09 00:00:00','Kar','Karthik','Gangireddy','economy',1,50),('G654','A22',900,100,'2023-12-09 00:00:00','Karth','Karthik','Gangireddy','business',0,0),('G97','A12',900,120,'2023-12-11 00:00:00','Karthi','Karthik','Gangireddy','business',0,0);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketadmin`
--

DROP TABLE IF EXISTS `ticketadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticketadmin` (
  `ticketnumber` int NOT NULL,
  `seatNumber` varchar(3) DEFAULT NULL,
  `total_fare` float DEFAULT NULL,
  `bookingFee` float DEFAULT NULL,
  `purchaseDateTime` datetime DEFAULT NULL,
  `Passenger_Name` varchar(50) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `isEconomy` tinyint(1) DEFAULT NULL,
  `changeCancelFee` float DEFAULT NULL,
  PRIMARY KEY (`ticketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketadmin`
--

LOCK TABLES `ticketadmin` WRITE;
/*!40000 ALTER TABLE `ticketadmin` DISABLE KEYS */;
-- INSERT INTO `ticketadmin` VALUES ('T1010',NULL,300,NULL,'2023-01-01 10:00:00','John Doe',NULL,NULL,'Economy',NULL,NULL),('T1011',NULL,300,NULL,'2023-01-02 10:00:00','Jane Doe',NULL,NULL,'Economy',NULL,NULL),('T1012',NULL,300,NULL,'2023-01-03 10:00:00','Jim Beam',NULL,NULL,'Economy',NULL,NULL),('T1013',NULL,300,NULL,'2023-01-04 10:00:00','Jill Hill',NULL,NULL,'Economy',NULL,NULL),('T1014',NULL,300,NULL,'2023-01-05 10:00:00','Jack Black',NULL,NULL,'Economy',NULL,NULL),('T1015',NULL,350,NULL,'2023-01-06 10:00:00','Sam Smith',NULL,NULL,'Economy',NULL,NULL),('T1016',NULL,350,NULL,'2023-01-07 10:00:00','Sara Stone',NULL,NULL,'Economy',NULL,NULL),('T1017',NULL,350,NULL,'2023-01-08 10:00:00','Sue Sand',NULL,NULL,'Economy',NULL,NULL),('T1018',NULL,320,NULL,'2023-01-09 10:00:00','Mike Mountain',NULL,NULL,'Economy',NULL,NULL),('T1019',NULL,320,NULL,'2023-01-10 10:00:00','Molly Mole',NULL,NULL,'Economy',NULL,NULL),('T1020',NULL,320,NULL,'2023-01-11 10:00:00','Marge Major',NULL,NULL,'Economy',NULL,NULL),('T1021',NULL,320,NULL,'2023-01-12 10:00:00','Matt Minor',NULL,NULL,'Economy',NULL,NULL),('T1022',NULL,320,NULL,'2023-01-13 10:00:00','Martha Mars',NULL,NULL,'Economy',NULL,NULL),('T1023',NULL,320,NULL,'2023-01-14 10:00:00','Martin Moon',NULL,NULL,'Economy',NULL,NULL),('T1024',NULL,320,NULL,'2023-01-15 10:00:00','Megan Meteor',NULL,NULL,'Economy',NULL,NULL),('T1030',NULL,300,NULL,'2023-02-01 10:00:00','Charlie Chaplin',NULL,NULL,'Economy',NULL,NULL),('T1031',NULL,300,NULL,'2023-02-02 10:00:00','Diana Prince',NULL,NULL,'Economy',NULL,NULL),('T1032',NULL,500,NULL,'2023-02-03 10:00:00','Ethan Hunt',NULL,NULL,'Economy',NULL,NULL),('T1033',NULL,500,NULL,'2023-02-04 10:00:00','Fiona Fantasy',NULL,NULL,'Economy',NULL,NULL);
/*!40000 ALTER TABLE `ticketadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketflightassociatedwith`
--

DROP TABLE IF EXISTS `ticketflightassociatedwith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticketflightassociatedwith` (
  `ticketnumber` int,
  `flightNumber` varchar(5) NOT NULL,
  `fromAirport` varchar(3) DEFAULT NULL,
  `toAirport` varchar(3) DEFAULT NULL,
  `departureDate` date DEFAULT NULL,
  PRIMARY KEY (`ticketNumber`,`flightNumber`),
  KEY `flightNumber` (`flightNumber`),
  KEY `fromAirport` (`fromAirport`),
  KEY `toAirport` (`toAirport`),
  CONSTRAINT `ticketflightassociatedwith_ibfk_1` FOREIGN KEY (`ticketNumber`) REFERENCES `ticket` (`ticketNumber`),
  CONSTRAINT `ticketflightassociatedwith_ibfk_2` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`),
  CONSTRAINT `ticketflightassociatedwith_ibfk_3` FOREIGN KEY (`fromAirport`) REFERENCES `airport` (`ThreeLetterID`),
  CONSTRAINT `ticketflightassociatedwith_ibfk_4` FOREIGN KEY (`toAirport`) REFERENCES `airport` (`ThreeLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketflightassociatedwith`
--

LOCK TABLES `ticketflightassociatedwith` WRITE;
/*!40000 ALTER TABLE `ticketflightassociatedwith` DISABLE KEYS */;
-- INSERT INTO `ticketflightassociatedwith` VALUES ('G42','F001','JFK','LAX','2023-12-06','12:00:00'),('G654','F003','JFK','AMS','2023-12-12','07:00:00');
/*!40000 ALTER TABLE `ticketflightassociatedwith` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketflightassociatedwithadmin`
--

DROP TABLE IF EXISTS `ticketflightassociatedwithadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticketflightassociatedwithadmin` (
  `ticketnumber` int NOT NULL,
  `flightNumber` varchar(5) NOT NULL,
  `fromAirport` varchar(3) DEFAULT NULL,
  `toAirport` varchar(3) DEFAULT NULL,
  `departureDate` date DEFAULT NULL,
  `departureTime` time DEFAULT NULL,
  PRIMARY KEY (`ticketNumber`,`flightNumber`),
  KEY `flightNumber` (`flightNumber`),
  KEY `fromAirport` (`fromAirport`),
  KEY `toAirport` (`toAirport`),
  CONSTRAINT `ticketflightassociatedwithAdmin_ibfk_1` FOREIGN KEY (`ticketNumber`) REFERENCES `ticketadmin` (`ticketNumber`),
  CONSTRAINT `ticketflightassociatedwithAdmin_ibfk_2` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`),
  CONSTRAINT `ticketflightassociatedwithAdmin_ibfk_3` FOREIGN KEY (`fromAirport`) REFERENCES `airport` (`ThreeLetterID`),
  CONSTRAINT `ticketflightassociatedwithAdmin_ibfk_4` FOREIGN KEY (`toAirport`) REFERENCES `airport` (`ThreeLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketflightassociatedwithadmin`
--

LOCK TABLES `ticketflightassociatedwithadmin` WRITE;
/*!40000 ALTER TABLE `ticketflightassociatedwithadmin` DISABLE KEYS */;
-- INSERT INTO `ticketflightassociatedwithadmin` VALUES ('T1010','F100',NULL,NULL,NULL,NULL),('T1011','F100',NULL,NULL,NULL,NULL),('T1012','F100',NULL,NULL,NULL,NULL),('T1013','F100',NULL,NULL,NULL,NULL),('T1014','F100',NULL,NULL,NULL,NULL),('T1015','F101',NULL,NULL,NULL,NULL),('T1016','F101',NULL,NULL,NULL,NULL),('T1017','F101',NULL,NULL,NULL,NULL),('T1018','F102',NULL,NULL,NULL,NULL),('T1019','F102',NULL,NULL,NULL,NULL),('T1020','F102',NULL,NULL,NULL,NULL),('T1021','F102',NULL,NULL,NULL,NULL),('T1022','F102',NULL,NULL,NULL,NULL),('T1023','F102',NULL,NULL,NULL,NULL),('T1024','F102',NULL,NULL,NULL,NULL),('T1030','F001',NULL,NULL,NULL,NULL),('T1031','F001',NULL,NULL,NULL,NULL),('T1032','F003',NULL,NULL,NULL,NULL),('T1033','F003',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ticketflightassociatedwithadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `accountID` varchar(20) NOT NULL,
  `ticketnumber` int NOT NULL,
  `seatAvailable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`accountID`,`ticketNumber`),
  KEY `ticketNumber` (`ticketNumber`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`ticketNumber`) REFERENCES `ticket` (`ticketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionadmin`
--

DROP TABLE IF EXISTS `transactionadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionadmin` (
  `accountID` varchar(20) NOT NULL,
  `ticketnumber` int NOT NULL,
  `seatAvailable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`accountID`,`ticketNumber`),
  KEY `ticketNumber` (`ticketNumber`),
  CONSTRAINT `transactionAdmin_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `transactionAdmin_ibfk_2` FOREIGN KEY (`ticketNumber`) REFERENCES `ticketadmin` (`ticketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionadmin`
--

LOCK TABLES `transactionadmin` WRITE;
/*!40000 ALTER TABLE `transactionadmin` DISABLE KEYS */;
INSERT INTO `transactionadmin` VALUES ('Customer1',1,1),('Customer1',2,1),('Customer1',3,1),('Customer1',4,1),('Customer1',5,1),('Customer1',6,1),('Customer1',7,1),('Customer1',8,1);
/*!40000 ALTER TABLE `transactionadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` varchar(30) NOT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Admin1','Admin1','SiteAdmin'),('Customer1','CustomerPassword','Customer'),('Customer12','CustomerPassword12','Customer'),('null','null','null'),('Rep1','Rep1','CustomerRepresentative'),('Rep3','Rep3','Customer');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waitinglist`
--

DROP TABLE IF EXISTS `waitinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitinglist` (
  `accountID` varchar(20) NOT NULL,
  `ticketnumber` int NOT NULL,
  `numberInLine` int DEFAULT NULL,
  `alertSent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`accountID`,`ticketNumber`),
  KEY `ticketNumber` (`ticketNumber`),
  CONSTRAINT `waitinglist_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `waitinglist_ibfk_2` FOREIGN KEY (`ticketNumber`) REFERENCES `ticket` (`ticketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitinglist`
--

LOCK TABLES `waitinglist` WRITE;
/*!40000 ALTER TABLE `waitinglist` DISABLE KEYS */;
INSERT INTO `waitinglist` VALUES ('Customer1','G97',NULL,NULL);
/*!40000 ALTER TABLE `waitinglist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-11 23:22:43
