-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: travelsystem
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
INSERT INTO `account` VALUES ('Acc001','user1@example.com','FL001, FL002'),('Acc002','user2@example.com','FL003, FL004');
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
INSERT INTO `adminticket` VALUES (1,'12A',300,50,'2023-01-15 10:00:00','John Doe','John','Doe','Economy',1,20);
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
INSERT INTO `adminticketflightassociatedwith` VALUES (1,'FL001','LAX','JFK','2023-01-20','08:00:00');
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
INSERT INTO `admintickets` VALUES (1,'FL001','LAX','JFK','2023-01-20','08:00:00');
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
INSERT INTO `aircraft` VALUES ('AC001',200,'Mon,Wed,Fri'),('AC002',150,'Tue,Thu,Sat');
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
INSERT INTO `airlineairportassociatedwith` VALUES ('LAX','AA'),('JFK','BA');
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
INSERT INTO `airlinecompany` VALUES ('AA'),('AL'),('BA'),('BL');
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
INSERT INTO `airport` VALUES ('ATL'),('EWR'),('JFK'),('LAX'),('LHR');
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
INSERT INTO `assists` VALUES ('user1','user2','Yes','General Inquiry','Yes');
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
INSERT INTO `customer` VALUES ('user1','Cust001');
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
INSERT INTO `customerrepresentative` VALUES ('user2','Rep001');
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
INSERT INTO `customersearchesfor` VALUES ('user1','2023-02-15',1,'FL001','AA','08:00:00','12:00:00',0,150,'LAX','JFK','domestic','04:00:00');
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
INSERT INTO `departurearrival` VALUES ('FL001','LAX','JFK'),('FL002','LHR','LAX');
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
INSERT INTO `faq` VALUES (1,'How do I book a flight?','You can book a flight through our website.'),(2,'What is the baggage allowance?','Each passenger is allowed one carry-on bag and one personal item.');
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
  `fromAirport` varchar(3) NOT NULL,
  `toAirport` varchar(3) NOT NULL,
  `economy_fare` float DEFAULT NULL,
  `business_fare` float DEFAULT NULL,
  `first_class_fare` float DEFAULT NULL,
  `airline` varchar(2) DEFAULT NULL,
  `number_of_stops` int DEFAULT NULL,
  `flight_type` enum('domestic','international') NOT NULL DEFAULT 'domestic',
  `departureDate` date DEFAULT NULL,
  `departureTime` time DEFAULT NULL,
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
INSERT INTO `flightservices` VALUES ('F001','AC001','EWR','ATL',200,400,500,'UA',0,'domestic','2023-12-16','00:00:00','2023-12-17','00:00:00','19:00:00',NULL),('FL001','AC001','LAX','JFK',150,300,450,'AA',0,'domestic','2023-01-20','08:00:00','2023-01-20','12:00:00','04:00:00',0),('FL002','AC002','LHR','LAX',200,400,600,'BA',1,'international','2023-01-22','09:00:00','2023-01-22','15:00:00','06:00:00',0);
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
INSERT INTO `getrevenuesummary` VALUES ('admin1','Admin001','AA','Monthly report details','Cust001','FL001, FL002');
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
INSERT INTO `ifnoseat` VALUES (1,'Acc001'),(2,'Acc002');
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
INSERT INTO `list` VALUES ('FL001','AA','admin1','user2','user1',1,1,1);
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
INSERT INTO `onewayticket` VALUES (1,'FL001'),(2,'FL002');
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
INSERT INTO `operates` VALUES ('AA','FL001'),('BA','FL002');
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
INSERT INTO `owns` VALUES ('AA','AC001'),('BA','AC002');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'FL001','user1','John Doe','2023-01-15','Economy','Confirmed','12A',150.00,'2023-01-10 09:00:00'),(2,'FL002','user1','John Doe','2023-01-22','Business','Pending','12B',300.00,'2023-01-12 10:00:00');
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
INSERT INTO `roundtripticket` VALUES (1,'FL001','FL002');
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
INSERT INTO `siteadmin` VALUES ('admin1','Admin001');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'12A',300,'2023-01-15 10:00:00','John','Doe','Economy'),(2,'12B',450,'2023-01-16 11:00:00','Jane','Doe','Business'),(3,NULL,20.5,'2023-12-14 17:09:20','Johnny','Test','economy');
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
INSERT INTO `ticketadmin` VALUES (1,'12A',300,30,'2023-01-15 10:00:00','John Doe','John','Doe','Economy',1,20),(2,'12B',450,45,'2023-01-16 11:00:00','Jane Doe','Jane','Doe','Business',0,30);
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
INSERT INTO `ticketflightassociatedwith` VALUES (1,'FL001','LAX','JFK','2023-01-20'),(3,'FL001','LAX','JFK','2023-01-20');
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
INSERT INTO `transaction` VALUES ('Acc001',1,1),('Acc002',2,1);
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
  CONSTRAINT `transactionadmin_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `transactionadmin_ibfk_2` FOREIGN KEY (`ticketnumber`) REFERENCES `ticketadmin` (`ticketnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionadmin`
--

LOCK TABLES `transactionadmin` WRITE;
/*!40000 ALTER TABLE `transactionadmin` DISABLE KEYS */;
INSERT INTO `transactionadmin` VALUES ('Acc001',1,1),('Acc002',2,1);
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
INSERT INTO `user` VALUES ('admin1','adminpass','SiteAdmin'),('user1','password1','Customer'),('user2','password2','CustomerRepresentative');
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
INSERT INTO `waitinglist` VALUES ('Acc001',1,1,0),('Acc002',2,2,0);
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

-- Dump completed on 2023-12-14 21:36:47
