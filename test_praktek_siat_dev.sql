-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: test_praktek_siat_dev
-- ------------------------------------------------------
-- Server version	8.0.32-0buntu0.20.04.1

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
-- Table structure for table `block_list`
--

DROP TABLE IF EXISTS `block_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(20) NOT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ip_address` (`ip_address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_list`
--

LOCK TABLES `block_list` WRITE;
/*!40000 ALTER TABLE `block_list` DISABLE KEYS */;
INSERT INTO `block_list` VALUES (1,'::1','2023-01-30 11:35:36'),(2,'::1','2023-01-30 11:41:06');
/*!40000 ALTER TABLE `block_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_access`
--

DROP TABLE IF EXISTS `ip_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_access` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(20) DEFAULT NULL,
  `success_login` tinyint(1) NOT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ip_address` (`ip_address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_access`
--

LOCK TABLES `ip_access` WRITE;
/*!40000 ALTER TABLE `ip_access` DISABLE KEYS */;
INSERT INTO `ip_access` VALUES (1,'::1',0,'2023-01-30 11:06:31'),(2,'::1',0,'2023-01-30 11:06:46'),(3,'::1',0,'2023-01-30 11:06:47'),(4,'::1',0,'2023-01-30 11:07:36'),(5,'::1',0,'2023-01-30 11:07:50'),(6,'::1',1,'2023-01-30 11:08:00'),(7,'::1',1,'2023-01-30 11:35:29'),(8,'::1',0,'2023-01-30 11:35:31'),(9,'::1',0,'2023-01-30 11:35:33'),(10,'::1',0,'2023-01-30 11:35:34'),(11,'::1',0,'2023-01-30 11:38:07'),(12,'::1',0,'2023-01-30 11:38:09'),(13,'::1',1,'2023-01-30 11:38:12'),(14,'::1',0,'2023-01-30 11:41:04');
/*!40000 ALTER TABLE `ip_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user','user@gmail.com','User','$2y$10$TGFaBVrJAAOlLawAvI0xGuxbYUpiVlvC5svMo2eN8t1zuClvGdL7C');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `white_list_ip`
--

DROP TABLE IF EXISTS `white_list_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `white_list_ip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_address` (`ip_address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `white_list_ip`
--

LOCK TABLES `white_list_ip` WRITE;
/*!40000 ALTER TABLE `white_list_ip` DISABLE KEYS */;
INSERT INTO `white_list_ip` VALUES (1,'::11');
/*!40000 ALTER TABLE `white_list_ip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-30 11:43:57
