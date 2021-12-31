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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (49,'Tôi rất thích công việc này!','2021-08-31 10:32:35',173,212),(50,'Tôi làm rất giỏi công việc này','2021-08-31 10:32:35',173,211),(51,'Công việc này khá phù hợp với tôi','2021-08-31 10:32:35',173,210),(52,'Tôi đã có 4 năm làm việc trong lĩnh vực này','2021-08-31 10:32:35',175,207),(53,'Bạn cần một người đủ chuyên môn, tôi có thể giúp bạn','2021-08-31 10:32:35',173,205),(54,'Tôi rất thích công việc này!','2021-08-31 10:32:35',174,210),(57,'Tôi đã có 4 năm làm việc trong lĩnh vực này','2021-09-03 10:33:35',174,207),(59,'Tôi rất thích công việc này!','2021-12-31 10:32:35',175,212),(60,'Tôi làm rất giỏi công việc này','2021-09-03 10:33:35',175,199),(62,'Tôi đã có 4 năm làm việc trong lĩnh vực này','2021-12-31 10:33:35',173,207),(63,'Bạn cần một người đủ chuyên môn, tôi có thể giúp bạn','2021-09-03 10:33:35',173,206),(64,'Tôi rất thích công việc này!','2021-12-31 10:32:35',174,212),(67,'Tôi đã có 4 năm làm việc trong lĩnh vực này','2021-10-03 10:33:35',174,209),(68,'Bạn cần một người đủ chuyên môn, tôi có thể giúp bạn','2021-10-03 10:33:35',174,205),(69,'Tôi rất thích công việc này!','2021-10-03 10:33:35',173,121),(70,'Tôi làm rất giỏi công việc này','2021-10-03 10:33:35',173,108),(71,'Công việc này khá phù hợp với tôi','2021-12-31 10:33:15',173,111),(72,'Tôi đã có 4 năm làm việc trong lĩnh vực này','2021-12-31 10:33:35',175,111),(73,'Bạn cần một người đủ chuyên môn, tôi có thể giúp bạn','2021-12-31 10:34:00',173,121),(74,'Tôi rất thích công việc này!','2021-12-31 10:32:35',174,159),(75,'Tôi đã có 4 năm làm việc trong lĩnh vực này','2021-11-03 10:33:35',174,72),(76,'Tôi rất thích công việc này!','2021-11-03 10:33:35',175,184),(77,'Tôi làm rất giỏi công việc này','2021-12-31 10:33:03',175,185),(78,'Tôi đã có 4 năm làm việc trong lĩnh vực này','2021-12-31 10:33:35',173,186),(79,'Bạn cần một người đủ chuyên môn, tôi có thể giúp bạn','2021-12-31 10:34:00',173,187),(80,'Tôi rất thích công việc này!','2021-12-31 10:32:35',174,187),(81,'Tôi đã có 4 năm làm việc trong lĩnh vực này','2021-12-31 10:33:35',174,186),(82,'Bạn cần một người đủ chuyên môn, tôi có thể giúp bạn','2021-12-31 10:34:00',174,184);
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
INSERT INTO `category` VALUES (1,'Công Nghệ','AAA'),(2,'Văn phòng','BBB'),(3,'Vận tải','CCC'),(4,'Phụ việc','DDD');
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
  CONSTRAINT `fk_cmt_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cmt_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (203,'Công việc này còn tuyển không??','2021-12-31 10:31:55',212,173),(204,'Có ai làm việc này chưa? Có ổn không ạ?','2021-12-31 10:36:15',212,174),(205,'Tôi đã làm ở đây rồi. công việc rất tốt!','2021-12-31 10:56:47',212,177),(206,'Công việc rất tốt','2021-12-31 11:02:07',212,178),(207,'Tôi sẽ apply công việc này','2021-12-31 11:02:42',212,175),(208,'Tôi rất thích công việc này','2021-12-31 11:54:13',212,173);
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
  `pay` int DEFAULT NULL,
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
  CONSTRAINT `fk_job_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (2,'Giáo viên mầm non','Hỗ trợ học viên, Phụ giúp việc giảng dạy','IELTS 7 trở lên. Khả năng giao tiếp tốt. Chăm chỉ','Được giao tiếp nhiều với người nước ngoài. Môi trường năng động',12,'312 Hàng Mã','2021-05-22 09:48:37',3,'Giờ hành chính','Trợ giảng','Không yêu cầu','Không yêu cầu',169,3,2),(8,'Shipper','Giao hàng','Trên 18 tuổi. Có sức khỏe tốt. Chăm chỉ, siêng năng.','Thời gian tự do. Mức lương hấp dẫn. Chế độ BHXH theo quy định',8,'79 Lê Trọng Tấn. Q Tân Phú','2021-05-22 09:48:37',5,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',171,1,3),(21,'Giáo viên toán cấp 3','Dạy kèm cấp 3. Các môn Toán, Văn','Có bằng sư phạm. Có kiến thức tốt','Lương thưởng theo khả năng. Được hỗ trợ tiền ăn',15,'Quận thốt nốt','2021-05-22 09:48:37',2,'Từ 7-9h tối','Giảng viên','ít nhất 1 năm kinh nghiệm','Ưu tiên Nữ',170,4,2),(22,'Tài xế công nghệ','Chở khách theo yêu cầu. Chở hàng hóa. Giao hàng theo đơn','Trên 18 tuổi. Có sức khỏe tốt. Chăm chỉ, siêng năng.','Thời gian tự do. Mức lương hấp dẫn. Chế độ BHXH theo quy định',12,'79 Lê Trọng Tấn. Q Tân Phú','2021-05-22 09:48:37',10,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',169,2,3),(25,'Giáo viên toán cấp 3','Dạy kèm cấp 3. Các môn Toán, Văn','Có bằng sư phạm. Có kiến thức tốt','Lương thưởng theo khả năng. Được hỗ trợ tiền ăn',15,'Quận thốt nốt','2021-05-22 09:48:37',2,'Từ 7-9h tối','Giảng viên','ít nhất 1 năm kinh nghiệm','Ưu tiên Nữ',166,1,2),(26,'Shipper','Tài xế Grab','Trên 18 tuổi. Có sức khỏe tốt. Chăm chỉ, siêng năng.','Thời gian tự do. Mức lương hấp dẫn. Chế độ BHXH theo quy định',9,'231 Hàng Mã','2021-05-22 09:48:37',5,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',165,3,3),(28,'Tài xế xe tải','Giao hàng shop mỹ phẩm','Có sức khỏe tốt. Chịu khó.','Linh động thời gian. Lương cao',7,'121 Quận Sơn Trà','2021-06-03 09:29:53',12,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',170,2,3),(31,'Thợ sửa máy lạnh','Sửa chữa máy lạnh. Lắp đặt theo yêu cầu','Có kinh nghiệm trong việc sửa  máy lạnh. Thái độ tốt','Lương theo năng lực. Giờ giấc tự do',10,'89 Quang Trung. Q Gò Vấp','2021-06-03 09:29:53',5,'Tự do','Nhân viên','2 năm kinh nghiệm','Nam',167,1,4),(43,'Kỹ sự xây dựng','Thực hiện bảng vẽ phát thảo. Bla blaaa','Có kinh nghiệm trong việc sửa  máy lạnh. Thái độ tốt','Lương theo năng lực. Giờ giấc tự do',10,'89 Quang Trung. Q Gò Vấp','2021-06-03 09:29:53',5,'Tự do','Nhân viên','2 năm kinh nghiệm','Nam',170,3,3),(52,'Giáo viên mầm non','Hỗ trợ học viên, Phụ giúp việc giảng dạy','IELTS 7 trở lên. Khả năng giao tiếp tốt. Chăm chỉ','Được giao tiếp nhiều với người nước ngoài. Môi trường năng động',12,'312 Hàng Mã','2021-06-03 09:29:53',3,'Giờ hành chính','Trợ giảng','Không yêu cầu','Không yêu cầu',166,2,2),(55,'Lập trình viên','Thực hiện dự án theo yêu cầu. Bảo trì hệ thống.','Có kiến thức tốt về lập trình. Chịu được áp lực','Lương cao. Cơ hội thăng tiến tốt',5,'122 Trường Chinh. Q Tân Bình','2021-06-03 09:29:53',13,'8h Sáng - 5h Chiều','Nhân viên','ít nhấ 1 năm kinh nghiệm','Nam',167,1,1),(58,'Tài xế riêng','Đưa đón theo yêu cầu','Thật thà, chịu khó. Khả năng lái xe tốt','Mức lương cao. Có thưởng thêm',21,'79 Lê Trọng Tấn. Q Tân Phú','2021-06-03 09:29:53',1,'Tự do','Nhân viên','Hơn 3 năm','Nam',169,1,3),(62,'Trợ giảng Tiếng Anh','Hỗ trợ học viên, Phụ giúp việc giảng dạy','IELTS 7 trở lên. Khả năng giao tiếp tốt. Chăm chỉ','Được giao tiếp nhiều với người nước ngoài. Môi trường năng động',12,'312 Hàng Mã','2021-06-03 09:29:53',3,'Giờ hành chính','Trợ giảng','Không yêu cầu','Không yêu cầu',166,1,2),(64,'Giảng viên dạy kèm','Dạy kèm cấp 1. Các môn Toán, Văn','Có bằng sư phạm. Có kiến thức tốt','Lương thưởng theo khả năng. Được hỗ trợ tiền ăn',15,'Quận thốt nốt','2021-07-01 09:48:37',2,'Từ 7-9h tối','Giảng viên','ít nhất 1 năm kinh nghiệm','Ưu tiên Nữ',166,2,2),(65,'Công nhân xí nghiệm','Thực hiện dự án theo yêu cầu. Bảo trì hệ thống.','Có kiến thức tốt về lập trình. Chịu được áp lực','Lương cao. Cơ hội thăng tiến tốt',5,'122 Trường Chinh. Q Tân Bình','2021-07-01 09:48:37',13,'8h Sáng - 5h Chiều','Nhân viên','ít nhấ 1 năm kinh nghiệm','Nam',172,4,1),(69,'Trợ giảng Tiếng Anh','Hỗ trợ học viên, Phụ giúp việc giảng dạy','IELTS 7 trở lên. Khả năng giao tiếp tốt. Chăm chỉ','Được giao tiếp nhiều với người nước ngoài. Môi trường năng động',12,'312 Hàng Mã','2021-07-01 09:48:37',3,'Giờ hành chính','Trợ giảng','Không yêu cầu','Không yêu cầu',166,3,2),(72,'Giảng viên dạy kèm','Dạy kèm cấp 1. Các môn Toán, Văn','Có bằng sư phạm. Có kiến thức tốt','Lương thưởng theo khả năng. Được hỗ trợ tiền ăn',15,'Quận thốt nốt','2021-07-01 09:48:37',2,'Từ 7-9h tối','Giảng viên','ít nhất 1 năm kinh nghiệm','Ưu tiên Nữ',166,4,2),(92,'Thợ điện','Sửa chữa máy lạnh. Lắp đặt theo yêu cầu','Có kinh nghiệm trong việc sửa  máy lạnh. Thái độ tốt','Lương theo năng lực. Giờ giấc tự do',10,'89 Quang Trung. Q Gò Vấp','2021-07-01 09:48:37',5,'Tự do','Nhân viên','2 năm kinh nghiệm','Nam',167,1,4),(93,'Tài xế xe tải','Chở hàng theo lịch trình. Bốc vác hàng hóa','Có sức khỏe tốt. Chịu khó.','Linh động thời gian. Lương cao',15,'121 Quận Sơn Trà','2021-08-05 09:48:37',20,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',171,2,3),(94,'Nhân viên K+','Lắp đặt truyền hình','Có kinh nghiệm trong mảng truyền hình. Thái độ tốt','Lương theo năng lực. Giờ giấc tự do',10,'89 Quang Trung. Q Gò Vấp','2021-08-05 09:48:37',5,'Tự do','Nhân viên','2 năm kinh nghiệm','Nam',167,3,4),(100,'Công Nhân May','Phụ dọn dẹp nhà cửa. Chăm trẻ.','Nhanh nhẹn. Chăm Chỉ','Thưởng cuối tháng. Công việc nhàn rỗi',7,'Đường 3/2 Nguyễn Văn Cừ','2021-08-05 09:48:37',1,'Có bao ở','Giúp việc','Không yêu cầu','Nữ',171,4,2),(108,'Giúp việc nhà','Phụ dọn dẹp nhà cửa. Chăm trẻ.','Nhanh nhẹn. Chăm Chỉ','Thưởng cuối tháng. Công việc nhàn rỗi',7,'Đường 3/2 Nguyễn Văn Cừ','2021-08-05 09:48:37',1,'Có bao ở','Giúp việc','Không yêu cầu','Nữ',168,4,4),(111,'Lập trình viên Website','Thực hiện dự án theo yêu cầu. Bảo trì hệ thống.','Có kiến thức tốt về lập trình. Chịu được áp lực','Lương cao. Cơ hội thăng tiến tốt',5,'122 Trường Chinh. Q Tân Bình','2021-08-05 09:48:37',13,'8h Sáng - 5h Chiều','Nhân viên','ít nhấ 1 năm kinh nghiệm','Nam',167,2,1),(121,'Shipper','Chở hàng hóa. Giao hàng theo đơn','Trên 18 tuổi. Có sức khỏe tốt. Chăm chỉ, siêng năng.','Thời gian tự do. Mức lương hấp dẫn. Chế độ BHXH theo quy định',12,'231 Hàng Mã','2021-09-21 09:29:53',5,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',165,3,3),(159,'Shipper','Chở hàng hóa. Giao hàng theo đơn','Trên 18 tuổi. Có sức khỏe tốt. Chăm chỉ, siêng năng.','Thời gian tự do. Mức lương hấp dẫn. Chế độ BHXH theo quy định',8,'79 Lê Trọng Tấn. Q Tân Phú','2021-09-21 09:29:53',5,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',169,1,3),(177,'Lập trình viên Java','Thực hiện dự án theo yêu cầu. Bảo trì hệ thống.','Có kiến thức tốt về lập trình. Chịu được áp lực','Lương cao. Cơ hội thăng tiến tốt',5,'122 Trường Chinh. Q Tân Bình','2021-09-21 09:29:53',13,'8h Sáng - 5h Chiều','Nhân viên','ít nhấ 1 năm kinh nghiệm','Nam',172,1,1),(182,'Phụ Bếp','Phụ nấu món ăn. Chạy bàn','Nhanh nhẹn. Chăm Chỉ','Thưởng cuối tháng. Công việc nhàn rỗi',6,'216 Q Nam từ Liêm','2021-09-21 09:29:53',5,'Theo ca 8 tiếng','Phụ bếp','Không yêu cầu','Không yêu cầu',168,3,4),(184,'Phụ nhà hàng','Phụ nấu món ăn. Chạy bàn','Nhanh nhẹn. Chăm Chỉ','Thưởng cuối tháng. Công việc nhàn rỗi',6,'216 Q Nam từ Liêm','2021-09-21 09:29:53',5,'Theo ca 8 tiếng','Phụ bếp','Không yêu cầu','Không yêu cầu',171,1,4),(185,'Giáo viên mầm non','Hỗ trợ học viên, Phụ giúp việc giảng dạy','IELTS 7 trở lên. Khả năng giao tiếp tốt. Chăm chỉ','Được giao tiếp nhiều với người nước ngoài. Môi trường năng động',12,'312 Hàng Mã','2021-10-21 09:29:53',3,'Giờ hành chính','Trợ giảng','Không yêu cầu','Không yêu cầu',166,3,2),(186,'Shipper','Giao hàng','Trên 18 tuổi. Có sức khỏe tốt. Chăm chỉ, siêng năng.','Thời gian tự do. Mức lương hấp dẫn. Chế độ BHXH theo quy định',8,'79 Lê Trọng Tấn. Q Tân Phú','2021-10-21 09:29:53',5,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',171,1,3),(187,'Giáo viên toán cấp 3','Dạy kèm cấp 3. Các môn Toán, Văn','Có bằng sư phạm. Có kiến thức tốt','Lương thưởng theo khả năng. Được hỗ trợ tiền ăn',15,'Quận thốt nốt','2021-10-21 09:29:53',2,'Từ 7-9h tối','Giảng viên','ít nhất 1 năm kinh nghiệm','Ưu tiên Nữ',170,4,2),(188,'Tài xế công nghệ','Chở khách theo yêu cầu. Chở hàng hóa. Giao hàng theo đơn','Trên 18 tuổi. Có sức khỏe tốt. Chăm chỉ, siêng năng.','Thời gian tự do. Mức lương hấp dẫn. Chế độ BHXH theo quy định',12,'79 Lê Trọng Tấn. Q Tân Phú','2021-10-21 09:29:53',10,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',165,1,3),(189,'Giáo viên toán cấp 3','Dạy kèm cấp 3. Các môn Toán, Văn','Có bằng sư phạm. Có kiến thức tốt','Lương thưởng theo khả năng. Được hỗ trợ tiền ăn',15,'Quận thốt nốt','2021-10-21 09:29:53',2,'Từ 7-9h tối','Giảng viên','ít nhất 1 năm kinh nghiệm','Ưu tiên Nữ',166,1,2),(190,'Shipper','Tài xế Grab','Trên 18 tuổi. Có sức khỏe tốt. Chăm chỉ, siêng năng.','Thời gian tự do. Mức lương hấp dẫn. Chế độ BHXH theo quy định',9,'231 Hàng Mã','2021-11-29 09:29:53',5,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',169,3,3),(191,'Tài xế xe tải','Giao hàng shop mỹ phẩm','Có sức khỏe tốt. Chịu khó.','Linh động thời gian. Lương cao',7,'121 Quận Sơn Trà','2021-11-29 09:29:53',12,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',165,2,3),(192,'Thợ sửa máy lạnh','Sửa chữa máy lạnh. Lắp đặt theo yêu cầu','Có kinh nghiệm trong việc sửa  máy lạnh. Thái độ tốt','Lương theo năng lực. Giờ giấc tự do',10,'89 Quang Trung. Q Gò Vấp','2021-11-29 09:29:53',5,'Tự do','Nhân viên','2 năm kinh nghiệm','Nam',167,1,4),(193,'Kỹ sự xây dựng','Thực hiện bảng vẽ phát thảo. Bla blaaa','Có kinh nghiệm trong việc sửa  máy lạnh. Thái độ tốt','Lương theo năng lực. Giờ giấc tự do',10,'89 Quang Trung. Q Gò Vấp','2021-11-29 09:29:53',5,'Tự do','Nhân viên','2 năm kinh nghiệm','Nam',172,3,3),(194,'Giáo viên mầm non','Hỗ trợ học viên, Phụ giúp việc giảng dạy','IELTS 7 trở lên. Khả năng giao tiếp tốt. Chăm chỉ','Được giao tiếp nhiều với người nước ngoài. Môi trường năng động',12,'312 Hàng Mã','2021-11-29 09:29:53',3,'Giờ hành chính','Trợ giảng','Không yêu cầu','Không yêu cầu',171,2,2),(195,'Lập trình viên','Thực hiện dự án theo yêu cầu. Bảo trì hệ thống.','Có kiến thức tốt về lập trình. Chịu được áp lực','Lương cao. Cơ hội thăng tiến tốt',5,'122 Trường Chinh. Q Tân Bình','2021-11-29 09:29:53',13,'8h Sáng - 5h Chiều','Nhân viên','ít nhấ 1 năm kinh nghiệm','Nam',167,1,1),(196,'Tài xế riêng','Đưa đón theo yêu cầu','Thật thà, chịu khó. Khả năng lái xe tốt','Mức lương cao. Có thưởng thêm',21,'79 Lê Trọng Tấn. Q Tân Phú','2021-11-29 09:29:53',1,'Tự do','Nhân viên','Hơn 3 năm','Nam',165,1,3),(197,'Trợ giảng Tiếng Anh','Hỗ trợ học viên, Phụ giúp việc giảng dạy','IELTS 7 trở lên. Khả năng giao tiếp tốt. Chăm chỉ','Được giao tiếp nhiều với người nước ngoài. Môi trường năng động',12,'312 Hàng Mã','2021-11-29 09:29:53',3,'Giờ hành chính','Trợ giảng','Không yêu cầu','Không yêu cầu',170,1,2),(198,'Giảng viên dạy kèm','Dạy kèm cấp 1. Các môn Toán, Văn','Có bằng sư phạm. Có kiến thức tốt','Lương thưởng theo khả năng. Được hỗ trợ tiền ăn',15,'Quận thốt nốt','2021-11-29 09:29:53',2,'Từ 7-9h tối','Giảng viên','ít nhất 1 năm kinh nghiệm','Ưu tiên Nữ',171,2,2),(199,'Công nhân xí nghiệm','Thực hiện dự án theo yêu cầu. Bảo trì hệ thống.','Có kiến thức tốt về lập trình. Chịu được áp lực','Lương cao. Cơ hội thăng tiến tốt',5,'122 Trường Chinh. Q Tân Bình','2021-11-29 09:29:53',13,'8h Sáng - 5h Chiều','Nhân viên','ít nhấ 1 năm kinh nghiệm','Nam',167,4,1),(200,'Trợ giảng Tiếng Anh','Hỗ trợ học viên, Phụ giúp việc giảng dạy','IELTS 7 trở lên. Khả năng giao tiếp tốt. Chăm chỉ','Được giao tiếp nhiều với người nước ngoài. Môi trường năng động',12,'312 Hàng Mã','2021-11-29 09:29:53',3,'Giờ hành chính','Trợ giảng','Không yêu cầu','Không yêu cầu',170,3,2),(201,'Giảng viên dạy kèm','Dạy kèm cấp 1. Các môn Toán, Văn','Có bằng sư phạm. Có kiến thức tốt','Lương thưởng theo khả năng. Được hỗ trợ tiền ăn',15,'Quận thốt nốt','2021-12-06 09:48:37',2,'Từ 7-9h tối','Giảng viên','ít nhất 1 năm kinh nghiệm','Ưu tiên Nữ',166,4,2),(202,'Thợ điện','Sửa chữa máy lạnh. Lắp đặt theo yêu cầu','Có kinh nghiệm trong việc sửa  máy lạnh. Thái độ tốt','Lương theo năng lực. Giờ giấc tự do',10,'89 Quang Trung. Q Gò Vấp','2021-12-23 09:58:30',5,'Tự do','Nhân viên','2 năm kinh nghiệm','Nam',172,1,4),(203,'Tài xế xe tải','Chở hàng theo lịch trình. Bốc vác hàng hóa','Có sức khỏe tốt. Chịu khó.','Linh động thời gian. Lương cao',15,'121 Quận Sơn Trà','2021-12-24 09:29:53',20,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',165,2,3),(204,'Nhân viên K+','Lắp đặt truyền hình','Có kinh nghiệm trong mảng truyền hình. Thái độ tốt','Lương theo năng lực. Giờ giấc tự do',10,'89 Quang Trung. Q Gò Vấp','2021-12-25 09:58:30',5,'Tự do','Nhân viên','2 năm kinh nghiệm','Nam',167,3,4),(205,'Công Nhân May','Phụ dọn dẹp nhà cửa. Chăm trẻ.','Nhanh nhẹn. Chăm Chỉ','Thưởng cuối tháng. Công việc nhàn rỗi',7,'Đường 3/2 Nguyễn Văn Cừ','2021-12-25 10:13:42',1,'Có bao ở','Giúp việc','Không yêu cầu','Nữ',171,4,2),(206,'Giúp việc nhà','Phụ dọn dẹp nhà cửa. Chăm trẻ.','Nhanh nhẹn. Chăm Chỉ','Thưởng cuối tháng. Công việc nhàn rỗi',7,'Đường 3/2 Nguyễn Văn Cừ','2021-12-25 10:13:42',1,'Có bao ở','Giúp việc','Không yêu cầu','Nữ',168,4,4),(207,'Lập trình viên Website','Thực hiện dự án theo yêu cầu. Bảo trì hệ thống.','Có kiến thức tốt về lập trình. Chịu được áp lực','Lương cao. Cơ hội thăng tiến tốt',5,'122 Trường Chinh. Q Tân Bình','2021-12-29 09:58:30',13,'8h Sáng - 5h Chiều','Nhân viên','ít nhấ 1 năm kinh nghiệm','Nam',172,2,1),(208,'Shipper','Chở hàng hóa. Giao hàng theo đơn','Trên 18 tuổi. Có sức khỏe tốt. Chăm chỉ, siêng năng.','Thời gian tự do. Mức lương hấp dẫn. Chế độ BHXH theo quy định',12,'231 Hàng Mã','2021-12-29 09:29:53',5,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',170,3,3),(209,'Shipper','Chở hàng hóa. Giao hàng theo đơn','Trên 18 tuổi. Có sức khỏe tốt. Chăm chỉ, siêng năng.','Thời gian tự do. Mức lương hấp dẫn. Chế độ BHXH theo quy định',8,'79 Lê Trọng Tấn. Q Tân Phú','2021-12-30 09:29:53',5,'Tự do','Nhân viên','Không yêu cầu','Ưu tiên Nam',165,1,3),(210,'Lập trình viên Java','Thực hiện dự án theo yêu cầu. Bảo trì hệ thống.','Có kiến thức tốt về lập trình. Chịu được áp lực','Lương cao. Cơ hội thăng tiến tốt',5,'122 Trường Chinh. Q Tân Bình','2021-12-30 09:58:30',13,'8h Sáng - 5h Chiều','Nhân viên','ít nhấ 1 năm kinh nghiệm','Nam',167,1,1),(211,'Phụ Bếp','Phụ nấu món ăn. Chạy bàn','Nhanh nhẹn. Chăm Chỉ','Thưởng cuối tháng. Công việc nhàn rỗi',6,'216 Q Nam từ Liêm','2021-12-31 10:10:07',5,'Theo ca 8 tiếng','Phụ bếp','Không yêu cầu','Không yêu cầu',171,3,4),(212,'Phụ nhà hàng','Phụ nấu món ăn. Chạy bàn','Nhanh nhẹn. Chăm Chỉ','Thưởng cuối tháng. Công việc nhàn rỗi',6,'216 Q Nam từ Liêm','2021-12-31 10:10:07',5,'Theo ca 8 tiếng','Phụ bếp','Không yêu cầu','Không yêu cầu',170,1,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (164,'Nguyễn Trung','Hiếu',22,'1751010035hieu@ou.edu.vn','0923272840','https://res.cloudinary.com/springmvc/image/upload/v1640915484/h006e7l7c50h5qpz82eq.png','admin','$2a$10$e6DhVSVvTBE035VG.AKBuOdpg7HQkK1hgPZb6U4qQD1/bhmY4bFGi',0,NULL,'ROLE_ADMIN',1,1),(165,'Trần Trung','Nghĩa',35,'nghiatran@gmail.com','0934212154','https://res.cloudinary.com/springmvc/image/upload/v1640918080/ehnabzdt4y2x2p6k1jwl.png','ntd1','$2a$10$kPtHpmYJbam.6zf4g7CUou2llWXYiIEBcu6ixJh0P5CXhWVv9TIom',1,'','ROLE_NTD',3,3),(166,'Nguyễn','Ánh',27,'nguyenanh@gmail.com','0948482132','https://res.cloudinary.com/springmvc/image/upload/v1640916090/dyjq8tpzd6rdjzhu9cyc.png','ntd2','$2a$10$2sg7B6vnyXuExWPJjr9zHuPjoKoT7Pao3ZtUAl4gmdBYgJfMbiJIG',1,NULL,'ROLE_NTD',2,2),(167,'Lê Thị','Thu',38,'lethithu@gmail.com','1234567891','https://res.cloudinary.com/springmvc/image/upload/v1640919352/qquxcigbymoxupxwpsoe.png','ntd3','$2a$10$6kR1INDTOhqSHEJiCAKZvO/EWH14Q/HHtyfV.79UQOofjvlcKxwrq',1,'','ROLE_NTD',1,1),(168,'Trần Quốc','Nhân',31,'tranquocnhan@gmail.com','1234567892','https://res.cloudinary.com/springmvc/image/upload/v1640916323/fs1e7umhas99xaw9lcky.png','ntd4','$2a$10$zW6GrosQuMYAd8ogVunAOeUvKTujnS9uNjaVvVH/Qr80l/DUa16Xa',1,NULL,'ROLE_NTD',4,1),(169,'Trần Gia','Bảo',48,'giabao@gmail.com','1234561233','https://res.cloudinary.com/springmvc/image/upload/v1640916409/bkj9cvgavexht4ofrot5.png','ntd5','$2a$10$bIiVJPrP2RcBWz8kwXn.auTekIRQk7ZcHuEvkIWu9GHUGBqjXoJ5S',1,NULL,'ROLE_NTD',3,1),(170,'Nguyễn','Ngọc',23,'nguyenngoc@gmail.com','1231231231','https://res.cloudinary.com/springmvc/image/upload/v1640916462/e7uc8clkrgxkqnbqansj.png','ntd7','$2a$10$FXu3Vnj2gvd7yyi7hhnev.DRVOWl1F0jNWb990GPrElLvZd4Sf/Ni',1,NULL,'ROLE_NTD',2,3),(171,'Trần','Khôi',42,'trankhoi@gmail.com','1231233211','https://res.cloudinary.com/springmvc/image/upload/v1640916526/msuagamrlduasfmgxvna.png','ntd8','$2a$10$8rPiJWYbqhkw7UUBfRCDm.28nS9Temye/gqbNmcWRXI/tw9biETZ2',1,NULL,'ROLE_NTD',2,2),(172,'Bùi Xuân','Hoàn',24,'xuanhoan@gmail.com','1235123123','https://res.cloudinary.com/springmvc/image/upload/v1640916789/fxn10550vjhtjemq21pw.png','ntd9','$2a$10$NwKvu4DXmdifbpJoxRGy6..vENu8TqwwUuak32/W1wi0fytumJSES',1,'','ROLE_NTD',2,4),(173,'Rô','Đô',37,'quoctan@gmail.com','1414141414','https://res.cloudinary.com/springmvc/image/upload/v1640917248/ytmdd9jfefysjkyqjoks.jpg','user1','$2a$10$PIfcBKerP6Pc0F5I/nd4wOXDqc.1Q7ImX3tDi1RaJLT9r4YC6UEdS',2,'https://res.cloudinary.com/springmvc/image/upload/v1640917573/vod8mtilt2e1pmujnury.jpg','ROLE_USER',1,1),(174,'Lê','Messi',34,'messi@gmail.com','1234561232','https://res.cloudinary.com/springmvc/image/upload/v1640917309/jiqwdfv7qyjvfjdi8soh.jpg','user2','$2a$10$gOGCw1d2bXWhGx10jV1z7.8BxU8BTCvlV/NigHgcVzM9Aiz044shO',2,'https://res.cloudinary.com/springmvc/image/upload/v1640924501/fxssrea08cv5oh1ucjph.jpg','ROLE_USER',2,3),(175,'Nguyễn Bi','Bờ',54,'nguyenhue@gmail.com','1231231238','https://res.cloudinary.com/springmvc/image/upload/v1640917351/alh3xd4qwmwzd0ccl39k.jpg','user3','$2a$10$gasov28Y0/qEsbYUVMaaeuFRfKm3qGNvKujVDlLQ1KZ4.N17TVRYu',3,'https://res.cloudinary.com/springmvc/image/upload/v1640924523/kbdohbftwvjjq5l9mghk.jpg','ROLE_USER',4,3),(177,'Đỗ Nam','Trump',60,'trump@gmail.com','1231231221','https://res.cloudinary.com/springmvc/image/upload/v1640922967/bi164rbmybzagkc6twx5.jpg','user4','$2a$10$EJAcxlX75ArEUguDluerCuFFOZu6U0S.ofjIQ4MU4TufiXV6JEu0q',3,'https://res.cloudinary.com/springmvc/image/upload/v1640924543/mhouuyw6womg1ukublfy.jpg','ROLE_USER',4,4),(178,'Nguyễn Ny','Ma',29,'nyma@gmail.com','1231233212','https://res.cloudinary.com/springmvc/image/upload/v1640923293/ucpdosdi3yxaeogd6y7p.jpg','user5','$2a$10$hRRbZz60jLnD4Q0K9dDR6usPcOROLNI0H7q3alq4aO2gvaTW1vOLa',3,NULL,'ROLE_USER',3,2);
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

-- Dump completed on 2021-12-31 12:19:29
