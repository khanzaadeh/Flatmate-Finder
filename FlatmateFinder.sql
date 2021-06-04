-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: flatmatefinder
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `booking_status`
--

DROP TABLE IF EXISTS `booking_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_status` (
  `booking_status_id` int NOT NULL AUTO_INCREMENT,
  `booking_status_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`booking_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_status`
--

LOCK TABLES `booking_status` WRITE;
/*!40000 ALTER TABLE `booking_status` DISABLE KEYS */;
INSERT INTO `booking_status` VALUES (1,'PENDING'),(2,'BOOKED, NOT PAID'),(3,'PAID'),(4,'CANCELLED');
/*!40000 ALTER TABLE `booking_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildings` (
  `building_id` int NOT NULL AUTO_INCREMENT,
  `building_name` varchar(100) DEFAULT NULL,
  `building_description` varchar(255) DEFAULT NULL,
  `building_address` varchar(255) DEFAULT NULL,
  `building_caretaker` varchar(100) DEFAULT NULL,
  `building_phone_no` varchar(75) DEFAULT NULL,
  `building_otherdetails` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildings`
--

LOCK TABLES `buildings` WRITE;
/*!40000 ALTER TABLE `buildings` DISABLE KEYS */;
INSERT INTO `buildings` VALUES (1,'Hajeramonjil','5 storey building Near NSU','408 Aftab Uddin Ahmed Rd, Bashundhora R/A','Afjal Hossain','0178xxxxxxx','building has a garage,lift And CCTV secuirity'),(2,'Nature monjil','10 storey building Near NSU','395-11 Rd No 11, Bashundhora R/A','Sujon Mia','0193xxxxxxx','cctv, garage, lift, roof accessibility'),(3,'SKY Blue','10 storey building Near Brac','Mohakhali, Dhaka-1212','N/A','01745xxxxxx','garage'),(4,'Ahsan Monjil','10 storey building Near DIU','Dhanmondhi','N/A','01894xxxxxx','garage, lift, roof accessable'),(5,'Chaya Nibash','6 storey building Near EWU ','Aftabnagar main road','Mokbul Mia','01986xxxxxx','garage');
/*!40000 ALTER TABLE `buildings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `facilities_id` int NOT NULL AUTO_INCREMENT,
  `facilities_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`facilities_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,'Bua, AC, Fridge, IPS, Wi-Fi, Washing Machine'),(2,'Bua,Fridge, IPS, Wi-Fi, Washing Machine'),(3,'Bua, AC, Fridge, IPS, Wi-Fi'),(4,'Bua, AC, Fridge, Wi-Fi, Washing Machine'),(5,'Bua, AC, Fridge, Genereator, Wi-Fi, Washing Machine');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flat_bookings`
--

DROP TABLE IF EXISTS `flat_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flat_bookings` (
  `flat_booking_id` int NOT NULL AUTO_INCREMENT,
  `flatmate_id` int DEFAULT NULL,
  `booking_status_id` int DEFAULT NULL,
  `booking_start_date` datetime DEFAULT NULL,
  `booking_end_date` datetime DEFAULT NULL,
  `booking_other_details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`flat_booking_id`),
  KEY `fk_flatmate_id` (`flatmate_id`),
  KEY `fk_booking_status_id` (`booking_status_id`),
  CONSTRAINT `fk_booking_status_id` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_status` (`booking_status_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_flatmate_id` FOREIGN KEY (`flatmate_id`) REFERENCES `flatmates` (`flatmate_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flat_bookings`
--

LOCK TABLES `flat_bookings` WRITE;
/*!40000 ALTER TABLE `flat_bookings` DISABLE KEYS */;
INSERT INTO `flat_bookings` VALUES (1,1,3,'2021-05-08 02:24:11','2021-10-08 02:24:11','Paid'),(2,2,2,'2021-05-08 02:24:11','2021-10-08 02:24:11','Booked but not paid'),(3,3,3,'2021-02-08 02:24:11','2021-10-08 02:24:11','Paid'),(4,4,4,'2021-05-08 02:24:11','2021-10-08 02:24:11','Cancelled'),(5,5,2,'2021-04-08 02:24:11','2021-12-08 02:24:11','Booked');
/*!40000 ALTER TABLE `flat_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flat_facilities`
--

DROP TABLE IF EXISTS `flat_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flat_facilities` (
  `flat_id` int NOT NULL,
  `facilities_id` int DEFAULT NULL,
  PRIMARY KEY (`flat_id`),
  KEY `fk_facilities_id` (`facilities_id`),
  CONSTRAINT `fk_facilities_id` FOREIGN KEY (`facilities_id`) REFERENCES `facilities` (`facilities_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_flat_id` FOREIGN KEY (`flat_id`) REFERENCES `flats` (`flat_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flat_facilities`
--

LOCK TABLES `flat_facilities` WRITE;
/*!40000 ALTER TABLE `flat_facilities` DISABLE KEYS */;
INSERT INTO `flat_facilities` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3);
/*!40000 ALTER TABLE `flat_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flatmates`
--

DROP TABLE IF EXISTS `flatmates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flatmates` (
  `flatmate_id` int NOT NULL AUTO_INCREMENT,
  `flat_id` int NOT NULL,
  `flatmate_first_name` varchar(100) DEFAULT NULL,
  `flatmate_last_name` varchar(100) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `other_details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`flatmate_id`),
  KEY `fk_flat_id_flatmates` (`flat_id`),
  CONSTRAINT `fk_flat_id_flatmates` FOREIGN KEY (`flat_id`) REFERENCES `flats` (`flat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flatmates`
--

LOCK TABLES `flatmates` WRITE;
/*!40000 ALTER TABLE `flatmates` DISABLE KEYS */;
INSERT INTO `flatmates` VALUES (1,1,'Samin','Hasan','M','1995-06-30','Bangladeshi, blood group: B+, hometown: Amtali, Barguna'),(2,1,'Shamim','Shahriar','M','1995-07-30','Bangladeshi, blood group: B+, hometown: Amtali, Barguna'),(3,2,'Mehedi','Khan','M','1995-07-08','Bangladeshi, blood group: AB+, hometown: Rangamati'),(4,2,'Tamim','Zaman','M','1996-03-15','Bangladeshi, blood group: A+, hometown: Dinajpur'),(5,3,'Anika','Haq','F','1998-03-14','Bangladeshi, blood group: A-, hometown: Patuakhali, Barishal'),(6,3,'Sadia','Islam','F','2000-02-02','Bangladeshi, blood group: O+, hometown: Bagherhat, Khulna'),(7,4,'Rifat','Jahan','F','1999-02-02','Bangladeshi, blood group: O+, hometown: Kushtia'),(8,5,'Nusrat','Jahan','F','2000-02-14','Bangladeshi, blood group: O+, hometown: Chadpur');
/*!40000 ALTER TABLE `flatmates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flats`
--

DROP TABLE IF EXISTS `flats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flats` (
  `flat_id` int NOT NULL AUTO_INCREMENT,
  `building_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `flat_number` char(2) DEFAULT NULL,
  `bathrooms` int DEFAULT NULL,
  `bedrooms` int DEFAULT NULL,
  `rooms` varchar(10) DEFAULT NULL,
  `availability` varchar(10) DEFAULT NULL,
  `flat_otherdetails` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`flat_id`),
  KEY `fk_buildingid` (`building_id`),
  KEY `fk_userid` (`user_id`),
  CONSTRAINT `fk_buildingid` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`building_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flats`
--

LOCK TABLES `flats` WRITE;
/*!40000 ALTER TABLE `flats` DISABLE KEYS */;
INSERT INTO `flats` VALUES (1,1,1,'2A',2,3,'Total 5','yes','2000 sq ft, good interior with enough spacing and light, good airflow, walls decorated'),(2,1,2,'2B',2,3,'Total 5','yes','2000 sq ft, good interior with enough spacing and light, good airflow, walls decorated'),(3,2,3,'5A',3,4,'Total 6','yes','3000 sq ft, big spacing, nice interior, wall repainted'),(4,2,4,'5B',3,4,'Total 6','yes','3000 sq ft, big spacing, nice interior, wall repainted'),(5,3,5,'2E',2,3,'Total 5','yes','2100 sq ft, wall decorated, excellent ambience'),(6,3,2,'3E',2,3,'Total 5','no','2100 sq ft, wall decorated, excellent ambience'),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `flats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `contact_no` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Akib','Hasan','Bashundhora,Dhaka','akibhasan@gmail.com','0173xxxxxxx'),(2,'Mahmud','Hasan','South Banasree, Dhaka','khan@gmail.com','0157xxxxxxx'),(3,'Lamia','Mahboob','Bashundhora, Dhaka','lamia@gmail.com','0174xxxxxxx'),(4,'Rashed','Khan','Banani, Dhaka','rashed@gmail.com','0167xxxxxxx'),(5,'Kamran','Akmal','Mohammadpur, Dhaka','kamran@gmail.com','0175xxxxxxx');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-07 21:58:36
