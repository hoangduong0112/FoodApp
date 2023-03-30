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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Đồ ăn'),(2,'Đồ uống'),(3,'Đồ chay'),(4,'Bánh Kem'),(5,'Ăn vặt/Vỉa hè');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_StoreMenu_idx` (`store_id`),
  CONSTRAINT `FK_StoreMenu` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'BÁNH CÁ TAIYAKI ĐẶC BIỆT',1),(2,'BÁNH CÁ TAIYAKI NHÂN NGỌT',1),(3,'BÁNH CÁ TAIYAKI NHÂN MẶN',1),(4,'COMBO ĐỘC QUYỀN',2),(5,'HỦ TIẾU',2),(6,'MÌ',2),(7,'SỦI CẢO',2),(8,'HOT DEAL',3),(9,'HOT DEAL CHÁO SƯỜN 1K',3),(10,'MÓN CHÁO',3);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_menu_idx` (`menu_id`),
  CONSTRAINT `FK_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,'Bánh cá Taiyaki Pate - Chà Bông - Phô Mai - Xúc Xích',14000,1),(2,'Bánh cá Taiyaki Trứng Muối - Phô Mai - Chà Bông',15000,1),(3,'Bánh cá Taiyaki Phô Mai',12000,2),(4,'Bánh cá Taiyaki Chocolate',12000,2),(5,'Bánh cá Taiyaki Việt Quất',13000,2),(6,'Bánh cá Taiyaki Nho',13000,2),(7,'Bánh cá Taiyaki Phô Mai - Chà Bông',12000,3),(8,'Bánh cá Taiyaki Trứng Muối - Xúc Xích',13000,3),(9,'Bánh cá Taiyaki Trứng Muối - Pate',13000,3);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CategoryShop_idx` (`category_id`),
  CONSTRAINT `FK_CategoryShop` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Bánh Cá Taiyaki - Phạm Văn Đồng','513/23B Đ. Phạm Văn Đồng, P. 13, Bình Thạnh, TP. HCM','111','https://images.foody.vn/res/g107/1066835/prof/s640x400/file_restaurant_photo_taur_16176-bf889abf-210405162633.jpeg',5),(2,'Anh Quán - Mì Khô Gà Quay & Hủ Tiếu Mì Sủi Cảo','80/17/138 Dương Quảng Hàm, P. 5, Gò Vấp, TP. HCM','111','https://images.foody.vn/res/g88/873165/prof/s640x400/foody-upload-api-foody-mobile-21-jpg-181229121709.jpg',1),(3,'Cháo Sườn Cô Giang - Đinh Tiên Hoàng','14B Đinh Tiên Hoàng, P. Đa Kao, Quận 1, TP. HCM','112','https://images.foody.vn/res/g70/697938/prof/s280x175/foody-upload-api-foody-mobile-11-jpg-180717141743.jpg',1),(4,'Cơm Tấm Bụi Sài Gòn - Thạch Thị Thanh','100 Thạch Thị Thanh, P. Tân Định, Quận 1, TP. HCM','131','https://images.foody.vn/res/g1/542/prof/s640x400/foody-upload-api-foody-mobile-im-5bd794b1-220104082127.jpg',1),(5,'Bò Kho Cô Mai - Since 1984 - Nguyễn Thị Minh Khai','25 Nguyễn Thị Minh Khai, P. Bến Nghé, Quận 1, TP. HCM','311','https://images.foody.vn/res/g98/972557/prof/s640x400/foody-upload-api-foody-mobile-foody-upload-api-foo-191025083749.jpg',1),(6,'Trà Sữa Yolo - Đường Số 44','15 Đường Số 44, P. 10, Quận 6, TP. HCM','111','https://images.foody.vn/res/g8/77771/prof/s640x400/foody-upload-api-foody-mobile-10-200930135839.jpg',2),(7,'Taka Cha - Trà Sữa','69 Huỳnh Thúc Kháng, P. Bến Thành, Quận 1, TP. HCM','111','https://images.foody.vn/res/g100/993432/prof/s640x400/foody-upload-api-foody-mobile-an-22eededd-220126221627.jpeg',2),(8,'Cơm Chay Diệu Thiện - Nguyễn Xí','23 Nguyễn Xí, P. 26, Bình Thạnh, TP. HCM','231','https://images.foody.vn/res/g107/1063485/prof/s640x400/file_restaurant_photo_d6po_16118-8ddd98a3-210128230603.jpg',3),(9,'Cơm Chay Diệu Hạnh','126 Nguyễn Thượng Hiền, Quận 3, TP. HCM','411','https://images.foody.vn/res/g78/776449/prof/s640x400/foody-upload-api-foody-mobile-3-jpg-180920115447.jpg',3),(10,'Tiệm Bánh Ngũ Phúc','103 Gò Công, P. 13, Quận 5, TP. HCM','154','https://images.foody.vn/res/g95/948472/prof/s640x400/file_restaurant_photo_953c_16663-69361dd2-221021200646.jpg',4),(11,'Anh Cường Bakery - Bánh Cua Phô Mai - ','32 Nguyễn Văn Lạc, P. 19, Bình Thạnh, TP. HCM',NULL,'https://images.foody.vn/res/g79/781832/prof/s640x400/foody-upload-api-foody-mobile-banhkembap1-jpg-181002153458.jpg',4);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hoten` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2023-03-31  2:16:38
