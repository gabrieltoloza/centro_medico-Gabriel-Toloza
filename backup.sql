-- MySQL dump 10.13  Distrib 9.0.1, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: centro_medico
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `centro_medico`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `centro_medico` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `centro_medico`;

--
-- Table structure for table `RUP_registro_matriculas`
--

DROP TABLE IF EXISTS `RUP_registro_matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RUP_registro_matriculas` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_matricula` int NOT NULL,
  `fecha_registrada` date DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `FK_id_matricula` (`id_matricula`),
  CONSTRAINT `FK_id_matricula` FOREIGN KEY (`id_matricula`) REFERENCES `matriculas` (`id_matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar los registros de las matriculas en el R.U.P (Registro unico de profesionales de la salud';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RUP_registro_matriculas`
--

LOCK TABLES `RUP_registro_matriculas` WRITE;
/*!40000 ALTER TABLE `RUP_registro_matriculas` DISABLE KEYS */;
INSERT INTO `RUP_registro_matriculas` VALUES (1,1,'2013-05-19'),(2,2,'2018-09-02'),(3,3,'2011-11-25'),(4,4,'2015-07-17'),(5,5,'2019-03-11'),(6,6,'2012-02-28'),(7,7,'2017-05-22'),(8,8,'2014-10-08'),(9,9,'2016-01-19'),(10,10,'2018-06-15'),(11,11,'2013-09-04'),(12,12,'2019-11-29'),(13,13,'2011-03-17'),(14,14,'2015-02-25'),(15,15,'2017-11-01'),(16,16,'2014-05-13'),(17,17,'2012-08-14'),(18,18,'2016-09-07'),(19,19,'2018-03-27'),(20,20,'2011-06-22'),(21,21,'2019-08-20'),(22,22,'2017-02-02'),(23,23,'2014-11-25'),(24,24,'2016-05-10'),(25,25,'2013-01-09'),(26,26,'2018-10-16'),(27,27,'2012-04-18'),(28,28,'2019-04-24'),(29,29,'2011-09-13'),(30,30,'2015-11-03'),(31,31,'2017-08-08'),(32,32,'2014-03-05'),(33,33,'2012-10-22'),(34,34,'2016-07-19'),(35,35,'2018-01-23'),(36,36,'2011-05-02'),(37,37,'2019-10-09'),(38,38,'2017-06-13'),(39,39,'2014-08-26'),(40,40,'2016-02-15');
/*!40000 ALTER TABLE `RUP_registro_matriculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alta_medico_control`
--

DROP TABLE IF EXISTS `alta_medico_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alta_medico_control` (
  `id_control` int NOT NULL AUTO_INCREMENT,
  `id_medico` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `cuit` bigint DEFAULT NULL,
  `profesion` varchar(255) DEFAULT NULL,
  `num_matricula` bigint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `usuario` varchar(255) NOT NULL,
  PRIMARY KEY (`id_control`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para llevar un registro completo sin joins de los medicos registrados medicos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alta_medico_control`
--

LOCK TABLES `alta_medico_control` WRITE;
/*!40000 ALTER TABLE `alta_medico_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `alta_medico_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alta_paciente_control`
--

DROP TABLE IF EXISTS `alta_paciente_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alta_paciente_control` (
  `id_control` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `obra_social` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) NOT NULL,
  PRIMARY KEY (`id_control`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para controlar la creacion de un paciente. Actua sobre la tabla "pacientes" .';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alta_paciente_control`
--

LOCK TABLES `alta_paciente_control` WRITE;
/*!40000 ALTER TABLE `alta_paciente_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `alta_paciente_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_trigger`
--

DROP TABLE IF EXISTS `auditoria_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_trigger` (
  `id_auditor` int NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_auditor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para llevar a cabo el control del descuento de la facturacion paciente.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_trigger`
--

LOCK TABLES `auditoria_trigger` WRITE;
/*!40000 ALTER TABLE `auditoria_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centros_medicos`
--

DROP TABLE IF EXISTS `centros_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centros_medicos` (
  `id_centro_medico` int NOT NULL AUTO_INCREMENT,
  `id_dueno` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` bigint NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `provincia` varchar(255) NOT NULL,
  `codigo_postal` int NOT NULL,
  `sitio_web` varchar(255) NOT NULL,
  PRIMARY KEY (`id_centro_medico`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `sitio_web` (`sitio_web`),
  KEY `fk_duenos_id_dueno` (`id_dueno`),
  CONSTRAINT `fk_duenos_id_dueno` FOREIGN KEY (`id_dueno`) REFERENCES `duenos` (`id_dueno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que relaciona todas las entidades que pueden trabajar en un centro medico, hay 3 centros medicos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centros_medicos`
--

LOCK TABLES `centros_medicos` WRITE;
/*!40000 ALTER TABLE `centros_medicos` DISABLE KEYS */;
INSERT INTO `centros_medicos` VALUES (1,1,'CentromedicoLorena','Cordoba255','centro_medico_lorena@gmail.com',2204528588,'Merlo','BuenosAires',1722,'www.centromedicolorena.com.ar'),(2,2,'CentromedicoOeste','Av.Rivadavia7558','oeste_centromedico@gmail.com',2204524567,'SanAntoniodePadua','BuenosAires',1722,'www.oestecentromedico.com.ar'),(3,3,'SaludMentalQuillinzo','O\'brien1598','salud_mental_Quillinzo@gmail.com',3514568852,'ValleCalamuchita','Cordoba',5196,'www.quillinzo-salud-mental.com.ar');
/*!40000 ALTER TABLE `centros_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duenos`
--

DROP TABLE IF EXISTS `duenos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duenos` (
  `id_dueno` int NOT NULL AUTO_INCREMENT,
  `nombre_dueno` varchar(255) NOT NULL,
  `apellido_dueno` varchar(255) NOT NULL,
  `dni_dueno` bigint NOT NULL,
  `domicilio_dueno` varchar(255) NOT NULL,
  `telefono_dueno` bigint NOT NULL,
  PRIMARY KEY (`id_dueno`),
  UNIQUE KEY `dni_dueno` (`dni_dueno`),
  UNIQUE KEY `telefono_dueno` (`telefono_dueno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar a los duenos/socios del Centro Medico';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duenos`
--

LOCK TABLES `duenos` WRITE;
/*!40000 ALTER TABLE `duenos` DISABLE KEYS */;
INSERT INTO `duenos` VALUES (1,'Ricardo','Farina',26458457,'Gral. Rosas 1525',1145258877),(2,'Bernarda','Chela',27410255,'Corrientes 956',1165255587),(3,'Adrian','Frenucci',29545777,'Cordoba 1144',1123659545);
/*!40000 ALTER TABLE `duenos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `id_centro_medico` int NOT NULL,
  `nombre_empleado` varchar(255) NOT NULL,
  `apellido_empleado` varchar(255) NOT NULL,
  `dni_empleado` bigint NOT NULL,
  `domicilio_empleado` varchar(255) NOT NULL,
  `telefono_empleado` bigint NOT NULL,
  `fecha_alta` date DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `dni_empleado` (`dni_empleado`),
  UNIQUE KEY `telefono_empleado` (`telefono_empleado`),
  KEY `fk_centros_medicos_empleado` (`id_centro_medico`),
  CONSTRAINT `fk_centros_medicos_empleado` FOREIGN KEY (`id_centro_medico`) REFERENCES `centros_medicos` (`id_centro_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar a los empleados del Centro Medico';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,1,'Sandra','Chapman',42825134,'78876 Raymond Pike',1112095163,'2023-05-01'),(2,2,'Brian','Mckinney',29675309,'073 Lucas Meadows',1147898781,'2022-06-13'),(3,3,'Tracy','Baker',45853395,'551 Andrea Port',1104834274,'2021-02-16'),(4,1,'Katelyn','Clark',30630881,'711 Rodriguez Station',1126995484,'2022-12-21'),(5,2,'Crystal','Salazar',28670591,'87221 Brooke Plains Apt. 161',1182490328,'2023-08-09'),(6,3,'Bill','Wright',48880237,'3631 Mendez Highway Apt. 218',1105212524,'2023-12-01'),(7,1,'Matthew','Taylor',44197588,'03808 Mendez Bypass',1195761763,'2024-02-27'),(8,2,'Richard','Pacheco',25013986,'0085 Reese Islands Apt. 917',1184577373,'2023-09-09'),(9,3,'Michelle','Wilson',38185137,'2630 Davis Pines',1154957371,'2020-11-12'),(10,1,'Timothy','Oneill',42319888,'63090 Nicole Loop',1180907149,'2020-05-21'),(11,2,'Jason','Baker',26651690,'86891 Steven Greens Apt. 924',1151419013,'2023-10-14'),(12,3,'Jerry','Esparza',20512030,'326 Wood Haven Apt. 451',1179184545,'2020-02-14'),(13,1,'Jeffrey','Woodard',43486374,'7575 Greene Spurs',1121266582,'2023-04-10'),(14,2,'Austin','Jones',21593885,'3656 Paula Spur Suite 250',1103291706,'2023-08-17'),(15,3,'Dustin','Gonzalez',33607833,'249 Ferguson View',1111408975,'2024-05-28'),(16,1,'Larry','Suarez',45480064,'97822 James Well Apt. 066',1102082374,'2024-06-27'),(17,2,'Steven','Solis',44439768,'743 Joseph Park Apt. 756',1124148270,'2019-11-17'),(18,3,'Richard','Walker',21990405,'9888 Michael Ways Suite 543',1113812043,'2021-05-01'),(19,1,'Mary','Morrison',27444573,'07031 Lacey Park Apt. 705',1102497895,'2019-09-16'),(20,2,'Martin','Young',48849809,'267 Russell Branch',1114023721,'2022-09-22'),(21,3,'Rebecca','Short',45170874,'7078 Natalie Centers',1189010239,'2023-04-11'),(22,1,'Karen','Klein',40613721,'804 Michael Glen',1188461038,'2024-02-07'),(23,2,'Courtney','Jackson',31902207,'269 Rivera Valleys',1125459815,'2024-03-27'),(24,3,'Charles','Campbell',35823343,'101 Morris Hill',1180799446,'2021-08-08'),(25,1,'Michael','Prince',29442110,'101 Michael Centers',1144775893,'2019-10-22'),(26,2,'Stephen','Branch',30318719,'1954 Kelley Springs',1101984324,'2019-09-30'),(27,3,'Cassandra','Riley',33160780,'3428 Amy Freeway',1182626738,'2021-11-29'),(28,1,'Martin','Price',45199993,'3622 Adam Mountains Apt. 619',1150069688,'2023-06-10'),(29,2,'Martha','Bennett',36782831,'284 Paul Groves Apt. 021',1150676033,'2023-08-21'),(30,3,'Amanda','Rodriguez',47620087,'036 Hernandez Hills',1161903418,'2021-08-10'),(31,1,'Ryan','Wright',28817957,'58396 Chandler Key Apt. 811',1158660490,'2020-07-21'),(32,2,'Matthew','Gutierrez',33279892,'8301 Lewis Wells',1142467267,'2022-02-07'),(33,3,'Justin','Mcclure',34543893,'9397 Cunningham Orchard',1179332049,'2024-05-26'),(34,1,'Nancy','Armstrong',35516509,'5679 Zimmerman Causeway Suite 140',1170893599,'2020-11-19'),(35,2,'Stephen','Lloyd',29290736,'945 Corey Crossroad',1146404688,'2022-01-25'),(36,3,'Alicia','Lopez',30321654,'8195 Alamo Street Apt. 510',1116234782,'2023-03-14'),(37,1,'Frank','Hernandez',45713456,'2345 Seagull Road',1153692465,'2024-05-30'),(38,2,'Jessica','Peters',49513234,'123 Elm Street',1198472563,'2024-06-20');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados_puestos`
--

DROP TABLE IF EXISTS `empleados_puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados_puestos` (
  `id_empleado` int NOT NULL,
  `id_puesto` int NOT NULL,
  PRIMARY KEY (`id_empleado`,`id_puesto`),
  KEY `FK_id_puesto` (`id_puesto`),
  CONSTRAINT `FK_id_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_puesto` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id_puesto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla intermedia entre la entidad Puestos y Empleados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados_puestos`
--

LOCK TABLES `empleados_puestos` WRITE;
/*!40000 ALTER TABLE `empleados_puestos` DISABLE KEYS */;
INSERT INTO `empleados_puestos` VALUES (1,1),(2,1),(3,1),(18,1),(19,1),(29,1),(30,1),(31,1),(36,1),(38,1),(4,2),(5,2),(6,2),(14,2),(37,2),(7,3),(8,3),(9,3),(28,3),(21,4),(25,4),(26,4),(27,4),(16,5),(17,5),(20,5),(32,5),(10,6),(15,6),(22,6),(33,6),(11,7),(12,7),(13,7),(23,8),(34,8),(24,9),(35,9);
/*!40000 ALTER TABLE `empleados_puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_medico`
--

DROP TABLE IF EXISTS `factura_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_medico` (
  `id_factura_medico` int NOT NULL AUTO_INCREMENT,
  `id_medico` int NOT NULL,
  `id_tratamiento` int NOT NULL,
  `horas_trabajadas` int NOT NULL,
  `monto` decimal(12,2) NOT NULL,
  `mes_facturado` date DEFAULT NULL,
  PRIMARY KEY (`id_factura_medico`),
  KEY `FK_factura_medico_id_medico` (`id_medico`),
  KEY `FK_factura_medico_id_tratamiento` (`id_tratamiento`),
  CONSTRAINT `FK_factura_medico_id_medico` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_factura_medico_id_tratamiento` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamientos` (`id_tratamiento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para facturar los servicios prestados a los Pacientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_medico`
--

LOCK TABLES `factura_medico` WRITE;
/*!40000 ALTER TABLE `factura_medico` DISABLE KEYS */;
INSERT INTO `factura_medico` VALUES (1,1,1,64,360000.00,'2023-05-22'),(2,12,2,48,300000.00,'2024-02-22'),(3,23,3,80,432000.00,'2023-09-22'),(4,34,4,56,324000.00,'2024-01-22'),(5,5,5,72,396000.00,'2023-11-22'),(6,16,6,40,264000.00,'2024-03-22'),(7,27,7,64,360000.00,'2023-07-22'),(8,38,8,48,300000.00,'2024-06-22'),(9,9,9,88,468000.00,'2023-12-22'),(10,20,10,56,324000.00,'2024-04-22'),(11,31,11,72,396000.00,'2023-08-22'),(12,2,12,48,300000.00,'2024-05-22'),(13,13,13,80,432000.00,'2023-10-22'),(14,24,14,64,360000.00,'2024-01-22'),(15,35,15,56,324000.00,'2023-06-22'),(16,6,16,72,396000.00,'2024-03-22'),(17,17,17,40,264000.00,'2023-09-22'),(18,28,18,64,360000.00,'2024-02-22'),(19,39,19,48,300000.00,'2023-11-22'),(20,10,20,88,468000.00,'2024-05-22'),(21,21,21,56,324000.00,'2023-07-22'),(22,32,22,72,396000.00,'2024-04-22'),(23,3,23,48,300000.00,'2023-12-22'),(24,14,24,80,432000.00,'2024-01-22'),(25,25,25,64,360000.00,'2023-08-22'),(26,36,26,56,324000.00,'2024-06-22'),(27,7,27,72,396000.00,'2023-10-22'),(28,18,28,40,264000.00,'2024-03-22'),(29,29,29,64,360000.00,'2023-05-22'),(30,40,30,48,300000.00,'2024-02-22'),(31,11,31,88,468000.00,'2023-09-22'),(32,22,32,56,324000.00,'2024-01-10'),(33,33,33,72,396000.00,'2023-11-10'),(34,4,34,48,300000.00,'2024-04-10'),(35,15,35,80,432000.00,'2023-07-10'),(36,26,36,64,360000.00,'2024-05-10'),(37,37,37,56,324000.00,'2023-12-10'),(38,8,38,72,396000.00,'2024-03-10'),(39,19,39,40,264000.00,'2023-08-10'),(40,30,40,64,360000.00,'2024-06-10'),(41,1,41,48,300000.00,'2023-10-10'),(42,12,42,88,468000.00,'2024-02-10'),(43,23,43,56,324000.00,'2023-05-10'),(44,34,44,72,396000.00,'2024-01-10'),(45,5,45,48,300000.00,'2023-09-10'),(46,16,46,80,432000.00,'2024-04-10'),(47,27,47,64,360000.00,'2023-11-10'),(48,38,48,56,324000.00,'2024-03-10'),(49,9,49,72,396000.00,'2023-07-10'),(50,20,50,40,264000.00,'2024-05-10'),(51,31,51,64,360000.00,'2023-12-10'),(52,2,52,48,300000.00,'2024-02-10'),(53,13,53,88,468000.00,'2023-08-10'),(54,24,54,56,324000.00,'2024-06-10'),(55,35,55,72,396000.00,'2023-10-10'),(56,6,56,48,300000.00,'2024-01-10'),(57,17,57,80,432000.00,'2023-05-10'),(58,28,58,64,360000.00,'2024-03-10'),(59,39,59,56,324000.00,'2023-09-15'),(60,10,60,72,396000.00,'2024-04-15'),(61,21,61,40,264000.00,'2023-11-15'),(62,32,62,64,360000.00,'2024-02-15'),(63,3,63,48,300000.00,'2023-07-15'),(64,14,64,88,468000.00,'2024-05-15'),(65,25,65,56,324000.00,'2023-12-15'),(66,36,66,72,396000.00,'2024-01-15'),(67,7,67,48,300000.00,'2023-08-15'),(68,18,68,80,432000.00,'2024-06-15'),(69,29,69,64,360000.00,'2023-10-15'),(70,40,70,56,324000.00,'2024-03-15'),(71,11,71,72,396000.00,'2023-05-15'),(72,22,72,40,264000.00,'2024-02-15'),(73,33,73,64,360000.00,'2023-09-15'),(74,4,74,48,300000.00,'2024-01-15'),(75,15,75,88,468000.00,'2023-11-15'),(76,26,76,56,324000.00,'2024-04-15'),(77,37,77,72,396000.00,'2023-07-15'),(78,8,78,48,300000.00,'2024-05-15'),(79,19,79,80,432000.00,'2023-12-15'),(80,30,80,64,360000.00,'2024-03-15'),(81,1,81,56,324000.00,'2023-08-15'),(82,12,82,72,396000.00,'2024-06-15'),(83,23,83,40,264000.00,'2023-10-15'),(84,34,84,64,360000.00,'2024-02-15'),(85,5,85,48,300000.00,'2023-05-15'),(86,16,86,88,468000.00,'2024-01-15'),(87,27,87,56,324000.00,'2023-09-15'),(88,38,88,72,396000.00,'2024-04-15'),(89,9,89,48,300000.00,'2023-11-15'),(90,20,90,80,432000.00,'2024-03-15'),(91,31,91,64,360000.00,'2023-07-15'),(92,2,92,56,324000.00,'2024-05-15'),(93,13,93,72,396000.00,'2023-12-15');
/*!40000 ALTER TABLE `factura_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_paciente`
--

DROP TABLE IF EXISTS `factura_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_paciente` (
  `id_factura_paciente` int NOT NULL AUTO_INCREMENT,
  `id_tratamiento` int NOT NULL,
  `id_paciente` int NOT NULL,
  `cuota` decimal(12,2) NOT NULL,
  `mes_facturado` date DEFAULT NULL,
  PRIMARY KEY (`id_factura_paciente`),
  KEY `FK_facutra_paciente_id_tratamiento` (`id_tratamiento`),
  KEY `FK_factura_paciente_id_paciente` (`id_paciente`),
  CONSTRAINT `FK_factura_paciente_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_facutra_paciente_id_tratamiento` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamientos` (`id_tratamiento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para facturar los servicios prestados por los Medicos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_paciente`
--

LOCK TABLES `factura_paciente` WRITE;
/*!40000 ALTER TABLE `factura_paciente` DISABLE KEYS */;
INSERT INTO `factura_paciente` VALUES (1,1,1,382000.00,'2023-05-15'),(2,2,2,295000.00,'2024-02-15'),(3,3,3,347000.00,'2023-09-15'),(4,4,4,312000.00,'2024-01-15'),(5,5,5,378000.00,'2023-11-15'),(6,6,6,267000.00,'2024-03-15'),(7,7,7,354000.00,'2023-07-15'),(8,8,8,289000.00,'2024-06-15'),(9,9,9,396000.00,'2023-12-15'),(10,10,10,328000.00,'2024-04-15'),(11,11,11,371000.00,'2023-08-15'),(12,12,12,276000.00,'2024-05-15'),(13,13,13,389000.00,'2023-10-15'),(14,14,14,304000.00,'2024-01-15'),(15,15,15,359000.00,'2023-06-15'),(16,16,16,283000.00,'2024-03-15'),(17,17,17,342000.00,'2023-09-15'),(18,18,18,297000.00,'2024-02-15'),(19,19,19,385000.00,'2023-11-15'),(20,20,20,316000.00,'2024-05-15'),(21,21,21,368000.00,'2023-07-15'),(22,22,22,279000.00,'2024-04-15'),(23,23,23,393000.00,'2023-12-15'),(24,24,24,301000.00,'2024-01-15'),(25,25,25,356000.00,'2023-08-15'),(26,26,26,285000.00,'2024-06-15'),(27,27,27,374000.00,'2023-10-15'),(28,28,28,292000.00,'2024-03-24'),(29,29,29,348000.00,'2023-05-24'),(30,30,30,308000.00,'2024-02-24'),(31,31,31,397000.00,'2023-09-24'),(32,32,32,321000.00,'2024-01-24'),(33,33,33,365000.00,'2023-11-24'),(34,34,34,273000.00,'2024-04-24'),(35,35,35,388000.00,'2023-07-24'),(36,36,36,299000.00,'2024-05-24'),(37,37,37,352000.00,'2023-12-24'),(38,38,38,287000.00,'2024-03-24'),(39,39,39,339000.00,'2023-08-24'),(40,40,40,314000.00,'2024-06-24'),(41,41,41,381000.00,'2023-10-24'),(42,42,42,294000.00,'2024-02-24'),(43,43,43,357000.00,'2023-05-24'),(44,44,44,311000.00,'2024-01-24'),(45,45,45,376000.00,'2023-09-24'),(46,46,46,268000.00,'2024-04-24'),(47,47,47,343000.00,'2023-11-24'),(48,48,48,306000.00,'2024-03-24'),(49,49,49,392000.00,'2023-07-24'),(50,50,50,325000.00,'2024-05-15'),(51,51,51,369000.00,'2023-12-15'),(52,52,52,277000.00,'2024-02-15'),(53,53,53,386000.00,'2023-08-15'),(54,54,54,302000.00,'2024-06-15'),(55,55,55,361000.00,'2023-10-15'),(56,56,56,284000.00,'2024-01-15'),(57,57,57,349000.00,'2023-05-15'),(58,58,58,298000.00,'2024-03-15'),(59,59,59,375000.00,'2023-09-15'),(60,60,60,317000.00,'2024-04-15'),(61,61,61,362000.00,'2023-11-15'),(62,62,62,280000.00,'2024-02-15'),(63,63,63,394000.00,'2023-07-15'),(64,64,64,309000.00,'2024-05-15'),(65,65,65,355000.00,'2023-12-15'),(66,66,66,286000.00,'2024-01-15'),(67,67,67,372000.00,'2023-08-15'),(68,68,68,293000.00,'2024-06-15'),(69,69,69,345000.00,'2023-10-15'),(70,70,70,307000.00,'2024-03-15'),(71,71,71,398000.00,'2023-05-08'),(72,72,72,322000.00,'2024-02-08'),(73,73,73,366000.00,'2023-09-08'),(74,74,74,274000.00,'2024-01-08'),(75,75,75,387000.00,'2023-11-08'),(76,76,76,300000.00,'2024-04-08'),(77,77,77,353000.00,'2023-07-08'),(78,78,78,288000.00,'2024-05-08'),(79,79,79,340000.00,'2023-12-08'),(80,80,80,315000.00,'2024-03-08'),(81,81,81,379000.00,'2023-08-08'),(82,82,82,296000.00,'2024-06-08'),(83,83,83,358000.00,'2023-10-08'),(84,84,84,313000.00,'2024-02-08'),(85,85,85,377000.00,'2023-05-08'),(86,86,86,269000.00,'2024-01-08'),(87,87,87,344000.00,'2023-09-08'),(88,88,88,305000.00,'2024-04-08'),(89,89,89,391000.00,'2023-11-08'),(90,90,90,326000.00,'2024-03-08'),(91,91,91,370000.00,'2023-07-08'),(92,92,92,278000.00,'2024-05-08'),(93,93,93,384000.00,'2023-12-08');
/*!40000 ALTER TABLE `factura_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `honorario_facturas`
--

DROP TABLE IF EXISTS `honorario_facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `honorario_facturas` (
  `id_honorario_factura` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `mes_facturado` date DEFAULT NULL,
  PRIMARY KEY (`id_honorario_factura`),
  KEY `FK_honorario_facturas_id_empleado` (`id_empleado`),
  CONSTRAINT `FK_honorario_facturas_id_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para registrar la facturacion de los empleados del Centro Medico';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `honorario_facturas`
--

LOCK TABLES `honorario_facturas` WRITE;
/*!40000 ALTER TABLE `honorario_facturas` DISABLE KEYS */;
INSERT INTO `honorario_facturas` VALUES (1,1,'2024-06-28'),(2,2,'2024-06-28'),(3,3,'2024-06-28'),(4,4,'2024-06-28'),(5,5,'2024-06-28'),(6,6,'2024-06-28'),(7,7,'2024-06-28'),(8,8,'2024-06-28'),(9,9,'2024-06-28'),(10,10,'2022-12-15'),(11,11,'2024-01-04'),(12,12,'2024-12-02'),(13,13,'2024-09-06'),(14,14,'2022-08-19'),(15,15,'2022-07-01'),(16,16,'2024-06-05'),(17,17,'2023-07-22'),(18,18,'2024-12-17'),(19,19,'2022-05-27'),(20,20,'2024-05-23'),(21,21,'2023-10-06'),(22,22,'2024-02-10'),(23,23,'2023-01-17'),(24,24,'2023-03-15'),(25,25,'2024-02-02'),(26,26,'2024-01-22'),(27,27,'2023-06-19'),(28,28,'2024-10-22'),(29,29,'2022-08-17'),(30,30,'2024-06-27'),(31,31,'2024-02-23'),(32,32,'2024-02-24'),(33,33,'2022-07-27'),(34,34,'2022-09-25'),(35,35,'2024-07-12'),(36,36,'2024-05-03'),(37,37,'2022-09-21'),(38,38,'2022-11-09');
/*!40000 ALTER TABLE `honorario_facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matriculas` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `id_medico` int NOT NULL,
  `numero_matricula` bigint NOT NULL,
  PRIMARY KEY (`id_matricula`),
  UNIQUE KEY `numero_matricula` (`numero_matricula`),
  KEY `FK_MATRICULAS_id_medico` (`id_medico`),
  CONSTRAINT `FK_MATRICULAS_id_medico` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar las matriculas de los profesionales.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculas`
--

LOCK TABLES `matriculas` WRITE;
/*!40000 ALTER TABLE `matriculas` DISABLE KEYS */;
INSERT INTO `matriculas` VALUES (1,1,45781423),(2,2,45735192),(3,3,45746785),(4,4,45798213),(5,5,45713579),(6,6,45762491),(7,7,45785329),(8,8,45749218),(9,9,45721987),(10,10,45765432),(11,11,45738195),(12,12,45792843),(13,13,45711749),(14,14,45776625),(15,15,45763891),(16,16,45782419),(17,17,45735114),(18,18,45759467),(19,19,45782131),(20,20,45713524),(21,21,45798275),(22,22,45762435),(23,23,45785393),(24,24,45749282),(25,25,45721941),(26,26,45765498),(27,27,45738151),(28,28,45792897),(29,29,45711703),(30,30,45776689),(31,31,45763845),(32,32,45782483),(33,33,45735178),(34,34,45759421),(35,35,45782195),(36,36,45713588),(37,37,45798239),(38,38,45762499),(39,39,45785357),(40,40,45749246);
/*!40000 ALTER TABLE `matriculas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`gabriel`@`%`*/ /*!50003 TRIGGER `insertar_RUP_matricula` AFTER INSERT ON `matriculas` FOR EACH ROW BEGIN 
		
		DECLARE check_id_matricula INT;
	
		SELECT srm.id_matricula INTO check_id_matricula
		FROM centro_medico.RUP_registro_matriculas AS srm
		WHERE srm.id_matricula = NEW.id_matricula;
	
	
		IF check_id_matricula IS NULL THEN
			INSERT INTO centro_medico.RUP_registro_matriculas 
				( id_matricula, fecha_registrada )
			VALUES 
				(NEW.id_matricula , DATE(CURRENT_DATE));
			
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
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`gabriel`@`%`*/ /*!50003 TRIGGER `alta_medico_controller_matricula` AFTER INSERT ON `matriculas` FOR EACH ROW BEGIN 
		
		DECLARE check_id_medico INT;
	
		-- Checkeando el id_medico de la matricula.
		SELECT m.id_medico INTO check_id_medico
		FROM centro_medico.medicos AS m
		WHERE m.id_medico = NEW.id_medico;
	
		IF check_id_medico IS NOT NULL THEN
			UPDATE centro_medico.alta_medico_control
			SET num_matricula = NEW.numero_matricula
			WHERE id_medico = check_id_medico;
		END IF;
		
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `id_centro_medico` int NOT NULL,
  `nombre_medico` varchar(255) NOT NULL,
  `apellido_medico` varchar(255) NOT NULL,
  `cuit` bigint NOT NULL,
  `email` varchar(255) NOT NULL,
  `estado` tinyint(1) DEFAULT '0',
  `fecha_alta` date DEFAULT NULL,
  PRIMARY KEY (`id_medico`),
  UNIQUE KEY `cuit` (`cuit`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_centros_medicos_medicos` (`id_centro_medico`),
  CONSTRAINT `fk_centros_medicos_medicos` FOREIGN KEY (`id_centro_medico`) REFERENCES `centros_medicos` (`id_centro_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar los medicos/profesionales del Centro Medico';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES (1,1,'Luciana','Murillo',20284567845,'luciana_murillo@gmail.com',0,'2022-10-05'),(2,2,'Gloria','Acosta',20254854576,'gloria_acosta@gmail.com',0,'2021-08-07'),(3,3,'Alexander','Ceballos',20310254567,'alexander_ceballos@gmail.com',0,'2021-10-01'),(4,1,'Carlos','Maldonado',20285154568,'carlos_maldonado@gmail.com',0,'2022-01-12'),(5,2,'Jessica','Prado',20264591589,'jessica_prado@gmail.com',0,'2021-08-12'),(6,3,'Martin','Sanchez',20301234590,'martin_sanchez@gmail.com',0,'2022-03-15'),(7,1,'Laura','Gomez',20289876591,'laura_gomez@gmail.com',0,'2021-11-20'),(8,2,'Federico','Lopez',20276543292,'federico_lopez@gmail.com',0,'2022-05-03'),(9,3,'Valentina','Rodriguez',20298765493,'valentina_rodriguez@gmail.com',0,'2021-09-28'),(10,1,'Sebastian','Torres',20287654394,'sebastian_torres@gmail.com',0,'2022-02-14'),(11,2,'Camila','Fernandez',20265432195,'camila_fernandez@gmail.com',0,'2021-12-07'),(12,3,'Nicolas','Perez',20309876596,'nicolas_perez@gmail.com',0,'2022-04-19'),(13,1,'Sofia','Diaz',20287654397,'sofia_diaz@gmail.com',0,'2021-10-30'),(14,2,'Matias','Garcia',20298765498,'matias_garcia@gmail.com',0,'2022-06-22'),(15,3,'Florencia','Martinez',20276543299,'florencia_martinez@gmail.com',0,'2021-08-25'),(16,1,'Joaquin','Gonzalez',20310987600,'joaquin_gonzalez@gmail.com',0,'2022-01-05'),(17,2,'Valeria','Herrera',20287654301,'valeria_herrera@gmail.com',0,'2021-11-11'),(18,3,'Lucas','Silva',20298765402,'lucas_silva@gmail.com',0,'2022-03-28'),(19,1,'Carolina','Romero',20265432103,'carolina_romero@gmail.com',0,'2021-09-14'),(20,2,'Ignacio','Morales',20309876504,'ignacio_morales@gmail.com',0,'2022-05-17'),(21,3,'Mariana','Castro',20287654305,'mariana_castro@gmail.com',0,'2021-12-20'),(22,1,'Emiliano','Suarez',20298765406,'emiliano_suarez@gmail.com',0,'2022-02-02'),(23,2,'Julieta','Ortiz',20276543207,'julieta_ortiz@gmail.com',0,'2021-10-09'),(24,3,'Tomas','Peralta',20310987608,'tomas_peralta@gmail.com',0,'2022-04-23'),(25,1,'Agustina','Vargas',20287654309,'agustina_vargas@gmail.com',0,'2021-08-18'),(26,2,'Facundo','Ramos',20298765410,'facundo_ramos@gmail.com',0,'2022-06-06'),(27,3,'Micaela','Medina',20265432111,'micaela_medina@gmail.com',0,'2021-11-29'),(28,1,'Lautaro','Gimenez',20309876512,'lautaro_gimenez@gmail.com',0,'2022-01-15'),(29,2,'Candela','Luna',20287654313,'candela_luna@gmail.com',0,'2021-09-03'),(30,3,'Bruno','Rojas',20298765414,'bruno_rojas@gmail.com',0,'2022-03-10'),(31,1,'Abril','Molina',20276543215,'abril_molina@gmail.com',0,'2021-12-13'),(32,2,'Dante','Aguirre',20310987616,'dante_aguirre@gmail.com',0,'2022-05-26'),(33,3,'Renata','Paz',20287654317,'renata_paz@gmail.com',0,'2021-10-19'),(34,1,'Thiago','Vega',20298765418,'thiago_vega@gmail.com',0,'2022-02-28'),(35,2,'Martina','Rios',20265432119,'martina_rios@gmail.com',0,'2021-08-31'),(36,3,'Benjamin','Cabrera',20309876520,'benjamin_cabrera@gmail.com',0,'2022-04-07'),(37,1,'Catalina','Mendoza',20287654321,'catalina_mendoza@gmail.com',0,'2021-11-23'),(38,2,'Santiago','Benitez',20298765422,'santiago_benitez@gmail.com',0,'2022-06-15'),(39,3,'Delfina','Acuna',20276543223,'delfina_acuna@gmail.com',0,'2021-09-20'),(40,1,'Mateo','Villalba',20310987624,'mateo_villalba@gmail.com',0,'2022-01-08');
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`gabriel`@`%`*/ /*!50003 TRIGGER `alta_medico_controller` AFTER INSERT ON `medicos` FOR EACH ROW BEGIN 
		
		DECLARE full_name VARCHAR(255);
	
		SET full_name = CONCAT(NEW.nombre_medico, ' ', NEW.apellido_medico);
	
		INSERT INTO centro_medico.alta_medico_control
			(id_medico, full_name, cuit, email, fecha_alta, usuario)
		VALUES
			(NEW.id_medico, full_name, NEW.cuit, NEW.email, NEW.fecha_alta, USER());
		
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `obra_social_empleados`
--

DROP TABLE IF EXISTS `obra_social_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obra_social_empleados` (
  `id_obra_social_empleados` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `nombre_obra_social` varchar(255) NOT NULL,
  `carnet_numero` bigint NOT NULL,
  `fecha_alta` date DEFAULT NULL,
  PRIMARY KEY (`id_obra_social_empleados`),
  UNIQUE KEY `carnet_numero` (`carnet_numero`),
  KEY `FK_id_empleado_obra_social` (`id_empleado`),
  CONSTRAINT `FK_id_empleado_obra_social` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar la relacion de empleados y obra social del centro medico';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obra_social_empleados`
--

LOCK TABLES `obra_social_empleados` WRITE;
/*!40000 ALTER TABLE `obra_social_empleados` DISABLE KEYS */;
INSERT INTO `obra_social_empleados` VALUES (1,1,'SANCOR',752159,'2018-11-05'),(2,2,'SANCOR',752177,'2018-12-25'),(3,3,'SANCOR',752100,'2018-10-11'),(4,4,'UOCRA',19277,'2019-05-06'),(5,5,'UOCRA',19241,'2019-10-25'),(6,6,'UOCRA',19200,'2019-11-20'),(7,7,'SANCOR',74259,'2020-08-17'),(8,8,'SANCOR',78515,'2020-07-20'),(9,9,'SANCOR',78555,'2020-01-17'),(10,10,'OSDE',4527482,'2021-02-15'),(11,11,'OSDE',4527481,'2022-03-10'),(12,12,'OSDE',4527480,'2021-04-12'),(13,13,'OSDE',4727480,'2021-05-21'),(14,14,'UOCRA',12520,'2022-06-30'),(15,15,'OSDE',7159852,'2021-07-19'),(16,16,'OSDE',7160155,'2022-08-28'),(17,17,'OSDE',7159999,'2022-09-15'),(18,18,'SANCOR',75655,'2022-10-14'),(19,19,'SANCOR',71255,'2023-11-03'),(20,20,'OSDE',4527478,'2023-12-22'),(21,21,'UOCRA',14513,'2023-01-29'),(22,22,'OSDE',5256321,'2023-02-28'),(23,23,'OSDE',5299321,'2023-02-28'),(24,24,'SANCOR',74250,'2023-04-23'),(25,25,'UOCRA',16419,'2023-05-15'),(26,26,'UOCRA',16418,'2023-06-16'),(27,27,'UOCRA',16417,'2023-07-20'),(28,28,'SANCOR',72548,'2023-08-24'),(29,29,'SANCOR',79559,'2023-11-27'),(30,30,'SANCOR',74741,'2023-11-28'),(31,31,'SANCOR',70154,'2023-11-01'),(32,32,'OSDE',2154852,'2023-12-29'),(33,33,'OSDE',2151445,'2023-08-29'),(34,34,'OSDE',2151777,'2023-02-26'),(35,35,'SANCOR',77520,'2023-03-29'),(36,36,'SANCOR',69520,'2023-04-20'),(37,37,'UOCRA',12584,'2023-05-25'),(38,38,'SANCOR',69720,'2023-06-22');
/*!40000 ALTER TABLE `obra_social_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obra_social_pacientes`
--

DROP TABLE IF EXISTS `obra_social_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obra_social_pacientes` (
  `id_obra_social_pacientes` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `nombre_obra_social_paciente` varchar(255) NOT NULL,
  `carnet_numero` bigint NOT NULL,
  PRIMARY KEY (`id_obra_social_pacientes`),
  UNIQUE KEY `carnet_numero` (`carnet_numero`),
  KEY `FK_id_paciente` (`id_paciente`),
  CONSTRAINT `FK_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar la relacion entre pacientes y sus obras sociales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obra_social_pacientes`
--

LOCK TABLES `obra_social_pacientes` WRITE;
/*!40000 ALTER TABLE `obra_social_pacientes` DISABLE KEYS */;
INSERT INTO `obra_social_pacientes` VALUES (1,1,'OSDE',456254),(2,2,'SANCOR',952580),(3,3,'SWISSMEDICAL',159456),(4,4,'VITAL',741582),(5,5,'OSPE',148595),(6,6,'OSDE',456355),(7,7,'SANCOR',952581),(8,8,'SWISSMEDICAL',159457),(9,9,'VITAL',741583),(10,10,'OSPE',148596),(11,11,'OSDE',456356),(12,12,'SANCOR',952582),(13,13,'SWISSMEDICAL',159458),(14,14,'VITAL',741584),(15,15,'OSPE',148597),(16,16,'OSDE',456357),(17,17,'SANCOR',952583),(18,18,'SWISSMEDICAL',159459),(19,19,'VITAL',741585),(20,20,'OSPE',148598),(21,21,'OSDE',456358),(22,22,'SANCOR',952584),(23,23,'SWISSMEDICAL',159460),(24,24,'VITAL',741586),(25,25,'OSPE',148599),(26,26,'OSDE',456359),(27,27,'SANCOR',952585),(28,28,'SWISSMEDICAL',159461),(29,29,'VITAL',741587),(30,30,'OSPE',148600),(31,31,'OSDE',456360),(32,32,'SANCOR',952586),(33,33,'SWISSMEDICAL',159462),(34,34,'VITAL',741588),(35,35,'OSPE',148601),(36,36,'OSDE',456361),(37,37,'SANCOR',952587),(38,38,'SWISSMEDICAL',159463),(39,39,'VITAL',741589),(40,40,'OSPE',148602),(41,41,'OSDE',456362),(42,42,'SANCOR',952588),(43,43,'SWISSMEDICAL',159464),(44,44,'VITAL',741590),(45,45,'OSPE',148603),(46,46,'OSDE',456363),(47,47,'SANCOR',952589),(48,48,'SWISSMEDICAL',159465),(49,49,'VITAL',741591),(50,50,'OSPE',148604),(51,51,'OSDE',456364),(52,52,'SANCOR',952590),(53,53,'SWISSMEDICAL',159466),(54,54,'VITAL',741592),(55,55,'OSPE',148605),(56,56,'OSDE',456365),(57,57,'SANCOR',952591),(58,58,'SWISSMEDICAL',159467),(59,59,'VITAL',741593),(60,60,'OSPE',148606),(61,61,'OSDE',456366),(62,62,'SANCOR',952592),(63,63,'SWISSMEDICAL',159468),(64,64,'VITAL',741594),(65,65,'OSPE',148607),(66,66,'OSDE',456367),(67,67,'SANCOR',952593),(68,68,'SWISSMEDICAL',159469),(69,69,'VITAL',741595),(70,70,'OSPE',148608),(71,71,'OSDE',456368),(72,72,'SANCOR',952594),(73,73,'SWISSMEDICAL',159470),(74,74,'VITAL',741596),(75,75,'OSPE',148609),(76,76,'OSDE',456369),(77,77,'SANCOR',952595),(78,78,'SWISSMEDICAL',159471),(79,79,'VITAL',741597),(80,80,'OSPE',148610),(81,81,'OSDE',456370),(82,82,'SANCOR',952596),(83,83,'SWISSMEDICAL',159472),(84,84,'VITAL',741598),(85,85,'OSPE',148611),(86,86,'OSDE',456371),(87,87,'SANCOR',952597),(88,88,'SWISSMEDICAL',159473),(89,89,'VITAL',741599),(90,90,'OSPE',148612),(91,91,'OSDE',456372),(92,92,'SANCOR',952598),(93,93,'SWISSMEDICAL',159474);
/*!40000 ALTER TABLE `obra_social_pacientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`gabriel`@`%`*/ /*!50003 TRIGGER `alta_paciente_controller_OS` AFTER INSERT ON `obra_social_pacientes` FOR EACH ROW BEGIN 
		
		DECLARE check_obra_social VARCHAR(255);

		SET check_obra_social = UPPER(check_obra_social);
	
		SELECT osp.nombre_obra_social_paciente INTO check_obra_social
		FROM centro_medico.obra_social_pacientes AS osp
		WHERE osp.id_paciente = NEW.id_paciente;
	
		
		UPDATE centro_medico.alta_paciente_control 
		SET obra_social = check_obra_social
		WHERE id_paciente = NEW.id_paciente;

		
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `id_centro_medico` int NOT NULL,
  `nombre_paciente` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `dni` bigint NOT NULL,
  `fecha_alta` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '0',
  `tiene_obra_social` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `dni` (`dni`),
  KEY `fk_centros_medicos_pacientes` (`id_centro_medico`),
  CONSTRAINT `fk_centros_medicos_pacientes` FOREIGN KEY (`id_centro_medico`) REFERENCES `centros_medicos` (`id_centro_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena pacientes del Centro Medico';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (1,1,'Juan','Garcia',30123456,'2022-03-15',0,1),(2,2,'Maria','Lopez',31234567,'2023-01-20',0,1),(3,3,'Pedro','Martinez',32345678,'2021-11-05',0,1),(4,1,'Ana','Rodriguez',33456789,'2023-06-30',0,1),(5,2,'Carlos','Fernandez',34567890,'2022-09-10',0,1),(6,3,'Laura','Gonzalez',35678901,'2023-04-25',0,1),(7,1,'Miguel','Perez',36789012,'2021-08-12',0,1),(8,2,'Sofia','Sanchez',37890123,'2022-12-03',0,1),(9,3,'Diego','Romero',38901234,'2023-02-18',0,1),(10,1,'Valentina','Torres',39012345,'2022-07-09',0,1),(11,2,'Javier','Navarro',40123456,'2023-05-14',0,1),(12,3,'Lucia','Morales',41234567,'2021-10-28',0,1),(13,1,'Mateo','Jimenez',42345678,'2023-03-07',0,1),(14,2,'Camila','Ruiz',43456789,'2022-06-22',0,1),(15,3,'Andres','Hernandez',44567890,'2023-01-11',0,1),(16,1,'Isabella','Diaz',45678901,'2022-04-19',0,1),(17,2,'Alejandro','alvarez',46789012,'2023-08-02',0,1),(18,3,'Valeria','Munoz',47890123,'2021-12-16',0,1),(19,1,'Daniel','Rojas',48901234,'2023-07-05',0,1),(20,2,'Paula','Moreno',49012345,'2022-02-27',0,1),(21,3,'Sebastian','Vargas',50123456,'2023-09-21',0,1),(22,1,'Mariana','Castro',51234567,'2022-11-08',0,1),(23,2,'Gabriel','Ortiz',52345678,'2023-04-13',0,1),(24,3,'Catalina','Silva',53456789,'2021-09-30',0,1),(25,1,'Emilio','Nunez',54567890,'2023-06-17',0,1),(26,2,'Antonella','Campos',55678901,'2022-01-24',0,1),(27,3,'Felipe','Contreras',56789012,'2023-10-09',0,1),(28,1,'Renata','Flores',57890123,'2022-08-06',0,1),(29,2,'Martin','Reyes',58901234,'2023-03-29',0,1),(30,3,'Victoria','Acosta',59012345,'2021-11-14',0,1),(31,1,'Tomas','Medina',60123456,'2023-07-23',0,1),(32,2,'Florencia','Ramos',61234567,'2022-05-01',0,1),(33,3,'Joaquin','Vega',62345678,'2023-02-10',0,1),(34,1,'Elena','Molina',63456789,'2022-10-18',0,1),(35,2,'Nicolas','Guzman',64567890,'2023-05-27',0,1),(36,3,'Agustina','Herrera',65678901,'2021-12-04',0,1),(37,1,'Ignacio','Cortes',66789012,'2023-08-15',0,1),(38,2,'Abril','Guerrero',67890123,'2022-03-22',0,1),(39,3,'Maximiliano','Mendez',68901234,'2023-01-07',0,1),(40,1,'Delfina','Arias',69012345,'2022-06-13',0,1),(41,2,'Facundo','Valdez',70123456,'2023-09-28',0,1),(42,3,'Julieta','Benitez',71234567,'2021-11-25',0,1),(43,1,'Benjamin','Rivero',72345678,'2023-04-03',0,1),(44,2,'Constanza','Figueroa',73456789,'2022-07-19',0,1),(45,3,'Thiago','Luna',74567890,'2023-02-26',0,1),(46,1,'Celeste','Aguirre',75678901,'2022-09-11',0,1),(47,2,'Lautaro','Paz',76789012,'2023-06-08',0,1),(48,3,'Bianca','Pereyra',77890123,'2021-10-23',0,1),(49,1,'Santino','Soto',78901234,'2023-03-18',0,1),(50,2,'Micaela','Cabrera',79012345,'2022-01-05',0,1),(51,3,'Bruno','Ledesma',80123456,'2023-08-30',0,1),(52,1,'Candela','Godoy',81234567,'2022-12-14',0,1),(53,2,'Nahuel','Vidal',82345678,'2023-05-21',0,1),(54,3,'Martina','Ojeda',83456789,'2021-09-07',0,1),(55,1,'Franco','Miranda',84567890,'2023-07-12',0,1),(56,2,'Josefina','Ponce',85678901,'2022-04-29',0,1),(57,3,'Bautista','Vera',86789012,'2023-01-16',0,1),(58,1,'Malena','Gimenez',87890123,'2022-08-23',0,1),(59,2,'Jeronimo','Ibanez',88901234,'2023-03-02',0,1),(60,3,'Paulina','Chavez',89012345,'2021-11-19',0,1),(61,1,'Dante','Carrasco',90123456,'2023-06-25',0,1),(62,2,'Lola','Rios',91234567,'2022-02-09',0,1),(63,3,'Julian','Escobar',92345678,'2023-09-14',0,1),(64,1,'Alma','Suarez',93456789,'2022-10-31',0,1),(65,2,'Ramiro','Gallardo',94567890,'2023-04-07',0,1),(66,3,'Emilia','Quintero',95678901,'2021-12-22',0,1),(67,1,'Ciro','Ayala',96789012,'2023-07-28',0,1),(68,2,'Pilar','Blanco',97890123,'2022-05-15',0,1),(69,3,'Maximo','Caceres',98901234,'2023-02-01',0,1),(70,1,'Morena','Villalba',99012345,'2022-09-26',0,1),(71,2,'Salvador','Quiroga',10012345,'2023-06-03',0,1),(72,3,'Abril','Salazar',10123456,'2021-10-10',0,1),(73,1,'Guadalupe','Rivas',10234567,'2023-03-24',0,1),(74,2,'Valentin','Coronel',10345678,'2022-01-30',0,1),(75,3,'Olivia','Acuna',10456789,'2023-08-19',0,1),(76,1,'Benicio','Peralta',10567890,'2022-11-06',0,1),(77,2,'Mia','Varela',10678901,'2023-05-12',0,1),(78,3,'Simon','Maldonado',10789012,'2021-09-17',0,1),(79,1,'Amparo','Pacheco',10890123,'2023-07-02',0,1),(80,2,'Octavio','Andrade',10901234,'2022-04-08',0,1),(81,3,'Juana','Aguilera',11012345,'2023-01-27',0,1),(82,1,'Lorenzo','Villanueva',11123456,'2022-08-13',0,1),(83,2,'Zoe','Zambrano',11234567,'2023-03-09',0,1),(84,3,'Ulises','Tapia',11345678,'2021-11-30',0,1),(85,1,'Amelia','Cano',11456789,'2023-06-20',0,1),(86,2,'Gonzalo','Sosa',11567890,'2022-02-16',0,1),(87,3,'Trinidad','Arce',11678901,'2023-09-05',0,1),(88,1,'Lisandro','Calderon',11789012,'2022-12-28',0,1),(89,2,'Renata','Villegas',11890123,'2023-04-23',0,1),(90,3,'Ian','Gomez',11901234,'2021-10-01',0,1),(91,1,'Lara','Paez',12012345,'2023-07-18',0,1),(92,2,'Tiziano','Vera Cruz',12123456,'2022-05-25',0,1),(93,3,'Emiliano','Palacios',12234567,'2023-02-07',0,1);
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`gabriel`@`%`*/ /*!50003 TRIGGER `alta_paciente_controller` AFTER INSERT ON `pacientes` FOR EACH ROW BEGIN 
		
		DECLARE full_name VARCHAR(255);
	
		SET full_name = CONCAT(NEW.nombre_paciente, ' ', NEW.apellido);
		
		INSERT INTO centro_medico.alta_paciente_control
			(id_paciente, nombres, fecha_alta, usuario)
		VALUES
			(NEW.id_paciente, full_name, NEW.fecha_alta, USER());
		
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `profesion_medicos`
--

DROP TABLE IF EXISTS `profesion_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesion_medicos` (
  `id_profesion` int NOT NULL,
  `id_medico` int NOT NULL,
  PRIMARY KEY (`id_profesion`,`id_medico`),
  KEY `FK_id_medico` (`id_medico`),
  CONSTRAINT `FK_id_medico` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_profesion` FOREIGN KEY (`id_profesion`) REFERENCES `profesiones` (`id_profesion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla intermedia para relacionar medicos con profesiones.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion_medicos`
--

LOCK TABLES `profesion_medicos` WRITE;
/*!40000 ALTER TABLE `profesion_medicos` DISABLE KEYS */;
INSERT INTO `profesion_medicos` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(1,9),(2,10),(3,11),(4,12),(5,13),(6,14),(7,15),(8,16),(1,17),(2,18),(3,19),(4,20),(5,21),(6,22),(7,23),(8,24),(1,25),(2,26),(3,27),(4,28),(5,29),(6,30),(7,31),(8,32),(1,33),(2,34),(3,35),(4,36),(5,37),(6,38),(7,39),(8,40);
/*!40000 ALTER TABLE `profesion_medicos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`gabriel`@`%`*/ /*!50003 TRIGGER `alta_medico_controller_profesion` AFTER INSERT ON `profesion_medicos` FOR EACH ROW BEGIN 	
		
		DECLARE check_profesion VARCHAR(255);
		
		SELECT prof.nombre_profesion INTO check_profesion
		FROM centro_medico.medicos AS m
		JOIN centro_medico.profesion_medicos AS pm
			USING(id_medico)
		JOIN centro_medico.profesiones AS prof
			USING(id_profesion)
		WHERE m.id_medico = NEW.id_medico;
	
		IF check_profesion IS NOT NULL THEN
			UPDATE centro_medico.alta_medico_control
			SET profesion =  check_profesion
			WHERE id_medico = NEW.id_medico;
		END IF;
		
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `profesiones`
--

DROP TABLE IF EXISTS `profesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesiones` (
  `id_profesion` int NOT NULL AUTO_INCREMENT,
  `nombre_profesion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_profesion`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar las profesiones de los Medicos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesiones`
--

LOCK TABLES `profesiones` WRITE;
/*!40000 ALTER TABLE `profesiones` DISABLE KEYS */;
INSERT INTO `profesiones` VALUES (1,'psicologia'),(2,'psicopedagogia'),(3,'fonoaudiologia'),(4,'logopeda'),(5,'acompanante terapeutico'),(6,'psiquiatra'),(7,'enfermeria'),(8,'neurologia'),(9,'psiquiatria infantil y asolescente'),(10,'neuropsicologia');
/*!40000 ALTER TABLE `profesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `id_puesto` int NOT NULL AUTO_INCREMENT,
  `nombre_puesto` varchar(255) NOT NULL,
  `honorario_mensual` decimal(10,2) NOT NULL,
  `descripcion_puesto` varchar(255) NOT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar los diferentes puestos de trabajo del Centro Medico excepto los Medicos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'limpieza/maestranza',517555.87,'encargados de mantener la limpieza y el orden del establecimiento'),(2,'seguridad',625120.88,'encargado de mantener la integridad fisica y material del establecimiento y las personas'),(3,'recepcion',450000.50,'atender a los pacientes y coordinar citas o consultas'),(4,'mantenimiento',530000.00,'encargados de reparar y mantener las instalaciones del centro medico'),(5,'farmacia',470000.75,'gestionar el stock de medicamentos y suministros medicos'),(6,'administracion',480000.80,'realizar tareas administrativas y de oficina del centro medico'),(7,'radiologia',600000.90,'gestionar y operar equipos de diagnostico por imagen'),(8,'laboratorio',590000.60,'procesar muestras y realizar analisis clinicos'),(9,'soporte tecnico',550000.45,'encargados del mantenimiento y soporte de los sistemas informaticos');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamientos`
--

DROP TABLE IF EXISTS `tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamientos` (
  `id_tratamiento` int NOT NULL AUTO_INCREMENT,
  `id_centro_medico` int NOT NULL,
  `id_medico` int NOT NULL,
  `id_paciente` int NOT NULL,
  `descripcion` text,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_tratamiento`),
  KEY `FK_tratamientos_id_medico` (`id_medico`),
  KEY `FK_tratamientos_id_paciente` (`id_paciente`),
  KEY `fk_centros_medicos_tratamientos` (`id_centro_medico`),
  CONSTRAINT `fk_centros_medicos_tratamientos` FOREIGN KEY (`id_centro_medico`) REFERENCES `centros_medicos` (`id_centro_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tratamientos_id_medico` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tratamientos_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar los tratamientos vinculando paciente/medico y el detalle del tratamiento';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamientos`
--

LOCK TABLES `tratamientos` WRITE;
/*!40000 ALTER TABLE `tratamientos` DISABLE KEYS */;
INSERT INTO `tratamientos` VALUES (1,1,1,1,'Paciente con problemas de ansiedad y depresion','2022-08-28',NULL),(2,2,2,2,'Paciente con trastorno de deficit de atencion e hiperactividad','2022-07-30',NULL),(3,3,3,3,'Paciente con insomnio cronico','2022-06-02',NULL),(4,1,4,4,'Paciente con trastorno bipolar','2023-09-26',NULL),(5,2,5,5,'Paciente con esquizofrenia','2024-01-05',NULL),(6,3,6,6,'Paciente con trastorno obsesivo compulsivo','2023-11-19',NULL),(7,1,7,7,'Paciente con fobia social','2021-10-30',NULL),(8,2,8,8,'Paciente con anorexia nerviosa','2023-02-25',NULL),(9,3,9,9,'Paciente con bulimia nerviosa','2022-12-15',NULL),(10,1,10,10,'Paciente con trastorno de personalidad limite','2023-05-07',NULL),(11,2,11,11,'Paciente con adiccion al juego','2022-09-18',NULL),(12,3,12,12,'Paciente con adiccion al alcohol','2023-08-01',NULL),(13,1,13,13,'Paciente con adiccion a opiaceos','2024-02-10',NULL),(14,2,14,14,'Paciente con trastorno de estres postraumatico','2023-03-22',NULL),(15,3,15,15,'Paciente con agorafobia','2022-11-05',NULL),(16,1,16,16,'Paciente con trastorno disociativo','2023-07-14',NULL),(17,2,17,17,'Paciente con trastorno de la alimentacion','2022-10-09',NULL),(18,3,18,18,'Paciente con trastorno del sueno','2023-04-30',NULL),(19,1,19,19,'Paciente con trastorno de adaptacion','2024-01-20',NULL),(20,2,20,20,'Paciente con trastorno disforico','2023-06-11',NULL),(21,3,21,21,'Paciente con trastorno de panico','2022-08-03',NULL),(22,1,22,22,'Paciente con fobia especifica','2023-10-25',NULL),(23,2,23,23,'Paciente con trastorno de ansiedad','2022-12-07',NULL),(24,3,24,24,'Paciente con trastorno del control de impulsos','2023-09-16',NULL),(25,1,25,25,'Paciente con trastorno del espectro autista','2024-03-01',NULL),(26,2,26,26,'Paciente con demencia','2023-01-13',NULL),(27,3,27,27,'Paciente con enfermedad de alzheimer','2022-07-19',NULL),(28,1,28,28,'Paciente con trastorno de depresion mayor','2023-11-30',NULL),(29,2,29,29,'Paciente con trastorno disforico premenstrual','2022-09-02',NULL),(30,3,30,30,'Paciente con trastorno de identidad disociativo','2023-05-28',NULL),(31,1,31,31,'Paciente con trastorno esquizoafectivo','2024-02-15',NULL),(32,2,32,32,'Paciente con trastorno de la fluidez del inicio de la infancia','2023-08-09',NULL),(33,3,33,33,'Paciente con trastorno de tics motores o vocales','2022-11-22',NULL),(34,1,34,34,'Paciente con trastorno por consumo de cannabis','2023-04-05',NULL),(35,2,35,35,'Paciente con trastorno por consumo de cafeina','2022-10-17',NULL),(36,3,36,36,'Paciente con trastorno por consumo de tabaco','2023-07-01',NULL),(37,1,37,37,'Paciente con trastorno por consumo de alucinogenos','2024-01-25',NULL),(38,2,38,38,'Paciente con trastorno de aprendizaje','2023-03-14',NULL),(39,3,39,39,'Paciente con trastorno de lectura o dislexia','2022-08-26',NULL),(40,1,40,40,'Paciente con trastorno de expresion escrita','2023-06-18',NULL),(41,2,1,41,'Paciente con trastorno de calculo o discalculia','2022-12-30',NULL),(42,3,2,42,'Paciente con trastorno del desarrollo de la coordinacion','2023-09-11',NULL),(43,1,3,43,'Paciente con trastorno de la expresion del lenguaje','2024-03-05',NULL),(44,2,4,44,'Paciente con trastorno fonologico','2023-01-17',NULL),(45,3,5,45,'Paciente con trastorno del lenguaje pragmatico','2022-07-23',NULL),(46,1,6,46,'Paciente con trastorno de la fluidez de comienzo en la adultez','2023-11-04',NULL),(47,2,7,47,'Paciente con trastorno de la comunicacion social','2022-09-06',NULL),(48,3,8,48,'Paciente con trastorno por consumo de alcohol','2023-05-20',NULL),(49,1,9,49,'Paciente con trastorno por consumo de opioides','2024-02-02',NULL),(50,2,10,50,'Paciente con trastorno por consumo de sedantes','2023-08-13',NULL),(51,3,11,51,'Paciente con trastorno por consumo de cocaina','2022-11-26',NULL),(52,1,12,52,'Paciente con trastorno por consumo de anfetamina','2023-04-09',NULL),(53,2,13,53,'Paciente con trastorno por consumo de inhalantes','2022-10-21',NULL),(54,3,14,54,'Paciente con trastorno por juego de apuestas','2023-07-05',NULL),(55,1,15,55,'Paciente con trastorno obsesivo compulsivo','2024-01-29',NULL),(56,2,16,56,'Paciente con trastorno dismorfico corporal','2023-03-18',NULL),(57,3,17,57,'Paciente con trastorno de acumulacion','2022-08-30',NULL),(58,1,18,58,'Paciente con tricotilomania','2023-06-22',NULL),(59,2,19,59,'Paciente con excoriacion compulsiva','2022-12-04',NULL),(60,3,20,60,'Paciente con trastorno del estado de animo','2023-09-15',NULL),(61,1,21,61,'Paciente con trastorno de panico','2024-03-09',NULL),(62,2,22,62,'Paciente con agorafobia','2023-01-21',NULL),(63,3,23,63,'Paciente con fobia especifica','2022-07-27',NULL),(64,1,24,64,'Paciente con trastorno de ansiedad','2023-11-08',NULL),(65,2,25,65,'Paciente con trastorno de ansiedad','2022-09-10',NULL),(66,3,26,66,'Paciente con trastorno de ansiedad','2023-05-24',NULL),(67,1,27,67,'Paciente con mutismo selectivo','2024-02-06',NULL),(68,2,28,68,'Paciente con trastorno de ansiedad','2023-08-17',NULL),(69,3,29,69,'Paciente con trastorno de ansiedad inducido por sustancias','2022-11-30',NULL),(70,1,30,70,'Paciente con trastorno de ansiedad','2023-04-13',NULL),(71,2,31,71,'Paciente con trastorno de estres agudo','2022-10-25',NULL),(72,3,32,72,'Paciente con trastorno de estres postraumatico','2023-07-09',NULL),(73,1,33,73,'Paciente con trastorno de adaptacion','2024-02-20',NULL),(74,2,34,74,'Paciente con trastorno disociativo','2023-03-22',NULL),(75,3,35,75,'Paciente con amnesia disociativa','2022-09-03',NULL),(76,1,36,76,'Paciente con trastorno de despersonalizacion','2023-06-26',NULL),(77,2,37,77,'Paciente con trastorno de identidad disociativo','2022-12-08',NULL),(78,3,38,78,'Paciente con trastorno disociativo no especificado','2023-09-19',NULL),(79,1,39,79,'Paciente con trastorno de sintomas somaticos','2024-03-13',NULL),(80,2,40,80,'Paciente con trastorno facticio','2023-01-25',NULL),(81,3,1,81,'Paciente con trastorno converso','2022-07-31',NULL),(82,1,2,82,'Paciente con trastorno de ansiedad por enfermedad','2023-11-12',NULL),(83,2,3,83,'Paciente con trastorno de la conducta alimentaria','2022-09-14',NULL),(84,3,4,84,'Paciente con pica','2023-05-28',NULL),(85,1,5,85,'Paciente con trastorno de rumiacion','2024-02-10',NULL),(86,2,6,86,'Paciente con anorexia nerviosa','2023-08-21',NULL),(87,3,7,87,'Paciente con bulimia nerviosa','2022-12-03',NULL),(88,1,8,88,'Paciente con trastorno por atracones','2023-04-17',NULL),(89,2,9,89,'Paciente con trastorno de la alimentacion','2022-10-29',NULL),(90,3,10,90,'Paciente con insomnio','2023-07-13',NULL),(91,1,11,91,'Paciente con hipersomnolencia','2024-02-24',NULL),(92,2,12,92,'Paciente con narcolepsia','2023-03-26',NULL),(93,3,13,93,'Paciente con apnea del sueno','2022-09-07',NULL);
/*!40000 ALTER TABLE `tratamientos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`gabriel`@`%`*/ /*!50003 TRIGGER `alta_tratamiento_controller` AFTER INSERT ON `tratamientos` FOR EACH ROW BEGIN 
		
		DECLARE check_id_medico INT;
		DECLARE check_id_paciente INT;
	
	
		-- Checkear si el id_medico existe.
		SELECT m.id_medico INTO check_id_medico
		FROM centro_medico.medicos AS m
		WHERE m.id_medico = NEW.id_medico;
		
		
		-- Checkear si el id_paciente existe.
		SELECT p.id_paciente INTO check_id_paciente
		FROM centro_medico.pacientes AS p
		WHERE p.id_paciente = NEW.id_paciente;
	
		IF check_id_medico IS NULL AND check_id_paciente IS NULL THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Actualizacion de estado cancelada.';
		ELSE 
			UPDATE centro_medico.medicos 
			SET estado = 1 
			WHERE id_medico = check_id_medico;
		
			UPDATE centro_medico.pacientes 
			SET estado = 1
			WHERE id_paciente = check_id_paciente;
		
		END IF;
		
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `verificacion_importacion_csv`
--

DROP TABLE IF EXISTS `verificacion_importacion_csv`;
/*!50001 DROP VIEW IF EXISTS `verificacion_importacion_csv`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `verificacion_importacion_csv` AS SELECT 
 1 AS `TABLE_NAME`,
 1 AS `ROW_COUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_duenos_centros_medicos`
--

DROP TABLE IF EXISTS `view_duenos_centros_medicos`;
/*!50001 DROP VIEW IF EXISTS `view_duenos_centros_medicos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_duenos_centros_medicos` AS SELECT 
 1 AS `dueno`,
 1 AS `dni_dueno`,
 1 AS `telefono_dueno`,
 1 AS `centro_medico`,
 1 AS `domicilio_CM`,
 1 AS `email_CM`,
 1 AS `telefono_CM`,
 1 AS `ciudad`,
 1 AS `provincia`,
 1 AS `codigo_postal`,
 1 AS `sitio_web`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_facturacion_medico_tratamiento`
--

DROP TABLE IF EXISTS `view_facturacion_medico_tratamiento`;
/*!50001 DROP VIEW IF EXISTS `view_facturacion_medico_tratamiento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_facturacion_medico_tratamiento` AS SELECT 
 1 AS `medico`,
 1 AS `email`,
 1 AS `area`,
 1 AS `id_tratamiento`,
 1 AS `descripcion`,
 1 AS `pago_por_tratamiento`,
 1 AS `horas_trabajadas_mensuales`,
 1 AS `fecha_facturacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_facturacion_tratamiento_paciente`
--

DROP TABLE IF EXISTS `view_facturacion_tratamiento_paciente`;
/*!50001 DROP VIEW IF EXISTS `view_facturacion_tratamiento_paciente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_facturacion_tratamiento_paciente` AS SELECT 
 1 AS `paciente`,
 1 AS `tiene_obra_social`,
 1 AS `obra_social`,
 1 AS `carnet_numero`,
 1 AS `estado`,
 1 AS `descripcion`,
 1 AS `cuota`,
 1 AS `mes_facturado`,
 1 AS `fecha_fin`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_show_empleados_all_data`
--

DROP TABLE IF EXISTS `view_show_empleados_all_data`;
/*!50001 DROP VIEW IF EXISTS `view_show_empleados_all_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_show_empleados_all_data` AS SELECT 
 1 AS `id_centro_medico`,
 1 AS `empleado`,
 1 AS `dni_empleado`,
 1 AS `domicilio_empleado`,
 1 AS `telefono_empleado`,
 1 AS `alta_CM`,
 1 AS `nombre_obra_social`,
 1 AS `carnet_OS`,
 1 AS `alta_OS`,
 1 AS `puesto`,
 1 AS `salario_mensual`,
 1 AS `descripcion_puesto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_show_empleados_facturaciones`
--

DROP TABLE IF EXISTS `view_show_empleados_facturaciones`;
/*!50001 DROP VIEW IF EXISTS `view_show_empleados_facturaciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_show_empleados_facturaciones` AS SELECT 
 1 AS `empleado`,
 1 AS `dni_empleado`,
 1 AS `domicilio_empleado`,
 1 AS `mes_facturado`,
 1 AS `tarea`,
 1 AS `descripcion_puesto`,
 1 AS `salario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_show_empleados_obras_sociales`
--

DROP TABLE IF EXISTS `view_show_empleados_obras_sociales`;
/*!50001 DROP VIEW IF EXISTS `view_show_empleados_obras_sociales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_show_empleados_obras_sociales` AS SELECT 
 1 AS `id_centro_medico`,
 1 AS `empleado`,
 1 AS `DNI`,
 1 AS `telefono`,
 1 AS `OS`,
 1 AS `carnet_OS`,
 1 AS `alta_OS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_show_medicos_full_data`
--

DROP TABLE IF EXISTS `view_show_medicos_full_data`;
/*!50001 DROP VIEW IF EXISTS `view_show_medicos_full_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_show_medicos_full_data` AS SELECT 
 1 AS `medico`,
 1 AS `cuit`,
 1 AS `email`,
 1 AS `estado`,
 1 AS `profesion`,
 1 AS `numero_matricula`,
 1 AS `alta_matricula`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_show_pacientes_obra_social`
--

DROP TABLE IF EXISTS `view_show_pacientes_obra_social`;
/*!50001 DROP VIEW IF EXISTS `view_show_pacientes_obra_social`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_show_pacientes_obra_social` AS SELECT 
 1 AS `paciente`,
 1 AS `dni`,
 1 AS `alta_CM`,
 1 AS `actividad`,
 1 AS `tiene_obra_social`,
 1 AS `nombre_obra_social_paciente`,
 1 AS `carnet_numero`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_show_tratamientos_main`
--

DROP TABLE IF EXISTS `view_show_tratamientos_main`;
/*!50001 DROP VIEW IF EXISTS `view_show_tratamientos_main`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_show_tratamientos_main` AS SELECT 
 1 AS `obra_social`,
 1 AS `carnet_OS`,
 1 AS `paciente`,
 1 AS `medico`,
 1 AS `area`,
 1 AS `descripcion`,
 1 AS `fecha_inicio`,
 1 AS `fecha_fin`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'centro_medico'
--
/*!50003 DROP FUNCTION IF EXISTS `ACTIVE_INACTIVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` FUNCTION `ACTIVE_INACTIVE`( valor BOOLEAN ) RETURNS tinyint(1)
    NO SQL
    DETERMINISTIC
BEGIN	
	
	DECLARE nuevo_valor BOOLEAN;
	SET nuevo_valor = CASE 
							WHEN valor THEN FALSE
							ELSE TRUE
						END;
	RETURN nuevo_valor;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CAPITALIZE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` FUNCTION `CAPITALIZE`( string VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
BEGIN	
	
	DECLARE primer_letra VARCHAR(255);
	DECLARE resto_letra VARCHAR(255);
	DECLARE capitalizada VARCHAR(255);

	SET primer_letra = UPPER(SUBSTRING(string, 1, 1));
	SET resto_letra = LOWER(SUBSTRING(string, 2));
	SET capitalizada = CONCAT(primer_letra, resto_letra);

	RETURN capitalizada;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CHECK_OS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` FUNCTION `CHECK_OS`(obra_social VARCHAR(255)) RETURNS int
    NO SQL
BEGIN

	DECLARE check_obra_social INT;

	SET check_obra_social = CASE
								WHEN UPPER(obra_social) IN ('OSDE', 'UOCRA', 'SANCOR') THEN 1
								ELSE 0
						  END;

	RETURN check_obra_social;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DISCOUNT_OS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` FUNCTION `DISCOUNT_OS`( precio FLOAT(10,2), obra_social VARCHAR(255)) RETURNS float(10,2)
    NO SQL
    DETERMINISTIC
BEGIN
	
	DECLARE descuento FLOAT(10,2);
	DECLARE calculo_descuento FLOAT(10,2);
	DECLARE precio_descontado FLOAT(10,2);

	SET descuento = CASE 
						WHEN UPPER(obra_social) = 'SANCOR' THEN 10
						WHEN UPPER(obra_social) = 'VITAL' THEN 20
						WHEN UPPER(obra_social) = 'OSPE' THEN 21.50
						WHEN UPPER(obra_social) = 'OSDE' THEN 27
						WHEN UPPER(obra_social) = 'SWISSMEDICAL' THEN 32
					END;
	
	SET calculo_descuento = precio * descuento / 100;
	SET precio_descontado = precio - calculo_descuento;
	
	RETURN precio_descontado;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sumar_IVA_21` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` FUNCTION `sumar_IVA_21`(monto FLOAT(10,2)) RETURNS float(10,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
	
	DECLARE porcentaje_a_sumar FLOAT(10,2);
	DECLARE nuevo_monto FLOAT(10,2);
	
	SET porcentaje_a_sumar = (monto * 21) / 100;
	SET nuevo_monto = monto + porcentaje_a_sumar;
	
	RETURN nuevo_monto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alta_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` PROCEDURE `alta_empleado`(
	IN centro_medico_id INT,
	IN empleado_nombre VARCHAR(255),
	IN empleado_apellido VARCHAR(255),
	IN empleado_dni BIGINT,
	IN empleado_domicilio VARCHAR(255),
	IN empleado_telefono BIGINT,
	IN empleado_fecha_alta DATE,
	IN empleado_puesto VARCHAR(255),
	IN obra_social VARCHAR(255),
	IN numero_carnet BIGINT,
	IN alta_obra_social DATE
)
BEGIN

	DECLARE error_message VARCHAR(255);
	DECLARE check_empleado_dni INT;
	DECLARE check_puesto VARCHAR(255);
	DECLARE check_id_puesto INT;
	DECLARE new_id_empleado INT;
	DECLARE check_obra_social INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		-- Manejo de excepcion
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
	END;

	START TRANSACTION;

	-- Checkeando el que dni del empleado no existe en la base de datos
	SELECT e.dni_empleado INTO check_empleado_dni
	FROM centro_medico.empleados AS e
	WHERE e.dni_empleado = empleado_dni;

	-- Checkeando que el puesto exista en la base de datos y capturando el id del puesto
	SELECT p.nombre_puesto, p.id_puesto INTO check_puesto, check_id_puesto
	FROM centro_medico.puestos AS p
	WHERE p.nombre_puesto = empleado_puesto;

	-- Checkeando si la obra social existe
	SET check_obra_social = CHECK_OS(obra_social);


	-- Validaciones para que en el caso que haya excepciones, caigan en el bloque de errores.
	IF check_empleado_dni IS NOT NULL THEN
		SET error_message = 'EL DNI INGRESADO CORRESPONSE A UN EMPLEADO EXISTENTE';
		SIGNAL SQLSTATE '45000';
	ELSEIF check_puesto IS NULL THEN
		SET error_message = 'NO SE ENCUENTRA EL PUESTO INDICADO';
		SIGNAL SQLSTATE '45000';
	ELSE

		-- Insertando registro en la tabla pacientes
		INSERT INTO centro_medico.empleados
			(id_centro_medico, nombre_empleado, apellido_empleado, dni_empleado, domicilio_empleado, telefono_empleado, fecha_alta)
		VALUES
			(centro_medico_id, empleado_nombre, empleado_apellido, empleado_dni, empleado_domicilio, empleado_telefono, empleado_fecha_alta);

		-- Guardando el id creado en la variable
		SET new_id_empleado = LAST_INSERT_ID();

		-- Insertando en la tabla intermedia
		INSERT INTO centro_medico.empleados_puestos
			(id_empleado, id_puesto)
		VALUES
			(new_id_empleado, check_id_puesto);

		-- Checkeando el resultaldo de la validacion de la obra social
		IF check_obra_social = 0 THEN
			SET error_message = 'OBRA SOCIAL NO PERMITIDA';
			SIGNAL SQLSTATE '45000';
		ELSE
			INSERT INTO centro_medico.obra_social_empleados
				(id_empleado, nombre_obra_social, carnet_numero, fecha_alta)
			VALUES
				(new_id_empleado, UPPER(obra_social), numero_carnet, empleado_fecha_alta);
		END IF;

		COMMIT;


		SELECT 'Empleado creado con exito' AS Mensaje;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alta_medico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` PROCEDURE `alta_medico`(
	IN id_cm INT,
	IN nombre VARCHAR(255),
	IN apellido VARCHAR(255),
	IN cuit_input BIGINT,
	IN correo VARCHAR(255),
	IN status BOOLEAN,
	IN alta_fecha DATE,
	IN profesion VARCHAR(255),
	IN num_matricula BIGINT

)
BEGIN

	DECLARE check_cuit BIGINT;
	DECLARE check_profesion VARCHAR(255);
	DECLARE check_id_profesion INT;
	DECLARE check_num_matricula BIGINT;
	DECLARE error_message VARCHAR(255);
	DECLARE last_id INT;

	-- Bloque de excepciones
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		-- Manejo de excepcion
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
	END;

	START TRANSACTION;

	SET check_profesion = LOWER(profesion);

	-- Checkea que no exista el cuit en la base de datos y la inserta en la variable " check_cuit"
	SELECT sm.cuit INTO check_cuit
	FROM centro_medico.medicos AS sm
	WHERE sm.cuit = cuit_input;

	SET error_message = 'llego cuit';

	-- Checkea si la profesion se encuentra en la base de datos y la inserta en la variable "check_profesion"
	SELECT sp.nombre_profesion INTO check_profesion
	FROM centro_medico.profesiones AS sp
	WHERE sp.nombre_profesion = check_profesion;

	SET error_message = 'llego profesion';

	-- Checkea si la profesion se encuentra en la base de datos y la inserta en la variable "check_profesion"
	SELECT sp.id_profesion INTO check_id_profesion
	FROM centro_medico.profesiones AS sp
	WHERE sp.nombre_profesion = profesion;

	SET error_message = 'llego profesion';

	-- Checkea si la matricula se encuentra en la base de datos y la inserta en la variable " check_num_matricula"
	SELECT mat.numero_matricula INTO check_num_matricula 
	FROM centro_medico.matriculas AS mat
	WHERE mat.numero_matricula = num_matricula;

	SET error_message = 'llego matricula';
	

	IF check_cuit IS NOT NULL THEN
			SET error_message = 'El cuit ingresado pertenece a un medico registrado. Compruebe los datos.';
			SIGNAL SQLSTATE '45000';
	ELSEIF check_profesion IS NULL THEN
			SET error_message = 'Profesion no registrada en la base de datos.';
			SIGNAL SQLSTATE '45000';
	ELSEIF check_id_profesion IS NULL THEN
			SET error_message = 'Error al intentar encontrar la profesion.';
			SIGNAL SQLSTATE '45000';
	ELSEIF check_num_matricula IS NOT NULL THEN
			SET error_message = 'La matricula ingresada pertenece a un registro existente.';
			SIGNAL SQLSTATE '45000';
	ELSE
		-- Creando un nuevo registro en la tabla medicos
		INSERT INTO centro_medico.medicos 
			(id_centro_medico, nombre_medico, apellido_medico, cuit, email, estado, fecha_alta)
		VALUES
			(id_cm, nombre, apellido, cuit_input, correo, status, alta_fecha);
		
		SET error_message = 'paso 1ra insercion';
		SET last_id = LAST_INSERT_ID();
		
		
	
	
		-- Creando un nuevo registro asociando al medico creado a la tabla profesiones mediante la tabla intermedia
		INSERT INTO centro_medico.profesion_medicos 
			(id_profesion, id_medico)
		VALUES 
			(check_id_profesion, last_id);
		
		SET error_message = 'paso 2da insercion';
		
		-- Creando un nuevo registro en matriculas usando el id recien insertado, 
		INSERT INTO centro_medico.matriculas 
			(id_medico, numero_matricula)
		VALUES
			(last_id, num_matricula);
		
		SET error_message = 'llego al final';
	END IF;

	COMMIT;

	SELECT 'Medico creado con exito' AS mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alta_paciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` PROCEDURE `alta_paciente`(
	IN id_c_medico INT, 
	IN nombre VARCHAR(255), 
	IN apellido_paciente VARCHAR(255),
	IN documento BIGINT,
	IN alta DATE,
	IN status BOOLEAN,
	IN nombre_obra_social VARCHAR(255),
	IN numero_carnet BIGINT
)
BEGIN 
	
	DECLARE check_exists BIGINT;
	DECLARE valor_OS VARCHAR(255);

	SET valor_OS = CASE 
						WHEN nombre_obra_social = '' THEN 0
						ELSE 1
				   END;
	
	-- Checkeando que no exista el paciente
	SELECT 
		sp.dni INTO check_exists
    FROM centro_medico.pacientes AS sp
    WHERE sp.dni = documento; 

	IF check_exists IS NOT NULL THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'EL DNI YA SE ENCUENTRA REGISTRADO';
	ELSE 
		INSERT INTO centro_medico.pacientes 
		(id_centro_medico, nombre_paciente, apellido, dni, fecha_alta, estado, tiene_obra_social)
		VALUES 
			(id_c_medico, nombre, apellido_paciente, documento, alta, status, valor_OS);
		
		IF nombre_obra_social != '' AND numero_carnet != 0 THEN 
			INSERT INTO centro_medico.obra_social_pacientes 
				(id_paciente, nombre_obra_social_paciente, carnet_numero)
			VALUES
				(LAST_INSERT_ID(), UPPER(nombre_obra_social), numero_carnet);
			
		END IF;
		
	END IF;


	SELECT 'Paciente creado con exito' AS mensaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alta_tratamiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` PROCEDURE `alta_tratamiento`(
	IN id_centro INT,
	IN medico_id INT,
	IN paciente_id INT,
	IN detalle TEXT,
	IN fecha_de_inicio DATE,
	IN fecha_de_fin DATE
)
BEGIN
	
	INSERT INTO centro_medico.tratamientos 
		(id_centro_medico, id_medico, id_paciente, descripcion, fecha_inicio, fecha_fin)
	VALUES
		(id_centro, medico_id, paciente_id, detalle, fecha_de_inicio, fecha_de_fin);
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generar_factura_medico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` PROCEDURE `generar_factura_medico`(
	IN medico_id INT,
	IN tratamiento_id INT,
	IN horas_trabajados INT,
	IN monto_pagado DECIMAL(10,2),
	IN mes_facturaDo DATE
)
BEGIN
	
	DECLARE check_id_medico INT;
	DECLARE check_id_tratamiento INT;

	-- Checkeando si existe el id_medico:
	SELECT m.id_medico INTO check_id_medico
	FROM centro_medico.medicos AS m
	WHERE m.id_medico = medico_id;

	-- Chekeando si existe el id_tratamiento:
	SELECT st.id_tratamiento INTO check_id_tratamiento
	FROM centro_medico.tratamientos AS st
	WHERE st.id_tratamiento = tratamiento_id;


	IF check_id_tratamiento IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontro un tratamiento con ese identificador';
	ELSEIF check_id_medico IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El identificador del medico no existe.';
	ELSE 
		INSERT INTO centro_medico.factura_medico 
			(id_medico, id_tratamiento, horas_trabajadas, monto, mes_facturado)
		VALUES
			(check_id_medico, check_id_tratamiento, horas_trabajados, monto_pagado, mes_facturado);
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generar_factura_paciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` PROCEDURE `generar_factura_paciente`(
	IN tratamiento_id INT,
	IN paciente_id INT,
	IN cuota_mensual DECIMAL(10,2),
	IN factura_mes DATE
)
BEGIN
	
	DECLARE check_id_paciente INT;
	DECLARE check_id_tratamiento INT;
	DECLARE check_id_tratamiento_paciente INT;
	DECLARE check_obra_social VARCHAR(255);
	DECLARE precio_final DECIMAL(12,2);
	DECLARE error_message VARCHAR(255);


	-- Bloque de excepciones
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		-- Manejo de excepcion
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
	END;

	START TRANSACTION;	

	-- Checkeando si existe el id_paciente
	SELECT p.id_paciente INTO check_id_paciente
	FROM centro_medico.pacientes AS p
	WHERE p.id_paciente = paciente_id;
	
	-- Checkeando si existe el id del tratamiento
	SELECT trat.id_tratamiento INTO check_id_tratamiento
	FROM centro_medico.tratamientos AS trat
	WHERE trat.id_tratamiento = tratamiento_id;

	-- Checkeando si tiene obra social
	SELECT osp.nombre_obra_social_paciente INTO check_obra_social
	FROM centro_medico.obra_social_pacientes AS osp
	WHERE osp.id_paciente = check_id_paciente;

	SELECT t.id_paciente INTO check_id_tratamiento_paciente
	FROM centro_medico.tratamientos AS t
	WHERE t.id_tratamiento = check_id_tratamiento
	ORDER BY t.id_paciente DESC
	LIMIT 1;
	

	SET precio_final = CASE
							WHEN check_obra_social IS NULL THEN cuota_mensual
							ELSE 
								DISCOUNT_OS(cuota_mensual, check_obra_social)
						END;
	
	IF check_id_paciente IS NULL THEN
		SET error_message = 'No pudo encontrarse el registro del paciente';
		SIGNAL SQLSTATE '45000';
	ELSEIF check_id_tratamiento IS NULL THEN
		SET error_message = 'No se pudo encontrar el registro del tratamiento';
		SIGNAL SQLSTATE '45000';
	ELSEIF check_id_paciente != check_id_tratamiento_paciente THEN
		SET error_message = 'El id del paciente no corresponde al tratamiento indicado';
		SIGNAL SQLSTATE '45000';
	ELSE
		INSERT INTO centro_medico.factura_paciente
			(id_tratamiento, id_paciente, cuota, mes_facturado)
		VALUES
			(check_id_tratamiento, check_id_paciente, precio_final, factura_mes);
		
		IF precio_final = cuota_mensual THEN 
				INSERT INTO centro_medico.auditoria_trigger
					(mensaje)
				VALUES
					(CONCAT('No se aplico un descuenot a la factura del paciente con el id: ', paciente_id, ' Cuota: ', precio_final));
		ELSE
			INSERT INTO centro_medico.auditoria_trigger
				(mensaje)
			VALUES
				(CONCAT('Se aplico el descuento paciente con el id: ', paciente_id, ' Cuota: ', precio_final, ', con la obra social ', check_obra_social));
		END IF;
	
		COMMIT;	
	
		SELECT *
		FROM centro_medico.factura_paciente AS fp
		WHERE fp.id_paciente = check_id_paciente
		ORDER BY fp.id_factura_paciente DESC
		LIMIT 1;
	END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nueva_factura_empleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` PROCEDURE `nueva_factura_empleados`(
	IN empleado_id INT,
	IN fecha_facturacion DATE
)
BEGIN

	DECLARE check_id_empleado INT;

	-- Checkeando el id del empleado
	SELECT e.id_empleado INTO check_id_empleado
	FROM centro_medico.empleados AS e
	WHERE e.id_empleado = empleado_id;

	IF check_id_empleado IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO SE ENCONTRO EL REGISTRO DEL EMPLEADO';
	ELSE
		INSERT INTO centro_medico.honorario_facturas
			(id_empleado, mes_facturado)
		VALUES
			(check_id_empleado, fecha_facturacion);
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `terminar_tratamiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gabriel`@`%` PROCEDURE `terminar_tratamiento`(
	IN id_medico INT,
	IN id_paciente INT
)
BEGIN

	DECLARE check_id_tratamiento INT;
	DECLARE check_id_paciente INT;
	DECLARE check_id_medico INT;
	DECLARE error_message VARCHAR(255);

	-- Bloque de excepciones
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		-- Manejo de excepcion
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
	END;


	START TRANSACTION;

	-- Checkeando si existe el paciente en la tabla tratamientos.
	SELECT st.id_medico INTO check_id_medico
	FROM centro_medico.tratamientos AS st
	WHERE st.id_medico = id_medico
	ORDER BY st.id_tratamiento
	LIMIT 1;

	-- Checkeando si existe el paciente en la tabla tratamientos.
	SELECT st.id_paciente INTO check_id_paciente
	FROM centro_medico.tratamientos AS st
	WHERE st.id_paciente = id_paciente
	ORDER BY st.id_tratamiento
	LIMIT 1;


	-- Checkeando si existe el tratamiento en la tabla
	SELECT st.id_tratamiento INTO check_id_tratamiento
	FROM centro_medico.tratamientos AS st
	WHERE st.id_paciente = check_id_paciente
	AND st.id_medico = check_id_medico
	ORDER BY st.id_tratamiento DESC
	LIMIT 1;

	IF check_id_paciente IS NULL OR check_id_medico IS NULL THEN
		SET error_message = 'NO SE PUDO FINALIZAR EL TRATAMIENTO. PACIENTE O MEDICO NO ENCONTRADO';
		SIGNAL SQLSTATE '45000';
	ELSE
		UPDATE centro_medico.medicos 
		SET estado = 0
		WHERE id_medico = check_id_medico;
	
		UPDATE centro_medico.pacientes 
		SET estado = 0
		WHERE id_paciente = check_id_paciente;

		IF check_id_tratamiento IS NULL THEN
			SET error_message = 'TRATAMIENTO NO ENCONTRADO';
			SIGNAL SQLSTATE '45000';
		ELSE
			UPDATE centro_medico.tratamientos
			SET fecha_fin = CURRENT_DATE
			WHERE id_tratamiento = check_id_tratamiento;
		END IF;

		COMMIT;
		SELECT 'Tratamiento finalizado' AS mensaje;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `centro_medico`
--

USE `centro_medico`;

--
-- Final view structure for view `verificacion_importacion_csv`
--

/*!50001 DROP VIEW IF EXISTS `verificacion_importacion_csv`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gabriel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `verificacion_importacion_csv` AS select 'RUP_registro_matriculas' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `RUP_registro_matriculas` union select 'centros_medicos' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `centros_medicos` union select 'duenos' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `duenos` union select 'empleados' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `empleados` union select 'empleados_puestos' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `empleados_puestos` union select 'factura_medico' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `factura_medico` union select 'factura_paciente' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `factura_paciente` union select 'honorario_facturas' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `honorario_facturas` union select 'matriculas' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `matriculas` union select 'medicos' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `medicos` union select 'obra_social_empleados' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `obra_social_empleados` union select 'obra_social_pacientes' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `obra_social_pacientes` union select 'pacientes' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `pacientes` union select 'profesion_medicos' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `profesion_medicos` union select 'profesiones' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `profesiones` union select 'puestos' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `puestos` union select 'tratamientos' AS `TABLE_NAME`,count(0) AS `ROW_COUNT` from `tratamientos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_duenos_centros_medicos`
--

/*!50001 DROP VIEW IF EXISTS `view_duenos_centros_medicos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gabriel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_duenos_centros_medicos` AS select concat(`d`.`nombre_dueno`,' ',`d`.`apellido_dueno`) AS `dueno`,`d`.`dni_dueno` AS `dni_dueno`,`d`.`telefono_dueno` AS `telefono_dueno`,`cm`.`nombre` AS `centro_medico`,`cm`.`direccion` AS `domicilio_CM`,`cm`.`email` AS `email_CM`,`cm`.`telefono` AS `telefono_CM`,`cm`.`ciudad` AS `ciudad`,`cm`.`provincia` AS `provincia`,`cm`.`codigo_postal` AS `codigo_postal`,`cm`.`sitio_web` AS `sitio_web` from (`duenos` `d` join `centros_medicos` `cm` on((`d`.`id_dueno` = `cm`.`id_dueno`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_facturacion_medico_tratamiento`
--

/*!50001 DROP VIEW IF EXISTS `view_facturacion_medico_tratamiento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gabriel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_facturacion_medico_tratamiento` AS select concat(`m`.`nombre_medico`,' ',`m`.`apellido_medico`) AS `medico`,`m`.`email` AS `email`,`p`.`nombre_profesion` AS `area`,`t`.`id_tratamiento` AS `id_tratamiento`,`t`.`descripcion` AS `descripcion`,`fm`.`monto` AS `pago_por_tratamiento`,`fm`.`horas_trabajadas` AS `horas_trabajadas_mensuales`,`fm`.`mes_facturado` AS `fecha_facturacion` from ((((`profesiones` `p` join `profesion_medicos` `pm` on((`pm`.`id_profesion` = `p`.`id_profesion`))) join `medicos` `m` on((`m`.`id_medico` = `pm`.`id_medico`))) join `tratamientos` `t` on((`t`.`id_medico` = `m`.`id_medico`))) join `factura_medico` `fm` on((`fm`.`id_tratamiento` = `t`.`id_tratamiento`))) order by `fm`.`id_factura_medico` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_facturacion_tratamiento_paciente`
--

/*!50001 DROP VIEW IF EXISTS `view_facturacion_tratamiento_paciente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gabriel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_facturacion_tratamiento_paciente` AS select concat(`p`.`nombre_paciente`,' ',`p`.`apellido`) AS `paciente`,(case when (`p`.`tiene_obra_social` = 0) then 'No' else 'Si' end) AS `tiene_obra_social`,`osp`.`nombre_obra_social_paciente` AS `obra_social`,`osp`.`carnet_numero` AS `carnet_numero`,(case when (`p`.`estado` = 0) then 'Inactivo' else 'Activo' end) AS `estado`,`t`.`descripcion` AS `descripcion`,`fp`.`cuota` AS `cuota`,`fp`.`mes_facturado` AS `mes_facturado`,`t`.`fecha_fin` AS `fecha_fin` from (((`obra_social_pacientes` `osp` join `pacientes` `p` on((`osp`.`id_paciente` = `p`.`id_paciente`))) join `tratamientos` `t` on((`osp`.`id_paciente` = `t`.`id_paciente`))) join `factura_paciente` `fp` on((`osp`.`id_paciente` = `fp`.`id_paciente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_show_empleados_all_data`
--

/*!50001 DROP VIEW IF EXISTS `view_show_empleados_all_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gabriel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_show_empleados_all_data` AS select `e`.`id_centro_medico` AS `id_centro_medico`,concat(`e`.`nombre_empleado`,' ',`e`.`apellido_empleado`) AS `empleado`,`e`.`dni_empleado` AS `dni_empleado`,`e`.`domicilio_empleado` AS `domicilio_empleado`,`e`.`telefono_empleado` AS `telefono_empleado`,`e`.`fecha_alta` AS `alta_CM`,`ose`.`nombre_obra_social` AS `nombre_obra_social`,`ose`.`carnet_numero` AS `carnet_OS`,`ose`.`fecha_alta` AS `alta_OS`,`p`.`nombre_puesto` AS `puesto`,`p`.`honorario_mensual` AS `salario_mensual`,`p`.`descripcion_puesto` AS `descripcion_puesto` from (((`obra_social_empleados` `ose` join `empleados` `e` on((`ose`.`id_empleado` = `e`.`id_empleado`))) join `empleados_puestos` `ep` on((`ose`.`id_empleado` = `ep`.`id_empleado`))) join `puestos` `p` on((`ep`.`id_puesto` = `p`.`id_puesto`))) order by `ose`.`id_empleado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_show_empleados_facturaciones`
--

/*!50001 DROP VIEW IF EXISTS `view_show_empleados_facturaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gabriel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_show_empleados_facturaciones` AS select concat(`e`.`nombre_empleado`,' ',`e`.`apellido_empleado`) AS `empleado`,`e`.`dni_empleado` AS `dni_empleado`,`e`.`domicilio_empleado` AS `domicilio_empleado`,`hf`.`mes_facturado` AS `mes_facturado`,`p`.`nombre_puesto` AS `tarea`,`p`.`descripcion_puesto` AS `descripcion_puesto`,`p`.`honorario_mensual` AS `salario` from (((`honorario_facturas` `hf` join `empleados` `e` on((`hf`.`id_empleado` = `e`.`id_empleado`))) join `empleados_puestos` `ep` on((`hf`.`id_empleado` = `ep`.`id_empleado`))) join `puestos` `p` on((`ep`.`id_puesto` = `p`.`id_puesto`))) order by `e`.`id_empleado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_show_empleados_obras_sociales`
--

/*!50001 DROP VIEW IF EXISTS `view_show_empleados_obras_sociales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gabriel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_show_empleados_obras_sociales` AS select `e`.`id_centro_medico` AS `id_centro_medico`,concat(`e`.`nombre_empleado`,' ',`e`.`apellido_empleado`) AS `empleado`,`e`.`dni_empleado` AS `DNI`,`e`.`telefono_empleado` AS `telefono`,`ose`.`nombre_obra_social` AS `OS`,`ose`.`carnet_numero` AS `carnet_OS`,`ose`.`fecha_alta` AS `alta_OS` from (`empleados` `e` join `obra_social_empleados` `ose` on((`e`.`id_empleado` = `ose`.`id_empleado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_show_medicos_full_data`
--

/*!50001 DROP VIEW IF EXISTS `view_show_medicos_full_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gabriel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_show_medicos_full_data` AS select concat(`med`.`nombre_medico`,' ',`med`.`apellido_medico`) AS `medico`,`med`.`cuit` AS `cuit`,`med`.`email` AS `email`,(case when (`med`.`estado` = 0) then 'Disponible' else 'En tratamiento medico.' end) AS `estado`,`prof`.`nombre_profesion` AS `profesion`,`mat`.`numero_matricula` AS `numero_matricula`,`reg`.`fecha_registrada` AS `alta_matricula` from ((((`profesiones` `prof` join `profesion_medicos` `pm` on((`prof`.`id_profesion` = `pm`.`id_profesion`))) join `medicos` `med` on((`pm`.`id_medico` = `med`.`id_medico`))) join `matriculas` `mat` on((`pm`.`id_medico` = `mat`.`id_medico`))) join `RUP_registro_matriculas` `reg` on((`mat`.`id_matricula` = `reg`.`id_matricula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_show_pacientes_obra_social`
--

/*!50001 DROP VIEW IF EXISTS `view_show_pacientes_obra_social`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gabriel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_show_pacientes_obra_social` AS select concat(`p`.`nombre_paciente`,' ',`p`.`apellido`) AS `paciente`,`p`.`dni` AS `dni`,`p`.`fecha_alta` AS `alta_CM`,(case when (`p`.`estado` = 0) then 'Inactivo' else 'Activo' end) AS `actividad`,(case when (`p`.`tiene_obra_social` = 0) then 'No' else 'Si' end) AS `tiene_obra_social`,`osp`.`nombre_obra_social_paciente` AS `nombre_obra_social_paciente`,`osp`.`carnet_numero` AS `carnet_numero` from (`obra_social_pacientes` `osp` join `pacientes` `p` on((`osp`.`id_paciente` = `p`.`id_paciente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_show_tratamientos_main`
--

/*!50001 DROP VIEW IF EXISTS `view_show_tratamientos_main`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gabriel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_show_tratamientos_main` AS select `osp`.`nombre_obra_social_paciente` AS `obra_social`,`osp`.`carnet_numero` AS `carnet_OS`,concat(`pac`.`nombre_paciente`,' ',`pac`.`apellido`) AS `paciente`,concat(`med`.`nombre_medico`,' ',`med`.`apellido_medico`) AS `medico`,`prof`.`nombre_profesion` AS `area`,`t`.`descripcion` AS `descripcion`,`t`.`fecha_inicio` AS `fecha_inicio`,(case when (`t`.`fecha_fin` is null) then 'Tratamiento activo' end) AS `fecha_fin` from (((((`obra_social_pacientes` `osp` join `pacientes` `pac` on((`osp`.`id_paciente` = `pac`.`id_paciente`))) join `tratamientos` `t` on((`osp`.`id_paciente` = `t`.`id_paciente`))) join `medicos` `med` on((`t`.`id_medico` = `med`.`id_medico`))) join `profesion_medicos` `pm` on((`t`.`id_medico` = `pm`.`id_medico`))) join `profesiones` `prof` on((`pm`.`id_profesion` = `prof`.`id_profesion`))) */;
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

-- Dump completed on 2024-08-21  2:10:59
