-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: healthtracker
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `daily_activity`
--

DROP TABLE IF EXISTS `daily_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_activity` (
  `Activity_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `Activity_Name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Start_Time` datetime DEFAULT NULL,
  `End_Time` datetime DEFAULT NULL,
  `Calories_Burned` float DEFAULT NULL,
  `Activity_Date` date DEFAULT NULL,
  PRIMARY KEY (`Activity_ID`),
  KEY `idx_activity_user` (`User_ID`),
  CONSTRAINT `fk_activity_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_activity`
--

LOCK TABLES `daily_activity` WRITE;
/*!40000 ALTER TABLE `daily_activity` DISABLE KEYS */;
INSERT INTO `daily_activity` VALUES (6,1,'Đá bóng','2025-12-25 08:00:00','2025-12-25 10:00:00',800,'2025-12-25'),(7,1,'Bowling','2025-12-25 16:00:00','2025-12-25 17:00:00',550,'2025-12-25');
/*!40000 ALTER TABLE `daily_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_summary`
--

DROP TABLE IF EXISTS `daily_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_summary` (
  `Summary_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `Total_Activity_Time` float DEFAULT NULL,
  `Total_Rest_Time` float DEFAULT NULL,
  `Calories_Consumed` float DEFAULT NULL,
  `Calories_Burned` float DEFAULT NULL,
  `Total_Sugar` float DEFAULT NULL,
  `Total_Protein` float DEFAULT NULL,
  `Total_Fat` float DEFAULT NULL,
  `Total_Fiber` float DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  `Notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Summary_Date` date DEFAULT NULL,
  PRIMARY KEY (`Summary_ID`),
  KEY `idx_summary_user` (`User_ID`),
  CONSTRAINT `fk_summary_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_summary`
--

LOCK TABLES `daily_summary` WRITE;
/*!40000 ALTER TABLE `daily_summary` DISABLE KEYS */;
INSERT INTO `daily_summary` VALUES (6,1,180,450,1280,1350,9,40,21,16,4.16667,NULL,'2025-12-25');
/*!40000 ALTER TABLE `daily_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_indicators`
--

DROP TABLE IF EXISTS `health_indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_indicators` (
  `Indicator_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `Height` float DEFAULT NULL,
  `Weight` float DEFAULT NULL,
  `Blood_Pressure` float DEFAULT NULL,
  `Heart_Rate` float DEFAULT NULL,
  `BMI` float DEFAULT NULL,
  `Health_Status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Indicator_ID`),
  KEY `idx_indicator_user` (`User_ID`),
  CONSTRAINT `fk_indicator_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_indicators`
--

LOCK TABLES `health_indicators` WRITE;
/*!40000 ALTER TABLE `health_indicators` DISABLE KEYS */;
INSERT INTO `health_indicators` VALUES (1,1,1.75,68.5,120.5,72,22.37,'Updated via Dashboard'),(5,3,1.75,NULL,NULL,NULL,0,'Updated via Dashboard');
/*!40000 ALTER TABLE `health_indicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal` (
  `Meal_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `Dish_Name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Meal_Type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Protein` float DEFAULT NULL,
  `Fat` float DEFAULT NULL,
  `Fiber` float DEFAULT NULL,
  `Sugar` float DEFAULT NULL,
  `Calories` float DEFAULT NULL,
  `Meal_Date` date DEFAULT NULL,
  PRIMARY KEY (`Meal_ID`),
  KEY `idx_meal_user` (`User_ID`),
  CONSTRAINT `fk_meal_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (6,1,'Bánh cuốn','Bữa sáng',15,3,5,2,500,'2025-12-25'),(7,1,'Cơm tấm','Bữa trưa',25,18,11,7,780,'2025-12-25');
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_record`
--

DROP TABLE IF EXISTS `medical_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_record` (
  `Record_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `Disease_Name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Disease_Type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Severity` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Diagnosis_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Record_ID`),
  KEY `idx_medical_user` (`User_ID`),
  CONSTRAINT `fk_medical_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_record`
--

LOCK TABLES `medical_record` WRITE;
/*!40000 ALTER TABLE `medical_record` DISABLE KEYS */;
INSERT INTO `medical_record` VALUES (1,1,'Viêm họng cấp','Hô hấp','Nhẹ','Đã khỏi','2024-01-15','2024-01-25','Điều trị bằng kháng sinh 7 ngày'),(2,1,'Cảm cúm thông thường','Virus','Trung bình','Đã khỏi','2024-03-10','2024-03-20','Sốt cao 3 ngày đầu'),(3,1,'Đau dạ dày','Tiêu hóa','Nhẹ','Đang điều trị','2024-05-01',NULL,'Trào ngược nhẹ, cần hạn chế cay nóng'),(4,1,'Viêm xoang','Hô hấp mãn tính','Nhẹ','Theo dõi','2023-11-20',NULL,'Tái phát khi thời tiết thay đổi');
/*!40000 ALTER TABLE `medical_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleep`
--

DROP TABLE IF EXISTS `sleep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleep` (
  `Sleep_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `Sleep_Time` datetime DEFAULT NULL,
  `Wake_Time` datetime DEFAULT NULL,
  `Sleep_Type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sleep_Quality` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sleep_Date` date DEFAULT NULL,
  PRIMARY KEY (`Sleep_ID`),
  KEY `idx_sleep_user` (`User_ID`),
  CONSTRAINT `fk_sleep_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleep`
--

LOCK TABLES `sleep` WRITE;
/*!40000 ALTER TABLE `sleep` DISABLE KEYS */;
INSERT INTO `sleep` VALUES (7,1,'2025-12-25 22:00:00','2025-12-26 05:30:00','Giấc đêm','Tốt','2025-12-25');
/*!40000 ALTER TABLE `sleep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Last_Name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nguyễn Văn','A',22,'Male','user1@gmail.com','123456'),(2,NULL,NULL,NULL,NULL,'user2@gmail.com','123456'),(3,'','',0,'Nam','user3@gmail.com','123456');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-02 22:26:24
