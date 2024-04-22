-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: entities
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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Aquiles','Montero','(20) 842-0214','Valencia'),(2,'Sebastián','Lorenzo','(51) 551-1317','Valencia'),(3,'Jaime','Domínguez','(18) 651-3563','Valencia'),(4,'Marcelino','Gallego','(41) 037-4720','Alicante'),(5,'Julia','Herrero','(94) 418-7636','Barcelona'),(6,'Jaime','Benítez','(52) 007-0274','Valencia'),(7,'Encarnación','Sanz','(47) 543-7958','Alicante'),(8,'Óscar','Suárez','(59) 997-8655','Valencia'),(9,'Jacobo','Iglesias','(36) 223-1455','Alicante'),(10,'Urbano','Gil','(28) 891-1127','Valencia'),(11,'Virgilio','Sáez','(83) 970-1621','Malaga'),(12,'Rosalia','García','(19) 833-0540','Malaga'),(13,'Clara','Santiago','(80) 117-2991','Alicante'),(14,'Leoncio','Moreno','(67) 406-1526','Valencia'),(15,'Mercedes','Torres','(31) 992-1660','Alicante'),(16,'Benito','Ibá?ez','(56) 060-5288','Malaga'),(17,'Celso','Santana','(89) 777-6529','Barcelona'),(18,'Efrén','Sanz','(35) 418-4564','Valencia'),(19,'Guzmán','Vega','(30) 354-3448','Alicante'),(20,'Oscar','Velasco','(97) 211-4254','Valencia');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-22  9:38:49
