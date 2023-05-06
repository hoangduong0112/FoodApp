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
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user-comment_idx` (`user_id`),
  KEY `FK_store-comment_idx` (`store_id`),
  CONSTRAINT `FK_store-comment` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `FK_user-comment` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'111',NULL,1,1),(2,'adsdas','2023-05-06 02:03:42',2,1),(3,'ád','2023-05-06 16:14:47',2,2),(4,'ád','2023-05-06 16:17:13',2,2),(5,'ádsdaads','2023-05-06 16:17:25',2,2),(6,'ưeqwqe','2023-05-06 16:22:47',2,2),(7,'ưeqwqeưeq','2023-05-06 16:22:48',2,2),(8,'ưqeqwe','2023-05-06 16:31:15',2,2);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user-follow_idx` (`user_id`),
  KEY `FK_store-follow_idx` (`store_id`),
  CONSTRAINT `FK_store-follow` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `FK_user-follow` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (1,2,1),(2,2,3),(13,17,2),(14,17,1),(15,17,30),(16,17,9),(17,17,7),(18,17,8),(19,17,4);
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_StoreMenu_idx` (`store_id`),
  CONSTRAINT `FK_StoreMenu` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (4,'COMBO ĐỘC QUYỀN',2),(5,'SỦI CẢO',2),(6,'MÌ',2),(7,'MÓN THÊM',2),(10,'MÓN CHÁO',3),(11,'COMBO HOT',4),(12,'MENU CANH',4),(13,'MÓN THÊM',4),(14,'COMBO',5),(15,'MÓN CHÍNH',5),(16,'MÓN THÊM',5),(17,'TRÀ SỮA',6),(18,'HỒNG TRÀ - TRÀ ĐÀO',6),(30,'BÁNH CÁ TAIYAKI ĐẶC BIỆT',1),(31,'BÁNH CÁ TAIYAKI NHÂN NGỌT',1),(32,'BÁNH CÁ TAIYAKI NHÂN MẶN',1),(38,'DEAL TUYỆT ĐỈNH - GIẢM 25K',3),(40,'DEAL LINH ĐÌNH - GIẢM 40K',3),(41,'TRÀ SỮA',7),(42,'TRÀ TRÁI CÂY',7),(43,'TRÀ NGUYÊN VỊ SỦI BỌT',7),(61,'Hoàng ',1);
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
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_menu_idx` (`menu_id`),
  CONSTRAINT `FK_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (13,'Canh Nghêu đậu hũ non',16000,12),(14,'Canh Cua Đồng',16000,12),(15,'Canh Nghêu đậu hũ non',19000,12),(16,'Chả',4000,13),(17,'Cơm thêm',2000,13),(18,'Ốp la',7000,13),(25,'Nha Đam Hạt Chia',15000,18),(31,'Hồng trà tắc',12000,18),(34,'Cháo Thịt Bằm nhỏ + Trứng Gà',25000,10),(37,'Combo Cơm xá xíu + canh + Nước sâm',56000,4),(38,'Combo Mì khô gà quay+nước ngọt',59000,4),(40,'Sủi cảo sốt ớt',25000,5),(41,'Sủi Cảo Chiên',30000,5),(42,'Mì cọng nhỏ',8000,7),(43,'Mì cọng lớn',8000,7),(44,'Mì khô gà quay cọng nhỏ',8000,6),(60,'Bánh cá Taiyaki Pate - Chà Bông - Phô Mai - Xúc Xích',14000,30),(61,'Bánh cá Taiyaki Trứng Muối - Phô Mai - Chà Bông',14000,30),(62,'Bánh cá Taiyaki Phô Mai',12000,31),(63,'Bánh cá Taiyaki Chocolate',12000,31),(64,'Bánh cá Taiyaki Việt Quất',12000,31),(65,'Bánh cá Taiyaki Phô Mai - Chà Bông',12000,32),(66,'Bánh cá Taiyaki Xúc Xích - Phô Mai',12000,32),(67,'Bánh cá Taiyaki Khô Bò Sợi',13000,32),(68,'Bánh cá Taiyaki Xúc Xích - Chà Bông',12000,32),(69,'Cháo Sườn Thập Cẩm',55000,10),(70,'Cháo Sườn thịt bằm lớn',30000,10),(71,'Cháo Sườn Lớn Bách Thảo',38000,10),(72,'Cháo Sườn Lớn Bắc Thảo + 01 Coca-Cola',53000,38),(73,'Cháo Sườn Bò Viên + 01 Coca-Cola',51000,38),(74,'2 Cháo Sườn Lớn Bắc Thảo + 02 Coca-Cola',106000,40),(75,'2 Cháo Sườn Bò Viên + 02 Coca-Cola',102000,40),(76,'Cơm sườn non nướng mật ong + Canh khổ qua dồn thịt cá Thác lác',81000,11),(77,'Combo 83k: Bò Kho Tô Lớn + Sâm Lạnh + Khăn',83000,14),(78,'Combo 90k: Bò Kho Tô Lớn (Nạm bò+Gân bò), Dừa tắc muối, Khăn',90000,14),(79,'Bánh Mì Bò Kho',64000,15),(80,'Hủ Tiếu Dai Bò Kho',64000,15),(81,'Hủ Tiếu Mềm Bò Kho',64000,15),(82,'Bánh Mì',5000,16),(83,'Mì Tươi',1000,16),(84,'Thịt Thêm',50000,16),(85,'Trà sữa Thái xanh',16000,17),(86,'Trà sữa nguyên vị',15000,17),(87,'Trà sữa chocolate',18000,17),(88,'Hồng Trà Thập Cẩm Yolo',14000,18),(89,'Trà sữa truyền thống (Đậm Trà)',25000,41),(90,'Trà sữa oolong sen',25000,41),(91,'Lục Hoa Trà Sữa',25000,41),(92,'OLONG XOÀI ĐÀO',25000,42),(93,'Lục trà dưa gang',25000,42),(94,'Lục trà việt quất',25000,42),(95,'Lục trà mật ong',20000,43),(96,'Lục trà',15000,43),(99,' Gà',120002,61);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_item-order_idx` (`item_id`),
  KEY `FK_order-detail_idx` (`order_id`),
  CONSTRAINT `FK_item-order` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`id`),
  CONSTRAINT `FK_order-detail` FOREIGN KEY (`order_id`) REFERENCES `order_sale` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (2,2,34,4,'WAITING'),(3,3,34,5,'WAITING'),(4,4,41,2,'WAITING'),(5,4,44,2,'WAITING'),(6,5,37,2,'WAITING'),(7,5,38,2,'WAITING'),(8,6,13,2,'WAITING'),(9,6,14,2,'WAITING'),(10,6,15,2,'WAITING'),(11,7,34,3,'WAITING'),(12,8,13,2,'WAITING'),(13,8,14,3,'WAITING'),(14,9,64,1,'ACCEPT'),(15,9,66,1,'WAITING'),(16,9,60,1,'WAITING'),(17,9,61,1,'WAITING'),(18,9,62,1,'WAITING'),(19,9,63,1,'DECLINE'),(20,10,65,2,'ACCEPT'),(21,10,66,2,'WAITING'),(22,11,64,1,'WAITING'),(23,11,62,1,'WAITING'),(24,11,63,1,'WAITING'),(25,12,64,1,'WAITING'),(26,12,61,1,'ACCEPT'),(27,12,62,2,'WAITING'),(28,12,63,1,'WAITING'),(29,13,64,2,'WAITING'),(30,13,62,2,'WAITING'),(31,13,63,2,'WAITING'),(32,14,60,4,'WAITING'),(33,14,61,5,'WAITING'),(34,15,38,1,'WAITING'),(35,15,40,1,'WAITING'),(36,15,41,2,'WAITING'),(37,16,90,1,'WAITING'),(38,16,91,1,'WAITING'),(39,16,92,2,'WAITING'),(40,17,41,2,'WAITING'),(41,17,44,2,'WAITING'),(42,18,37,1,'WAITING'),(43,18,38,1,'WAITING'),(44,18,40,1,'WAITING'),(45,18,41,2,'WAITING'),(46,19,69,1,'WAITING'),(47,19,70,2,'WAITING'),(48,19,71,1,'ACCEPT'),(49,20,60,1,'ACCEPT'),(50,20,61,2,'ACCEPT'),(51,21,37,1,'WAITING'),(52,21,38,1,'WAITING'),(53,21,40,2,'WAITING'),(54,22,37,1,'WAITING'),(55,22,38,1,'WAITING'),(56,22,40,1,'WAITING'),(57,22,41,1,'WAITING'),(58,22,44,1,'WAITING'),(59,23,37,2,'WAITING'),(60,23,38,2,'WAITING'),(61,24,40,2,'WAITING'),(62,24,41,1,'WAITING'),(63,25,60,1,'WAITING'),(64,25,61,1,'WAITING'),(65,25,62,1,'WAITING'),(66,26,37,1,'WAITING'),(67,26,38,1,'WAITING'),(68,26,40,2,'WAITING'),(69,27,62,1,'WAITING'),(70,27,63,1,'WAITING'),(71,28,64,1,'WAITING'),(72,28,60,1,'WAITING'),(73,28,61,1,'WAITING'),(74,29,61,2,'WAITING'),(75,29,62,2,'WAITING'),(76,29,63,1,'WAITING'),(77,30,64,2,'WAITING'),(78,30,63,2,'WAITING'),(79,31,60,2,'WAITING'),(80,31,61,1,'WAITING'),(81,31,62,1,'WAITING'),(82,32,60,1,'WAITING'),(83,32,61,1,'WAITING'),(84,32,62,1,'WAITING'),(85,33,65,1,'WAITING'),(86,33,66,1,'WAITING'),(87,33,67,1,'WAITING'),(88,34,64,2,'ACCEPT'),(89,34,63,2,'WAITING'),(90,35,60,2,'WAITING'),(91,35,61,2,'ACCEPT'),(92,36,37,2,'WAITING'),(93,36,38,2,'WAITING'),(94,37,60,1,'WAITING'),(95,37,61,4,'ACCEPT'),(96,38,64,2,'WAITING'),(97,38,65,1,'WAITING'),(98,38,63,1,'WAITING'),(99,39,65,2,'WAITING'),(100,39,66,2,'WAITING'),(101,40,60,1,'WAITING'),(102,40,61,1,'WAITING'),(103,41,60,2,'WAITING'),(104,41,61,4,'WAITING'),(105,42,64,1,'WAITING'),(106,42,62,2,'WAITING'),(107,42,63,1,'WAITING'),(108,43,40,1,'WAITING'),(109,43,41,1,'WAITING'),(110,43,44,1,'WAITING'),(111,44,64,1,'WAITING'),(112,44,61,1,'WAITING'),(113,44,62,1,'ACCEPT'),(114,44,63,1,'ACCEPT'),(115,45,65,1,'ACCEPT'),(116,45,66,1,'ACCEPT'),(117,45,67,1,'ACCEPT'),(118,45,68,1,'ACCEPT'),(119,46,38,1,'WAITING'),(120,46,40,1,'WAITING'),(121,46,41,1,'WAITING'),(122,47,37,1,'WAITING'),(123,47,38,1,'WAITING'),(124,47,40,1,'WAITING'),(125,48,40,1,'WAITING'),(126,48,41,1,'WAITING'),(130,49,99,2,'WAITING'),(131,50,64,1,'WAITING'),(132,50,65,1,'WAITING'),(133,50,66,1,'WAITING'),(134,50,63,1,'WAITING'),(135,51,37,2,'WAITING'),(136,51,38,2,'WAITING'),(137,52,64,1,'WAITING'),(138,52,61,5,'WAITING'),(139,53,38,1,'WAITING'),(140,53,40,1,'WAITING'),(141,54,72,1,'WAITING'),(142,54,74,1,'WAITING'),(143,55,38,1,'WAITING'),(144,55,40,1,'WAITING'),(145,56,38,1,'WAITING'),(146,56,40,1,'WAITING');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_sale`
--

DROP TABLE IF EXISTS `order_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_sale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user-order_idx` (`user_id`),
  CONSTRAINT `FK_user-order` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_sale`
--

LOCK TABLES `order_sale` WRITE;
/*!40000 ALTER TABLE `order_sale` DISABLE KEYS */;
INSERT INTO `order_sale` VALUES (2,'2023-04-28 16:00:38',1),(3,'2023-04-28 17:32:45',1),(4,'2023-04-28 17:43:29',1),(5,'2023-04-28 17:45:10',1),(6,'2023-04-28 17:49:34',1),(7,'2023-04-28 22:45:49',1),(8,'2023-04-28 22:52:35',1),(9,'2023-04-30 03:02:59',2),(10,'2023-04-30 03:03:14',2),(11,'2023-04-30 03:04:47',2),(12,'2023-04-30 17:02:49',2),(13,'2023-05-01 00:57:35',2),(14,'2023-05-01 14:47:05',2),(15,'2023-05-02 22:17:00',2),(16,'2023-05-02 22:40:39',2),(17,'2023-05-02 22:42:33',2),(18,'2023-05-02 23:17:13',2),(19,'2023-05-02 23:29:56',2),(20,'2023-05-03 01:39:44',2),(21,'2023-05-03 20:16:38',17),(22,'2023-05-03 20:24:23',17),(23,'2023-05-03 20:45:08',17),(24,'2023-05-03 20:47:42',17),(25,'2023-05-03 20:48:17',17),(26,'2023-05-03 20:53:27',17),(27,'2023-05-03 20:59:48',17),(28,'2023-05-03 21:09:19',17),(29,'2023-05-03 21:13:41',17),(30,'2023-05-03 21:20:54',17),(31,'2023-05-03 21:47:47',2),(32,'2023-05-03 22:00:50',2),(33,'2023-05-03 22:20:17',2),(34,'2023-05-03 22:26:09',2),(35,'2023-05-04 00:21:07',2),(36,'2023-05-04 00:27:52',2),(37,'2023-05-04 00:32:36',2),(38,'2023-05-04 00:47:55',2),(39,'2023-05-04 00:56:33',2),(40,'2023-05-04 01:38:18',2),(41,'2023-05-04 01:42:20',2),(42,'2023-05-04 02:08:40',17),(43,'2023-05-04 02:19:44',17),(44,'2023-05-04 02:29:17',2),(45,'2023-05-04 02:30:52',2),(46,'2023-05-04 02:34:13',2),(47,'2023-05-04 02:38:29',2),(48,'2023-05-04 02:39:29',2),(49,'2023-05-05 02:22:17',2),(50,'2023-05-05 02:23:33',2),(51,'2023-05-06 00:17:18',2),(52,'2023-05-06 15:52:10',2),(53,'2023-05-06 15:52:41',2),(54,'2023-05-06 16:04:56',2),(55,'2023-05-06 16:05:11',2),(56,'2023-05-06 16:08:16',2);
/*!40000 ALTER TABLE `order_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CategoryShop_idx` (`category_id`),
  KEY `FK_UserStore_idx` (`user_id`),
  CONSTRAINT `FK_CategoryShop` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_UserStore` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Bánh cá Taiyaki - Phạm Văn Đồng','513/23B Đ. Phạm Văn Đồng, P. 13, Bình Thạnh, TP. HCM','1234153','https://images.foody.vn/res/g107/1066835/prof/s640x400/file_restaurant_photo_taur_16176-bf889abf-210405162633.jpeg',1,2,NULL),(2,'Anh Quán - Mì Khô Gà Quay & Hủ Tiếu Mì Sủi Cảo','80/17/138 Dương Quảng Hàm, P. 5, Gò Vấp, TP. HCM','111421221aa1','https://images.foody.vn/res/g88/873165/prof/s640x400/foody-upload-api-foody-mobile-21-jpg-181229121709.jpg',1,6,NULL),(3,'Cháo Sườn Cô Giang - Đinh Tiên Hoàng','14B Đinh Tiên Hoàng, P. Đa Kao, Quận 1, TP. HCM','1122','https://res.cloudinary.com/dmfr3gngl/image/upload/v1682193553/rmuu2z2uel0h0ytfncxc.jpg',1,7,NULL),(4,'Cơm Tấm Bụi Sài Gòn - Thạch Thị Thanh','100 Thạch Thị Thanh, P. Tân Định, Quận 1, TP. HCM','131','https://images.foody.vn/res/g1/542/prof/s640x400/foody-upload-api-foody-mobile-im-5bd794b1-220104082127.jpg',1,8,NULL),(5,'Bò Kho Cô Mai - Since 1984 - Nguyễn Thị Minh Khai','25 Nguyễn Thị Minh Khai, P. Bến Nghé, Quận 1, TP. HCM','311','https://images.foody.vn/res/g98/972557/prof/s640x400/foody-upload-api-foody-mobile-foody-upload-api-foo-191025083749.jpg',1,9,NULL),(6,'Trà Sữa Yolo - Đường Số 44','15 Đường Số 44, P. 10, Quận 6, TP. HCM','111','https://images.foody.vn/res/g8/77771/prof/s640x400/foody-upload-api-foody-mobile-10-200930135839.jpg',2,10,NULL),(7,'Taka Cha - Trà Sữa','69 Huỳnh Thúc Kháng, P. Bến Thành, Quận 1, TP. HCM','111','https://images.foody.vn/res/g100/993432/prof/s640x400/foody-upload-api-foody-mobile-an-22eededd-220126221627.jpeg',2,11,NULL),(8,'Cơm Chay Diệu Thiện - Nguyễn Xí','23 Nguyễn Xí, P. 26, Bình Thạnh, TP. HCM','231','https://images.foody.vn/res/g107/1063485/prof/s640x400/file_restaurant_photo_d6po_16118-8ddd98a3-210128230603.jpg',3,12,NULL),(9,'Cơm Chay Diệu Hạnh','126 Nguyễn Thượng Hiền, Quận 3, TP. HCM','411','https://images.foody.vn/res/g78/776449/prof/s640x400/foody-upload-api-foody-mobile-3-jpg-180920115447.jpg',3,13,NULL),(30,'Hoàng Dương','075201007243','','https://res.cloudinary.com/dmfr3gngl/image/upload/v1683197241/imwrvncgz2dddlycjmlh.jpg',2,15,NULL);
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
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hoten` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'duong','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,'Hoang Duong',NULL,'ROLE_ADMIN',_binary ''),(2,'partner1','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','hd123789a@gmail.com','Hoang Duong','https://res.cloudinary.com/dmfr3gngl/image/upload/v1682668506/ydhr2po8r7tdwe0mmkea.jpg','ROLE_PARTNER',_binary ''),(6,'partner2','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','hd123789a@gmail.com','Hoang Duong',NULL,'ROLE_PARTNER',_binary ''),(7,'partner3','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','hd123789a@gmail.com','Hoang Duong',NULL,'ROLE_PARTNER',_binary ''),(8,'partner4','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','hd123789a@gmail.com','Hoang Duong',NULL,'ROLE_PARTNER',_binary ''),(9,'partner5','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','hd123789a@gmail.com','Hoang Duong',NULL,'ROLE_PARTNER',_binary ''),(10,'partner6','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','hd123789a@gmail.com','Hoang Duong',NULL,'ROLE_PARTNER',_binary ''),(11,'partner7','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','hd123789a@gmail.com','Hoang Duong',NULL,'ROLE_PARTNER',_binary ''),(12,'partner8','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','hd123789a@gmail.com','Hoang Duong',NULL,'ROLE_PARTNER',_binary ''),(13,'partner9','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','hd123789a@gmail.com','Hoang Duong',NULL,'ROLE_PARTNER',_binary ''),(14,'partner10','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','hd123789a@gmail.com','Hoang Duong',NULL,'ROLE_PARTNER',_binary ''),(15,'partner11','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','hd123789a@gmail.com','Hoang Duong',NULL,'ROLE_PARTNER',_binary ''),(16,'user1','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','hd123789a@gmail.com','Hoang Duong',NULL,'ROLE_USER',_binary ''),(17,'duong111','$2a$10$hvTGXVeeee7zTkf5I3HpUOnayDReGpIFQVtE/WYp1o9SRHlkoIeRC','hd123789a@gmail.com','Hoang Duong',NULL,'ROLE_USER',NULL),(18,'hoangduong','$2a$10$6Y178xBpu1UCskm.4rsOS.hm9SYZlhc9eH62BAf/UD8Q.OX9sDd46','1957012049duong@ou.edu.vn','H','https://res.cloudinary.com/dmfr3gngl/image/upload/v1682668506/ydhr2po8r7tdwe0mmkea.jpg','ROLE_USER',_binary ''),(19,'duong1123','$2a$10$FcsGjP4Ji9liL7tiFDU2dOgLOkt4f4XvjCNizf0eoq9WXrn.OuQ/2','1957012049duong@ou.edu.vn','Hoang Duong','https://res.cloudinary.com/dmfr3gngl/image/upload/v1682953400/nakwycywlpzno6sryjf8.jpg','ROLE_USER',_binary '');
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

-- Dump completed on 2023-05-06 18:30:09
