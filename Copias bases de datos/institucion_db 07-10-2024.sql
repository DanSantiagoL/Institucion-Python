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
  `adminId` int NOT NULL AUTO_INCREMENT,
  `usuDocumento_fk` int NOT NULL,
  `adminCargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  KEY `documntAdmin_fk_idx` (`usuDocumento_fk`),
  CONSTRAINT `documntAdmin_fk` FOREIGN KEY (`usuDocumento_fk`) REFERENCES `usuario` (`usuDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativo`
--

LOCK TABLES `administrativo` WRITE;
/*!40000 ALTER TABLE `administrativo` DISABLE KEYS */;
INSERT INTO `administrativo` VALUES (1,1234567811,'Directora'),(11,1030525061,'Cargo pendiente'),(12,1574033333,'Cargo pendiente');
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
  PRIMARY KEY (`cursoId`),
  UNIQUE KEY `ClaseId_UNIQUE` (`cursoId`),
  KEY `ProfesorId_fk_idx` (`profId_fk`),
  CONSTRAINT `ProfesorId_fk` FOREIGN KEY (`profId_fk`) REFERENCES `profesor` (`profId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (10,'Primero A','Activo',21),(11,'Curso no Definido','Inactivo',8),(12,'Primero B','Activo',11);
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
  `cursoId_fk` int DEFAULT '11',
  PRIMARY KEY (`estuId`),
  KEY `documentoEstudi_fk_idx` (`usuDocumento_fk`),
  KEY `cursoIdEstudiantes_fk_idx` (`cursoId_fk`),
  CONSTRAINT `cursoIdEstudiantes_fk` FOREIGN KEY (`cursoId_fk`) REFERENCES `curso` (`cursoId`) ON DELETE CASCADE,
  CONSTRAINT `documentoEstudi_fk` FOREIGN KEY (`usuDocumento_fk`) REFERENCES `usuario` (`usuDocumento`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (18,1234567890,10),(20,1030527777,12);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asignar_curso_id_fk` BEFORE INSERT ON `estudiante` FOR EACH ROW BEGIN
    IF NEW.cursoId_fk IS NULL OR NEW.cursoId_fk = '' THEN
        SET NEW.cursoId_fk = 8;  -- Asigna el valor 8 si cursoId_fk está vacío
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `matId` int NOT NULL AUTO_INCREMENT,
  `matDescripcion` varchar(45) NOT NULL,
  `profIdProfesor_fk` int NOT NULL,
  `matEstado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`matId`),
  UNIQUE KEY `matId_UNIQUE` (`matId`),
  KEY `profesorMateriaId_fk_idx` (`profIdProfesor_fk`),
  CONSTRAINT `profesorMateria_fk` FOREIGN KEY (`profIdProfesor_fk`) REFERENCES `profesor` (`profId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (5,'Ingles',11,'Inactivo'),(6,'Educacion fisica',21,'Activo');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (8,1000000000,NULL),(11,1187453674,'Estudios Pendientes'),(14,1050648527,'Estudios Pendientes'),(21,1176852033,'Deportes y atletismo en la nacional');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_profesor` BEFORE DELETE ON `profesor` FOR EACH ROW BEGIN
    -- Eliminar los registros de curso que tienen un profId_fk igual al profId del profesor que se está eliminando
    DELETE FROM curso WHERE profId_fk = OLD.profId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_profesor_materia` BEFORE DELETE ON `profesor` FOR EACH ROW BEGIN
    -- Elimina de la tabla materia donde profIdProfesor_fk coincide con el profId del profesor eliminado
    DELETE FROM materia WHERE profIdProfesor_fk = OLD.profId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `usuario` VALUES (1000000000,'ProfesorNoDefinido@gmail.com','No definido','Profesor','CC',1111111111,'Inactivo',2),(1030525061,'Andres@gmail.com','Perez','Andres','CC',3148752296,'Activo',1),(1030527777,'Santiago@gmail.com','Hernandez','Santiago','TI',3224557333,'Activo',3),(1050648527,'pepita123@gmail.com','Perez','Pepita','CC',3205489964,'Activo',2),(1176852033,'Manolo35@hotmail.com','Gavilia','Manolo','CE',3224557701,'Activo',2),(1184536200,'estudiante@gmail.com','Rodriguez','Luis','CC',3148596674,'Activo',3),(1187453674,'profesor2@gmail.com','Nariño','David','CC',3157552005,'Activo',2),(1194512031,'Estudiante4@gmail.com','Generico 2','Nombre','TI',1111111111,'Inactivo',3),(1234567811,'administrativo@gmail.com','Gavilia','Nubia','CC',3234765589,'Activo',1),(1234567822,'estudiante3@gmail.com','Generico','Nombre','TI',3142579985,'Activo',3),(1234567890,'profesor@gmail.com','Hernandez','Gabriel','CC',3084596322,'Activo',3),(1245933670,'estudiante2@gmail.com','Martinez','Manolo','TI',3136588477,'Activo',3),(1574033333,'Pablito123@hotmail.com','Osorio','Pablo','CC',3122558333,'Activo',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_usuario_insert` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
    -- Verifica si el rol es 3 (rol de estudiante)
    IF NEW.rolId_fk = 3 THEN
        -- Inserta automáticamente en la tabla 'estudiante'
        INSERT INTO estudiante (usuDocumento_fk) VALUES (NEW.usuDocumento);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_usuario` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
    -- Verificar si el rol del nuevo usuario es '2' (Profesor)
    IF NEW.rolId_fk = 2 THEN
        -- Insertar el documento del nuevo usuario en la tabla profesor
        INSERT INTO profesor (usuDocumento_fk) VALUES (NEW.usuDocumento);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_usuario_admin` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
    -- Verificar si el rol del nuevo usuario es '1' (administrativo)
    IF NEW.rolId_fk = 1 THEN
        -- Insertar el documento del nuevo usuario en la tabla administrativo
        INSERT INTO administrativo (usuDocumento_fk) VALUES (NEW.usuDocumento);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_usuario` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN
    -- Si el rol se actualiza a 2, inserta el usuario en la tabla profesor
    IF NEW.rolId_fk = 2 THEN
        INSERT INTO profesor (usuDocumento_fk, profEstudios) 
        VALUES (NEW.usuDocumento, 'Estudios Pendientes') 
        ON DUPLICATE KEY UPDATE profEstudios = 'Estudios Pendientes'; -- Actualiza si ya existe
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_usuario_role` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN
    -- Si el rol cambia de 2 a otro rol, elimina el registro de profesor
    IF OLD.rolId_fk = 2 AND NEW.rolId_fk != 2 THEN
        DELETE FROM profesor WHERE usuDocumento_fk = OLD.usuDocumento;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_usuario_admin` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN
    -- Si el rol se actualiza a 2, inserta el usuario en la tabla profesor
    IF NEW.rolId_fk = 1 THEN
        INSERT INTO administrativo (usuDocumento_fk, adminCargo) 
        VALUES (NEW.usuDocumento, 'Cargo pendiente') 
        ON DUPLICATE KEY UPDATE adminCargo = 'Cargo pendiente'; -- Actualiza si ya existe
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_usuario_role_admin` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN
    -- Si el rol cambia de 2 a otro rol, elimina el registro de profesor
    IF OLD.rolId_fk = 1 AND NEW.rolId_fk != 1 THEN
        DELETE FROM administrativo WHERE usuDocumento_fk = OLD.usuDocumento;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_usuario_update` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
    -- Si el rol cambia a 3, inserta o actualiza el estudiante en la tabla 'estudiante'
    IF NEW.rolId_fk = 3 AND OLD.rolId_fk != 3 THEN
        INSERT INTO estudiante (usuDocumento_fk) VALUES (NEW.usuDocumento)
        ON DUPLICATE KEY UPDATE usuDocumento_fk = NEW.usuDocumento;
    -- Si el rol deja de ser 3, elimina el estudiante de la tabla 'estudiante'
    ELSEIF OLD.rolId_fk = 3 AND NEW.rolId_fk != 3 THEN
        DELETE FROM estudiante WHERE usuDocumento_fk = OLD.usuDocumento;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_usuario` BEFORE DELETE ON `usuario` FOR EACH ROW BEGIN
    -- Elimina de la tabla profesor si se elimina el usuario
    DELETE FROM profesor WHERE usuDocumento_fk = OLD.usuDocumento;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_usuario_admin` BEFORE DELETE ON `usuario` FOR EACH ROW BEGIN
    -- Elimina de la tabla profesor si se elimina el usuario
    DELETE FROM administrativo WHERE usuDocumento_fk = OLD.usuDocumento;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_usuario_delete` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
    -- Si el usuario eliminado tenía rol 3, también elimina su registro en la tabla 'estudiante'
    IF OLD.rolId_fk = 3 THEN
        DELETE FROM estudiante WHERE usuDocumento_fk = OLD.usuDocumento;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_usuario_delete_2` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
    -- Si el usuario eliminado tenía rol 2, también elimina su registro en la tabla 'profesor'
    IF OLD.rolId_fk = 2 THEN
        DELETE FROM profesor WHERE usuDocumento_fk = OLD.usuDocumento;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vista_administrativos`
--

DROP TABLE IF EXISTS `vista_administrativos`;
/*!50001 DROP VIEW IF EXISTS `vista_administrativos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_administrativos` AS SELECT 
 1 AS `adminId`,
 1 AS `nombre_completo`,
 1 AS `adminCargo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_curso`
--

DROP TABLE IF EXISTS `vista_curso`;
/*!50001 DROP VIEW IF EXISTS `vista_curso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_curso` AS SELECT 
 1 AS `cursoId`,
 1 AS `cursoDescripcion`,
 1 AS `cursoEstado`,
 1 AS `nombre_completo_profesor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_estudiante`
--

DROP TABLE IF EXISTS `vista_estudiante`;
/*!50001 DROP VIEW IF EXISTS `vista_estudiante`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estudiante` AS SELECT 
 1 AS `estuId`,
 1 AS `nombre_completo_estudiante`,
 1 AS `cursoDescripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_nombre_profesor`
--

DROP TABLE IF EXISTS `vista_nombre_profesor`;
/*!50001 DROP VIEW IF EXISTS `vista_nombre_profesor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_nombre_profesor` AS SELECT 
 1 AS `matId`,
 1 AS `matDescripcion`,
 1 AS `nombre_completo_profesor`,
 1 AS `matEstado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_profesor`
--

DROP TABLE IF EXISTS `vista_profesor`;
/*!50001 DROP VIEW IF EXISTS `vista_profesor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_profesor` AS SELECT 
 1 AS `profId`,
 1 AS `nombre_completo_profesor`,
 1 AS `profEstudios`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_usuario`
--

DROP TABLE IF EXISTS `vista_usuario`;
/*!50001 DROP VIEW IF EXISTS `vista_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_usuario` AS SELECT 
 1 AS `usuDocumento`,
 1 AS `usuCorreo`,
 1 AS `usuApellido`,
 1 AS `usuNombre`,
 1 AS `usuTipoDocumento`,
 1 AS `usuTelefono`,
 1 AS `usuEstado`,
 1 AS `rol`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'institucion_db'
--

--
-- Dumping routines for database 'institucion_db'
--

--
-- Final view structure for view `vista_administrativos`
--

/*!50001 DROP VIEW IF EXISTS `vista_administrativos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_administrativos` AS select `a`.`adminId` AS `adminId`,concat(`u`.`usuNombre`,' ',`u`.`usuApellido`) AS `nombre_completo`,`a`.`adminCargo` AS `adminCargo` from (`administrativo` `a` join `usuario` `u` on((`a`.`usuDocumento_fk` = `u`.`usuDocumento`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_curso`
--

/*!50001 DROP VIEW IF EXISTS `vista_curso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_curso` AS select `c`.`cursoId` AS `cursoId`,`c`.`cursoDescripcion` AS `cursoDescripcion`,`c`.`cursoEstado` AS `cursoEstado`,concat(`u`.`usuNombre`,' ',`u`.`usuApellido`) AS `nombre_completo_profesor` from ((`curso` `c` join `profesor` `p` on((`c`.`profId_fk` = `p`.`profId`))) join `usuario` `u` on((`p`.`usuDocumento_fk` = `u`.`usuDocumento`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_estudiante`
--

/*!50001 DROP VIEW IF EXISTS `vista_estudiante`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estudiante` AS select `e`.`estuId` AS `estuId`,concat(`u`.`usuNombre`,' ',`u`.`usuApellido`) AS `nombre_completo_estudiante`,`c`.`cursoDescripcion` AS `cursoDescripcion` from ((`estudiante` `e` join `usuario` `u` on((`e`.`usuDocumento_fk` = `u`.`usuDocumento`))) join `curso` `c` on((`e`.`cursoId_fk` = `c`.`cursoId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_nombre_profesor`
--

/*!50001 DROP VIEW IF EXISTS `vista_nombre_profesor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_nombre_profesor` AS select `m`.`matId` AS `matId`,`m`.`matDescripcion` AS `matDescripcion`,concat(`u`.`usuNombre`,' ',`u`.`usuApellido`) AS `nombre_completo_profesor`,`m`.`matEstado` AS `matEstado` from ((`materia` `m` join `profesor` `p` on((`m`.`profIdProfesor_fk` = `p`.`profId`))) join `usuario` `u` on((`p`.`usuDocumento_fk` = `u`.`usuDocumento`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_profesor`
--

/*!50001 DROP VIEW IF EXISTS `vista_profesor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_profesor` AS select `p`.`profId` AS `profId`,concat(`u`.`usuNombre`,' ',`u`.`usuApellido`) AS `nombre_completo_profesor`,`p`.`profEstudios` AS `profEstudios` from (`profesor` `p` join `usuario` `u` on((`p`.`usuDocumento_fk` = `u`.`usuDocumento`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuario`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuario` AS select `usuario`.`usuDocumento` AS `usuDocumento`,`usuario`.`usuCorreo` AS `usuCorreo`,`usuario`.`usuApellido` AS `usuApellido`,`usuario`.`usuNombre` AS `usuNombre`,`usuario`.`usuTipoDocumento` AS `usuTipoDocumento`,`usuario`.`usuTelefono` AS `usuTelefono`,`usuario`.`usuEstado` AS `usuEstado`,(case when (`usuario`.`rolId_fk` = 1) then 'Administrador' when (`usuario`.`rolId_fk` = 2) then 'Profesor' when (`usuario`.`rolId_fk` = 3) then 'Estudiante' else 'Otro' end) AS `rol` from `usuario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-06 15:57:04
