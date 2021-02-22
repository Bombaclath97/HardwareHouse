CREATE DATABASE  IF NOT EXISTS `hardwarehouse` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hardwarehouse`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: hardwarehouse
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `amministratore`
--

DROP TABLE IF EXISTS `amministratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amministratore` (
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `amministratore.email` FOREIGN KEY (`email`) REFERENCES `utente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amministratore`
--

LOCK TABLES `amministratore` WRITE;
/*!40000 ALTER TABLE `amministratore` DISABLE KEYS */;
INSERT INTO `amministratore` VALUES ('m.risi@email.com');
/*!40000 ALTER TABLE `amministratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferiti`
--

DROP TABLE IF EXISTS `preferiti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferiti` (
  `email_utente` varchar(45) NOT NULL,
  `prodotto_preferito` int NOT NULL,
  KEY `preferiti.email_utente_idx` (`email_utente`),
  KEY `preferiti.prodotto_preferito_idx` (`prodotto_preferito`),
  CONSTRAINT `preferiti.email_utente` FOREIGN KEY (`email_utente`) REFERENCES `privato` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `preferiti.prodotto_preferito` FOREIGN KEY (`prodotto_preferito`) REFERENCES `prodotto` (`codice`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferiti`
--

LOCK TABLES `preferiti` WRITE;
/*!40000 ALTER TABLE `preferiti` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferiti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privato`
--

DROP TABLE IF EXISTS `privato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privato` (
  `email` varchar(45) NOT NULL,
  `data_nascita` date NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `privato.email` FOREIGN KEY (`email`) REFERENCES `utente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privato`
--

LOCK TABLES `privato` WRITE;
/*!40000 ALTER TABLE `privato` DISABLE KEYS */;
INSERT INTO `privato` VALUES ('c.lazar@email.com','1996-03-11','Cristiana Elena','Lazar'),('d.didario@email.com','1997-03-07','Dario','Di Dario'),('e.bombardelli@email.com','1997-04-07','Emanuele','Bombardelli'),('g.verlingieri@email.com','1997-05-06','Gianluca','Verlingieri'),('l.dichiara@email.com','1998-03-26','Luca','Di Chiara'),('m.morea@email.com','1997-04-22','Michele','Morea');
/*!40000 ALTER TABLE `privato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descrizione` varchar(256) NOT NULL,
  `img_path` varchar(400) DEFAULT NULL,
  `prezzo` float NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `email_venditore` varchar(45) NOT NULL,
  `email_moderatore` varchar(45) DEFAULT NULL,
  `email_acquirente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codice`),
  KEY `prodotto.email_venditore_idx` (`email_venditore`),
  KEY `prodotto.email_moderatore_idx` (`email_moderatore`),
  KEY `prodotto.email_acquirente_idx` (`email_acquirente`),
  CONSTRAINT `prodotto.email_acquirente` FOREIGN KEY (`email_acquirente`) REFERENCES `privato` (`email`),
  CONSTRAINT `prodotto.email_moderatore` FOREIGN KEY (`email_moderatore`) REFERENCES `amministratore` (`email`),
  CONSTRAINT `prodotto.email_venditore` FOREIGN KEY (`email_venditore`) REFERENCES `privato` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (1,'Asus H81MK','Scheda madre con socket 1150','asus-h81mk',80,'Scheda madre','e.bombardelli@email.com','m.risi@email.com',NULL),(2,'Corsair HX1000','Alimentatore da 1000W','corsair',100,'Alimentatore','g.verlingieri@email.com','m.risi@email.com',NULL),(3,'Crucial Ballistix','Ram da 32GB 3200MHz','crucial-ballistix',150,'RAM','m.morea@email.com','m.risi@email.com',NULL),(4,'GTX 970','Scheda video da 4GB dedicati','gtx-970',90,'Scheda video','g.verlingieri@email.com','m.risi@email.com',NULL),(5,'i5 7600','Processore 4 core 4 thread','i5-7600',110,'CPU','g.verlingieri@email.com','m.risi@email.com',NULL),(6,'i7 4790','Processore 4 core 4 thread','i7-4790',70,'CPU','e.bombardelli@email.com','m.risi@email.com',NULL),(7,'MSI B550','Scheda madre con socket AM4','msi-b550',140,'Scheda madre','m.morea@email.com','m.risi@email.com',NULL),(8,'MSI PC MATE','Scheda madre con socket 1151','msi-pcmate',60,'Scheda madre','g.verlingieri@email.com','m.risi@email.com',NULL),(9,'R9 390x','Scheda video famiglia amd con 8GB dedicati','r9-390x',90,'Scheda video','e.bombardelli@email.com','m.risi@email.com','g.verlingieri@email.com'),(10,'RAM DDR3 CL 18','Ram da 8GB CL18 da 2400Mhz','ram-ddr3',50,'RAM','e.bombardelli@email.com','m.risi@email.com',NULL),(11,'RTX 2060 ','Scheda video da 6GB dedicati con supporto ray tracing','rtx-2060',300,'Scheda video','m.morea@email.com','m.risi@email.com',NULL),(12,'Ryzen 5 3600','Processore 6 core 12 thread con processo produttivo a 7nm','ryzen5-3600',250,'CPU','m.morea@email.com','m.risi@email.com',NULL),(13,'Sharkoon','Alimentatore davvero buono con cavi sleeve integrati','sharkoon',60,'Alimentatore','e.bombardelli@email.com','m.risi@email.com',NULL),(14,'XPG ADATA DDR4','Ram da 16GB 3200MHz','xpg-adataddr4',105,'RAM','g.verlingieri@email.com','m.risi@email.com',NULL),(15,'Kolink Enclave','Alimentatore 700W 80 plus gold','kolink-enclave',90,'Alimentatore','m.morea@email.com','m.risi@email.com',NULL),(16,'YESTON RX 580','Scheda video famiglia AMD piattaforma RX 580 con 4GB di VRAM','YESTON-RX-580-GameAce-3',200,'Scheda video','e.bombardelli@email.com','m.risi@email.com',NULL),(18,'Ryzen 9 5900x','CPU di ultima generazione AMD con socket AM4','3231872-a',600,'CPU','e.bombardelli@email.com','m.risi@email.com',NULL),(20,'AMD RX Vega 56','Scheda video di ultima generazione Vega 56 usata pochissimo con imballo originale','AMD-Radeon-RX-Vega-56_1-png',299.99,'Scheda video','c.lazar@email.com',NULL,NULL),(21,'i9 10900k','Nuovo processore intel serie 10000 overclockabile LGA1200','HBFqdBPsY3NavkV9PJNRZB-1200-80',900,'CPU','d.didario@email.com',NULL,NULL);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `tipo` char(1) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('c.lazar@email.com','1e48b6ccef0792a106efa5d317ae60878cace2c372010a094feb424e3456d36a','p'),('d.didario@email.com','8e75d514c450788b5afe7a026732078809973b5facf94c795f1ab01ed3c1cd97','p'),('e.bombardelli@email.com','1e48b6ccef0792a106efa5d317ae60878cace2c372010a094feb424e3456d36a','p'),('g.verlingieri@email.com','1e48b6ccef0792a106efa5d317ae60878cace2c372010a094feb424e3456d36a','p'),('l.dichiara@email.com','1e48b6ccef0792a106efa5d317ae60878cace2c372010a094feb424e3456d36a','p'),('m.morea@email.com','1e48b6ccef0792a106efa5d317ae60878cace2c372010a094feb424e3456d36a','p'),('m.risi@email.com','1e48b6ccef0792a106efa5d317ae60878cace2c372010a094feb424e3456d36a','a');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-22 14:17:34
