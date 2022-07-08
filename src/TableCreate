-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: movie_reservation_db
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `distribution`
--

DROP TABLE IF EXISTS `distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribution` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `movie_seq` int DEFAULT NULL,
  `male` decimal(2,1) DEFAULT NULL,
  `female` decimal(2,1) DEFAULT NULL,
  `teenager` int DEFAULT NULL,
  `twenty` int DEFAULT NULL,
  `thirty` int DEFAULT NULL,
  `forty` int DEFAULT NULL,
  `fifty` int DEFAULT NULL,
  PRIMARY KEY (`seq`),
  KEY `movie_seq` (`movie_seq`),
  CONSTRAINT `distribution_ibfk_1` FOREIGN KEY (`movie_seq`) REFERENCES `movie` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribution`
--

LOCK TABLES `distribution` WRITE;
/*!40000 ALTER TABLE `distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `city` varchar(15) DEFAULT NULL,
  `city_detail` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `reservation` decimal(5,2) DEFAULT NULL,
  `img` varchar(100) NOT NULL,
  `rdate` varchar(8) NOT NULL,
  `readcount` decimal(8,0) NOT NULL,
  `actor` varchar(100) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `genre` varchar(30) DEFAULT NULL,
  `age_limit` varchar(15) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `movie_description` varchar(2000) DEFAULT NULL,
  `previous_expectations` int DEFAULT NULL,
  `real_review` int DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `movie_seq` int DEFAULT NULL,
  `wdate` timestamp NULL DEFAULT NULL,
  `rdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`seq`),
  KEY `movie_seq` (`movie_seq`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`movie_seq`) REFERENCES `movie` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `wdate` int DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `auth` decimal(1,0) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('test','test','test','test@naver.com','010-1234-1234',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_movie`
--

DROP TABLE IF EXISTS `location_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_movie` (
  `location_seq` int DEFAULT NULL,
  `movie_seq` int DEFAULT NULL,
  `movie_time` timestamp NULL DEFAULT NULL,
  KEY `location_seq` (`location_seq`),
  KEY `movie_seq` (`movie_seq`),
  CONSTRAINT `location_movie_ibfk_1` FOREIGN KEY (`location_seq`) REFERENCES `location` (`seq`),
  CONSTRAINT `location_movie_ibfk_2` FOREIGN KEY (`movie_seq`) REFERENCES `movie` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_movie`
--

LOCK TABLES `location_movie` WRITE;
/*!40000 ALTER TABLE `location_movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_movie` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `user_reservation_location`
--

DROP TABLE IF EXISTS `user_reservation_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_reservation_location` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `reservation_seq` int DEFAULT NULL,
  `location_seq` int DEFAULT NULL,
  PRIMARY KEY (`seq`),
  KEY `user_id` (`user_id`),
  KEY `reservation_seq` (`reservation_seq`),
  KEY `location_seq` (`location_seq`),
  CONSTRAINT `user_reservation_location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_reservation_location_ibfk_2` FOREIGN KEY (`reservation_seq`) REFERENCES `reservation` (`seq`),
  CONSTRAINT `user_reservation_location_ibfk_3` FOREIGN KEY (`location_seq`) REFERENCES `location` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_reservation_location`
--

LOCK TABLES `user_reservation_location` WRITE;
/*!40000 ALTER TABLE `user_reservation_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_reservation_location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-08 11:34:20
