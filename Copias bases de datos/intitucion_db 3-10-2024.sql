-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: institucion_db
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase` (
  `claseId` int NOT NULL AUTO_INCREMENT,
  `claseDescripcion` varchar(45) NOT NULL,
  `claseEstado` enum('Activo','Inactivo') NOT NULL,
  `usuIdProfe` int NOT NULL,
  PRIMARY KEY (`claseId`),
  UNIQUE KEY `ClaseId_UNIQUE` (`claseId`),
  UNIQUE KEY `ClaseDescripcion_UNIQUE` (`claseDescripcion`),
  KEY `usuIdProfesor_idx` (`usuIdProfe`),
  CONSTRAINT `usuIdProfe` FOREIGN KEY (`usuIdProfe`) REFERENCES `usuario` (`usuId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claseestudiantes`
--

DROP TABLE IF EXISTS `claseestudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claseestudiantes` (
  `claseId_fk` int NOT NULL,
  `usuIdEstudiante_fk` int NOT NULL,
  PRIMARY KEY (`claseId_fk`),
  KEY `usuaId_fk_idx` (`usuIdEstudiante_fk`),
  CONSTRAINT `clasesId_fk` FOREIGN KEY (`claseId_fk`) REFERENCES `clase` (`claseId`),
  CONSTRAINT `usuarioId_fk` FOREIGN KEY (`usuIdEstudiante_fk`) REFERENCES `usuario` (`usuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claseestudiantes`
--

LOCK TABLES `claseestudiantes` WRITE;
/*!40000 ALTER TABLE `claseestudiantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `claseestudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallesclase`
--

DROP TABLE IF EXISTS `detallesclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallesclase` (
  `detcId` int NOT NULL AUTO_INCREMENT,
  `claseId_fk` int NOT NULL,
  `matId_fk` int NOT NULL,
  PRIMARY KEY (`detcId`),
  UNIQUE KEY `detcId_UNIQUE` (`detcId`),
  KEY `claseId_fk_idx` (`claseId_fk`),
  KEY `matId_fk_idx` (`matId_fk`),
  CONSTRAINT `claseId_fk` FOREIGN KEY (`claseId_fk`) REFERENCES `clase` (`claseId`),
  CONSTRAINT `matId_fk` FOREIGN KEY (`matId_fk`) REFERENCES `materia` (`matId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesclase`
--

LOCK TABLES `detallesclase` WRITE;
/*!40000 ALTER TABLE `detallesclase` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallesclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `matId` int NOT NULL AUTO_INCREMENT,
  `matDescripcion` varchar(45) NOT NULL,
  `usuIdProfesor` int NOT NULL,
  `matEstado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`matId`),
  UNIQUE KEY `matId_UNIQUE` (`matId`),
  KEY `usuIdProfesor_idx` (`usuIdProfesor`),
  CONSTRAINT `usuIdProfesor` FOREIGN KEY (`usuIdProfesor`) REFERENCES `usuario` (`usuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `rolId` int NOT NULL AUTO_INCREMENT,
  `rolDescripcion` enum('Estudiante','Profesor','Administrativo','Conserje') NOT NULL,
  `rolEstado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`rolId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrativo','Activo'),(2,'Profesor','Activo'),(3,'Estudiante','Activo'),(4,'Conserje','Activo');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuId` int NOT NULL AUTO_INCREMENT,
  `usuCorreo` varchar(45) NOT NULL,
  `usuContrasena` varchar(45) NOT NULL,
  `usuApellido` varchar(45) NOT NULL,
  `usuNombre` varchar(45) NOT NULL,
  `usuTipoDocumento` enum('CC','TI','CE') NOT NULL,
  `usuDocumento` int NOT NULL,
  `usuTelefono` bigint NOT NULL,
  `usuEstado` enum('Activo','Inactivo') NOT NULL,
  `rolId_fk` int NOT NULL,
  PRIMARY KEY (`usuId`),
  UNIQUE KEY `usuId_UNIQUE` (`usuId`),
  UNIQUE KEY `usuDocumento_UNIQUE` (`usuDocumento`),
  KEY `rolId_fk_idx` (`rolId_fk`),
  CONSTRAINT `rolId_fk` FOREIGN KEY (`rolId_fk`) REFERENCES `rol` (`rolId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'paquita@gmail.com','paquita123','Martinez','Paquita','CC',1865247712,3145896657,'Activo',2),(4,'Andres@gmail.com','Andres123','Perez','Andres','CC',1030528847,3204589945,'Activo',3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-03 10:05:30
