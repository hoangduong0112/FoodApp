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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (4,'COMBO ĐỘC QUYỀN',2),(5,'SỦI CẢO',2),(6,'MÌ',2),(7,'MÓN THÊM',2),(10,'MÓN CHÁO',3),(11,'MENU CƠM MÓN CHÍNH',4),(12,'MENU CANH',4),(13,'MÓN THÊM',4),(14,'COMBO',5),(15,'MÓN CHÍNH',5),(16,'THỨC UỐNG NHÀ NẤU',5),(17,'TRÀ SỮA',6),(18,'HỒNG TRÀ - TRÀ ĐÀO',6),(24,'111',1),(29,'HoÃ ng DÆ°Æ¡ng',1);
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
  `price` float DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_menu_idx` (`menu_id`),
  CONSTRAINT `FK_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (13,'Canh Nghêu đậu hũ non',16000,12),(14,'Canh Cua Đồng',16000,12),(15,'Canh Nghêu đậu hũ non',19000,12),(16,'Chả',4000,13),(17,'Cơm thêm',2000,13),(18,'Ốp la',7000,13),(25,'Nha Đam Hạt Chia',15000,16),(31,'Hồng trà tắc',12000,18),(34,'Cháo Thịt Bằm nhỏ + Trứng Gà',25000,10),(37,'Combo Cơm xá xíu + canh + Nước sâm',56000,4),(38,'Combo Mì khô gà quay+nước ngọt',59000,4),(40,'Sủi cảo sốt ớt',25000,5),(41,'Sủi Cảo Chiên',30000,5),(42,'Mì cọng nhỏ',8000,7),(43,'Mì cọng lớn',8000,7),(44,'Mì khô gà quay cọng nhỏ',8000,6),(45,'HoÃ ng DÆ°Æ¡ng',12000,NULL),(47,'112',12000,29),(49,'HoÃ ng DÆ°Æ¡ng',12000,24);
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
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CategoryShop_idx` (`category_id`),
  KEY `FK_UserStore_idx` (`user_id`),
  CONSTRAINT `FK_CategoryShop` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_UserStore` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Bánh Cá Taiyaki - Phạm Văn Đồng','513/23B Đ. Phạm Văn Đồng, P. 13, Bình Thạnh, TP. HCM','1234153','https://images.foody.vn/res/g107/1066835/prof/s640x400/file_restaurant_photo_taur_16176-bf889abf-210405162633.jpeg',1,2,NULL),(2,'Anh Quán - Mì Khô Gà Quay & Hủ Tiếu Mì Sủi Cảo','80/17/138 Dương Quảng Hàm, P. 5, Gò Vấp, TP. HCM','111421221aa1','https://images.foody.vn/res/g88/873165/prof/s640x400/foody-upload-api-foody-mobile-21-jpg-181229121709.jpg',1,6,NULL),(3,'Cháo Sườn Cô Giang - Đinh Tiên Hoàng','14B Đinh Tiên Hoàng, P. Đa Kao, Quận 1, TP. HCM','1122','https://res.cloudinary.com/dmfr3gngl/image/upload/v1682193553/rmuu2z2uel0h0ytfncxc.jpg',1,7,NULL),(4,'Cơm Tấm Bụi Sài Gòn - Thạch Thị Thanh','100 Thạch Thị Thanh, P. Tân Định, Quận 1, TP. HCM','131','https://images.foody.vn/res/g1/542/prof/s640x400/foody-upload-api-foody-mobile-im-5bd794b1-220104082127.jpg',1,8,NULL),(5,'Bò Kho Cô Mai - Since 1984 - Nguyễn Thị Minh Khai','25 Nguyễn Thị Minh Khai, P. Bến Nghé, Quận 1, TP. HCM','311','https://images.foody.vn/res/g98/972557/prof/s640x400/foody-upload-api-foody-mobile-foody-upload-api-foo-191025083749.jpg',1,9,NULL),(6,'Trà Sữa Yolo - Đường Số 44','15 Đường Số 44, P. 10, Quận 6, TP. HCM','111','https://images.foody.vn/res/g8/77771/prof/s640x400/foody-upload-api-foody-mobile-10-200930135839.jpg',2,10,NULL),(7,'Taka Cha - Trà Sữa','69 Huỳnh Thúc Kháng, P. Bến Thành, Quận 1, TP. HCM','111','https://images.foody.vn/res/g100/993432/prof/s640x400/foody-upload-api-foody-mobile-an-22eededd-220126221627.jpeg',2,11,NULL),(8,'Cơm Chay Diệu Thiện - Nguyễn Xí','23 Nguyễn Xí, P. 26, Bình Thạnh, TP. HCM','231','https://images.foody.vn/res/g107/1063485/prof/s640x400/file_restaurant_photo_d6po_16118-8ddd98a3-210128230603.jpg',3,12,NULL),(9,'Cơm Chay Diệu Hạnh','126 Nguyễn Thượng Hiền, Quận 3, TP. HCM','411','https://images.foody.vn/res/g78/776449/prof/s640x400/foody-upload-api-foody-mobile-3-jpg-180920115447.jpg',3,13,NULL);
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
  `hoten` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'duong','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','Hoang Duong',NULL,'ROLE_USER',_binary '',NULL),(2,'partner1','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,NULL,'ROLE_PARTNER',_binary '',NULL),(6,'partner2','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,NULL,'ROLE_PARTNER',_binary '',NULL),(7,'partner3','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,NULL,'ROLE_PARTNER',_binary '',NULL),(8,'partner4','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,NULL,'ROLE_PARTNER',_binary '',NULL),(9,'partner5','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,NULL,'ROLE_PARTNER',_binary '',NULL),(10,'partner6','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,NULL,'ROLE_PARTNER',_binary '',NULL),(11,'partner7','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,NULL,'ROLE_PARTNER',_binary '',NULL),(12,'partner8','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,NULL,'ROLE_PARTNER',_binary '',NULL),(13,'partner9','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,NULL,'ROLE_PARTNER',_binary '',NULL),(14,'partner10','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,NULL,'ROLE_PARTNER',_binary '',NULL),(15,'partner11','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,NULL,'ROLE_PARTNER',_binary '',NULL),(16,'user1','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',NULL,NULL,'ROLE_USER',_binary '',NULL);
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

-- Dump completed on 2023-04-25 17:51:36
