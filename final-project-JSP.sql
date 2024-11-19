CREATE DATABASE  IF NOT EXISTS `system_station` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `system_station`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: system_station
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminname` varchar(45) NOT NULL,
  `ademail` varchar(45) DEFAULT NULL,
  `adpass` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`adminname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('vrpass','system_station06@gmail.com','789456','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `prod_id` int NOT NULL,
  `prod_name` varchar(45) NOT NULL,
  `prod_cat` varchar(45) NOT NULL,
  `prod_desc` varchar(400) NOT NULL,
  `prod_price` varchar(45) NOT NULL,
  `prod_img` varchar(450) NOT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactus`
--

DROP TABLE IF EXISTS `contactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactus` (
  `name` varchar(45) NOT NULL,
  `phno` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `question` varchar(500) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactus`
--

LOCK TABLES `contactus` WRITE;
/*!40000 ALTER TABLE `contactus` DISABLE KEYS */;
INSERT INTO `contactus` VALUES ('Suprit','9353410837','supritkumar9353@gmail.com','Awesome application for all in one computer delights.','2024-03-19'),('Adithya','8593214655','adithya@gmail.com','Awesome website','2024-03-19'),('nandini','9353410837','nandini@gmail.com','good','2024-03-27');
/*!40000 ALTER TABLE `contactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editprofile`
--

DROP TABLE IF EXISTS `editprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editprofile` (
  `profilephoto` longblob,
  `pusername` varchar(45) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `mobileno` varchar(20) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pusername`),
  UNIQUE KEY `puserrname_UNIQUE` (`pusername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editprofile`
--

LOCK TABLES `editprofile` WRITE;
/*!40000 ALTER TABLE `editprofile` DISABLE KEYS */;
INSERT INTO `editprofile` VALUES (_binary 'null','abc','krishna','e r','7418529630','Female','Karnataka','hosur','580020'),(_binary 'null','ARP','krishna','e r','7418529630','Female','Karnataka','hosur','580020'),(_binary 'null','rrdhfjfj','hhgjh','hvjh','jhgjh','Male','hfhjg','gjg','hjgj'),(_binary 'null','sangmesh','adfadf','adfadf','adfadfa','Male','adafadf','fafadfa','adfadfa'),(_binary 'null','SRP','krishna','e r','7418529630','Female','Karnataka','hosur','580020'),(_binary 'null','suprit100','suprit','R P','9353410837','Male','Karnataka','Hubli','580028'),(_binary 'null','suprit80','suprit','R P','9353410837','Male','Karnataka','Hubli','580028'),(_binary 'null','wer','suprit','R P','9353410837','Male','Karnataka','Hubli','580028');
/*!40000 ALTER TABLE `editprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledgers`
--

DROP TABLE IF EXISTS `ledgers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ledgers` (
  `orderId` int NOT NULL,
  `cust_name` varchar(450) NOT NULL,
  `email` varchar(450) NOT NULL,
  `prod_id` varchar(450) NOT NULL,
  `prod_name` varchar(450) NOT NULL,
  `prod_cat` varchar(450) NOT NULL,
  `prod_desc` varchar(450) NOT NULL,
  `prod_img` varchar(450) NOT NULL,
  `total_amt` varchar(450) NOT NULL,
  `address` varchar(800) NOT NULL,
  `deliver_date` date NOT NULL,
  `phno` varchar(450) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledgers`
--

LOCK TABLES `ledgers` WRITE;
/*!40000 ALTER TABLE `ledgers` DISABLE KEYS */;
INSERT INTO `ledgers` VALUES (4302,'Supritkumar','supritkumar9353@gmail.com','4785','Acer','Laptop','Acer Aspire Lite 12th Gen Intel Core i5-1235U Thin and Light Laptop','https://i.ibb.co/vHkz2Wb/acer.jpg','47990.0','Maruthi nagar,Hubli','2024-04-11','9353410837'),(4936,'Supritkumar','supritkumar9353@gmail.com','5214','Display port','Port','Display Port to Display Port Cable- Female-to-Female','https://i.ibb.co/nnB23KC/a2.jpg','1100.0','Maruthi nagar,Hubli','2024-04-13','9353410837'),(3756,'Supritkumar','supritkumar9353@gmail.com','2496','HP','Printer','HP Smart Tank 585 All-in-one WiFi Colour Printer (Upto 6000 Black and 6000 Colour Pages)','https://i.ibb.co/hWCfrqf/hp-p2.jpg','11100.0','Maruthi nagar,Hubli','2024-04-13','9353410837'),(7753,'Supritkumar','supritkumar9353@gmail.com','5741','Lemorele','USB','Lemorele USB C Docking Station for Laptop, 10 in 1 Triple Display Monitors','https://i.ibb.co/rmtjxnK/usb.jpg','2699.0','Maruthi nagar,Hubli','2024-05-13','9353410837'),(5732,'Supritkumar','supritkumar9353@gmail.com','1459','ASUS','Desktop','ASUS Vivo AiO V222 All-in-One Desktop','https://i.ibb.co/0QYT4PR/compu.jpg','28990.0','Maruthi nagar,Hubli','2024-05-13','9353410837'),(5732,'Supritkumar','supritkumar9353@gmail.com','3657','ZEBRONICS','CPU Cabinet','ZEBRONICS Glass Raptor Mid-Tower Premium Gaming Cabinet CPU','https://i.ibb.co/hgCPYWD/cpu.jpg','8829.0','Maruthi nagar,Hubli','2024-05-13','9353410837');
/*!40000 ALTER TABLE `ledgers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderId` int NOT NULL,
  `cust_name` varchar(450) NOT NULL,
  `email` varchar(450) NOT NULL,
  `prod_id` varchar(45) NOT NULL,
  `prod_name` varchar(450) NOT NULL,
  `prod_cat` varchar(450) NOT NULL,
  `prod_desc` varchar(450) NOT NULL,
  `prod_img` varchar(800) NOT NULL,
  `total_amt` varchar(45) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `address` varchar(450) NOT NULL,
  `phno` varchar(450) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (7986,'Supritkumar','supritkumar9353@gmail.com','2789','Lenovo','Monitor','Lenovo ThinkVision S24e-2023.8\" FHD Monitor','https://i.ibb.co/68n9psL/a3.jpg','8373.0','null','Maruthi nagar,Hubli','9353410837');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prod_id` int NOT NULL,
  `prod_name` varchar(45) DEFAULT NULL,
  `prod_cat` varchar(45) DEFAULT NULL,
  `prod_desc` varchar(1000) DEFAULT NULL,
  `prod_price` varchar(45) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `prod_img` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1078,'HP','Printer','HP Deskjet 2331 Colour Printer,Scanner and Copier for Home/Small Office','3773.0',3,'https://i.ibb.co/72MN7TC/hp3.jpg'),(1247,'Quick Heal','Antivirus','Quick Heal | Total Security Renewal Upgrade Gold pack | 1 User | 3 years','1100.0',12,'https://i.ibb.co/Y2xhNmY/a1.jpg'),(1423,'Quick Heal','Antivirus','Quick Heal Internet Security Latest Version - 1 PC, 1 Year','699.0',20,'https://i.ibb.co/1XvXV0B/inter.jpg'),(1459,'ASUS','Desktop','ASUS Vivo AiO V222 All-in-One Desktop','28990.0',1,'https://i.ibb.co/0QYT4PR/compu.jpg'),(2378,'HP','Printer','HP Smart Tank 529 AIO Colour Printer (Upto 6000 Black & 6000 Colour Pages Included in The Box)','10363.0',4,'https://i.ibb.co/3s9cvPT/hp-p.jpg'),(2496,'HP','Printer','HP Smart Tank 585 All-in-one WiFi Colour Printer (Upto 6000 Black and 6000 Colour Pages)','11100.0',2,'https://i.ibb.co/hWCfrqf/hp-p2.jpg'),(2789,'Lenovo','Monitor','Lenovo ThinkVision S24e-2023.8\" FHD Monitor','8373.0',2,'https://i.ibb.co/68n9psL/a3.jpg'),(3489,'Hard Disk','Storage device','Western Digital 1TB SATA7200RPM 3.5\" Desktop Hard Disk','2700.0',5,'https://i.ibb.co/HtmncCV/a4.jpg'),(3657,'ZEBRONICS','CPU Cabinet','ZEBRONICS Glass Raptor Mid-Tower Premium Gaming Cabinet CPU','8829.0',3,'https://i.ibb.co/hgCPYWD/cpu.jpg'),(4287,'Quick Heal','Antivirus','Quick Heal | Total Security | Latest Version | 2 Users | 3 Years','2863.0',10,'https://i.ibb.co/t218Fqv/a3y.jpg'),(4785,'Acer','Laptop','Acer Aspire Lite 12th Gen Intel Core i5-1235U Thin and Light Laptop','47990.0',5,'https://i.ibb.co/vHkz2Wb/acer.jpg'),(4859,'Dell','Monitor','Dell E2422HN 24 Inch Full HD LED-Backlit LCD Monitor','1363.0',2,'https://i.ibb.co/YXRx7W0/a1.jpg'),(5214,'Display port','Port','Display Port to Display Port Cable- Female-to-Female','1100.0',10,'https://i.ibb.co/nnB23KC/a2.jpg'),(5741,'Lemorele','USB','Lemorele USB C Docking Station for Laptop, 10 in 1 Triple Display Monitors','2699.0',10,'https://i.ibb.co/rmtjxnK/usb.jpg'),(7568,'HP','Printer','HP Ink Advantage 4278 Printer, Automatic Document Feeder Simple Setup Smart App, Ideal for Home','6999.0',5,'https://i.ibb.co/ypZ4McH/hp4.jpg'),(9874,'McAfee','Antivirus','McAfee Antivirus 2024 | 1 Device, 3 Year | Antivirus Internet Security Software','660.0',15,'https://i.ibb.co/8r0vH9B/mac.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `designation` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `mobileno` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES ('customer','adi001','Aditya H','7418529630','adithya@gmail.com','nekar nagar, hubli','Karnataka','hosur','580020','123456'),('customer','gsdesai07','Girish S Desai','6361255693','gsdesai07@gmail.com','Saptapur','Karnataka','Dharwad','580001','@Gsdesai07'),('customer','Nandini','Nandini','1234567890','abc@gmail.com','abc','Karnataka','Dharwad','580025','Abc@123'),('customer','pratik','pratikg','8310308803','prateekgaidoli@gmail.com','HUblli','Karnataka','Hubli','580031','123456'),('customer','preetam@123','Preetam Karoshi','7338483340','preetamkrsh2@gmail.com','Navanagar Hubli','Karnataka','Hubli','580025','Preetamkrsh@2005'),('customer','suprit007','Supritkumar','9353410837','supritkumar9353@gmail.com','Maruthi nagar,Hubli','Karnataka','Hubli','580028','147258'),('customer','tandavraj123','TandavRaj','9353410837','supritkumarrpagalapur@gmail.com','Maruthi nagar,Hubli','Karnataka','Hubli','580028','258369');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `d_name` varchar(450) NOT NULL,
  `d_email` varchar(450) NOT NULL,
  `d_pass` varchar(450) NOT NULL,
  `designation` varchar(45) NOT NULL,
  PRIMARY KEY (`d_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES ('raj','system_station06@gmail.com','456789','delivery');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `prod_name` varchar(45) NOT NULL,
  `prod_desc` varchar(400) NOT NULL,
  `prod_price` varchar(45) NOT NULL,
  `prod_id` varchar(45) NOT NULL,
  `prod_img` varchar(450) NOT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES ('Dell','Dell E2422HN 24 Inch Full HD LED-Backlit LCD Monitor','1363.0','4859','https://i.ibb.co/YXRx7W0/a1.jpg');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-16 11:53:01
