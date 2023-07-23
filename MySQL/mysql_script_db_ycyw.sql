CREATE DATABASE  IF NOT EXISTS `db_ycyw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_ycyw`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_ycyw
-- Author : T.VELOSO
-- Company name : Your Car Your Way
-- Date : 22/07/2023
-- ------------------------------------------------------
-- Server version	8.0.32

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

-- -----------------------------------------------------
-- Table structure for table `adresse`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresse` (
  `id_adresse` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(10) DEFAULT NULL,
  `rue` varchar(100) DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `pays` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `adresse`
-- -----------------------------------------------------

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table structure for table `agence`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agence` (
  `id_agence` int NOT NULL AUTO_INCREMENT,
  `nom_agence` varchar(100) DEFAULT NULL,
  `id_adresse` int NOT NULL,
  PRIMARY KEY (`id_agence`,`id_adresse`),
  KEY `id_adresse_idx` (`id_adresse`),
  CONSTRAINT `FK_agence_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `agence`
-- -----------------------------------------------------

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table structure for table `carburant`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `carburant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carburant` (
  `id_carburant` int NOT NULL AUTO_INCREMENT,
  `nom_carburant` varchar(50) DEFAULT NULL,
  `desc_carburant` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_carburant`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `carburant`
-- -----------------------------------------------------

LOCK TABLES `carburant` WRITE;
/*!40000 ALTER TABLE `carburant` DISABLE KEYS */;
INSERT INTO `carburant` VALUES (1,'R','Carburant non spécifié avec air climatisé'),(2,'N','Carburant non spécifié sans air climatisé'),(3,'D','Diesel avec air climatisé'),(4,'Q','Diesel sans air climatisé'),(5,'H','Véhicule hybride avec air climatisé'),(6,'I','Véhicule hybride Plug in air climatisé'),(7,'E','Véhicule électrique'),(8,'C','Véhicule électrique'),(9,'L','Véhicule GPL avec air climatisé'),(10,'S','Véhicule GPL sans air climatisé'),(11,'A','Véhicule à hydrogène avec air climatisé'),(12,'B','Véhicule à hydrogène sans air climatisé'),(13,'M','Carburant multiple avec air climatisé'),(14,'F','Carburant multiple sans air climatisé'),(15,'V','Véhicule essence avec air climatisé'),(16,'Z','Véhicule essence sans air climatisé'),(17,'U','Véhicule éthanol avec air climatisé'),(18,'X','Véhicule éthanlo sans air climatisé');
/*!40000 ALTER TABLE `carburant` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table structure for table `categorie`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(50) DEFAULT NULL,
  `desc_categorie` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `categorie`
-- -----------------------------------------------------

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'M','Mini'),(2,'N','Mini Elite'),(3,'E','Economique'),(4,'H','Economique Elite'),(5,'C','Compacte'),(6,'D','Compacte Elite'),(7,'I','Intermédiaire'),(8,'J','Intermédiaire Elite'),(9,'S','Routière'),(10,'R','Routière Elite'),(11,'F','Grande Routière'),(12,'G','Grande Routière Elite'),(13,'P','Berline Premium'),(14,'U','Berline Premimum Elite'),(15,'L','Luxe'),(16,'W','Luxe Elite'),(17,'O','Très Grand Gabarit'),(18,'X','Spéciale');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table structure for table `classe_vehicule`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `classe_vehicule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classe_vehicule` (
  `id_categorie` int NOT NULL,
  `id_type` int NOT NULL,
  `id_transmission` int NOT NULL,
  `id_carburant` int NOT NULL,
  `id_agence` int NOT NULL,
  `tarif_journalier` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`,`id_type`,`id_transmission`,`id_carburant`,`id_agence`),
  KEY `FK_categorie_idx` (`id_categorie`),
  KEY `FK_type_idx` (`id_type`),
  KEY `FK_transmission_idx` (`id_transmission`),
  KEY `FK_carburant_idx` (`id_carburant`),
  KEY `FK_agence_idx` (`id_agence`) /*!80000 INVISIBLE */,
  CONSTRAINT `FK_agence_CV` FOREIGN KEY (`id_agence`) REFERENCES `agence` (`id_agence`),
  CONSTRAINT `FK_carburant_CV` FOREIGN KEY (`id_carburant`) REFERENCES `carburant` (`id_carburant`),
  CONSTRAINT `FK_categorie_CV` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`),
  CONSTRAINT `FK_transmission_CV` FOREIGN KEY (`id_transmission`) REFERENCES `transmission` (`id_transmission`),
  CONSTRAINT `FK_type_CV` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `classe_vehicule`
-- -----------------------------------------------------

LOCK TABLES `classe_vehicule` WRITE;
/*!40000 ALTER TABLE `classe_vehicule` DISABLE KEYS */;
/*!40000 ALTER TABLE `classe_vehicule` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table structure for table `message`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id_message` int NOT NULL AUTO_INCREMENT,
  `date_message` datetime DEFAULT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `contenu` longtext,
  `statut` tinyint DEFAULT NULL,
  `id_utilisateur` int NOT NULL,
  PRIMARY KEY (`id_message`,`id_utilisateur`),
  KEY `id_utilisateur_idx` (`id_utilisateur`),
  CONSTRAINT `FK_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `message`
-- -----------------------------------------------------

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table structure for table `option`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option` (
  `id_option` int NOT NULL AUTO_INCREMENT,
  `nom_option` varchar(50) DEFAULT NULL,
  `description_option` varchar(100) DEFAULT NULL,
  `tarif_option` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `option`
-- -----------------------------------------------------

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table structure for table `reservation`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_depart` datetime DEFAULT NULL,
  `date_retour` datetime DEFAULT NULL,
  `id_agence_depart` int NOT NULL,
  `id_agence_retour` int NOT NULL,
  `id_utilisateur` int NOT NULL,
  `id_categorie` int NOT NULL,
  `id_type` int NOT NULL,
  `id_transmission` int NOT NULL,
  `id_carburant` int NOT NULL,
  `tarif_classe_vehicule` decimal(10,2) DEFAULT NULL,
  `num_transaction` varchar(50) DEFAULT NULL,
  `tarif` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_reservation`,`id_agence_depart`,`id_agence_retour`,`id_utilisateur`,`id_categorie`,`id_type`,`id_transmission`,`id_carburant`),
  KEY `FK_agence_depart_idx` (`id_agence_depart`),
  KEY `FK_utilisateur_idx` (`id_utilisateur`),
  KEY `FK_agence_retour_idx` (`id_agence_retour`),
  KEY `FK_categorie_idx` (`id_categorie`),
  KEY `FK_type_idx` (`id_type`),
  KEY `FK_transmission_idx` (`id_transmission`),
  KEY `FK_carburant_idx` (`id_carburant`),
  CONSTRAINT `FK_agence_depart` FOREIGN KEY (`id_agence_depart`) REFERENCES `agence` (`id_agence`),
  CONSTRAINT `FK_agence_retour` FOREIGN KEY (`id_agence_retour`) REFERENCES `agence` (`id_agence`),
  CONSTRAINT `FK_carburant` FOREIGN KEY (`id_carburant`) REFERENCES `carburant` (`id_carburant`),
  CONSTRAINT `FK_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`),
  CONSTRAINT `FK_reservation_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  CONSTRAINT `FK_transmission` FOREIGN KEY (`id_transmission`) REFERENCES `transmission` (`id_transmission`),
  CONSTRAINT `FK_type` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `reservation`
-- -----------------------------------------------------

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table structure for table `reservation_option`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `reservation_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_option` (
  `id_reservation` int NOT NULL,
  `id_option` int NOT NULL,
  PRIMARY KEY (`id_reservation`,`id_option`),
  KEY `FK_option_idx` (`id_option`),
  KEY `FK_reservation_idx` (`id_reservation`),
  CONSTRAINT `FK_option` FOREIGN KEY (`id_option`) REFERENCES `option` (`id_option`),
  CONSTRAINT `FK_reservation` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `reservation_option`
-- -----------------------------------------------------

LOCK TABLES `reservation_option` WRITE;
/*!40000 ALTER TABLE `reservation_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_option` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table structure for table `role`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `nom_role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `role`
-- -----------------------------------------------------

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'client'),(3,'support');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table structure for table `transmission`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `transmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transmission` (
  `id_transmission` int NOT NULL AUTO_INCREMENT,
  `nom_transmission` varchar(50) DEFAULT NULL,
  `desc_transmission` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_transmission`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `transmission`
-- -----------------------------------------------------

LOCK TABLES `transmission` WRITE;
/*!40000 ALTER TABLE `transmission` DISABLE KEYS */;
INSERT INTO `transmission` VALUES (1,'M','Manuelle'),(2,'N','Manuelle 4X4'),(3,'C','Manuelle toutes roues motrices'),(4,'A','Automatique'),(5,'B','Automatique 4'),(6,'D','Automatique toutes roues motrices');
/*!40000 ALTER TABLE `transmission` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table structure for table `type`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `nom_type` varchar(50) DEFAULT NULL,
  `desc_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `type`
-- -----------------------------------------------------

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'B','2-3 Portes'),(2,'C','2/4 Portes'),(3,'D','4-5 Portes'),(4,'W','Break'),(5,'V','Minibus -plus de 6 passagers'),(6,'L','Limousine//sedan'),(7,'S','Sport'),(8,'T','Cabriolet'),(9,'F','SUV'),(10,'J','Tout Terrain'),(11,'X','Spéciale'),(12,'P','Pick up à cabine classique/rallongée - 2 portes'),(13,'Q','Pick up à double cabines - 4 portes'),(14,'Z','Offre spéciale'),(15,'E','Coupé'),(16,'M','Monospace-5 passagers maximum'),(17,'R','Véhicule de loisirs'),(18,'H','Camping car'),(19,'Y','2 roues'),(20,'N','Roadster'),(21,'G','Crossover'),(22,'K','Véhicule utilitaire');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table structure for table `utilisateur`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `id_utilisateur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `id_adresse` int NOT NULL,
  `id_role` int NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_role`,`id_adresse`),
  KEY `id_role_idx` (`id_role`),
  KEY `id_adresse_idx` (`id_adresse`),
  CONSTRAINT `FK_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`),
  CONSTRAINT `FK_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Dumping data for table `utilisateur`
-- -----------------------------------------------------

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-20 21:57:06
