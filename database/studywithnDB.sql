CREATE DATABASE  IF NOT EXISTS `projectweb1` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projectweb1`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: projectweb1
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `postId` int DEFAULT NULL,
  `courseId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `content` text COLLATE utf8mb3_swedish_ci,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `FK_courseId_idx` (`courseId`),
  KEY `FK_profileId_idx` (`userId`),
  KEY `FK_postId_idx` (`postId`),
  CONSTRAINT `FK_courseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_postId` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_profileId` FOREIGN KEY (`userId`) REFERENCES `profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (103,NULL,3,10,'Bình luận thứ nhất của Người dùng 1','2024-06-23 04:44:15'),(104,94,NULL,10,'Bình luận đầu tiên của người dùng 1','2024-06-23 03:46:06'),(105,91,NULL,10,'Bình luận đầu tiên của người dùng 1','2024-06-23 03:46:11'),(106,90,NULL,10,'Bình luận đầu tiên của người dùng 1','2024-06-23 03:46:20'),(107,89,NULL,10,'Bình luận đầu tiên của người dùng 1','2024-06-23 03:46:24'),(108,88,NULL,10,'Bình luận đầu tiên của người dùng 1','2024-06-23 03:46:28'),(109,87,NULL,10,'Bình luận đầu tiên của người dùng 1','2024-06-23 03:46:32'),(110,86,NULL,10,'Bình luận đầu tiên của người dùng 1','2024-06-23 03:46:37'),(111,NULL,3,11,'Bình luận thứ hai của Người dùng 2','2024-06-23 10:53:04'),(112,85,NULL,11,'Xin chào Người dùng 1','2024-06-23 10:54:54'),(113,114,NULL,11,'Xin chào Người dùng 4','2024-06-23 10:55:46'),(114,122,NULL,11,'Xin chào người dùng 5','2024-06-23 10:56:01'),(115,121,NULL,11,'Xin chào người dùng 5','2024-06-23 10:56:05'),(116,120,NULL,11,'Xin chào người dùng 5','2024-06-23 10:56:08'),(117,119,NULL,11,'Xin chào người dùng 5','2024-06-23 10:56:12'),(118,117,NULL,11,'Xin chào người dùng 5','2024-06-23 10:56:15'),(119,130,NULL,11,'Xin chào người dùng 6','2024-06-23 10:56:30'),(120,129,NULL,11,'Xin chào người dùng 6','2024-06-23 10:56:34'),(121,128,NULL,11,'Xin chào người dùng 6','2024-06-23 10:56:37'),(122,124,NULL,11,'Xin chào người dùng 6','2024-06-23 10:56:45'),(123,125,NULL,11,'Xin chào người dùng 6','2024-06-23 10:56:49'),(124,132,NULL,11,'Xin chào người dùng 7','2024-06-23 10:57:11'),(125,131,NULL,11,'Xin chào người dùng 7','2024-06-23 10:57:14'),(126,134,NULL,11,'Xin chào người dùng 7','2024-06-23 10:57:20'),(127,135,NULL,11,'Xin chào người dùng 7','2024-06-23 10:57:23'),(128,136,NULL,11,'Xin chào người dùng 7','2024-06-23 10:57:27'),(129,139,NULL,11,'Xin chào người dùng 7','2024-06-23 10:57:31'),(130,138,NULL,11,'Xin chào người dùng 7','2024-06-23 10:57:34'),(131,NULL,3,12,'Bình luận thứ ba của Người dùng 3','2024-06-23 10:58:04'),(132,85,NULL,12,'Xin chào Người dùng 1','2024-06-23 11:01:56'),(133,82,NULL,12,'Xin chào Người dùng 1','2024-06-23 11:02:00'),(134,81,NULL,12,'Xin chào Người dùng 1','2024-06-23 11:02:03'),(135,80,NULL,12,'Xin chào Người dùng 1','2024-06-23 11:02:06'),(136,79,NULL,12,'Xin chào Người dùng 1','2024-06-23 11:02:09'),(137,78,NULL,12,'Xin chào Người dùng 1','2024-06-23 11:02:12'),(138,76,NULL,12,'Xin chào Người dùng 1','2024-06-23 11:02:15'),(139,77,NULL,12,'Xin chào Người dùng 1','2024-06-23 11:02:18'),(140,74,NULL,12,'Xin chào Người dùng 1','2024-06-23 11:02:21'),(141,75,NULL,12,'Xin chào Người dùng 1','2024-06-23 11:02:24'),(142,94,NULL,12,'Xin chào Người dùng 2','2024-06-23 11:02:44'),(143,91,NULL,12,'Xin chào Người dùng 2','2024-06-23 11:02:47'),(144,90,NULL,12,'Xin chào Người dùng 2','2024-06-23 11:02:51'),(145,89,NULL,12,'Xin chào Người dùng 2','2024-06-23 11:02:55'),(146,88,NULL,12,'Xin chào Người dùng 2','2024-06-23 11:02:58'),(147,86,NULL,12,'Xin chào Người dùng 2','2024-06-23 11:03:01'),(149,114,NULL,12,'Xin chào Người dùng 4','2024-06-23 11:03:34'),(150,113,NULL,12,'Xin chào Người dùng 4','2024-06-23 11:03:37'),(151,111,NULL,12,'Xin chào Người dùng 4','2024-06-23 11:03:40'),(152,111,NULL,12,'Xin chào Người dùng 4','2024-06-23 11:03:44'),(153,108,NULL,12,'Xin chào Người dùng 4','2024-06-23 11:03:48'),(154,107,NULL,12,'Xin chào Người dùng 4','2024-06-23 11:03:51'),(155,104,NULL,12,'Xin chào Người dùng 4','2024-06-23 11:03:54'),(156,105,NULL,12,'Xin chào Người dùng 4','2024-06-23 11:03:57'),(162,116,NULL,12,'Xin chào Người dùng 4','2024-06-23 11:04:32'),(163,122,NULL,12,'Xin chào Người dùng 5','2024-06-23 11:06:47'),(164,121,NULL,12,'Xin chào Người dùng 5','2024-06-23 11:06:57'),(165,120,NULL,12,'Xin chào Người dùng 5','2024-06-23 11:07:01'),(166,119,NULL,12,'Xin chào Người dùng 5','2024-06-23 11:07:06'),(167,117,NULL,12,'Xin chào Người dùng 5','2024-06-23 11:07:11'),(168,116,NULL,12,'Xin chào Người dùng 5','2024-06-23 11:07:14'),(169,130,NULL,12,'Xin chào Người dùng 6','2024-06-23 11:07:37'),(170,129,NULL,12,'Xin chào Người dùng 6','2024-06-23 11:07:41'),(171,127,NULL,12,'Xin chào Người dùng 6','2024-06-23 11:07:45'),(172,128,NULL,12,'Xin chào Người dùng 6','2024-06-23 11:07:48'),(173,126,NULL,12,'Xin chào Người dùng 6','2024-06-23 11:07:52'),(174,125,NULL,12,'Xin chào Người dùng 6','2024-06-23 11:07:55'),(175,124,NULL,12,'Xin chào Người dùng 6','2024-06-23 11:07:57'),(176,NULL,3,13,'Bình luận thứ tư của Người dùng 4','2024-06-23 11:09:04'),(177,139,NULL,13,'Xin chào người dùng 7','2024-06-23 12:46:36'),(178,138,NULL,13,'Xin chào người dùng 7','2024-06-23 12:46:39'),(179,137,NULL,13,'Xin chào người dùng 7','2024-06-23 12:46:42'),(180,136,NULL,13,'Xin chào người dùng 7','2024-06-23 12:46:46'),(181,135,NULL,13,'Xin chào người dùng 7','2024-06-23 12:46:50'),(182,134,NULL,13,'Xin chào người dùng 7','2024-06-23 12:46:55'),(183,132,NULL,13,'Xin chào người dùng 7','2024-06-23 12:46:58'),(184,131,NULL,13,'Xin chào người dùng 7','2024-06-23 12:47:04'),(185,85,NULL,13,'Xin chào Người dùng 1','2024-06-23 12:47:36'),(186,80,NULL,13,'Xin chào Người dùng 1','2024-06-23 12:47:39'),(187,79,NULL,13,'Xin chào Người dùng 1','2024-06-23 12:47:42'),(188,76,NULL,13,'Xin chào Người dùng 1','2024-06-23 12:47:45'),(189,75,NULL,13,'Xin chào Người dùng 1','2024-06-23 12:47:47'),(190,74,NULL,13,'Xin chào Người dùng 1','2024-06-23 12:47:51'),(191,NULL,3,14,'Bình luận thứ năm của Người dùng 5','2024-06-23 12:48:16'),(192,123,NULL,14,'tôi tự comment bài viết của tôi','2024-06-23 12:48:50'),(193,122,NULL,14,'tôi tự comment bài viết của tôi','2024-06-23 12:48:54'),(194,121,NULL,14,'tôi tự comment bài viết của tôi','2024-06-23 12:48:56'),(195,119,NULL,14,'tôi tự comment bài viết của tôi','2024-06-23 12:48:59'),(196,118,NULL,14,'tôi tự comment bài viết của tôi','2024-06-23 12:49:03'),(197,117,NULL,14,'tôi tự comment bài viết của tôi','2024-06-23 12:49:06'),(198,116,NULL,14,'tôi tự comment bài viết của tôi','2024-06-23 12:49:09'),(199,103,NULL,14,'Xin chào Người dùng 3','2024-06-23 12:49:42'),(200,102,NULL,14,'Xin chào Người dùng 3','2024-06-23 12:49:45'),(201,100,NULL,14,'Xin chào Người dùng 3','2024-06-23 12:49:49'),(202,101,NULL,14,'Xin chào Người dùng 3','2024-06-23 12:49:51'),(203,99,NULL,14,'Xin chào Người dùng 3','2024-06-23 12:49:54'),(204,98,NULL,14,'Xin chào Người dùng 3','2024-06-23 12:49:56'),(205,NULL,3,15,'Bình luận thứ 6 của Người dùng 6','2024-06-23 12:50:22'),(206,NULL,3,16,'Bình luận thứ 7 của Người dùng 7','2024-06-23 13:09:02'),(208,NULL,3,18,'bình luận lần 2<br>','2024-06-23 13:42:14'),(209,NULL,3,18,'bình luận lần 3','2024-06-23 13:42:21'),(211,139,NULL,18,'xin chào lần 2','2024-06-23 13:43:03'),(212,142,NULL,16,'xin chào Người dùng 8','2024-06-23 13:46:15'),(213,132,NULL,18,'Xin chào','2024-06-23 13:49:31');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `contactId` int NOT NULL AUTO_INCREMENT,
  `profileId` int NOT NULL,
  `contactType` varchar(60) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `linkContact` varchar(60) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `descContact` varchar(60) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`contactId`),
  KEY `FK_profileId_idx` (`profileId`),
  CONSTRAINT `FK_profileId_contact` FOREIGN KEY (`profileId`) REFERENCES `profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseId` int NOT NULL AUTO_INCREMENT,
  `coursecategoryId` int DEFAULT NULL,
  `courseName` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `courseURL` varchar(100) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `describe` text CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci,
  `createdAt` date DEFAULT NULL,
  PRIMARY KEY (`courseId`),
  KEY `FK_coursecategoryId_idx` (`coursecategoryId`),
  CONSTRAINT `FK_coursecategoryId` FOREIGN KEY (`coursecategoryId`) REFERENCES `coursecategory` (`coursecategoryId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,1,'Giải tích 1','giai-tich-1/giaitich1',NULL,'2024-01-01'),(2,1,'Giải tích 2','giai-tich-2/giaitich2',NULL,'2024-01-01'),(3,1,'Giải tích 3','giai-tich-3/giaitich3','Chuỗi, Phương trình vi phân, Phương pháp biến đổi Laplace','2024-01-01'),(4,1,'	Đại số tuyến tính','dai-so-tuyen-tinh/daisotuyentinh',NULL,'2024-01-01'),(5,1,'Xác suất thống kê','xac-suat-thong-ke/xacsuatthongke',NULL,'2024-01-01'),(6,1,'	Vật lý đại cương 1','vat-li-dai-cuong-1/vatlidaicuong1',NULL,'2024-01-01'),(7,1,'Xử lý tín hiệu','xu-ly-tin-hieu/xulytinhieu',NULL,'2024-01-01'),(8,1,'Tính toán khoa học','tinh-toan-khoa-hoc/tinhtoankhoahoc',NULL,'2024-01-02'),(9,1,'Điện tử cho CNTT','dien-tu-cho-cntt/dientuchocntt',NULL,'2024-01-02'),(10,1,'Toán rời rạc','toan-roi-rac/toanroirac',NULL,'2024-01-02'),(11,1,'Điện tử cho CNTT lab','dien-tu-cho-cntt-lab/dientuchocnttlab',NULL,'2024-01-02'),(12,1,'Kiến thức máy tính','kien-thuc-may-tinh/kienthucmaytinh',NULL,'2024-01-02'),(13,1,'	Nhập môn CNTT và TT','nhap-mon-cntt-va-tt/nhapmoncnttvatt',NULL,'2024-01-02'),(14,2,'Triết học Mác - Lênin','triet-hoc-mac-lenin/triethocmaclenin',NULL,NULL),(15,2,'	Kinh tế chính trị Mác - Lênin','kinh-te-chinh-tri-mac-lenin/kinhtechinhtrimaclenin',NULL,NULL),(16,2,'	Chủ nghĩa xã hội khoa học','chu-nghia-xa-hoi-khoa-hoc/chunghiaxahoikhoahoc',NULL,NULL),(17,2,'Lịch sử Đảng cộng sản Việt Nam','lich-su-dang-cong-san-viet-nam/lichsudangcongsanvietnam',NULL,NULL),(18,2,'Tư tưởng Hồ Chí Minh','tu-tuong-ho-chi-minh/tutuonghochiminh',NULL,NULL),(19,2,'	Pháp luật đại cương','phap-luat-dai-cuong/phapluatdaicuong',NULL,NULL),(20,3,'Technical Writing and Presentation','technical-writing-and-presentation/technicalwritingandpresentation',NULL,NULL),(21,3,'Cấu trúc dữ liệu và thuật toán','cau-truc-du-lieu-va-giai-thuat/cautrucdulieuvagiaithuat',NULL,NULL),(22,3,'	Nguyên lý hệ điều hành','nguyen-ly-he-dieu-hanh/nguyenlyhedieuhanh',NULL,NULL),(23,3,'Mạng máy tính','mang-may-tinh/mangmaytinh',NULL,NULL),(24,3,'Lập trình hướng đối tượng','lap-trinh-huong-doi-tuong/laptrinhhuongdoituong',NULL,NULL),(25,3,'	Nhập môn Trí tuệ nhân tạo','nhap-mon-tri-tue-nhan-tao/nhapmontrituenhantao',NULL,NULL),(26,3,'	Thuật toán ứng dụng','thuat-toan-ung-dung/thuattoanungdung',NULL,NULL),(27,3,'Lập trình C cơ bản','lap-trinh-c-co-ban/laptrinhccoban',NULL,NULL),(28,3,'Kiến trúc máy tính','kien-truc-may-tinh/kientrucmaytinh',NULL,NULL),(29,3,'	Cơ sở dữ liệu','co-so-du-lieu/cosodulieu',NULL,NULL),(30,3,'Thực hành kiến trúc máy tính','thuc-hanh-kien-truc-may-tinh/thuchanhkientrucmaytinh',NULL,NULL),(31,3,'Xây dựng chương trình dịch','xay-dung-chuong-trinh-dich/xaydungchuongtrinhdich',NULL,NULL),(32,3,'Nhập môn an toàn thông tin','nhap-mon-an-toan-thong-tin/nhapmonantoanthongtin',NULL,NULL),(33,3,'	Thực hành Lập trình mạng','thuc-hanh-lap-trinh-mang/thuchanhlaptrinhmang',NULL,NULL),(34,3,'Kỹ thuật phần mềm','ky-thuat-phan-mem/kythuatphanmem',NULL,NULL),(35,3,'Nhập môn kỹ thuật truyền thông','nhap-mon-ky-thuat-truyen-thong/nhapmonkithuattruyenthong',NULL,NULL),(36,4,'	Kỹ năng mềm','ky-nang-mem/kynangmem',NULL,NULL),(37,4,'Tâm lý học ứng dụng','tam-ly-hoc-ung-dung/tamlyhocungdung',NULL,NULL),(38,4,'Văn hóa kinh doanh và tinh thần khởi nghiệp','van-hoa-kinh-doanh-va-tinh-than-khoi-nghiep/vanhoakinhdoanhvatinhthankhoinghiep',NULL,NULL),(39,3,'Thực hành cơ sở dữ liệu','thuc-hanh-co-so-du-lieu/thuchanhcosodulieu',NULL,NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursecategory`
--

DROP TABLE IF EXISTS `coursecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coursecategory` (
  `coursecategoryId` int NOT NULL AUTO_INCREMENT,
  `coursecategoryName` varchar(100) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `coursecategoryFolder` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`coursecategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursecategory`
--

LOCK TABLES `coursecategory` WRITE;
/*!40000 ALTER TABLE `coursecategory` DISABLE KEYS */;
INSERT INTO `coursecategory` VALUES (1,'Toán và Khoa học cơ bản','toan-va-khoa-hoc-co-ban'),(2,'Lý luận chính trị','ly-luan-chinh-tri'),(3,'Cơ sở và cốt lõi ngành','co-so-va-cot-loi-nganh'),(4,'Kiến thức bổ trợ','kien-thuc-bo-tro'),(5,'Tài liệu tham khảo khác','tai-lieu-tham-khao-khac');
/*!40000 ALTER TABLE `coursecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error`
--

DROP TABLE IF EXISTS `error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `error` (
  `errorId` int NOT NULL,
  `errorType` varchar(100) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `errorDesc` text COLLATE utf8mb3_swedish_ci,
  `errorOccurrenceTime` datetime DEFAULT NULL,
  PRIMARY KEY (`errorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error`
--

LOCK TABLES `error` WRITE;
/*!40000 ALTER TABLE `error` DISABLE KEYS */;
/*!40000 ALTER TABLE `error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `followid` int NOT NULL AUTO_INCREMENT,
  `follower` int DEFAULT NULL,
  `following` int DEFAULT NULL,
  PRIMARY KEY (`followid`),
  UNIQUE KEY `unique_follow_post_user` (`follower`,`following`),
  KEY `FK_follower_profileId_idx` (`follower`),
  KEY `FK_following_profileId_idx` (`following`),
  CONSTRAINT `FK_follower_profileId` FOREIGN KEY (`follower`) REFERENCES `profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_following_profileId` FOREIGN KEY (`following`) REFERENCES `profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (19,10,11),(20,10,12),(21,10,13),(22,10,14),(23,10,15),(24,10,16),(25,11,10),(26,11,13),(27,11,14),(28,11,15),(29,11,16),(30,12,10),(31,12,11),(32,12,13),(33,12,14),(34,12,15),(35,13,16),(36,14,11),(37,14,12),(40,16,18),(42,18,13),(41,18,16);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likepost`
--

DROP TABLE IF EXISTS `likepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likepost` (
  `likeId` int NOT NULL AUTO_INCREMENT,
  `postId` int NOT NULL,
  `userId` int NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`likeId`),
  UNIQUE KEY `unique_like_post_user` (`postId`,`userId`),
  KEY `fk_userId_like_idx` (`userId`),
  KEY `fk_postId_like_idx` (`postId`),
  CONSTRAINT `fk_postId_like` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userId_like` FOREIGN KEY (`userId`) REFERENCES `profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likepost`
--

LOCK TABLES `likepost` WRITE;
/*!40000 ALTER TABLE `likepost` DISABLE KEYS */;
INSERT INTO `likepost` VALUES (61,94,10,'2024-06-23 03:45:38'),(62,91,10,'2024-06-23 03:45:39'),(63,90,10,'2024-06-23 03:45:40'),(64,89,10,'2024-06-23 03:45:41'),(65,87,10,'2024-06-23 03:45:42'),(66,88,10,'2024-06-23 03:45:43'),(67,86,10,'2024-06-23 03:45:43'),(68,136,10,'2024-06-23 10:49:40'),(69,138,10,'2024-06-23 10:49:40'),(70,130,10,'2024-06-23 10:49:42'),(71,120,10,'2024-06-23 10:49:43'),(72,126,10,'2024-06-23 10:49:44'),(73,129,10,'2024-06-23 10:49:45'),(74,125,10,'2024-06-23 10:49:46'),(75,121,10,'2024-06-23 10:49:47'),(76,117,10,'2024-06-23 10:49:48'),(77,85,10,'2024-06-23 10:51:35'),(78,84,10,'2024-06-23 10:51:37'),(79,83,10,'2024-06-23 10:51:38'),(80,82,10,'2024-06-23 10:51:39'),(81,85,11,'2024-06-23 10:54:34'),(83,80,11,'2024-06-23 10:54:36'),(85,79,11,'2024-06-23 10:54:38'),(86,78,11,'2024-06-23 10:54:38'),(87,74,11,'2024-06-23 10:54:39'),(88,76,11,'2024-06-23 10:54:40'),(89,77,11,'2024-06-23 10:54:40'),(90,75,11,'2024-06-23 10:54:42'),(91,126,11,'2024-06-23 10:55:03'),(92,129,11,'2024-06-23 10:55:03'),(93,130,11,'2024-06-23 10:55:04'),(94,134,11,'2024-06-23 10:55:05'),(95,138,11,'2024-06-23 10:55:07'),(96,133,11,'2024-06-23 10:55:07'),(97,125,11,'2024-06-23 10:55:08'),(98,127,11,'2024-06-23 10:55:09'),(99,104,11,'2024-06-23 10:55:10'),(100,101,11,'2024-06-23 10:55:12'),(101,107,11,'2024-06-23 10:55:12'),(102,116,11,'2024-06-23 10:55:13'),(103,100,11,'2024-06-23 10:55:14'),(104,120,11,'2024-06-23 10:55:15'),(105,113,11,'2024-06-23 10:55:16'),(106,119,11,'2024-06-23 10:55:17'),(107,124,11,'2024-06-23 10:55:17'),(108,110,11,'2024-06-23 10:55:18'),(109,82,11,'2024-06-23 10:55:21'),(110,81,11,'2024-06-23 10:55:24'),(111,114,11,'2024-06-23 10:55:38'),(112,135,11,'2024-06-23 10:56:57'),(113,136,11,'2024-06-23 10:56:59'),(114,137,11,'2024-06-23 10:56:59'),(115,139,11,'2024-06-23 10:57:02'),(116,131,11,'2024-06-23 10:57:04'),(117,85,12,'2024-06-23 11:01:34'),(118,82,12,'2024-06-23 11:01:35'),(119,81,12,'2024-06-23 11:01:36'),(120,80,12,'2024-06-23 11:01:36'),(121,79,12,'2024-06-23 11:01:38'),(122,76,12,'2024-06-23 11:01:39'),(123,78,12,'2024-06-23 11:01:39'),(124,77,12,'2024-06-23 11:01:40'),(125,74,12,'2024-06-23 11:01:41'),(126,75,12,'2024-06-23 11:01:43'),(127,94,12,'2024-06-23 11:02:32'),(128,91,12,'2024-06-23 11:02:32'),(129,90,12,'2024-06-23 11:02:33'),(130,89,12,'2024-06-23 11:02:34'),(131,88,12,'2024-06-23 11:02:35'),(132,87,12,'2024-06-23 11:02:36'),(133,86,12,'2024-06-23 11:02:37'),(134,113,12,'2024-06-23 11:03:13'),(136,111,12,'2024-06-23 11:03:16'),(137,110,12,'2024-06-23 11:03:17'),(138,108,12,'2024-06-23 11:03:18'),(139,122,12,'2024-06-23 11:04:06'),(140,121,12,'2024-06-23 11:04:08'),(141,120,12,'2024-06-23 11:04:09'),(142,119,12,'2024-06-23 11:04:10'),(143,117,12,'2024-06-23 11:04:10'),(144,116,12,'2024-06-23 11:04:12'),(145,130,12,'2024-06-23 11:07:27'),(146,129,12,'2024-06-23 11:07:28'),(147,128,12,'2024-06-23 11:07:29'),(148,127,12,'2024-06-23 11:07:29'),(149,126,12,'2024-06-23 11:07:31'),(150,125,12,'2024-06-23 11:08:08'),(151,124,12,'2024-06-23 11:08:09'),(152,134,12,'2024-06-23 11:08:20'),(153,133,12,'2024-06-23 11:08:22'),(154,138,12,'2024-06-23 11:08:23'),(155,139,12,'2024-06-23 11:08:24'),(156,132,13,'2024-06-23 12:46:14'),(157,131,13,'2024-06-23 12:46:14'),(158,137,13,'2024-06-23 12:46:16'),(159,136,13,'2024-06-23 12:46:16'),(160,139,13,'2024-06-23 12:46:17'),(161,138,13,'2024-06-23 12:46:18'),(162,135,13,'2024-06-23 12:46:48'),(163,134,13,'2024-06-23 12:46:53'),(164,85,13,'2024-06-23 12:47:19'),(165,80,13,'2024-06-23 12:47:20'),(166,79,13,'2024-06-23 12:47:21'),(167,76,13,'2024-06-23 12:47:22'),(168,75,13,'2024-06-23 12:47:23'),(169,123,14,'2024-06-23 12:48:26'),(170,122,14,'2024-06-23 12:48:30'),(171,121,14,'2024-06-23 12:48:31'),(172,120,14,'2024-06-23 12:48:32'),(173,119,14,'2024-06-23 12:48:32'),(174,116,14,'2024-06-23 12:48:34'),(175,117,14,'2024-06-23 12:48:35'),(176,103,14,'2024-06-23 12:49:29'),(177,102,14,'2024-06-23 12:49:30'),(178,101,14,'2024-06-23 12:49:31'),(179,100,14,'2024-06-23 12:49:32'),(180,99,14,'2024-06-23 12:49:33'),(182,138,18,'2024-06-23 13:43:34'),(183,139,18,'2024-06-23 13:44:33'),(185,140,18,'2024-06-23 13:45:13'),(186,142,18,'2024-06-23 13:45:55'),(187,142,16,'2024-06-23 13:46:08'),(188,140,16,'2024-06-23 13:46:18'),(189,133,18,'2024-06-23 13:49:23'),(190,131,18,'2024-06-23 13:49:24'),(191,135,18,'2024-06-23 13:49:24');
/*!40000 ALTER TABLE `likepost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `postId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `visibilityId` int DEFAULT NULL,
  `title` text COLLATE utf8mb3_swedish_ci,
  `newContent` text COLLATE utf8mb3_swedish_ci,
  `oldContent` text COLLATE utf8mb3_swedish_ci,
  `createdAt` date DEFAULT NULL,
  PRIMARY KEY (`postId`),
  KEY `FK_visibilityId_idx` (`visibilityId`),
  KEY `FK_profileId1_idx` (`userId`),
  CONSTRAINT `FK_profileId1` FOREIGN KEY (`userId`) REFERENCES `profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_visibilityId1` FOREIGN KEY (`visibilityId`) REFERENCES `visibility` (`visibilityId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (74,10,0,'Bài viết công khai số 1 của Người dùng 1','Bài viết công khai số 1 của Người dùng 1','Bài viết công khai số 1 của Người dùng 1','2024-06-23'),(75,10,0,'Bài viết công khai số 2 của Người dùng 1','Bài viết công khai số 2 của Người dùng 1','Bài viết công khai số 2 của Người dùng 1','2024-06-23'),(76,10,0,'Bài viết công khai số 3 của Người dùng 1','Bài viết công khai số 3 của Người dùng 1','Bài viết công khai số 3 của Người dùng 1','2024-06-23'),(77,10,1,'Bài viết dành cho Người theo dõi số 1 của Người dùng 1','Bài viết dành cho Người theo dõi số 1 của Người dùng 1','Bài viết dành cho Người theo dõi số 1 của Người dùng 1','2024-06-23'),(78,10,1,'Bài viết dành cho Người theo dõi số 2 của Người dùng 1','Bài viết dành cho Người theo dõi số 2 của Người dùng 1','Bài viết dành cho Người theo dõi số 2 của Người dùng 1','2024-06-23'),(79,10,0,'Bài viết công khai số 4 của Người dùng 1','Bài viết công khai số 4 của Người dùng 1','Bài viết công khai số 4 của Người dùng 1','2024-06-23'),(80,10,0,'Bài viết công khai số 5 của Người dùng 1','Bài viết công khai số 5 của Người dùng 1','Bài viết công khai số 5 của Người dùng 1','2024-06-23'),(81,10,1,'Bài viết dành cho Người theo dõi số 3 của Người dùng 1','Bài viết dành cho Người theo dõi số 3 của Người dùng 1','Bài viết dành cho Người theo dõi số 3 của Người dùng 1','2024-06-23'),(82,10,1,'Bài viết dành cho Người theo dõi số 4 của Người dùng 1','Bài viết dành cho Người theo dõi số 4 của Người dùng 1','Bài viết dành cho Người theo dõi số 4 của Người dùng 1','2024-06-23'),(83,10,2,'Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 1','Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 1','Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 1','2024-06-23'),(84,10,2,'Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 1','Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 1','Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 1','2024-06-23'),(85,10,0,'Bài viết dành cho Chỉ mình tôi số 3 của Người dùng 1','Bài viết dành cho Chỉ mình tôi số 3 của Người dùng 1','Bài viết dành cho Chỉ mình tôi số 3 của Người dùng 1','2024-06-23'),(86,11,1,'Bài viết dành cho Người theo dõi số 1 của Người dùng 2','Bài viết dành cho Người theo dõi số 1 của Người dùng 2','Bài viết dành cho Người theo dõi số 1 của Người dùng 2','2024-06-23'),(87,11,1,'Bài viết dành cho Người theo dõi số 2 của Người dùng 2','Bài viết dành cho Người theo dõi số 2 của Người dùng 2','Bài viết dành cho Người theo dõi số 2 của Người dùng 2','2024-06-23'),(88,11,1,'Bài viết dành cho Người theo dõi số 3 của Người dùng 2','Bài viết dành cho Người theo dõi số 3 của Người dùng 2','Bài viết dành cho Người theo dõi số 3 của Người dùng 2','2024-06-23'),(89,11,0,'Bài viết công khai số 1 của Người dùng 2','Bài viết công khai số 1 của Người dùng 2','Bài viết công khai số 1 của Người dùng 2','2024-06-23'),(90,11,0,'Bài viết công khai số 2 của Người dùng 2','Bài viết công khai số 2 của Người dùng 2','Bài viết công khai số 2 của Người dùng 2','2024-06-23'),(91,11,0,'Bài viết công khai số 3 của Người dùng 2','Bài viết công khai số 3 của Người dùng 2','Bài viết công khai số 3 của Người dùng 2','2024-06-23'),(92,11,2,'Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 2','Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 2','Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 2','2024-06-23'),(93,11,2,'Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 2','Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 2','Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 2','2024-06-23'),(94,11,0,'Bài viết dành cho Công khai số 4 của Người dùng 2','Bài viết dành cho Chỉ mình tôi số 3 của Người dùng 2','Bài viết dành cho Chỉ mình tôi số 3 của Người dùng 2','2024-06-23'),(95,12,2,'Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 3','Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 3','Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 3','2024-06-23'),(96,12,2,'Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 3','Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 3','Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 3','2024-06-23'),(97,12,2,'Bài viết dành cho Chỉ mình tôi số 3 của Người dùng 3','Bài viết dành cho Chỉ mình tôi số 3 của Người dùng 3','Bài viết dành cho Chỉ mình tôi số 3 của Người dùng 3','2024-06-23'),(98,12,0,'Bài viết công khai số 1 của Người dùng 3','Bài viết công khai số 1 của Người dùng 3','Bài viết công khai số 1 của Người dùng 3','2024-06-23'),(99,12,0,'Bài viết công khai số 2 của Người dùng 3','Bài viết công khai số 2 của Người dùng 3','Bài viết công khai số 2 của Người dùng 3','2024-06-23'),(100,12,0,'Bài viết công khai số 3 của Người dùng 3','Bài viết công khai số 3 của Người dùng 3','Bài viết công khai số 3 của Người dùng 3','2024-06-23'),(101,12,0,'Bài viết công khai số 4 của Người dùng 3','Bài viết công khai số 4 của Người dùng 3','Bài viết công khai số 4 của Người dùng 3','2024-06-23'),(102,12,1,'Bài viết dành cho Người theo dõi số 1 của Người dùng 3','Bài viết dành cho Người theo dõi số 1 của Người dùng 3','Bài viết dành cho Người theo dõi số 1 của Người dùng 3','2024-06-23'),(103,12,1,'Bài viết dành cho Người theo dõi số 2 của Người dùng 3','Bài viết dành cho Người theo dõi số 2 của Người dùng 3','Bài viết dành cho Người theo dõi số 2 của Người dùng 3','2024-06-23'),(104,13,0,'Bài viết công khai số 1 của Người dùng 4','Bài viết công khai số 1 của Người dùng 4','Bài viết công khai số 1 của Người dùng 4','2024-06-23'),(105,13,1,'Bài viết dành cho Người theo dõi số 1 của Người dùng 4','Bài viết dành cho Người theo dõi số 1 của Người dùng 4','Bài viết dành cho Người theo dõi số 1 của Người dùng 4','2024-06-23'),(106,13,2,'Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 4','Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 4','Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 4','2024-06-23'),(107,13,0,'Bài viết công khai số 2 của Người dùng 4','Bài viết công khai số 2 của Người dùng 4','Bài viết công khai số 2 của Người dùng 4','2024-06-23'),(108,13,1,'Bài viết dành cho Người theo dõi số 2 của Người dùng 4','Bài viết dành cho Người theo dõi số 2 của Người dùng 4 ','Bài viết dành cho Người theo dõi số 2 của Người dùng 4 ','2024-06-23'),(109,13,2,'Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 4','Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 4','Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 4','2024-06-23'),(110,13,0,'Bài viết công khai số 3 của Người dùng 4','Bài viết công khai số 3 của Người dùng 4','Bài viết công khai số 3 của Người dùng 4','2024-06-23'),(111,13,1,'Bài viết dành cho Người theo dõi số 3 của Người dùng 4','Bài viết dành cho Người theo dõi số 3 của Người dùng 4','Bài viết dành cho Người theo dõi số 3 của Người dùng 4','2024-06-23'),(112,13,2,'Bài viết dành cho Chỉ mình tôi số 3 của Người dùng 4','Bài viết dành cho Chỉ mình tôi số 3 của Người dùng 4','Bài viết dành cho Chỉ mình tôi số 3 của Người dùng 4','2024-06-23'),(113,13,0,'Bài viết công khai số 4 của Người dùng 4','Bài viết công khai số 4 của Người dùng 4','Bài viết công khai số 4 của Người dùng 4','2024-06-23'),(114,13,1,'Bài viết dành cho Người theo dõi số 4 của Người dùng 4','Bài viết dành cho Người theo dõi số 4 của Người dùng 4','Bài viết dành cho Người theo dõi số 4 của Người dùng 4','2024-06-23'),(115,13,2,'Bài viết dành cho Chỉ mình tôi số 4 của Người dùng 4','Bài viết dành cho Chỉ mình tôi số 4 của Người dùng 4','Bài viết dành cho Chỉ mình tôi số 4 của Người dùng 4','2024-06-23'),(116,14,0,'Bài viết công khai số 1 của Người dùng 5','Bài viết công khai số 1 của Người dùng 5','Bài viết công khai số 1 của Người dùng 5','2024-06-23'),(117,14,1,'Bài viết dành cho Người theo dõi số 1 của Người dùng 5','Bài viết dành cho Người theo dõi số 1 của Người dùng 5','Bài viết dành cho Người theo dõi số 1 của Người dùng 5','2024-06-23'),(118,14,2,'Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 5','Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 5','Bài viết dành cho Chỉ mình tôi số 1 của Người dùng 5','2024-06-23'),(119,14,0,'Bài viết công khai số 2 của Người dùng 5','Bài viết công khai số 2 của Người dùng 5','Bài viết công khai số 2 của Người dùng 5','2024-06-23'),(120,14,0,'Bài viết công khai số 3 của Người dùng 5','Bài viết công khai số 3 của Người dùng 5','Bài viết công khai số 3 của Người dùng 5','2024-06-23'),(121,14,1,'Bài viết dành cho Người theo dõi số 2 của Người dùng 5','Bài viết dành cho Người theo dõi số 2 của Người dùng 5','Bài viết dành cho Người theo dõi số 2 của Người dùng 5','2024-06-23'),(122,14,1,'Bài viết dành cho Người theo dõi số 3 của Người dùng 5','Bài viết dành cho Người theo dõi số 3 của Người dùng 5','Bài viết dành cho Người theo dõi số 3 của Người dùng 5','2024-06-23'),(123,14,2,'Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 5','Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 5','Bài viết dành cho Chỉ mình tôi số 2 của Người dùng 5','2024-06-23'),(124,15,0,'Bài viết công khai số 1 của Người dùng 6','Bài viết công khai số 1 của Người dùng 6','Bài viết công khai số 1 của Người dùng 6','2024-06-23'),(125,15,0,'Bài viết công khai số 2 của Người dùng 6','Bài viết công khai số 2 của Người dùng 6','Bài viết công khai số 2 của Người dùng 6','2024-06-23'),(126,15,0,'Bài viết công khai số 3 của Người dùng 6','Bài viết công khai số 3 của Người dùng 6','Bài viết công khai số 3 của Người dùng 6','2024-06-23'),(127,15,0,'Bài viết công khai số 4 của Người dùng 6','Bài viết công khai số 4 của Người dùng 6','Bài viết công khai số 4 của Người dùng 6','2024-06-23'),(128,15,0,'Bài viết công khai số 5 của Người dùng 6','Bài viết công khai số 5 của Người dùng 6','Bài viết công khai số 5 của Người dùng 6','2024-06-23'),(129,15,0,'Bài viết công khai số 6 của Người dùng 6','Bài viết công khai số 6 của Người dùng 6','Bài viết công khai số 6 của Người dùng 6','2024-06-23'),(130,15,0,'Bài viết công khai số 7 của Người dùng 7','Bài viết công khai số 7 của Người dùng 7','Bài viết công khai số 7 của Người dùng 7','2024-06-23'),(131,16,1,'Bài viết dành cho Người theo dõi số 1 của Người dùng 7','Bài viết dành cho Người theo dõi số 1 của Người dùng 7','Bài viết dành cho Người theo dõi số 1 của Người dùng 7','2024-06-23'),(132,16,1,'Bài viết dành cho Người theo dõi số 2 của Người dùng 7','Bài viết dành cho Người theo dõi số 2 của Người dùng 7','Bài viết dành cho Người theo dõi số 2 của Người dùng 7','2024-06-23'),(133,16,0,'Bài viết dành cho Người theo dõi số 3 của Người dùng 7','Bài viết dành cho Người theo dõi số 3 của Người dùng 7','Bài viết dành cho Người theo dõi số 3 của Người dùng 7','2024-06-23'),(134,16,0,'Bài viết dành cho Người theo dõi số 4 của Người dùng 7','Bài viết dành cho Người theo dõi số 4 của Người dùng 7.','Bài viết dành cho Người theo dõi số 4 của Người dùng 7.','2024-06-23'),(135,16,1,'Bài viết dành cho Người theo dõi số 5 của Người dùng 7','Bài viết dành cho Người theo dõi số  của Người dùng 7','Bài viết dành cho Người theo dõi số  của Người dùng 7','2024-06-23'),(136,16,1,'Bài viết dành cho Người theo dõi số 7 của Người dùng 7','Bài viết dành cho Người theo dõi số 7 của Người dùng 7','Bài viết dành cho Người theo dõi số 7 của Người dùng 7','2024-06-23'),(137,16,1,'Bài viết dành cho Người theo dõi số 8 của Người dùng 7','Bài viết dành cho Người theo dõi số 8 của Người dùng 7','Bài viết dành cho Người theo dõi số 8 của Người dùng 7','2024-06-23'),(138,16,0,'Bài viết công khai số 1 của Người dùng 7','Bài viết công khai số 1 của Người dùng 7','Bài viết công khai số 1 của Người dùng 7','2024-06-23'),(139,16,0,'Bài viết công khai số 2 của Người dùng 7','Bài viết công khai số 2 của Người dùng 7','Bài viết công khai số 2 của Người dùng 7','2024-06-23'),(140,18,0,'Bài viết chế độ công ','link github: <a href=\"https://github.com/nghiaphunng/Study-With-N-Project/tree/main\" target=\"_blank\">https://github.com/nghiaphunng/Study-With-N-Project/tree/main</a>','link github: https://github.com/nghiaphunng/Study-With-N-Project/tree/main','2024-06-23'),(141,18,2,'Chế độ bài viết chỉ mình tôi','Chế độ bài viết chỉ mình tôi','Chế độ bài viết chỉ mình tôi','2024-06-23'),(142,18,2,'Chế độ dành cho người theo dõi','Chế độ dành cho người theo dõi (đã chỉnh sửa nội dung)<br>Chỉnh sửa chế độ chỉ mình tôi','Chế độ dành cho người theo dõi (đã chỉnh sửa nội dung) Chỉnh sửa chế độ chỉ mình tôi','2024-06-23');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `profileId` int NOT NULL,
  `fullName` varchar(45) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `avatarURL` varchar(100) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  PRIMARY KEY (`profileId`),
  CONSTRAINT `FK_profileId_userId` FOREIGN KEY (`profileId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Phùng Duy Nghĩa','2004-05-13',0,'View/User/avatar/img/img_avatar_0.png','2024-03-12'),(10,'Người dùng 1','2004-01-01',0,'View/User/avatar/img/img_avatar_0.png','2024-06-23'),(11,'Người dùng 2','2004-02-02',1,'View/User/avatar/img/img_avatar_1.png','2024-06-23'),(12,'Người dùng 3','2004-03-03',0,'View/User/avatar/img/img_avatar_0.png','2024-06-23'),(13,'Người dùng 4','2004-04-04',0,'View/User/avatar/img/img_avatar_0.png','2024-06-23'),(14,'Người dùng 5','2004-05-05',1,'View/User/avatar/img/img_avatar_1.png','2024-06-23'),(15,'Người dùng 6','2004-06-06',0,'View/User/avatar/img/img_avatar_0.png','2024-06-23'),(16,'Người dùng 7','2004-07-07',0,'View/User/avatar/img/img_avatar_0.png','2024-06-23'),(18,'Người dùng 8','2004-08-08',0,'View/User/avatar/img/conan.jpg','2024-06-23');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `userEmail` varchar(45) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `userPassWord` varchar(45) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  `userCategoryId` int NOT NULL,
  `userMoney` int DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin135z','admin@gmail.com','123456788',1,10000),(10,'user1','user1@gmail.com','123456788',2,10),(11,'user2','user2@gmail.com','123456788',2,10),(12,'user3','user3@gmail.com','123456788',2,10),(13,'user4','user4@gmail.com','123456788',2,10),(14,'user5','user5@gmail.com','123456788',2,10),(15,'user6','user6@gmail.com','123456788',2,10),(16,'user7','user7@gmail.com','123456788',2,10),(18,'user8','user8@gmail.com','123456788',2,10);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visibility`
--

DROP TABLE IF EXISTS `visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visibility` (
  `visibilityId` int NOT NULL AUTO_INCREMENT,
  `visibilityName` varchar(45) COLLATE utf8mb3_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`visibilityId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visibility`
--

LOCK TABLES `visibility` WRITE;
/*!40000 ALTER TABLE `visibility` DISABLE KEYS */;
INSERT INTO `visibility` VALUES (0,'public'),(1,'follower'),(2,'private');
/*!40000 ALTER TABLE `visibility` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-23 16:33:32
