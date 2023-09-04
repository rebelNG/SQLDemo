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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-04 16:56:39
