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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (27,NULL,3,2,'xin chào mọi người nha','2024-06-13 00:00:00');
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
  KEY `FK_follower_profileId_idx` (`follower`),
  KEY `FK_following_profileId_idx` (`following`),
  CONSTRAINT `FK_follower_profileId` FOREIGN KEY (`follower`) REFERENCES `profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_following_profileId` FOREIGN KEY (`following`) REFERENCES `profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (1,2,3),(2,2,4),(3,2,5),(4,2,6),(5,2,7),(6,3,2),(7,4,5),(8,5,6),(9,3,4);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like` (
  `likeId` int NOT NULL AUTO_INCREMENT,
  `postId` int NOT NULL,
  `userId` int NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`likeId`),
  KEY `fk_userId_like_idx` (`userId`),
  KEY `fk_postId_like_idx` (`postId`),
  CONSTRAINT `fk_postId_like` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userId_like` FOREIGN KEY (`userId`) REFERENCES `profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (40,2,0,'test 1 test 1','test 1 okela 1','test 1 okela 1','2024-06-04'),(42,2,0,'test 3','test 3','test 3','2024-06-01'),(43,2,0,'test 4 okela','test 4 oknha','test 4 oknha','2024-06-04'),(44,2,1,'test 5','test 5 nè nè nữa nè','test 5 nè nè nữa nè','2024-06-04'),(48,2,2,'test 6 ','test 6 ','test 6 ','2024-06-04'),(49,2,2,'test 7','test 7','test 7','2024-06-04'),(50,2,2,'test 8','test 8','test 8','2024-06-04'),(51,2,2,'test 9','test 9','test 9','2024-06-04'),(52,2,2,'test 10','test 10','test 10','2024-06-04'),(53,2,0,'test 11','test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa âffffffffffffffffffffffffffffasfasfasf<br><br><br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br><br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa<br>test 11 đã sửa đã sửa','test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa âffffffffffffffffffffffffffffasfasfasf   test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa  test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa test 11 đã sửa đã sửa','2024-06-13'),(56,2,1,'test 14','test 14','test 14','2024-06-05'),(57,2,2,'test 15','test 15','test 15','2024-06-04'),(58,2,0,'test 16','test 16 đã sửa','test 16 đã sửa','2024-06-05');
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
INSERT INTO `profile` VALUES (1,'Phùng Duy Nghĩa','2004-05-13',0,'img_avatar_0.png','2024-03-12'),(2,'Phùng Duy Nghĩa','2004-05-13',0,'View/User/avatar/img/st.jpg','2024-03-12'),(3,'Phùng Duy Nghĩa','2004-05-13',0,'View/User/avatar/img/thuvien.jpg','2024-03-12'),(4,'Phùng Duy Nghĩa','2004-05-13',0,'img_avatar_0.png','2024-03-12'),(5,'userrandom3','2004-05-13',0,'img_avatar_0.png','2024-06-05'),(6,'user4','2004-05-13',1,'img_avatar_1.png','2024-06-05'),(7,'user5','2004-05-13',0,'img_avatar_0.png','2024-06-05'),(8,'user6','2004-05-13',0,'img_avatar_0.png','2024-06-05');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin135z','duynghia135z@gmail.com','123456788',1,10000),(2,'duynghia135z','nghiaphung18z@gmail.com','123456788',2,10),(3,'userrandom1','userrandom1@gmail.com','123456',2,10),(4,'userrandom2','userrandom2@gmail.com','123456',2,10),(5,'userrandom3','user3@gmail.com','123456',2,10),(6,'userrandom4','user4@gmail.com','123456',2,10),(7,'userrandom5','user5@gmail.com','123456',2,10),(8,'userrandom6','user6@gmail.com','123456',2,10);
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

-- Dump completed on 2024-06-21 12:04:51
