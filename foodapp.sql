-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: foodapp
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isOpen` tinyint DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewpoint` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ShopCate_idx` (`category_id`),
  CONSTRAINT `FK_ShopCate` FOREIGN KEY (`category_id`) REFERENCES `shopcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (1,'Con Sói - Sữa Tươi Trân Châu Đường Đen',1,'301 Nguyễn Đình Chiểu, P. 5, Quận 3, TP. HCM',5,2),(2,'Starbucks Coffee - Cách Mạng Tháng 8',1,'241Bis Cách Mạng Tháng 8, P. 4, Quận 3, TP. HCM',4,2),(3,'Chè Hoa - Trần Cao Vân',1,'15 Trần Cao Vân, P. Đakao, Quận 1, TP. HCM',4,5),(4,'TKY Takoyaki - Nguyễn Thượng Hiền',1,'153 Nguyễn Thượng Hiền, P. 4, Quận 3, TP. HCM',3,7),(5,'Cơm Ba Ghiên - Nguyễn Văn Trỗi',1,'146/3 Nguyễn Văn Trỗi, P. 8, Phú Nhuận, TP. HCM',5,1),(6,'Gà Rán Popeyes - An Dương Vương',1,'326 An Dương Vương, P. 4, Quận 5, TP. HCM',5,9);
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcategory`
--

DROP TABLE IF EXISTS `shopcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcategory`
--

LOCK TABLES `shopcategory` WRITE;
/*!40000 ALTER TABLE `shopcategory` DISABLE KEYS */;
INSERT INTO `shopcategory` VALUES (1,'Đồ ăn'),(2,'Đồ uống'),(3,'Đồ chay'),(4,'Bánh Kem'),(5,'Tráng miệng'),(6,'Homemade'),(7,'Vỉa hè'),(8,'Pizza/Burger'),(9,'Món gà'),(10,'Món lẩu'),(11,'Sushi'),(12,'Mì phở'),(13,'Cơm hộp');
/*!40000 ALTER TABLE `shopcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-27 22:20:59
