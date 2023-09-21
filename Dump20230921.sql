CREATE DATABASE  IF NOT EXISTS `maasin_bamboo_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `maasin_bamboo_system`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: maasin_bamboo_system
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(160) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `date_created` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Administrator','admin','81dc9bdb52d04dc20036dbd8313ed055','2023-08-13 02:38:02');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bamboo_inventory_logs`
--

DROP TABLE IF EXISTS `bamboo_inventory_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bamboo_inventory_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bamboo_section_id` int DEFAULT NULL,
  `initial_matured` int DEFAULT NULL,
  `initial_young` int DEFAULT NULL,
  `initial_destroyed` int DEFAULT NULL,
  `initial_harvested` int DEFAULT NULL,
  `initial_exported` int DEFAULT NULL,
  `delta_matured` int DEFAULT '0',
  `delta_young` int DEFAULT '0',
  `delta_destroyed` int DEFAULT '0',
  `delta_harvested` int DEFAULT '0',
  `delta_exported` int DEFAULT '0',
  `remarks` varchar(160) DEFAULT NULL,
  `logged_by` int DEFAULT NULL,
  `log_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bamboo_inventory_logs`
--

LOCK TABLES `bamboo_inventory_logs` WRITE;
/*!40000 ALTER TABLE `bamboo_inventory_logs` DISABLE KEYS */;
INSERT INTO `bamboo_inventory_logs` VALUES (1,0,20,10,0,0,0,0,0,0,0,0,'Test',NULL,'2023-09-08 13:39:35');
/*!40000 ALTER TABLE `bamboo_inventory_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bamboo_section`
--

DROP TABLE IF EXISTS `bamboo_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bamboo_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lot_id` int DEFAULT NULL,
  `mature_count` int DEFAULT NULL,
  `young_count` int DEFAULT NULL,
  `destroyed_count` int DEFAULT NULL,
  `harvested_count` int DEFAULT NULL,
  `exported_count` int DEFAULT NULL,
  `available_count` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bamboo_section`
--

LOCK TABLES `bamboo_section` WRITE;
/*!40000 ALTER TABLE `bamboo_section` DISABLE KEYS */;
INSERT INTO `bamboo_section` VALUES (1,1,10,0,0,0,0,0),(2,1,20,10,0,0,0,0);
/*!40000 ALTER TABLE `bamboo_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barangay`
--

DROP TABLE IF EXISTS `barangay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barangay` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(160) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barangay`
--

LOCK TABLES `barangay` WRITE;
/*!40000 ALTER TABLE `barangay` DISABLE KEYS */;
INSERT INTO `barangay` VALUES (1,'ABAY'),(2,'ABILAY'),(3,'AGROCEL'),(4,'AMERANG'),(5,'BAGACAY EAST'),(6,'BAGACAY WEST'),(7,'BOLO'),(8,'BUG-OT'),(9,'BULAY'),(10,'BUNTALAN'),(11,'BURAK'),(12,'CABANGCALAN'),(13,'CABATAC'),(14,'CAIGON'),(15,'CANANGHAN'),(16,'CANAWILI'),(17,'DAGAMI'),(18,'DAJA'),(19,'DALUSAN'),(20,'DELCAR'),(21,'INABASAN'),(22,'LAYOG'),(23,'LINAB'),(24,'LIÑAGAN CALSDA'),(25,'LIÑAGAN TACAS'),(26,'MAGSAYSAY'),(27,'MABRIZ'),(28,'MIAPA'),(29,'MANDOG'),(30,'NAGBA'),(31,'NASAKA'),(32,'NASLO'),(33,'NASULI'),(34,'PANALIAN'),(35,'PIANDA-AN WEST'),(36,'PIAND-AN EAST'),(37,'PISPIS'),(38,'PUNONG'),(39,'SINUBSUBAN'),(40,'STA. RITA'),(41,'SUBOG'),(42,'SIWALO'),(43,'THT&P'),(44,'TIGBAUAN'),(45,'TUBANG'),(46,'TULAHONG'),(47,'TUY-AN EAST'),(48,'TUY-AN WEST'),(49,'TRANGKA'),(50,'UBIAN');
/*!40000 ALTER TABLE `barangay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farm_ownership`
--

DROP TABLE IF EXISTS `farm_ownership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farm_ownership` (
  `id` int NOT NULL AUTO_INCREMENT,
  `farmer_id` int DEFAULT NULL,
  `lot_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farm_ownership`
--

LOCK TABLES `farm_ownership` WRITE;
/*!40000 ALTER TABLE `farm_ownership` DISABLE KEYS */;
/*!40000 ALTER TABLE `farm_ownership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer`
--

DROP TABLE IF EXISTS `farmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `address` varchar(160) NOT NULL,
  `brgy_id` smallint NOT NULL,
  `spouse_first_name` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer`
--

LOCK TABLES `farmer` WRITE;
/*!40000 ALTER TABLE `farmer` DISABLE KEYS */;
/*!40000 ALTER TABLE `farmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lot`
--

DROP TABLE IF EXISTS `lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lot_no` varchar(10) NOT NULL,
  `address` varchar(160) NOT NULL,
  `brgy_id` smallint NOT NULL,
  `arp_no` varchar(15) NOT NULL,
  `pin` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot`
--

LOCK TABLES `lot` WRITE;
/*!40000 ALTER TABLE `lot` DISABLE KEYS */;
INSERT INTO `lot` VALUES (1,'a','a',1,'a','a'),(2,'b','b',5,'b','b'),(3,'c','c',12,'c','c');
/*!40000 ALTER TABLE `lot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lot_bounds`
--

DROP TABLE IF EXISTS `lot_bounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lot_bounds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lot_id` int NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot_bounds`
--

LOCK TABLES `lot_bounds` WRITE;
/*!40000 ALTER TABLE `lot_bounds` DISABLE KEYS */;
INSERT INTO `lot_bounds` VALUES (1,1,10.89909780,122.40971039),(2,1,10.89893977,122.41125513),(3,1,10.89807587,122.41139459),(4,1,10.89741215,122.41134095),(5,1,10.89694859,122.41067585),(6,1,10.89702234,122.40950657),(7,1,10.89729626,122.40897020),(8,1,10.89783356,122.40880928),(9,1,10.89872906,122.40849819),(10,1,10.89906619,122.40889510),(11,2,10.89084433,122.44300942),(12,2,10.89135003,122.44562691),(13,2,10.89050719,122.44760075),(14,2,10.88861077,122.44897386),(15,2,10.88599791,122.44772948),(16,2,10.88684077,122.44322397),(17,2,10.88827363,122.44146467),(18,2,10.89029648,122.44082103),(19,3,10.94695584,122.39506937),(20,3,10.94628169,122.40880045),(21,3,10.93987717,122.41171831),(22,3,10.93448379,122.40931537),(23,3,10.93471975,122.39919152),(24,3,10.93615238,122.39086705),(25,3,10.93986032,122.38897903),(26,3,10.94533787,122.38923648);
/*!40000 ALTER TABLE `lot_bounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lot_img_reference`
--

DROP TABLE IF EXISTS `lot_img_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lot_img_reference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brgy_id` smallint NOT NULL,
  `img_path` varchar(512) NOT NULL,
  `top_left_lat` decimal(10,8) NOT NULL,
  `top_left_lng` decimal(11,8) NOT NULL,
  `bottom_right_lat` decimal(10,8) NOT NULL,
  `bottom_right_lng` decimal(11,8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot_img_reference`
--

LOCK TABLES `lot_img_reference` WRITE;
/*!40000 ALTER TABLE `lot_img_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `lot_img_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Farm owner'),(2,'Kagawad');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role_id` tinyint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Raul Armstrong','EdiWOW','0f8ee9c0588abdc9caa17176aee50520',1,1,'2023-08-13 03:26:05');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_status` (
  `id` tinyint NOT NULL,
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status`
--

LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
INSERT INTO `user_status` VALUES (-1,'Inactive'),(0,'New'),(1,'Active');
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-21 19:32:41
