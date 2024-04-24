-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: premier_league
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
-- Table structure for table `stadiums`
--

DROP TABLE IF EXISTS `stadiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadiums` (
  `stadium_id` int NOT NULL AUTO_INCREMENT,
  `team` varchar(50) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `stadium_name` varchar(50) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`stadium_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadiums`
--

LOCK TABLES `stadiums` WRITE;
/*!40000 ALTER TABLE `stadiums` DISABLE KEYS */;
INSERT INTO `stadiums` VALUES (1,'Arsenal','London','Emirates Stadium',60704),(2,'Aston Villa','Birmingham','Villa Park',42640),(3,'Bournemouth','Bournemouth','Vitality Stadium',11307),(4,'Brentford','London','Gtech Community Stadium',17250),(5,'Brighton and Hove Albion','Brighton','Amex Stadium',31876),(6,'Chelsea','London','Stamford Bridge',40343),(7,'Crystal Palace','London','Selhurst Park',25486),(8,'Everton','Liverpool','Goodison Park',39572),(9,'Fulham','London','Craven Cottage',25700),(10,'Leeds United','Leeds','Elland Road',37890),(11,'Leicester City','Leicester','The King Power Stadium',32261),(12,'Liverpool','Liverpool','Anfield',60725),(13,'Manchester City','Manchester','Etihad Stadium',53400),(14,'Manchester United','Manchester','Old Trafford',74310),(15,'Newcastle United','Newcastle','St James\' Park, Newcastle',52350),(16,'Nottingham Forest','Nottingham','The City Ground',30455),(17,'Southampton','Southampton','St. Mary\'s Stadium',32384),(18,'Tottenham Hotspur','London','Tottenham Hotspur Stadium',62850),(19,'West Ham United','London','London Stadium',62500),(20,'Wolverhampton Wanderers','Wolverhampton','Molineux',31750);
/*!40000 ALTER TABLE `stadiums` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-24 13:08:26
