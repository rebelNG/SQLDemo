-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: orders
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `CustStreet` varchar(100) NOT NULL,
  `CustCity` varchar(100) NOT NULL,
  `CustStateProv` varchar(100) NOT NULL,
  `CustCountry` varchar(100) NOT NULL,
  `CustPostalCode` varchar(20) NOT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'1 Main St','Golgafrincham','GuideShire','UK','1MSGGS'),(2,'42 Cricket St.','Islington','Greater London','UK','42CSIGL');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustID` int NOT NULL AUTO_INCREMENT,
  `CustName` varchar(200) NOT NULL,
  `SalutationID` int NOT NULL,
  `AddressID` int NOT NULL,
  PRIMARY KEY (`CustID`),
  KEY `FK_Customers_SalutationID_Salutations_SalutationID` (`SalutationID`),
  KEY `FK_Customers_AddressID_Address_AddressID` (`AddressID`),
  CONSTRAINT `FK_Customers_AddressID_Address_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`),
  CONSTRAINT `FK_Customers_SalutationID_Salutations_SalutationID` FOREIGN KEY (`SalutationID`) REFERENCES `salutations` (`SalutationID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Arthur Dent',1,1),(2,'trillian Astra',2,2);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `OrderItemID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `StockID` int NOT NULL,
  `Quantity` smallint NOT NULL,
  `Discount` decimal(4,2) NOT NULL,
  PRIMARY KEY (`OrderItemID`),
  KEY `FK_OrderItems_OrderID_Orders_OrderID` (`OrderID`),
  KEY `FK_OrderItems_StockID_Stock_StockID` (`StockID`),
  CONSTRAINT `FK_OrderItems_OrderID_Orders_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `FK_OrderItems_StockID_Stock_StockID` FOREIGN KEY (`StockID`) REFERENCES `stock` (`StockID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,1,1,1,20.00),(2,2,3,1,20.00);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderDate` date NOT NULL,
  `OrderRequestedDate` date NOT NULL,
  `OrderDeliveryDate` datetime DEFAULT NULL,
  `CustID` int NOT NULL,
  `OrderIsExpedited` bit(1) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_Orders_CustID_Customers_CustID` (`CustID`),
  CONSTRAINT `FK_Orders_CustID_Customers_CustID` FOREIGN KEY (`CustID`) REFERENCES `customers` (`CustID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2023-03-01','2023-04-01',NULL,1,_binary '\0'),(2,'2023-03-01','2023-04-01',NULL,2,_binary '\0');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordertracking`
--

DROP TABLE IF EXISTS `ordertracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordertracking` (
  `OrderId` int NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL,
  `RequestedDate` datetime NOT NULL,
  `DeliveryDate` datetime DEFAULT NULL,
  `CustName` varchar(200) NOT NULL,
  `CustAddress` varchar(200) NOT NULL,
  `ShoeStyle` varchar(200) NOT NULL,
  `ShoeSize` varchar(10) NOT NULL,
  `SKU` char(8) NOT NULL,
  `UnitPrice` decimal(7,2) NOT NULL,
  `Quantity` smallint NOT NULL,
  `Discount` decimal(4,2) NOT NULL,
  `IsExpedited` bit(1) NOT NULL,
  `TotalPrice` decimal(10,2) GENERATED ALWAYS AS (((`Quantity` * `UnitPrice`) * (1.0 - `Discount`))) STORED,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertracking`
--

LOCK TABLES `ordertracking` WRITE;
/*!40000 ALTER TABLE `ordertracking` DISABLE KEYS */;
INSERT INTO `ordertracking` (`OrderId`, `OrderDate`, `RequestedDate`, `DeliveryDate`, `CustName`, `CustAddress`, `ShoeStyle`, `ShoeSize`, `SKU`, `UnitPrice`, `Quantity`, `Discount`, `IsExpedited`) VALUES (1,'2023-03-01 00:00:00','2023-04-01 00:00:00',NULL,'Arthur Dent','Golgafrincham','Oxford','10_D','OXFORD01',50.00,1,0.00,_binary '\0'),(2,'2023-03-01 00:00:00','2023-04-01 00:00:00',NULL,'Arthur Dent','Golgafrincham','BabySneakers','3','BABYSH01',20.00,1,0.00,_binary '\0'),(3,'2023-03-01 00:00:00','2023-04-01 00:00:00',NULL,'Arthur Dent','Golgafrincham','Killer Heels','7','HEELS001',75.00,1,0.00,_binary '\0'),(4,'2023-10-01 00:00:00','2023-04-01 00:00:00',NULL,'Arthur Dent','Golgafrincham','Boots','10_D','BOOTS001',50.10,1,0.00,_binary '\0'),(5,'2023-10-01 00:00:00','2023-04-01 00:00:00',NULL,'Arthur Dent','Golgafrincham','Slippers','3','SLIPPERS',20.00,1,0.00,_binary '\0');
/*!40000 ALTER TABLE `ordertracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salutations`
--

DROP TABLE IF EXISTS `salutations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salutations` (
  `SalutationID` int NOT NULL AUTO_INCREMENT,
  `Salutation` varchar(5) NOT NULL,
  PRIMARY KEY (`SalutationID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salutations`
--

LOCK TABLES `salutations` WRITE;
/*!40000 ALTER TABLE `salutations` DISABLE KEYS */;
INSERT INTO `salutations` VALUES (1,'Mr.'),(2,'Miss'),(3,'Mrs.');
/*!40000 ALTER TABLE `salutations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `StockID` int NOT NULL AUTO_INCREMENT,
  `StockSKU` char(8) NOT NULL,
  `StockSize` varchar(10) NOT NULL,
  `StockName` varchar(100) NOT NULL,
  `StockPrice` decimal(7,2) NOT NULL,
  PRIMARY KEY (`StockID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'OXFORD01','10_D','Oxford',50.00),(2,'BABYSH01','3','Sneakers',20.00),(3,'HEELS001','7','Killer Heels',75.00);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-04 17:00:33
