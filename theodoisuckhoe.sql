-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: theodoisuckhoe
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a4dcc1b9-ae9f-11f0-958a-40c2bab4a4da:1-1841';

--
-- Table structure for table `daily_activity`
--

DROP TABLE IF EXISTS `daily_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_activity` (
  `Activity_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `Activity_Name` varchar(100) DEFAULT NULL,
  `Start_Time` datetime DEFAULT NULL,
  `End_Time` datetime DEFAULT NULL,
  `Calories_Burned` float DEFAULT NULL,
  `Activity_Date` date DEFAULT NULL,
  PRIMARY KEY (`Activity_ID`),
  KEY `idx_activity_user` (`User_ID`),
  CONSTRAINT `fk_activity_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_activity`
--

LOCK TABLES `daily_activity` WRITE;
/*!40000 ALTER TABLE `daily_activity` DISABLE KEYS */;
INSERT INTO `daily_activity` VALUES (58,21,'đi bơi','2024-03-25 06:30:00','2024-03-25 07:15:00',800,'2024-05-25'),(59,21,'đi bơi','2024-03-25 06:30:00','2024-03-25 07:15:00',800,'2024-05-25'),(61,24,'Chạy bộ','2024-06-01 06:00:00','2024-06-01 06:45:00',320.5,'2024-06-01'),(62,24,'Bơi lội','2024-06-02 17:30:00','2024-06-02 18:30:00',450,'2024-06-02'),(63,24,'Đạp xe','2024-06-03 07:00:00','2024-06-03 07:50:00',280,'2024-06-03'),(64,24,'Yoga','2024-06-04 18:00:00','2024-06-04 19:00:00',180.5,'2024-06-04'),(65,24,'Đi bộ','2024-06-05 06:30:00','2024-06-05 07:00:00',120,'2024-06-05');
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
  `Notes` varchar(255) DEFAULT NULL,
  `Summary_Date` date DEFAULT NULL,
  PRIMARY KEY (`Summary_ID`),
  KEY `idx_summary_user` (`User_ID`),
  CONSTRAINT `fk_summary_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_summary`
--

LOCK TABLES `daily_summary` WRITE;
/*!40000 ALTER TABLE `daily_summary` DISABLE KEYS */;
INSERT INTO `daily_summary` VALUES (31,21,0,NULL,820,0,4.2,71,24.6,6.4,1.66667,NULL,'2024-03-25'),(32,21,90,495,640,1600,7,71,20.4,10,2.5,NULL,'2024-05-25'),(33,21,NULL,NULL,320,NULL,3.5,35.5,10.2,5,0,NULL,'2025-05-25'),(34,24,1.5,8.5,1850.5,2100,45.2,85.5,65.2,25.5,8,'Ngày năng động, ngủ ngon','2024-06-01'),(35,24,2,8,2100,2300.5,50.5,92,70.8,30.2,8.5,'Tập luyện hiệu quả, ăn uống đủ chất','2024-06-02'),(36,24,1,9,1750,1800,40,75,60.5,22,7.5,'Ngày nghỉ ngơi, ít vận động','2024-06-03'),(37,24,1.75,8.25,1950.5,2000,48.5,88.5,68,28.5,8.2,'Cân bằng giữa làm việc và tập luyện','2024-06-04'),(38,24,2.5,7.5,2200,2500,55,95,75.5,32,8.8,'Ngày hoạt động tích cực, dinh dưỡng tốt','2024-06-05');
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
  `Health_Status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Indicator_ID`),
  KEY `idx_indicator_user` (`User_ID`),
  CONSTRAINT `fk_indicator_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_indicators`
--

LOCK TABLES `health_indicators` WRITE;
/*!40000 ALTER TABLE `health_indicators` DISABLE KEYS */;
INSERT INTO `health_indicators` VALUES (25,21,185.2,80.5,125.5,70,23.5,'Athletic'),(26,21,185.2,80.5,125.5,70,23.5,'Athletic'),(28,24,1.75,68.5,120.5,72,22.4,'Bình thường'),(29,24,1.75,69.2,118,75,22.6,'Bình thường'),(30,24,1.75,67.8,125,68,22.1,'Bình thường'),(31,24,1.75,70,130,80,22.9,'Hơi cao');
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
  `Dish_Name` varchar(100) DEFAULT NULL,
  `Meal_Type` varchar(50) DEFAULT NULL,
  `Protein` float DEFAULT NULL,
  `Fat` float DEFAULT NULL,
  `Fiber` float DEFAULT NULL,
  `Sugar` float DEFAULT NULL,
  `Calories` float DEFAULT NULL,
  `Meal_Date` date DEFAULT NULL,
  PRIMARY KEY (`Meal_ID`),
  KEY `idx_meal_user` (`User_ID`),
  CONSTRAINT `fk_meal_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (41,21,'Grilled Chicken Salad','Lunch',35.5,10.2,5,3.5,320,'2025-05-25'),(43,21,'Grilled Chicken Salad','Lunch',35.5,10.2,5,3.5,320,'2024-05-25'),(44,21,'Grilled Chicken Salad','Lunch',35.5,10.2,5,3.5,320,'2024-05-25'),(45,24,'Cơm gà xối mỡ','Trưa',35.5,15.2,3.5,2.1,450,'2024-06-01'),(46,24,'Bánh mì trứng','Sáng',18,12.5,2,5.5,320,'2024-06-02'),(47,24,'Cá hồi áp chảo + rau củ','Tối',40.2,20.5,8.5,3.2,480.5,'2024-06-02'),(48,24,'Sữa chua + hạt dinh dưỡng','Phụ',12.5,8,5.5,10.2,180,'2024-06-03'),(49,24,'Phở bò','Trưa',30,18.5,4,3.5,420,'2024-06-04');
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
  `Disease_Name` varchar(100) DEFAULT NULL,
  `Disease_Type` varchar(100) DEFAULT NULL,
  `Severity` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Diagnosis_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Record_ID`),
  KEY `idx_medical_user` (`User_ID`),
  CONSTRAINT `fk_medical_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_record`
--

LOCK TABLES `medical_record` WRITE;
/*!40000 ALTER TABLE `medical_record` DISABLE KEYS */;
INSERT INTO `medical_record` VALUES (22,21,'Migraine','Neurological','Moderate','Under Treatment','2024-03-25',NULL,'Chronic migraine, prescribed preventive medication'),(24,21,'tieu duong','Neurological','Moderate','Under Treatment','2024-03-25',NULL,'Chronic migraine, prescribed preventive medication'),(25,24,'Viêm họng cấp','Hô hấp','Nhẹ','Đã khỏi','2024-01-15','2024-01-25','Điều trị bằng kháng sinh 7 ngày'),(26,24,'Cảm cúm thông thường','Virus','Trung bình','Đã khỏi','2024-03-10','2024-03-20','Sốt cao 3 ngày đầu'),(27,24,'Đau dạ dày','Tiêu hóa','Nhẹ','Đang điều trị','2024-05-01',NULL,'Trào ngược nhẹ, cần hạn chế cay nóng'),(28,24,'Viêm xoang','Hô hấp mãn tính','Nhẹ','Theo dõi','2023-11-20',NULL,'Tái phát khi thời tiết thay đổi');
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
  `Sleep_Type` varchar(50) DEFAULT NULL,
  `Sleep_Quality` varchar(50) DEFAULT NULL,
  `Sleep_Date` date DEFAULT NULL,
  PRIMARY KEY (`Sleep_ID`),
  KEY `idx_sleep_user` (`User_ID`),
  CONSTRAINT `fk_sleep_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleep`
--

LOCK TABLES `sleep` WRITE;
/*!40000 ALTER TABLE `sleep` DISABLE KEYS */;
INSERT INTO `sleep` VALUES (31,21,'2025-12-28 22:30:00','2025-12-29 06:45:00','Night Sleep','Good','2024-05-25'),(33,24,'2024-06-01 22:30:00','2024-06-02 05:45:00','Sâu','Tốt','2024-06-02'),(34,24,'2024-06-02 23:15:00','2024-06-03 06:00:00','Bình thường','Khá','2024-06-03'),(35,24,'2024-06-03 22:00:00','2024-06-04 05:30:00','Sâu','Rất tốt','2024-06-04'),(36,24,'2024-06-04 00:30:00','2024-06-05 06:15:00','Nông','Trung bình','2024-06-05'),(37,24,'2024-06-05 22:45:00','2024-06-06 05:50:00','Bình thường','Khá','2024-06-06');
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
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (21,'Nguyễn','Văn Anh',35,'Nam'),(24,'Minh','Nguyễn',28,'Nam');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 19:28:57
