-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: ecom
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_usercreation'),(22,'Can change user',6,'change_usercreation'),(23,'Can delete user',6,'delete_usercreation'),(24,'Can view user',6,'view_usercreation'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add coupen',8,'add_coupen'),(30,'Can change coupen',8,'change_coupen'),(31,'Can delete coupen',8,'delete_coupen'),(32,'Can view coupen',8,'view_coupen'),(33,'Can add CustomerAdress',9,'add_customeradress'),(34,'Can change CustomerAdress',9,'change_customeradress'),(35,'Can delete CustomerAdress',9,'delete_customeradress'),(36,'Can view CustomerAdress',9,'view_customeradress'),(37,'Can add design',10,'add_design'),(38,'Can change design',10,'change_design'),(39,'Can delete design',10,'delete_design'),(40,'Can view design',10,'view_design'),(41,'Can add product',11,'add_product'),(42,'Can change product',11,'change_product'),(43,'Can delete product',11,'delete_product'),(44,'Can view product',11,'view_product'),(45,'Can add order item',12,'add_orderitem'),(46,'Can change order item',12,'change_orderitem'),(47,'Can delete order item',12,'delete_orderitem'),(48,'Can view order item',12,'view_orderitem'),(49,'Can add order',13,'add_order'),(50,'Can change order',13,'change_order'),(51,'Can delete order',13,'delete_order'),(52,'Can view order',13,'view_order'),(53,'Can add offer',14,'add_offer'),(54,'Can change offer',14,'change_offer'),(55,'Can delete offer',14,'delete_offer'),(56,'Can view offer',14,'view_offer'),(57,'Can add my wish list',15,'add_mywishlist'),(58,'Can change my wish list',15,'change_mywishlist'),(59,'Can delete my wish list',15,'delete_mywishlist'),(60,'Can view my wish list',15,'view_mywishlist'),(61,'Can add site',16,'add_site'),(62,'Can change site',16,'change_site'),(63,'Can delete site',16,'delete_site'),(64,'Can view site',16,'view_site');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_category`
--

DROP TABLE IF EXISTS `customer_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) NOT NULL,
  `Category_offer` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_category`
--

LOCK TABLES `customer_category` WRITE;
/*!40000 ALTER TABLE `customer_category` DISABLE KEYS */;
INSERT INTO `customer_category` VALUES (1,'String',10),(2,'Wood Wind',0),(3,'Brass',7),(4,'Keyboard',5);
/*!40000 ALTER TABLE `customer_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_coupen`
--

DROP TABLE IF EXISTS `customer_coupen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_coupen` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Coupencode` int DEFAULT NULL,
  `Coupen_offer` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_coupen`
--

LOCK TABLES `customer_coupen` WRITE;
/*!40000 ALTER TABLE `customer_coupen` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_coupen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customeradress`
--

DROP TABLE IF EXISTS `customer_customeradress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customeradress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone_number` varchar(99) NOT NULL,
  `house_name` varchar(200) DEFAULT NULL,
  `street_name` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `post_code` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_customeradr_user_id_3b4751fc_fk_customer_` (`user_id`),
  CONSTRAINT `customer_customeradr_user_id_3b4751fc_fk_customer_` FOREIGN KEY (`user_id`) REFERENCES `customer_usercreation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customeradress`
--

LOCK TABLES `customer_customeradress` WRITE;
/*!40000 ALTER TABLE `customer_customeradress` DISABLE KEYS */;
INSERT INTO `customer_customeradress` VALUES (1,'Roshas','Johnson','','07012598205','Velimanam','BLAH','Iritty','Kerala','India',670704,1);
/*!40000 ALTER TABLE `customer_customeradress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_design`
--

DROP TABLE IF EXISTS `customer_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_design` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Icon_image` varchar(100) DEFAULT NULL,
  `Logo_image` varchar(100) DEFAULT NULL,
  `Banner_image1` varchar(100) DEFAULT NULL,
  `Banner_image2` varchar(100) DEFAULT NULL,
  `Banner_image3` varchar(100) DEFAULT NULL,
  `Footer_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_design`
--

LOCK TABLES `customer_design` WRITE;
/*!40000 ALTER TABLE `customer_design` DISABLE KEYS */;
INSERT INTO `customer_design` VALUES (1,'images/576548.jpg','','images/569806.jpg','images/576548_n4TpCFp.jpg','images/576548_OH6x9NL.jpg','images/569806_MfdmuWX.jpg');
/*!40000 ALTER TABLE `customer_design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_mywishlist`
--

DROP TABLE IF EXISTS `customer_mywishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_mywishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `username_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_mywishlist_product_id_ce4b0c99_fk_customer_product_id` (`product_id`),
  KEY `customer_mywishlist_username_id_81922ac4_fk_customer_` (`username_id`),
  CONSTRAINT `customer_mywishlist_product_id_ce4b0c99_fk_customer_product_id` FOREIGN KEY (`product_id`) REFERENCES `customer_product` (`id`),
  CONSTRAINT `customer_mywishlist_username_id_81922ac4_fk_customer_` FOREIGN KEY (`username_id`) REFERENCES `customer_usercreation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_mywishlist`
--

LOCK TABLES `customer_mywishlist` WRITE;
/*!40000 ALTER TABLE `customer_mywishlist` DISABLE KEYS */;
INSERT INTO `customer_mywishlist` VALUES (3,5,1);
/*!40000 ALTER TABLE `customer_mywishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_offer`
--

DROP TABLE IF EXISTS `customer_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_offer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_offer_id` bigint DEFAULT NULL,
  `product_offer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_offer_category_offer_id_a159599e_fk_customer_` (`category_offer_id`),
  KEY `customer_offer_product_offer_id_c99c2fcb_fk_customer_product_id` (`product_offer_id`),
  CONSTRAINT `customer_offer_category_offer_id_a159599e_fk_customer_` FOREIGN KEY (`category_offer_id`) REFERENCES `customer_category` (`id`),
  CONSTRAINT `customer_offer_product_offer_id_c99c2fcb_fk_customer_product_id` FOREIGN KEY (`product_offer_id`) REFERENCES `customer_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_offer`
--

LOCK TABLES `customer_offer` WRITE;
/*!40000 ALTER TABLE `customer_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_ordered` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `transcation_id` char(32) NOT NULL,
  `payment_method` varchar(10) DEFAULT NULL,
  `total_prize` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `date_delivered` date NOT NULL,
  `Customer_id` bigint DEFAULT NULL,
  `order_product_id` bigint DEFAULT NULL,
  `user_name_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transcation_id` (`transcation_id`),
  KEY `customer_order_Customer_id_3789c9ec_fk_customer_` (`Customer_id`),
  KEY `customer_order_order_product_id_22492620_fk_customer_product_id` (`order_product_id`),
  KEY `customer_order_user_name_id_af6c5013_fk_customer_usercreation_id` (`user_name_id`),
  CONSTRAINT `customer_order_Customer_id_3789c9ec_fk_customer_` FOREIGN KEY (`Customer_id`) REFERENCES `customer_customeradress` (`id`),
  CONSTRAINT `customer_order_order_product_id_22492620_fk_customer_product_id` FOREIGN KEY (`order_product_id`) REFERENCES `customer_product` (`id`),
  CONSTRAINT `customer_order_user_name_id_af6c5013_fk_customer_usercreation_id` FOREIGN KEY (`user_name_id`) REFERENCES `customer_usercreation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_orderitem`
--

DROP TABLE IF EXISTS `customer_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `date_added` date NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `guest_user` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_orderitem_product_id_6a868eb8_fk_customer_product_id` (`product_id`),
  KEY `customer_orderitem_user_id_cd34fb20_fk_customer_usercreation_id` (`user_id`),
  CONSTRAINT `customer_orderitem_product_id_6a868eb8_fk_customer_product_id` FOREIGN KEY (`product_id`) REFERENCES `customer_product` (`id`),
  CONSTRAINT `customer_orderitem_user_id_cd34fb20_fk_customer_usercreation_id` FOREIGN KEY (`user_id`) REFERENCES `customer_usercreation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_orderitem`
--

LOCK TABLES `customer_orderitem` WRITE;
/*!40000 ALTER TABLE `customer_orderitem` DISABLE KEYS */;
INSERT INTO `customer_orderitem` VALUES (170,1,'2022-02-23',3,13,NULL),(174,1,'2022-02-24',1,1,NULL);
/*!40000 ALTER TABLE `customer_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_product`
--

DROP TABLE IF EXISTS `customer_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) DEFAULT NULL,
  `product_description` longtext,
  `product_prize` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL,
  `product_offer` int DEFAULT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `product_image1` varchar(100) DEFAULT NULL,
  `product_image2` varchar(100) DEFAULT NULL,
  `product_image3` varchar(100) DEFAULT NULL,
  `category_type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_product_category_type_id_1d3fe249_fk_customer_` (`category_type_id`),
  CONSTRAINT `customer_product_category_type_id_1d3fe249_fk_customer_` FOREIGN KEY (`category_type_id`) REFERENCES `customer_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_product`
--

LOCK TABLES `customer_product` WRITE;
/*!40000 ALTER TABLE `customer_product` DISABLE KEYS */;
INSERT INTO `customer_product` VALUES (1,'Vivaldi Violin','Kadence Vivaldi Violin VIV101 Solid Spruce Top, Maple Back (V101G)',7499,3,1,6,'images/61ldMWrk9L._AC_UL320_.jpg','images/516sPjvUtEL._AC_UL320__A9OUSNF.jpg','images/71Az0FA9GkL._AC_UL320_.jpg','images/71Az0FA9GkL._AC_UL320__fMIYcxT.jpg',1),(3,'Chromatic Mouth Organ','East top Chromatic Mouth Organ 12 Holes 48 Tones Forerunner Chromatic Harmonica Key of C, Chromatic Harmonica Mouth Organ Musical Instrument for Beginners and Professionals',3580,4,1,17,'images/61S7GhdoDOL._AC_UL640_QL65_.jpg','images/61S7GhdoDOL._AC_UL640_QL65__vGem0HJ.jpg','images/61S7GhdoDOL._AC_UL640_QL65__zH3sUG1.jpg','images/61S7GhdoDOL._AC_UL640_QL65__sF6iV99.jpg',2),(4,'Mini Keyboard','Roll over image to zoom in\r\nCasio SA-76 Musical Mini Keyboard with Free Adaptor for Kids',4270,4,1,5,'images/61ZvKStcMEL._AC_UL320_.jpg','images/61ZvKStcMEL._AC_UL320__xIHMFd4.jpg','images/61ZvKStcMEL._AC_UL320__wMOVLRZ.jpg','images/61ZvKStcMEL._AC_UL320__9b7VgTy.jpg',4),(5,'Bamboo Flute','Sarfuddin Flutes C Natural Medium Right Hand 19 Inches Bamboo Flute Black And Green Thread Combination',1500,5,1,17,'images/719fkq6K8zL._AC_UL320_.jpg','images/514hsPatKTL._AC_UL320_.jpg','images/51YOyuqwJVL._AC_UL320_.jpg','images/51YOyuqwJVL._AC_UL320__RjnJVvm.jpg',2),(6,'Big Jazz Drum','Spitin® Big Jazz Drum Set Musical Instrument 10 pcs Set - 5 Tom Tom Drum - Big Size 57 cm Height - Top Quality with High Straight PVC Material',1995,4,1,21,'images/41NnZYXNvBL._AC_UL320_.jpg','images/41NnZYXNvBL._AC_UL320__i72X8lI.jpg','images/41NnZYXNvBL._AC_UL320__3jLMDVk.jpg','images/41NnZYXNvBL._AC_UL320__dGL9q3F.jpg',3),(7,'Vivaldi   Guitar','Kadence Vivaldi Violin VIV101 Solid Spruce Top, Maple Back (V101G)',5000,5,1,50,'images/61rvzTTm9HL._AC_UL320__jY6vJSZ.jpg','images/61rvzTTm9HL._AC_UL320__HxfLx9Q.jpg','images/61rvzTTm9HL._AC_UL320__8rlaJNi.jpg','images/61rvzTTm9HL._AC_UL320__Fe0i5dn.jpg',1),(8,'Vivaldi  vilion','Vivaldi Vilion',5000,5,1,34,'images/61ldMWrk9L._AC_UL320__gaw2Kta.jpg','images/61ldMWrk9L._AC_UL320__QM27lB9.jpg','images/61ldMWrk9L._AC_UL320__6wqCtCa.jpg','images/61ldMWrk9L._AC_UL320__DUsUDKc.jpg',1),(9,'Keyboard','Roll over image to zoom in Casio SA-76 Musical  Keyboard with Free Adaptor for Kids',5999,4,1,12,'images/61ZvKStcfMEL._AC_UL320_.jpg','images/61ZvKStcfMEL._AC_UL320__AoJjslY.jpg','images/61ZvKStcfMEL._AC_UL320__X7wI8xk.jpg','images/61ZvKStcfMEL._AC_UL320__NBDLjQI.jpg',4),(10,'Bass Drum','Spitin® Big Jazz Drum Set Musical Instrument 10 pcs Set - 5 Tom Tom Drum - Big Size 57 cm Height - Top Quality with High Straight PVC Material',7999,5,1,34,'images/51v5o-jx8fS._AC_UL320_.jpg','images/51v5o-jx8fS._AC_UL320__GwBSrWR.jpg','images/51v5o-jx8fS._AC_UL320__8Ix1ydY.jpg','images/51v5o-jx8fS._AC_UL320__lCVp4sj.jpg',3),(11,'Musical Keyboard','Roll over image to zoom in Casio SA-76 Musical Keyboard with Free Adaptor',6799,5,1,22,'images/518INaxL6UL._AC_UL320_.jpg','images/518INaxL6UL._AC_UL320__lZe0eKr.jpg','images/518INaxL6UL._AC_UL320__xdiCbVZ.jpg','images/518INaxL6UL._AC_UL320__puMahw6.jpg',4),(12,'Bass Drum','Spitin® Big Jazz Drum Set Musical Instrument 10 pcs Set - 5 Tom Tom Drum - Big Size 57 cm Height - Top Quality with High Straight PVC Material',5899,4,1,20,'images/61g8AoSEAmL._AC_UL320_.jpg','images/61g8AoSEAmL._AC_UL320__RJDIYvU.jpg','images/61g8AoSEAmL._AC_UL320__qKlQ12w.jpg','images/61g8AoSEAmL._AC_UL320__hpowIVl.jpg',3),(13,'Guitar','Kadence Guitar Violin VIV101 Solid Spruce Top, Maple Back (V101G)',6999,4,1,23,'images/516sPjvUtEL._AC_UL320_.jpg','images/516sPjvUtEL._AC_UL320__xePuvzP.jpg','images/516sPjvUtEL._AC_UL320__yKSDYwb.jpg','images/516sPjvUtEL._AC_UL320__DcGbq0b.jpg',1);
/*!40000 ALTER TABLE `customer_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_usercreation`
--

DROP TABLE IF EXISTS `customer_usercreation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_usercreation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `coupen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `customer_usercreation_phone_number_9c0b4c6b_uniq` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_usercreation`
--

LOCK TABLES `customer_usercreation` WRITE;
/*!40000 ALTER TABLE `customer_usercreation` DISABLE KEYS */;
INSERT INTO `customer_usercreation` VALUES (1,'pbkdf2_sha256$320000$BhWVaRWHFtkSlyQg5tl1D4$rnuE/DSwtjVWXxrj2VjjRS7mWDsaF5rk93ggnAmjQKQ=','2022-02-22 04:17:22.096054',1,'roshas','','','roshas@gmail.com',1,1,'2022-02-18 15:22:57.632854','','100'),(13,'pbkdf2_sha256$320000$oP9FPn8304S6oigASPDWRl$Bn7nfx+w4Jm0WYNBLtO+YlJKRJGKf/13xX2XByqqes8=',NULL,0,'roshasba','Roshas','Johnson','roshasjohnson@gmail.com',0,1,'2022-02-23 05:19:47.002379','7012598205',NULL);
/*!40000 ALTER TABLE `customer_usercreation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_usercreation_groups`
--

DROP TABLE IF EXISTS `customer_usercreation_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_usercreation_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usercreation_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_usercreation_gr_usercreation_id_group_id_653cd67b_uniq` (`usercreation_id`,`group_id`),
  KEY `customer_usercreation_groups_group_id_42d429e0_fk_auth_group_id` (`group_id`),
  CONSTRAINT `customer_usercreatio_usercreation_id_17ce0a9a_fk_customer_` FOREIGN KEY (`usercreation_id`) REFERENCES `customer_usercreation` (`id`),
  CONSTRAINT `customer_usercreation_groups_group_id_42d429e0_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_usercreation_groups`
--

LOCK TABLES `customer_usercreation_groups` WRITE;
/*!40000 ALTER TABLE `customer_usercreation_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_usercreation_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_usercreation_user_permissions`
--

DROP TABLE IF EXISTS `customer_usercreation_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_usercreation_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usercreation_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_usercreation_us_usercreation_id_permissi_6d749c50_uniq` (`usercreation_id`,`permission_id`),
  KEY `customer_usercreatio_permission_id_2e56e687_fk_auth_perm` (`permission_id`),
  CONSTRAINT `customer_usercreatio_permission_id_2e56e687_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `customer_usercreatio_usercreation_id_867ad8c1_fk_customer_` FOREIGN KEY (`usercreation_id`) REFERENCES `customer_usercreation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_usercreation_user_permissions`
--

LOCK TABLES `customer_usercreation_user_permissions` WRITE;
/*!40000 ALTER TABLE `customer_usercreation_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_usercreation_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_customer_usercreation_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_customer_usercreation_id` FOREIGN KEY (`user_id`) REFERENCES `customer_usercreation` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-02-22 04:18:55.417542','1','images/576548.jpg',1,'[{\"added\": {}}]',10,1),(2,'2022-02-22 17:04:37.062739','83','OrderItem object (83)',3,'',12,1),(3,'2022-02-22 17:04:37.080603','82','OrderItem object (82)',3,'',12,1),(4,'2022-02-22 17:04:37.093137','81','OrderItem object (81)',3,'',12,1),(5,'2022-02-22 17:04:37.096882','80','OrderItem object (80)',3,'',12,1),(6,'2022-02-22 17:04:37.100904','79','OrderItem object (79)',3,'',12,1),(7,'2022-02-22 20:18:43.499683','109','OrderItem object (109)',3,'',12,1),(8,'2022-02-22 20:18:43.532829','108','OrderItem object (108)',3,'',12,1),(9,'2022-02-22 20:18:43.538776','105','OrderItem object (105)',3,'',12,1),(10,'2022-02-22 20:18:43.543920','104','OrderItem object (104)',3,'',12,1),(11,'2022-02-22 20:18:43.547168','103','OrderItem object (103)',3,'',12,1),(12,'2022-02-22 20:18:43.551013','102','OrderItem object (102)',3,'',12,1),(13,'2022-02-22 20:18:43.554666','101','OrderItem object (101)',3,'',12,1),(14,'2022-02-22 20:18:43.558577','96','OrderItem object (96)',3,'',12,1),(15,'2022-02-22 20:18:43.562249','95','OrderItem object (95)',3,'',12,1),(16,'2022-02-22 20:18:43.566196','94','OrderItem object (94)',3,'',12,1),(17,'2022-02-22 20:18:43.569983','93','OrderItem object (93)',3,'',12,1),(18,'2022-02-22 20:18:43.574008','92','OrderItem object (92)',3,'',12,1),(19,'2022-02-22 20:18:43.577952','91','OrderItem object (91)',3,'',12,1),(20,'2022-02-22 20:18:43.582874','90','OrderItem object (90)',3,'',12,1),(21,'2022-02-22 20:18:43.586261','89','OrderItem object (89)',3,'',12,1),(22,'2022-02-22 20:18:43.588941','88','OrderItem object (88)',3,'',12,1),(23,'2022-02-22 20:18:43.592162','87','OrderItem object (87)',3,'',12,1),(24,'2022-02-22 20:18:43.595273','86','OrderItem object (86)',3,'',12,1),(25,'2022-02-22 20:18:43.598356','85','OrderItem object (85)',3,'',12,1),(26,'2022-02-22 20:18:43.600651','84','OrderItem object (84)',3,'',12,1),(27,'2022-02-22 20:20:56.410672','27','roshas',3,'',13,1),(28,'2022-02-22 20:20:56.421957','26','roshas',3,'',13,1),(29,'2022-02-22 20:20:56.426353','25','roshas',3,'',13,1),(30,'2022-02-22 20:20:56.430350','24','roshas',3,'',13,1),(31,'2022-02-23 05:18:29.386447','12','balhhhhhhhhhh',3,'',6,1),(32,'2022-02-23 05:18:29.391352','11','yaya',3,'',6,1),(33,'2022-02-23 05:18:29.395586','10','user_name',3,'',6,1),(34,'2022-02-23 05:18:29.399130','9','roshasjohsnon',3,'',6,1),(35,'2022-02-23 05:18:29.402646','8','shiyastroxicblahf',3,'',6,1),(36,'2022-02-23 05:18:29.405918','7','shiyastroxicblah',3,'',6,1),(37,'2022-02-23 05:18:29.408582','6','shiyastroxic',3,'',6,1),(38,'2022-02-23 05:18:29.411887','5','roshaserblahhaha',3,'',6,1),(39,'2022-02-23 05:18:29.415715','4','roshaserblah',3,'',6,1),(40,'2022-02-23 05:18:29.419284','3','roshasere',3,'',6,1),(41,'2022-02-23 05:18:29.422970','2','roshasjohnson',3,'',6,1),(42,'2022-02-23 07:04:47.549703','29','roshas',3,'',13,1),(43,'2022-02-23 07:04:47.561240','28','roshas',3,'',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'customer','category'),(8,'customer','coupen'),(9,'customer','customeradress'),(10,'customer','design'),(15,'customer','mywishlist'),(14,'customer','offer'),(13,'customer','order'),(12,'customer','orderitem'),(11,'customer','product'),(6,'customer','usercreation'),(5,'sessions','session'),(16,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-02-18 15:18:56.311546'),(2,'contenttypes','0002_remove_content_type_name','2022-02-18 15:18:56.394891'),(3,'auth','0001_initial','2022-02-18 15:18:56.644900'),(4,'auth','0002_alter_permission_name_max_length','2022-02-18 15:18:56.711140'),(5,'auth','0003_alter_user_email_max_length','2022-02-18 15:18:56.718625'),(6,'auth','0004_alter_user_username_opts','2022-02-18 15:18:56.726014'),(7,'auth','0005_alter_user_last_login_null','2022-02-18 15:18:56.734079'),(8,'auth','0006_require_contenttypes_0002','2022-02-18 15:18:56.737861'),(9,'auth','0007_alter_validators_add_error_messages','2022-02-18 15:18:56.747689'),(10,'auth','0008_alter_user_username_max_length','2022-02-18 15:18:56.756692'),(11,'auth','0009_alter_user_last_name_max_length','2022-02-18 15:18:56.767990'),(12,'auth','0010_alter_group_name_max_length','2022-02-18 15:18:56.811265'),(13,'auth','0011_update_proxy_permissions','2022-02-18 15:18:56.821599'),(14,'auth','0012_alter_user_first_name_max_length','2022-02-18 15:18:56.830140'),(15,'customer','0001_initial','2022-02-18 15:18:58.019799'),(16,'admin','0001_initial','2022-02-18 15:18:58.151480'),(17,'admin','0002_logentry_remove_auto_add','2022-02-18 15:18:58.170901'),(18,'admin','0003_logentry_add_action_flag_choices','2022-02-18 15:18:58.181779'),(19,'sessions','0001_initial','2022-02-18 15:18:58.231725'),(20,'sites','0001_initial','2022-02-18 15:18:58.259002'),(21,'sites','0002_alter_domain_unique','2022-02-18 15:18:58.287639'),(22,'customer','0002_orderitem_guest_user_alter_order_status','2022-02-22 16:51:29.715255'),(23,'customer','0003_alter_order_status_alter_usercreation_phone_number','2022-02-23 05:52:21.477799'),(24,'customer','0004_alter_category_category_offer_and_more','2022-02-24 06:24:17.314609'),(25,'customer','0005_alter_order_status','2022-02-24 06:25:15.539063');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0ew33gmaq5friirywx9qllx461eigiuv','eyJuYW1lIjoiKzkxNzAxMjU5ODIwNSJ9:1nMBWE:IpnHwpLWhEw82vGrhQ2Knas34_SNbvo7SPuZxaa3Za8','2022-03-07 16:26:34.089637'),('0itcdkhqzahfbxlnk8k7nadh6ooek5xo','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYJM:dA-JrgMitOiaDQKXl5HBCFdFBQ2aP4wCU_TCpSLz6-8','2022-03-08 16:46:48.500277'),('35b3x1ce0pukoz83cczdfweylyekx9px','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYI8:rSYuiP1XieGBcfHPooWcmuXgUqGTAFFAk2kQW32nMO4','2022-03-08 16:45:32.285823'),('3a1tx4wllft7npl6dtcbmd87iywxe89t','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYIi:1ELblMwxHrMqVZgHM6vJSCmsLMogBa03a4veog6QskM','2022-03-08 16:46:08.377519'),('4y9zlj51jrnyxq2e1patuhh0wsi1q6ce','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYbB:v2O6iXAUcmarG3bAuXGkhEYrTzVlfqiN36N69IDON6U','2022-03-08 17:05:13.657311'),('5vzxsgvnix67zjv69fmuxa5rp0ef5jve','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYJN:_LBcXQ-Vqv3rGftNHk7ggPAJh8NaD7fre-uXktjkjEw','2022-03-08 16:46:49.248085'),('5zs0uto0y9lwiogu78evxrei8ofsvu23','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYeG:GwfMvHxqawetHmzIGUw-oj5EbEEFgPqx0ry3h9q50aA','2022-03-08 17:08:24.400234'),('avldaptlobtu1wi8al006zsz9ps5kb1n','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYI6:0DhSUmoHYxN5W1Z3g43rc11LXBX1cQA-jU4yAfh_ZA8','2022-03-08 16:45:30.797502'),('dn3f6wa42rejn92r8kw1jvj32uyaua18','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYJo:qNA77W2jy0rBLcUDKsCUxuVvrXmKOGOn0EFUxiThn2o','2022-03-08 16:47:16.688171'),('eaa846jlrh9eio7wxicaxxaze2ls7dlw','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYI7:dke_ilrAOoyY7DV2OnQkg9rmNf7WiB1cKWUuGr5p4lo','2022-03-08 16:45:31.968093'),('g0sl2q9k8juw7qegt2dnwpd5m8jjbkbt','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYJn:IMN30Q1Ydu_6opkiiTQYviIA0gEX9FRDs8IkwJT58u4','2022-03-08 16:47:15.803795'),('g1np3vyxjjro36q62mwbczxwmzkkj0u1','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYIh:Dk0qZhePEYO1LyFFzyRoq1-Pj101uIUXdlSOWWUQ6-0','2022-03-08 16:46:07.643558'),('gz4bqsonyeuhuxied57nes0hdp8sdnih','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYZ8:nMxjkT5Gyv3nieSmUarlmR9CyppWPF3AD6gvXOWbTrA','2022-03-08 17:03:06.117464'),('h1nxdop3bp0geiirru9zsh1hsbbrrkpd','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYPe:xrjJKWUoZB39MrPdgcefr4wvTJsekgtf1uC2JYMUmI8','2022-03-08 16:53:18.686726'),('hx3gaa9vryima5vz01prssnc65gxp7e7','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYeG:GwfMvHxqawetHmzIGUw-oj5EbEEFgPqx0ry3h9q50aA','2022-03-08 17:08:24.991115'),('j3m7fq4jnbxf7wls08rk6d8yphmvytcn','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYdU:XMgZzjthDtufV3EcK1k47oImTfkKslHR6LbCXwN-_N4','2022-03-08 17:07:36.125420'),('jxxvcexmj65uxdrvvjpdayhzq5xbbmbv','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYZP:Yd--T-C0fGDnxsm3nLWhysADl94LUwh-ukI7FGJKYgw','2022-03-08 17:03:23.123926'),('kl14lcyxfqm0yeb2qutwwr7oktax6aae','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYeH:tyGANwpSb-5w3nmjHuQeFvPQj4nDYITE2eYxEnx22sk','2022-03-08 17:08:25.510731'),('n22xf36rgvv7jc8170zw3sot2zxw4prn','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYdT:YHl2mMTgK8XQANlgFFkBNkY0U8OHVrj4qjpy86fEnps','2022-03-08 17:07:35.833935'),('nf091tuabr0b117zpkwrxpxvkmfwxjtu','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYcR:6C6btIlkcvuspOB7Q6xaHVnoPcMbnwOH1-pR3MwBVTA','2022-03-08 17:06:31.044125'),('o83qkwq7bcn2d8rorrjltrh5ph60x0u1','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYeG:GwfMvHxqawetHmzIGUw-oj5EbEEFgPqx0ry3h9q50aA','2022-03-08 17:08:24.811095'),('oka4rdwa4vjvid1kf6z6f1jnxwq3itl4','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYdT:YHl2mMTgK8XQANlgFFkBNkY0U8OHVrj4qjpy86fEnps','2022-03-08 17:07:35.940323'),('p8t20zjhcbg9awslu721zy3te2yq4xe1','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYJo:qNA77W2jy0rBLcUDKsCUxuVvrXmKOGOn0EFUxiThn2o','2022-03-08 16:47:16.502895'),('pb2lqc8j1vdi5kgjectefp63qlaps5ai','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYKZ:dzqrPANxxpwdtvm82eXM-PmehRtjA9-rR_0-35BMGrE','2022-03-08 16:48:03.847314'),('pddfayudyaervz6wjg6l9gj6hznyy1yo','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYZA:ukCAFRFB6fA2aoS7JUf580wF0xIQJxrzx-0GDU-aShM','2022-03-08 17:03:08.936616'),('qghy5k4wl5qvcjl1xfsdoxkxmr24hc0z','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYeH:tyGANwpSb-5w3nmjHuQeFvPQj4nDYITE2eYxEnx22sk','2022-03-08 17:08:25.380728'),('qlmlv3o3wcx42fg40c947tv5fp5br99n','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYIi:1ELblMwxHrMqVZgHM6vJSCmsLMogBa03a4veog6QskM','2022-03-08 16:46:08.192747'),('r90phm109s18d6y877sd8qsyj0z6i42l','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYdS:JL3CIkDqPaTai0PpFw7ANP52Lv0z2podrgGbzzm0FsQ','2022-03-08 17:07:34.235216'),('rszwkdc4w0a1auk3pewqfg4k40hnyohq','.eJxVzDsOwyAQBNC7UEdowQbjlOlzBmvZheB8QDJ2FeXuwZKLZMqZ0XuLCbc1TVsNyzSzOAslTr-dR3qEvA98x3wrkkpel9nL_SKPtcpr4fC8HN8_IGFNO0sjYYfsoNOGxgHV6C30wMYhAbb0RkcXI6D2invbOWuHCKSQQwDT0Iyv0KSl1GaKzxeXEj1f:1nMpoU:WKGyLF7hhToW6melYrByO5K9IYyZYF8nJxtNf8p0hfs','2022-03-09 11:28:06.122867'),('rtfqjioimukstwxl5tyafvf5p0w3e9zk','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYPZ:UKTBtcoUDxrUTiX00CU65UZ8EAVx4A406k2x0LEWiec','2022-03-08 16:53:13.479825'),('sigjdeknfu8ryqr0v6npd62wvty52rnx','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYI3:m9MpV70WTzPgGErToz5q8WBv9yIZ8yAdmwLlwE2vxEA','2022-03-08 16:45:27.473656'),('umohlf1y495yg6sukthm7242o6skfh2l','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYKr:SHDjVq58GfHgQmpGA3Es-zAcjJu8hyt-BFPWoR5oWjc','2022-03-08 16:48:21.145843'),('wmeigdiygzp3vt2lz13452be2x250e1w','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYI8:rSYuiP1XieGBcfHPooWcmuXgUqGTAFFAk2kQW32nMO4','2022-03-08 16:45:32.105785'),('x7hm2l4k4jtm8c0yxzmxev6macpeqeqb','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYcL:jcCz4vQ2of3EXhEhrn4HwL6X5kPjmQdAioKPHks1ZoM','2022-03-08 17:06:25.800252'),('x95i6sb8r4qsyynzlt7vpoznh7nzgexh','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYJN:_LBcXQ-Vqv3rGftNHk7ggPAJh8NaD7fre-uXktjkjEw','2022-03-08 16:46:49.073672'),('zrqoyl0tl9zefs5ze60pez2l4jtzg6me','.eJxVjEEOwiAQRe_C2pChBUpduvcMZJgBqRpISrsy3l1JutC__O_lvYTHfct-b3H1C4uzUOL0-wWkRywd8B3LrUqqZVuXILsiD9rktXJ8Xg73L5Cx5Z6lmXBEdjAOhuYJ1RwsaGDjkAC_02ZILiXAISjWdnTWTglIIccIRrw_7DU4QA:1nMYag:fwhsxQbDsU407413B03wx64m4sK9o8vGwDS-VVKzJas','2022-03-08 17:04:42.832988');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-24 20:33:05
