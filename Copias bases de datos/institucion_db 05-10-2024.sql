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
-- Table structure for table `administrativo`
--

DROP TABLE IF EXISTS `administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrativo` (
  `adminId` int NOT NULL,
  `usuDocumento_fk` int NOT NULL,
  `adminCargo` varchar(45) NOT NULL,
  PRIMARY KEY (`adminId`),
  KEY `documntAdmin_fk_idx` (`usuDocumento_fk`),
  CONSTRAINT `documntAdmin_fk` FOREIGN KEY (`usuDocumento_fk`) REFERENCES `usuario` (`usuDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativo`
--

LOCK TABLES `administrativo` WRITE;
/*!40000 ALTER TABLE `administrativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `cursoId` int NOT NULL AUTO_INCREMENT,
  `cursoDescripcion` varchar(45) NOT NULL,
  `cursoEstado` enum('Activo','Inactivo') NOT NULL,
  `profId_fk` int NOT NULL,
  `estuId_fk` int NOT NULL,
  PRIMARY KEY (`cursoId`),
  UNIQUE KEY `ClaseId_UNIQUE` (`cursoId`),
  UNIQUE KEY `ClaseDescripcion_UNIQUE` (`cursoDescripcion`),
  KEY `ProfesorId_fk_idx` (`profId_fk`),
  KEY `EstudianteId_fk_idx` (`estuId_fk`),
  CONSTRAINT `EstudianteId_fk` FOREIGN KEY (`estuId_fk`) REFERENCES `estudiante` (`estuId`),
  CONSTRAINT `ProfesorId_fk` FOREIGN KEY (`profId_fk`) REFERENCES `profesor` (`profId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Primero B','Activo',1,1);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallescurso`
--

DROP TABLE IF EXISTS `detallescurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallescurso` (
  `detcId` int NOT NULL AUTO_INCREMENT,
  `cursoId_fk` int NOT NULL,
  `matId_fk` int NOT NULL,
  PRIMARY KEY (`detcId`),
  UNIQUE KEY `detcId_UNIQUE` (`detcId`),
  KEY `cursoId_fk_idx` (`cursoId_fk`),
  KEY `matId_fk_idx` (`matId_fk`),
  CONSTRAINT `cursoId_fk` FOREIGN KEY (`cursoId_fk`) REFERENCES `curso` (`cursoId`),
  CONSTRAINT `matId_fk` FOREIGN KEY (`matId_fk`) REFERENCES `materia` (`matId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallescurso`
--

LOCK TABLES `detallescurso` WRITE;
/*!40000 ALTER TABLE `detallescurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallescurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `estuId` int NOT NULL AUTO_INCREMENT,
  `usuDocumento_fk` int NOT NULL,
  PRIMARY KEY (`estuId`),
  KEY `documentoEstudi_fk_idx` (`usuDocumento_fk`),
  CONSTRAINT `documentoEstudi_fk` FOREIGN KEY (`usuDocumento_fk`) REFERENCES `usuario` (`usuDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,1030525061);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
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
  `profIdProfesor` int NOT NULL,
  `matEstado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`matId`),
  UNIQUE KEY `matId_UNIQUE` (`matId`),
  KEY `profesorMateriaId_fk_idx` (`profIdProfesor`),
  CONSTRAINT `profesorMateria_fk` FOREIGN KEY (`profIdProfesor`) REFERENCES `profesor` (`profId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Ingleses',1,'Inactivo');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `profId` int NOT NULL AUTO_INCREMENT,
  `usuDocumento_fk` int NOT NULL,
  `profEstudios` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`profId`),
  KEY `documenProfe_fk_idx` (`usuDocumento_fk`),
  CONSTRAINT `documenProfe_fk` FOREIGN KEY (`usuDocumento_fk`) REFERENCES `usuario` (`usuDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,1234567890,'Estudios en la javerianas'),(2,1234567890,'Ingenieria mecatronica en jarvard'),(3,1234567890,'patata');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
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
INSERT INTO `rol` VALUES (1,'Administrativo','Activo'),(2,'Profesor','Activo'),(3,'Estudiante','Activo');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuDocumento` int NOT NULL,
  `usuCorreo` varchar(45) NOT NULL,
  `usuApellido` varchar(45) NOT NULL,
  `usuNombre` varchar(45) NOT NULL,
  `usuTipoDocumento` enum('CC','TI','CE') NOT NULL,
  `usuTelefono` bigint NOT NULL,
  `usuEstado` enum('Activo','Inactivo') NOT NULL,
  `rolId_fk` int NOT NULL,
  PRIMARY KEY (`usuDocumento`),
  KEY `RolId_fk_idx` (`rolId_fk`),
  CONSTRAINT `RolId_fk` FOREIGN KEY (`rolId_fk`) REFERENCES `rol` (`rolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1030525061,'Andres@gmail.com','Perez','Andres','CC',3148752296,'Activo',3),(1050648527,'pepita123@gmail.com','Perez','Pepita','CC',3205489964,'Activo',2),(1234567890,'profesor@gmail.com','Hernandez','Gabriel','CC',3084596322,'Activo',2);
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

-- Dump completed on 2024-10-04 23:59:27
