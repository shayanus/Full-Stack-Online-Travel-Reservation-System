CREATE DATABASE  IF NOT EXISTS `travelsystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `travelsystem`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: travelsystem
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
INSERT INTO `account` VALUES ('User1','password',NULL),('User2','password',NULL);
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
  PRIMARY KEY (`ticketnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminticket`
--

LOCK TABLES `adminticket` WRITE;
/*!40000 ALTER TABLE `adminticket` DISABLE KEYS */;
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
-- Table structure for table `admintickets`
--

DROP TABLE IF EXISTS `admintickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admintickets` (
  `ticketnumber` int NOT NULL,
  `flightNumber` varchar(5) NOT NULL,
  `fromAirport` varchar(3) DEFAULT NULL,
  `toAirport` varchar(3) DEFAULT NULL,
  `departureDate` date DEFAULT NULL,
  `departureTime` time DEFAULT NULL,
  PRIMARY KEY (`ticketnumber`,`flightNumber`),
  KEY `flightNumber` (`flightNumber`),
  KEY `fromAirport` (`fromAirport`),
  KEY `toAirport` (`toAirport`),
  CONSTRAINT `admintickets_ibfk_1` FOREIGN KEY (`ticketnumber`) REFERENCES `ticketadmin` (`ticketnumber`),
  CONSTRAINT `admintickets_ibfk_2` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`),
  CONSTRAINT `admintickets_ibfk_3` FOREIGN KEY (`fromAirport`) REFERENCES `airport` (`ThreeLetterID`),
  CONSTRAINT `admintickets_ibfk_4` FOREIGN KEY (`toAirport`) REFERENCES `airport` (`ThreeLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admintickets`
--

LOCK TABLES `admintickets` WRITE;
/*!40000 ALTER TABLE `admintickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admintickets` ENABLE KEYS */;
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
INSERT INTO `customer` VALUES ('CUST123','Alice Johnson'),('CUST234','George White'),('CUST345','Olivia Davis'),('CUST456','Bob Smith'),('CUST567','Sophia Brown'),('CUST678','William Taylor'),('CUST789','Eva Davis'),('CUST890','Michael Miller'),('CUST901','Emma Wilson'),('test','test'),('test1','test1');
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
INSERT INTO `faq` VALUES (2,'How do I make a booking?','Use the search page to look for your desired flight. There should be a book now button next to the flight which will take you to the booking page with the flight details. ');
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
INSERT INTO `flightservices` VALUES ('F001','A002','EWR','LAX',300,600,1000,'AA',0,'domestic','2023-12-07','12:30:00','2023-12-07','18:30:00','06:00:00',0),('F002','A011','LAX','EWR',200,400,1100,'AA',1,'domestic','2023-12-09','08:30:00','2023-12-09','18:30:00','10:00:00',0),('F003','A003','EWR','AMS',500,900,1500,'BA',1,'international','2023-12-13','07:30:00','2023-12-13','14:30:00','02:00:00',1),('F011','A014','EWR','LAX',300,600,1000,'AA',0,'domestic','2023-12-17','12:30:00','2023-12-17','18:30:00','06:00:00',0),('F012','A015','LAX','EWR',200,400,1100,'AA',1,'domestic','2023-12-19','08:30:00','2023-12-19','18:30:00','10:00:00',0),('F013','A013','EWR','AMS',500,900,1500,'BA',1,'international','2023-12-23','07:30:00','2023-12-23','14:30:00','02:00:00',1),('F014','A014','EWR','LAX',250,500,800,'AA',0,'domestic','2023-12-21','15:30:00','2023-12-21','21:30:00','06:00:00',0),('F015','A015','LAX','EWR',260,520,820,'DL',1,'domestic','2023-12-22','16:30:00','2023-12-22','22:30:00','06:00:00',0),('F016','A016','EWR','AMS',300,600,900,'BA',0,'international','2023-12-23','17:30:00','2023-12-24','07:30:00','14:30:00',0),('F100','A001','EWR','LAX',250,500,800,'AA',0,'domestic','2023-12-11','15:30:00','2023-12-11','21:30:00','06:00:00',0),('F101','A002','LAX','EWR',260,520,820,'DL',1,'domestic','2023-12-12','16:30:00','2023-12-12','22:30:00','06:00:00',0),('F102','A003','EWR','AMS',300,600,900,'BA',0,'international','2023-12-13','17:30:00','2023-12-14','07:30:00','14:30:00',0);
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
  PRIMARY KEY (`ticketnumber`,`accountID`),
  KEY `accountID` (`accountID`),
  CONSTRAINT `ifnoseat_ibfk_1` FOREIGN KEY (`ticketnumber`) REFERENCES `ticket` (`ticketNumber`),
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
  PRIMARY KEY (`ticketnumber`),
  KEY `DepartureFlightNumber` (`DepartureFlightNumber`),
  CONSTRAINT `onewayticket_ibfk_1` FOREIGN KEY (`ticketnumber`) REFERENCES `ticket` (`ticketNumber`),
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
INSERT INTO `owns` VALUES ('BA','A320'),('SQ','A330'),('QF','A340'),('UA','A350'),('LH','A380'),('AA','B737'),('AF','B747'),('CX','B767'),('DL','B777'),('EK','B787');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'F001','CUST123','Alice Johnson','2023-12-15','Economy','Confirmed','12A',300.00,'2023-11-01 10:30:00'),(2,'F002','CUST456','Bob Smith','2023-12-16','Business','Pending','8B',500.00,'2023-11-02 12:45:00'),(3,'F003','CUST789','Eva Davis','2023-12-17','First Class','Confirmed','1C',800.00,'2023-11-03 15:20:00'),(4,'F004','CUST234','George White','2023-12-18','Economy','Confirmed','15D',350.00,'2023-11-04 09:15:00'),(5,'F005','CUST567','Sophia Brown','2023-12-19','Business','Pending','5A',550.00,'2023-11-05 14:30:00'),(6,'F006','CUST890','Michael Miller','2023-12-20','First Class','Confirmed','3B',850.00,'2023-11-06 17:45:00'),(7,'F007','CUST345','Olivia Davis','2023-12-21','Economy','Confirmed','9C',320.00,'2023-11-07 11:00:00'),(8,'F008','CUST678','William Taylor','2023-12-22','Business','Pending','7D',600.00,'2023-11-08 16:15:00'),(9,'F009','CUST901','Emma Wilson','2023-12-23','First Class','Confirmed','2A',880.00,'2023-11-09 19:30:00'),(10,'F010','CUST456','James Johnson','2023-12-24','Economy','Confirmed','11B',310.00,'2023-11-10 13:45:00');
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
  PRIMARY KEY (`ticketnumber`),
  KEY `DepartureFlightNumber` (`DepartureFlightNumber`),
  KEY `ReturnFlightNumber` (`ReturnFlightNumber`),
  CONSTRAINT `roundtripticket_ibfk_1` FOREIGN KEY (`ticketnumber`) REFERENCES `ticket` (`ticketNumber`),
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
INSERT INTO `siteadmin` VALUES ('ad','ad'),('Admin1','Admin1'),('admin3','admin3');
/*!40000 ALTER TABLE `siteadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticketNumber` int NOT NULL AUTO_INCREMENT,
  `seatNumber` varchar(3) DEFAULT NULL,
  `total_fare` float DEFAULT NULL,
  `purchasedOn` datetime DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ticketNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=543255578 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (0,'NUL',44.3,'0000-00-00 00:00:00','test','test','business'),(547,NULL,20.5,'2023-12-13 20:06:51','test','test','business'),(548,NULL,20.5,'2023-12-13 20:15:41','test','test','business'),(549,NULL,20.5,'2023-12-13 20:15:46','test','test','business'),(550,NULL,20.5,'2023-12-13 20:15:49','test','test','business'),(777,NULL,20.5,'2023-12-13 20:50:35','test','test','economy'),(888,NULL,20.5,'2023-12-13 20:56:44','test','trtafga','economy'),(4000,NULL,20.5,'2023-12-13 20:19:40','test','hello','economy'),(5000,NULL,20.5,'2023-12-13 20:24:04','test','hello','economy'),(7000,NULL,20.5,'2023-12-13 20:27:02','test','hello','economy'),(8500,NULL,20.5,'2023-12-13 20:31:35','test','hello','economy'),(9000,NULL,20.5,'2023-12-13 20:27:30','test','hello','economy'),(9500,NULL,20.5,'2023-12-13 20:30:46','test','hello','economy'),(54356,NULL,20.5,'2023-12-13 20:15:51','test','test','business'),(543556,NULL,20.5,'2023-12-13 20:16:10','test','test','business'),(54355556,NULL,20.5,'2023-12-13 20:17:15','test','test','economy'),(543255556,NULL,20.5,'2023-12-13 20:17:56','test','test','economy'),(543255557,NULL,20.5,'2023-12-13 20:44:16','test','test','economy'),(543255558,NULL,20.5,'2023-12-13 20:45:27','test','test','economy'),(543255559,NULL,20.5,'2023-12-13 20:46:09','test','test','economy'),(543255560,NULL,20.5,'2023-12-13 20:49:40','test','test','economy'),(543255561,NULL,20.5,'2023-12-13 20:49:57','test','test','economy'),(543255562,NULL,44.3,'0000-00-00 00:00:00','test','test','business'),(543255563,NULL,20.5,'2023-12-13 21:17:49','test','test','economy'),(543255564,NULL,20.5,'2023-12-13 21:17:55','test','test','economy'),(543255565,NULL,20.5,'2023-12-13 21:21:54','hello','bye','economy'),(543255566,NULL,20.5,'2023-12-13 21:32:07','hello','bye','economy'),(543255567,NULL,20.5,'2023-12-13 21:32:37','hello','bye','economy'),(543255568,NULL,20.5,'2023-12-13 21:35:08','hello','bye','economy'),(543255569,NULL,20.5,'2023-12-13 21:35:23','hello','bye','economy'),(543255570,NULL,20.5,'2023-12-13 21:35:26','hello','bye','economy'),(543255571,NULL,20.5,'2023-12-13 21:35:35','hello','bye','economy'),(543255572,NULL,20.5,'2023-12-13 21:35:46','hello','bye','economy'),(543255573,NULL,20.5,'2023-12-13 21:35:51','hello','bye','economy'),(543255574,NULL,20.5,'2023-12-13 21:39:09','hello','bye','economy'),(543255575,NULL,20.5,'2023-12-13 22:12:29','tes','hellooo','economy'),(543255576,NULL,20.5,'2023-12-13 23:04:05','Joe','Lynch','economy'),(543255577,NULL,20.5,'2023-12-13 23:20:23','test','test','economy');
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
  PRIMARY KEY (`ticketnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketadmin`
--

LOCK TABLES `ticketadmin` WRITE;
/*!40000 ALTER TABLE `ticketadmin` DISABLE KEYS */;
INSERT INTO `ticketadmin` VALUES (1001,NULL,150,NULL,'2023-03-15 10:30:00',NULL,NULL,NULL,NULL,NULL,NULL),(1002,NULL,200,NULL,'2023-03-16 11:00:00',NULL,NULL,NULL,NULL,NULL,NULL),(1010,NULL,300,NULL,'2023-01-01 10:00:00','Alice Johnson',NULL,NULL,'Economy',NULL,NULL),(1011,NULL,300,NULL,'2023-01-02 10:00:00','Bob Smith',NULL,NULL,'Economy',NULL,NULL),(1012,NULL,300,NULL,'2023-01-03 10:00:00','Catherine White',NULL,NULL,'Economy',NULL,NULL),(1013,NULL,300,NULL,'2023-01-04 10:00:00','David Hill',NULL,NULL,'Economy',NULL,NULL),(1015,NULL,350,NULL,'2023-01-06 10:00:00','Frank Smith',NULL,NULL,'Economy',NULL,NULL),(1016,NULL,350,NULL,'2023-01-07 10:00:00','Grace Stone',NULL,NULL,'Economy',NULL,NULL),(1017,NULL,350,NULL,'2023-01-08 10:00:00','Henry Sand',NULL,NULL,'Economy',NULL,NULL);
/*!40000 ALTER TABLE `ticketadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketflightassociatedwith`
--

DROP TABLE IF EXISTS `ticketflightassociatedwith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticketflightassociatedwith` (
  `ticketnumber` int NOT NULL,
  `flightNumber` varchar(5) NOT NULL,
  `fromAirport` varchar(3) DEFAULT NULL,
  `toAirport` varchar(3) DEFAULT NULL,
  `departureDate` date DEFAULT NULL,
  PRIMARY KEY (`ticketnumber`,`flightNumber`),
  KEY `flightNumber` (`flightNumber`),
  KEY `fromAirport` (`fromAirport`),
  KEY `toAirport` (`toAirport`),
  CONSTRAINT `ticketflightassociatedwith_ibfk_1` FOREIGN KEY (`ticketnumber`) REFERENCES `ticket` (`ticketNumber`),
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
INSERT INTO `ticketflightassociatedwith` VALUES (7000,'F100',NULL,NULL,NULL),(8500,'F100',NULL,NULL,NULL),(543255563,'F100',NULL,NULL,NULL),(543255564,'F100',NULL,NULL,NULL),(543255565,'F001',NULL,NULL,NULL),(543255566,'F001',NULL,NULL,NULL),(543255567,'F001',NULL,NULL,NULL),(543255568,'F001',NULL,NULL,NULL),(543255569,'F001',NULL,NULL,NULL),(543255570,'F001',NULL,NULL,NULL),(543255571,'F001',NULL,NULL,NULL),(543255572,'F001',NULL,NULL,NULL),(543255573,'F001',NULL,NULL,NULL),(543255574,'F001',NULL,NULL,NULL),(543255575,'F001',NULL,NULL,NULL),(543255576,'F001',NULL,NULL,NULL),(543255577,'F001',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ticketflightassociatedwith` ENABLE KEYS */;
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
  PRIMARY KEY (`accountID`,`ticketnumber`),
  KEY `ticketNumber` (`ticketnumber`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`ticketnumber`) REFERENCES `ticket` (`ticketNumber`)
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
  PRIMARY KEY (`accountID`,`ticketnumber`),
  KEY `ticketNumber` (`ticketnumber`),
  CONSTRAINT `transactionAdmin_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `transactionAdmin_ibfk_2` FOREIGN KEY (`ticketnumber`) REFERENCES `ticketadmin` (`ticketnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionadmin`
--

LOCK TABLES `transactionadmin` WRITE;
/*!40000 ALTER TABLE `transactionadmin` DISABLE KEYS */;
INSERT INTO `transactionadmin` VALUES ('Customer1',74544647,1),('Customer10',74544656,1),('Customer2',74544648,1),('Customer3',74544649,0),('Customer4',74544650,1),('Customer5',74544651,0),('Customer6',74544652,1),('Customer7',74544653,1),('Customer8',74544654,0),('Customer9',74544655,1);
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
INSERT INTO `user` VALUES ('ad','min','SiteAdmin'),('admin','admin_password','SiteAdmin'),('admin1','test','SiteAdmin'),('admin3','test','SiteAdmin'),('customer1','customer1_password','Customer'),('customer2','customer2_password','Customer'),('customer3','customer3_password','Customer'),('employee1','employee1_password','SiteAdmin'),('manager','manager_password','SiteAdmin'),('null','null','null'),('rep1','rep1_password','CustomerRepresentative'),('rep2','rep2_password','CustomerRepresentative'),('test','test','Customer'),('test1','test','Customer');
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
  PRIMARY KEY (`accountID`,`ticketnumber`),
  KEY `ticketNumber` (`ticketnumber`),
  CONSTRAINT `waitinglist_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `waitinglist_ibfk_2` FOREIGN KEY (`ticketnumber`) REFERENCES `ticket` (`ticketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitinglist`
--

LOCK TABLES `waitinglist` WRITE;
/*!40000 ALTER TABLE `waitinglist` DISABLE KEYS */;
INSERT INTO `waitinglist` VALUES ('Customer1',1,NULL,NULL);
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

-- Dump completed on 2023-12-13 23:49:40
