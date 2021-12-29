-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: jobintroduct
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apply_date` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `job_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_app_user_idx` (`user_id`),
  KEY `fk_app_job_idx` (`job_id`),
  CONSTRAINT `fk_app_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_app_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (37,'Xin á»©ng tuyá»n','2021-12-25 23:27:02',66,120),(40,'aaaaaaaaaaaaa','2021-12-27 18:41:04',66,122),(41,'BBBBBBBBBBBB','2021-12-27 18:41:09',66,120),(42,'CCCCCCC','2021-12-27 18:41:15',66,106),(43,'DDDDDDDDDDD','2021-12-27 18:41:20',66,104),(44,'EEEEEEEEEEEEEE','2021-12-27 18:41:24',66,103),(45,'AAAAAAAAAAAAAAAAAAAA','2021-12-27 18:41:35',66,97),(46,'aaa','2021-12-29 06:34:50',66,144);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'CNTT','AAA'),(2,'Ngan Hang','BBB'),(3,'Giao Hang','CCC'),(4,'Giup Viec','DDD');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `job_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cmt_job_idx` (`job_id`),
  KEY `fk_cmt_user_idx` (`user_id`),
  CONSTRAINT `fk_cmt_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `fk_cmt_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (191,'Rất hay Rất ý nghĩa','2021-12-27 08:29:56',120,68),(193,'Good','2021-12-27 09:36:48',120,66),(194,'AAA','2021-12-27 09:37:13',120,66),(195,'AAA','2021-12-27 09:38:13',103,66),(197,'A','2021-12-27 09:39:38',120,68),(198,'Good','2021-12-28 04:01:00',127,66);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `requirement` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `reason` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `pay` decimal(10,0) DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `quantily` int DEFAULT NULL,
  `timework` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_job_category_idx` (`category_id`),
  KEY `fk_job_location_idx` (`location_id`),
  KEY `fk_job_user_idx` (`user_id`),
  CONSTRAINT `fk_job_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_job_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `fk_job_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (70,'sehdsah','sdhsdh','sdhdsh','sdhsdhsh',NULL,'shsh','2021-12-21 00:50:01',0,NULL,NULL,NULL,NULL,NULL,1,2),(71,'sdgasg','ashgaha','hasdhasdh','asdhadshah',NULL,'sdhsdhsh','2021-12-21 00:51:31',0,NULL,NULL,NULL,NULL,NULL,2,3),(72,'asfhdahf','ahfadh','ahfa','hahdadh',NULL,'adhahah','2021-12-21 00:53:09',0,NULL,NULL,NULL,NULL,NULL,1,1),(73,'Phụ việc nhà','Giúp việc full thời gian','Chăm chỉ, siêng năng\r\n','Lương cao',56125616,'98 Bùi quang là','2021-12-20 23:54:54',0,NULL,NULL,NULL,NULL,NULL,1,4),(74,'Lập trình viên Java','sajgasjg;aj','s;ghjsa;lgja;',';sljkasl;hjgas;h',NULL,'dsgdgsg','2021-12-21 00:32:09',0,NULL,NULL,NULL,NULL,NULL,4,1),(75,'sdfhsdh','sdhsd','hsdhsdh','sdhsdh',NULL,'eghdshsh','2021-12-21 00:49:18',0,NULL,NULL,NULL,NULL,NULL,3,1),(76,'sehdsah','sdhsdh','sdhdsh','sdhsdhsh',NULL,'shsh','2021-12-21 00:50:01',0,NULL,NULL,NULL,NULL,NULL,1,2),(77,'sdgasg','ashgaha','hasdhasdh','asdhadshah',NULL,'sdhsdhsh','2021-12-21 00:51:31',0,NULL,NULL,NULL,NULL,NULL,2,3),(78,'asfhdahf','ahfadh','ahfa','hahdadh',NULL,'adhahah','2021-12-21 00:53:09',0,NULL,NULL,NULL,NULL,NULL,1,1),(79,'Phụ việc nhà','Giúp việc full thời gian','Chăm chỉ, siêng năng\r\n','Lương cao',56125616,'98 Bùi quang là','2021-12-20 23:54:54',0,NULL,NULL,NULL,NULL,NULL,1,4),(80,'Lập trình viên Java','sajgasjg;aj','s;ghjsa;lgja;',';sljkasl;hjgas;h',NULL,'dsgdgsg','2021-12-21 00:32:09',0,NULL,NULL,NULL,NULL,NULL,4,1),(81,'sdfhsdh','sdhsd','hsdhsdh','sdhsdh',NULL,'eghdshsh','2021-12-21 00:49:18',0,NULL,NULL,NULL,NULL,NULL,3,1),(82,'sehdsah','sdhsdh','sdhdsh','sdhsdhsh',NULL,'shsh','2021-12-21 00:50:01',0,NULL,NULL,NULL,NULL,NULL,1,2),(83,'sdgasg','ashgaha','hasdhasdh','asdhadshah',NULL,'sdhsdhsh','2021-12-21 00:51:31',0,NULL,NULL,NULL,NULL,NULL,2,3),(84,'asfhdahf','ahfadh','ahfa','hahdadh',NULL,'adhahah','2021-12-21 00:53:09',0,NULL,NULL,NULL,NULL,NULL,3,1),(85,'Phụ việc nhà','Giúp việc full thời gian','Chăm chỉ, siêng năng\r\n','Lương cao',56125616,'98 Bùi quang là','2021-12-20 23:54:54',0,NULL,NULL,NULL,NULL,NULL,3,4),(86,'Lập trình viên Java','sajgasjg;aj','s;ghjsa;lgja;',';sljkasl;hjgas;h',NULL,'dsgdgsg','2021-12-21 00:32:09',0,NULL,NULL,NULL,NULL,NULL,4,1),(87,'sdfhsdh','sdhsd','hsdhsdh','sdhsdh',NULL,'eghdshsh','2021-12-21 00:49:18',0,NULL,NULL,NULL,NULL,NULL,1,1),(88,'sehdsah','sdhsdh','sdhdsh','sdhsdhsh',NULL,'shsh','2021-12-21 00:50:01',0,NULL,NULL,NULL,NULL,NULL,1,1),(89,'sdgasg','ashgaha','hasdhasdh','asdhadshah',NULL,'sdhsdhsh','2021-12-21 00:51:31',0,NULL,NULL,NULL,NULL,NULL,2,3),(90,'asfhdahf','ahfadh','ahfa','hahdadh',NULL,'adhahah','2021-12-21 00:53:09',0,NULL,NULL,NULL,NULL,NULL,1,1),(91,'Phụ việc nhà','Giúp việc full thời gian','Chăm chỉ, siêng năng\r\n','Lương cao',56125616,'98 Bùi quang là','2021-12-20 23:54:54',0,NULL,NULL,NULL,NULL,NULL,1,3),(92,'Lập trình viên Java','sajgasjg;aj','s;ghjsa;lgja;',';sljkasl;hjgas;h',NULL,'dsgdgsg','2021-12-21 00:32:09',0,NULL,NULL,NULL,NULL,NULL,4,1),(93,'sdfhsdh','sdhsd','hsdhsdh','sdhsdh',NULL,'eghdshsh','2021-12-21 00:49:18',0,NULL,NULL,NULL,NULL,NULL,3,2),(94,'sehdsah','sdhsdh','sdhdsh','sdhsdhsh',NULL,'shsh','2021-12-21 00:50:01',0,NULL,NULL,NULL,NULL,NULL,1,2),(95,'sdgasg','ashgaha','hasdhasdh','asdhadshah',NULL,'sdhsdhsh','2021-12-21 00:51:31',0,NULL,NULL,NULL,NULL,NULL,2,3),(96,'asfhdahf','ahfadh','ahfa','hahdadh',NULL,'adhahah','2021-12-21 00:53:09',0,NULL,NULL,NULL,NULL,NULL,3,1),(97,'Phụ việc nhà','Giúp việc full thời gian','Chăm chỉ, siêng năng\r\n','Lương cao',56125616,'98 Bùi quang là','2021-12-20 23:54:54',0,NULL,NULL,NULL,NULL,NULL,3,4),(98,'Lập trình viên Java','sajgasjg;aj','s;ghjsa;lgja;',';sljkasl;hjgas;h',NULL,'dsgdgsg','2021-12-21 00:32:09',0,NULL,NULL,NULL,NULL,NULL,4,1),(99,'sdfhsdh','sdhsd','hsdhsdh','sdhsdh',NULL,'eghdshsh','2021-12-21 00:49:18',0,NULL,NULL,NULL,NULL,NULL,1,2),(100,'sehdsah','sdhsdh','sdhdsh','sdhsdhsh',NULL,'shsh','2021-12-21 00:50:01',0,NULL,NULL,NULL,NULL,NULL,1,1),(101,'sdgasg','ashgaha','hasdhasdh','asdhadshah',NULL,'sdhsdhsh','2021-12-21 00:51:31',0,NULL,NULL,NULL,NULL,NULL,2,3),(102,'asfhdahf','ahfadh','ahfa','hahdadh',NULL,'adhahah','2021-12-21 00:53:09',0,NULL,NULL,NULL,NULL,NULL,3,1),(103,'Phụ việc nhà','Giúp việc full thời gian','Chăm chỉ, siêng năng\r\n','Lương cao',56125616,'98 Bùi quang là','2021-12-20 23:54:54',0,NULL,NULL,NULL,NULL,NULL,1,4),(104,'Lập trình viên Java','sajgasjg;aj','s;ghjsa;lgja;',';sljkasl;hjgas;h',NULL,'dsgdgsg','2021-12-21 00:32:09',0,NULL,NULL,NULL,NULL,NULL,4,1),(106,'sehdsah','sdhsdh','sdhdsh','sdhsdhsh',NULL,'shsh','2021-12-21 00:50:01',0,NULL,NULL,NULL,NULL,31,1,1),(120,'TÃ i xáº¿ riÃªng xe 4 chá»','CHá» mÃ¬nh Äi lÃ m viá»c','CÃ³ kháº£ nÄng cháº¡y xe tá»t. LÃ m viá»c ÄÆ°á»£c trong mÃ´i trÆ°á»ng Ã¡p lá»±c. CÃ³ sá»©c khá»e tá»t','sgasgagagag',1415151,'Cáº§u rá»ng','2021-12-25 16:51:31',0,NULL,NULL,NULL,NULL,7,2,4),(122,'BÃ¡n nÆ°á»c','Công việc tốt','','',NULL,'','2021-12-27 09:42:50',0,NULL,NULL,NULL,NULL,31,1,1),(123,'Bán bảo hiểm xã hội','aoighwsaoghaopgoi','AAAAAAAA. BBBBBBBBBB. CCCCCCCC','AAAAAAAAAAAA. BBBBBBBBBB. CCCCCCCC',1,'98 Phan Huy Ích, Q Gò Vấp','2021-12-28 02:57:50',5,'8h sáng- 5h chiều','Nhân viên','Trên 1 năm','Nữ',7,1,4),(124,'BÃ¡n báº£o hiá»m XÃ£ há»i','BÃ¡n báº£o hiá»m XÃ£ há»i','','',NULL,'','2021-12-28 03:10:57',0,'','','','',7,1,1),(125,'Ban Bao Hiem Nhan Tho','Ban bao hiem theo doanh so. Phu giup quan li van phong','Tren 18 tuoi. Sieng nang cham chi. Biet su dung may tinh','Muc luong hap dan. Moi truong lam viec nang dong',NULL,'Quan dong da ha noi','2021-12-28 03:37:01',0,'8 tieng 1 ngay','Nhan vien','2 nÄm kinh nghiá»m','KhÃ´ng yÃªu cáº§u',31,3,3),(126,'AAA','AA','AAAAAAA','AAAAAAAAA',NULL,'AAAA','2021-12-28 03:38:02',0,'AAAA','AAAA','AAAA','AAAAAA',31,1,1),(127,'AAAAAAA','AAAAAAAAA','AAAAAAAAAAAA','AAAAAAAAAA',NULL,'AAAA','2021-12-28 03:39:06',7,'8h sÃ¡ng - 5h chiá»u','NhÃ¢n viÃªn','AAA','AAA',31,1,1),(128,'ad','ad','','aadNTH',NULL,'','2021-12-29 04:22:24',0,'','','','',7,1,1),(129,'afaf','af','NTH','NTH',NULL,'','2021-12-29 04:22:41',0,'','','','',7,1,1),(130,'af','asfasf','asfasfa','afafNTH',NULL,'','2021-12-29 04:25:25',0,'','','','',7,1,1),(131,'agag','agagsa','asgasgasg','NTH',NULL,'sgsg','2021-12-29 04:25:46',24,'sgsgsd','sdgsdg','4','sdgsg',7,1,1),(132,'agag','agagsa','asgasgasg','NTH',NULL,'sgsg','2021-12-29 04:26:43',24,'sgsgsd','sdgsdg','4','sdgsg',7,1,1),(133,'afaf','fafaf','','NTH',NULL,'','2021-12-29 04:26:53',0,'','','','',7,1,1),(134,'afaf','fafaf','','NTH',NULL,'','2021-12-29 04:28:10',0,'','','','',7,1,1),(135,'afgasg','asgasgag','','',NULL,'','2021-12-29 04:28:23',0,'','','','',7,1,1),(136,'afa','sgsagag','agasg','asgasgasgag',24,'','2021-12-29 04:29:52',2,'afaf','afaf','afaf','afaf',7,1,1),(137,'sgs','gsgsg','sgsg','',NULL,'','2021-12-29 04:30:38',0,'','','','',7,1,1),(138,'sgs','gsgsg','sgsg','',NULL,'','2021-12-29 04:31:57',0,'','','','',7,1,1),(139,'AAA','AAAA','','',NULL,'','2021-12-29 04:32:30',0,'','','','',7,1,1),(140,'afag','agagag','','',NULL,'','2021-12-29 04:44:33',0,'','','','',7,1,1),(141,'Ban com','spjgskag','wg;ljaslgj','',NULL,'','2021-12-29 04:57:06',0,'','','','',31,1,1),(142,'qgwgag','sagasga','sagasgag','asgasgag',NULL,'agag','2021-12-29 04:57:50',1,'afasf','asfasfa','','',31,1,1),(144,'AAA','AAA','','',NULL,'','2021-12-29 05:03:17',0,'','','','AAAANam',31,1,1);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Hồ Chí Minh'),(2,'Đà Nẵng'),(3,'Hà Nội'),(4,'Cần Thơ');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` int DEFAULT NULL,
  `cv` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_role` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_UNIQUE` (`username`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_cate_idx` (`category_id`),
  KEY `fk_user_loca_idx` (`location_id`),
  CONSTRAINT `fk_user_cate` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_user_loca` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,'Nguyenn','Hieu',18,'admin@gmail.com','0923272840','https://res.cloudinary.com/springmvc/image/upload/v1640547339/d5swmyi6p4iv456pluh5.jpg','admin','$2a$10$5F111WVR1CBcZDpYvQViJ.EYhIteXiJFRNTtWmQvlcv1/KjlnmYl6',3,'','ROLE_ADMIN',1,1),(31,'Nguyen','Luhh',25,'aaa@gmail.com','0582602099','https://res.cloudinary.com/springmvc/image/upload/v1640548251/hj8h8lvwwmiqrvtbc0hf.png','ntd','$2a$10$5F111WVR1CBcZDpYvQViJ.EYhIteXiJFRNTtWmQvlcv1/KjlnmYl6',2,'https://res.cloudinary.com/springmvc/image/upload/v1640548385/uucs0hcusyjib6jkmrpr.jpg','ROLE_NTD',1,1),(66,'Nguyễn Trung','HiếuAA',16,'agagag@gmail.com','0919571059','https://res.cloudinary.com/springmvc/image/upload/v1640548939/fdpbuvyh29efr6n9asy6.png','user1','$2a$10$02RgCpT4/B9fpbIpxcpW7evWh6r55unaRLShY1pLC2/Mpz8YLnefG',2,'https://res.cloudinary.com/springmvc/image/upload/v1640548972/jmnwsu7zgz6asn206gx6.png','ROLE_NTD',1,1),(67,'Nguyen','T',25,'asfagag@gmail.com','17','https://res.cloudinary.com/springmvc/image/upload/v1640564950/tlyhnlyuoeg4vvwt5o9b.jpg','user2','$2a$10$g60b5UEn9uA3Z/3SjchbFuavVQm.iwtsA739q.OE0lH3TMDA7olOW',0,'https://res.cloudinary.com/springmvc/image/upload/v1640564965/gchz2pnz4i2rz8plbwfq.png','ROLE_USER',2,1),(68,'Tran','Quan',22,'tranquan@gmail.com','092314151','https://res.cloudinary.com/springmvc/image/upload/v1640567242/j8wmrqhlrull41mfscem.jpg','user3','$2a$10$XhldK53IrampXqYGFSRZAuHgdlfysF2vgdtvsnOiSnVimQ73j9haK',0,'https://res.cloudinary.com/springmvc/image/upload/v1640567552/uwet4h1hxxekt8kdxfio.png','ROLE_USER',1,1),(69,'Nguyễn Trung ','Hiếu',22,'aagjapg@gmail.com','1259052850',NULL,'user4','$2a$10$gx57wJJlbLnYykNv3Qa4m.8WIuFcTOgJyvMlb6hTD2KApnw4vKazm',0,NULL,'ROLE_USER',1,1),(70,'','',0,'','',NULL,'','$2a$10$wU7CLVy4IkuNCnqs7q5V2e4WuBm6x3TrXOenZz7YbotRNV67GpRsi',0,NULL,'ROLE_USER',1,1),(79,'AAAAA','AA',55,'AAAAAAA','14151',NULL,'user5','$2a$10$8..vN.6QCbf8uSb4FLgfM.RDpaNRjUZwxVX2fnSRsY/Gf3hKtKdUe',0,NULL,'ROLE_USER',3,1),(90,'AAAAAAAA','asaga',17,'gdsd','24125125',NULL,'user6','$2a$10$/lGrrmLUHn4X2zbRtrcizOqEHTEQTSVrNINszXdBElagG7LcVr1cG',0,NULL,'ROLE_USER',1,1),(100,'agagag','agaga',20,'agagag','145141','https://res.cloudinary.com/springmvc/image/upload/v1640719900/ddtdyw8z5dehwhzcf34h.jpg','user7','$2a$10$WjBolYXnlv7ZSlxpHl6S..aUXtjHdTTgo06CKYLQFnO3z.icWE3dW',0,NULL,'ROLE_USER',1,1),(103,'','gsg',16,'stwsg','151515',NULL,'user8','$2a$10$lNt8/YKCCf9RBORB89wJLeB/vzUTnQ2cP7aLFgAUq/L9VYRXs39H.',0,NULL,'ROLE_USER',1,1),(127,'a','A',17,'a','124',NULL,'14','$2a$10$JJa6BaxHpfruTqQt9kpBlOr8DX7oDIqTRn3CS2RqlCcK68pxOIc0u',0,NULL,'ROLE_USER',1,1),(132,'Np','afag',16,'adfaf','15151',NULL,'user10','$2a$10$V9EeplcZHFAe4v16iBSWnuYgw9e9DiWjD7EsxsJhozDRv0B6Xx0P2',0,NULL,'ROLE_USER',1,1),(133,'afaf','afafaf',16,'agagg@gmail.com','09151',NULL,'user11','$2a$10$bi9os5tst45XkqGJiMA07ueXVXGQCDxfT/NU3k3.Hhs.48pDVA13a',0,NULL,'ROLE_USER',1,1),(143,'asgag','sagagag',17,'oatjsopgi@gmail.com','159819051',NULL,'uu','$2a$10$01Al2MRWbKxC3WnMlkM7/uqE39hTS9/3ML6BRlgRUSMvtt/FWsfTC',0,NULL,'ROLE_USER',1,1),(154,'Nguyen  Trung','Hieu',19,'sgklsgkl@gmail.com','151569156','','admin1','$2a$10$e1Kzv5DALU1EcshZjQ2WYefWqgAVER.uPlH.CjZhSnaHBI29qgelK',0,'https://res.cloudinary.com/springmvc/image/upload/v1640733306/yhmvevp8mi8r5uvp3up2.jpg','ROLE_USER',1,1),(155,'Tran','Nghia',21,'klfgslkgn@gmail.com','01599158','','admin2','$2a$10$XGWru5j3KmpyBo9d2KW3h.dBl2wRl7iXd5JkDUPBNp3PupG/XVRoy',0,'https://res.cloudinary.com/springmvc/image/upload/v1640732889/tpe4fcou1ntespgeka81.pdf','ROLE_USER',1,1),(157,'wgasgag','asdgagag',22,'wgag@gmail.com','151561616','','admin3','$2a$10$GyUTs44x.QSuaBiLA5m66OPbUXVy9KP.L24DDGtW1fY2ejbqWsd0i',0,'','ROLE_USER',1,1),(158,'Nguyễn Trung','Hiếu',17,'alhag@gmail.com','09519749184','https://res.cloudinary.com/springmvc/image/upload/v1640731355/bhayt9nzvfqw9hxxvcin.jpg','adminn','$2a$10$bDHbJeAQssN4hL56QM3BHORHkja9XZGxe0..zINKGs0SVd2oyJEGO',0,'','ROLE_USER',1,1),(159,'Nguyen ','Trung',17,'spkgjsgko@gmail.com','15871895','https://res.cloudinary.com/springmvc/image/upload/v1640731399/qy8esodnsg9f22blzufd.jpg','userrr','$2a$10$62GP9sRyJoSVEQTXTffnHuYhRdyKbJ1uvM8t1ZjiVig5HZ78hOL4K',0,NULL,'ROLE_USER',1,1);
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

-- Dump completed on 2021-12-29 19:18:51
