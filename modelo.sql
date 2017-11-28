-- MySQL dump 10.16  Distrib 10.1.29-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: medicine
-- ------------------------------------------------------
-- Server version	5.7.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ANDROID`
--

DROP TABLE IF EXISTS `ANDROID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANDROID` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANDROID`
--

LOCK TABLES `ANDROID` WRITE;
/*!40000 ALTER TABLE `ANDROID` DISABLE KEYS */;
/*!40000 ALTER TABLE `ANDROID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FARMACIA`
--

DROP TABLE IF EXISTS `FARMACIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FARMACIA` (
  `id` int(11) NOT NULL,
  `estado` char(1) DEFAULT NULL,
  `tipo_est` char(1) DEFAULT NULL,
  `nombre` varchar(105) DEFAULT NULL,
  `ubigeo` char(6) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `horario` varchar(301) DEFAULT NULL,
  `dtecnico` varchar(150) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `distrito` varchar(50) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `ruc` varchar(15) DEFAULT NULL,
  `situacion` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `razonSocial` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FARMACIA`
--

LOCK TABLES `FARMACIA` WRITE;
/*!40000 ALTER TABLE `FARMACIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `FARMACIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FAVORITE`
--

DROP TABLE IF EXISTS `FAVORITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FAVORITE` (
  `idUser` varchar(15) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUser`,`idProducto`),
  KEY `FAVORITE_ibfk_1` (`idProducto`),
  CONSTRAINT `FAVORITE_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `PRODUCTO` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FAVORITE`
--

LOCK TABLES `FAVORITE` WRITE;
/*!40000 ALTER TABLE `FAVORITE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FAVORITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LABORATORIO`
--

DROP TABLE IF EXISTS `LABORATORIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LABORATORIO` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LABORATORIO`
--

LOCK TABLES `LABORATORIO` WRITE;
/*!40000 ALTER TABLE `LABORATORIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `LABORATORIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTIFICATIONS`
--

DROP TABLE IF EXISTS `NOTIFICATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTIFICATIONS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `message` varchar(256) DEFAULT NULL,
  `image_link` varchar(256) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTIFICATIONS`
--

LOCK TABLES `NOTIFICATIONS` WRITE;
/*!40000 ALTER TABLE `NOTIFICATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOTIFICATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTI_USER`
--

DROP TABLE IF EXISTS `NOTI_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTI_USER` (
  `id_notification` int(11) NOT NULL,
  `id_user` varchar(15) NOT NULL,
  `estado` char(1) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id_notification`,`id_user`),
  KEY `fk_NOTI_USER_NOTIFICATIONS1_idx` (`id_notification`,`id_user`),
  CONSTRAINT `fk_NOTI_USER_NOTIFICATIONS1` FOREIGN KEY (`id_notification`) REFERENCES `NOTIFICATIONS` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTI_USER`
--

LOCK TABLES `NOTI_USER` WRITE;
/*!40000 ALTER TABLE `NOTI_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOTI_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONAL`
--

DROP TABLE IF EXISTS `PERSONAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONAL` (
  `idF` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `horario` varchar(300) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`nombre`,`idF`,`tipo`),
  KEY `PERSONAL_ibfk_1` (`idF`),
  KEY `PERSONAL_ibfk_2` (`tipo`),
  CONSTRAINT `PERSONAL_ibfk_1` FOREIGN KEY (`idF`) REFERENCES `FARMACIA` (`id`),
  CONSTRAINT `PERSONAL_ibfk_2` FOREIGN KEY (`tipo`) REFERENCES `TIPO_PERSONAL` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONAL`
--

LOCK TABLES `PERSONAL` WRITE;
/*!40000 ALTER TABLE `PERSONAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `PERSONAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRESENTACION`
--

DROP TABLE IF EXISTS `PRESENTACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESENTACION` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRESENTACION`
--

LOCK TABLES `PRESENTACION` WRITE;
/*!40000 ALTER TABLE `PRESENTACION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRESENTACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO`
--

DROP TABLE IF EXISTS `PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `concent` varchar(100) DEFAULT NULL,
  `tp_pre` int(11) DEFAULT NULL,
  `tp_pre_si` int(11) DEFAULT NULL,
  `fracciones` int(11) DEFAULT NULL,
  `reg_san` int(11) DEFAULT NULL,
  `laboratorio` int(11) DEFAULT NULL,
  `presentacion` int(11) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `condicionV` varchar(35) DEFAULT NULL,
  `tipo` varchar(35) DEFAULT NULL,
  `fabricante` varchar(35) DEFAULT NULL,
  `Situacion` varchar(10) DEFAULT NULL,
  `sug` varchar(128) DEFAULT NULL,
  `pactivo` varchar(256) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PRESENTACION` (`presentacion`),
  KEY `PRODUCTO_ibfk_1` (`tp_pre`),
  KEY `PRODUCTO_ibfk_2` (`tp_pre_si`),
  KEY `PRODUCTO_ibfk_3` (`reg_san`),
  KEY `PRODUCTO_ibfk_4` (`laboratorio`),
  CONSTRAINT `FK_PRESENTACION` FOREIGN KEY (`presentacion`) REFERENCES `PRESENTACION` (`id`),
  CONSTRAINT `PRODUCTO_ibfk_1` FOREIGN KEY (`tp_pre`) REFERENCES `TIPO_PRESENTACION` (`id`),
  CONSTRAINT `PRODUCTO_ibfk_2` FOREIGN KEY (`tp_pre_si`) REFERENCES `TIPO_PRESENTACION` (`id`),
  CONSTRAINT `PRODUCTO_ibfk_3` FOREIGN KEY (`reg_san`) REFERENCES `REG_SAN` (`id`),
  CONSTRAINT `PRODUCTO_ibfk_4` FOREIGN KEY (`laboratorio`) REFERENCES `LABORATORIO` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO`
--

LOCK TABLES `PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROD_FARM`
--

DROP TABLE IF EXISTS `PROD_FARM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROD_FARM` (
  `idP` int(11) NOT NULL,
  `idF` int(11) NOT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`idP`,`idF`),
  KEY `PROD_FARM_ibfk_2` (`idF`),
  CONSTRAINT `PROD_FARM_ibfk_1` FOREIGN KEY (`idP`) REFERENCES `PRODUCTO` (`id`),
  CONSTRAINT `PROD_FARM_ibfk_2` FOREIGN KEY (`idF`) REFERENCES `FARMACIA` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROD_FARM`
--

LOCK TABLES `PROD_FARM` WRITE;
/*!40000 ALTER TABLE `PROD_FARM` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROD_FARM` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER after_prod_farm_insert 
    AFTER INSERT ON PROD_FARM
    FOR EACH ROW 
BEGIN
    update PRODUCTO set cnt = cnt + 1 where id = NEW.idP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER after_prod_farm_delete
    AFTER DELETE ON PROD_FARM
    FOR EACH ROW 
BEGIN
    update PRODUCTO set cnt = cnt - 1 where id = OLD.idP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `PROD_SUG`
--

DROP TABLE IF EXISTS `PROD_SUG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROD_SUG` (
  `idp` int(11) NOT NULL,
  `ids` varchar(50) NOT NULL,
  PRIMARY KEY (`ids`,`idp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROD_SUG`
--

LOCK TABLES `PROD_SUG` WRITE;
/*!40000 ALTER TABLE `PROD_SUG` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROD_SUG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_SAN`
--

DROP TABLE IF EXISTS `REG_SAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_SAN` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(13) DEFAULT NULL,
  `vencimiento` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_SAN`
--

LOCK TABLES `REG_SAN` WRITE;
/*!40000 ALTER TABLE `REG_SAN` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_SAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPO_PERSONAL`
--

DROP TABLE IF EXISTS `TIPO_PERSONAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPO_PERSONAL` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPO_PERSONAL`
--

LOCK TABLES `TIPO_PERSONAL` WRITE;
/*!40000 ALTER TABLE `TIPO_PERSONAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPO_PERSONAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPO_PRESENTACION`
--

DROP TABLE IF EXISTS `TIPO_PRESENTACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPO_PRESENTACION` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`descripcion`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPO_PRESENTACION`
--

LOCK TABLES `TIPO_PRESENTACION` WRITE;
/*!40000 ALTER TABLE `TIPO_PRESENTACION` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPO_PRESENTACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UBIGEO`
--

DROP TABLE IF EXISTS `UBIGEO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UBIGEO` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `tipo` tinyint(4) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_UBIGEO_UBIGEO1_idx` (`parent`),
  CONSTRAINT `fk_UBIGEO_UBIGEO1` FOREIGN KEY (`parent`) REFERENCES `UBIGEO` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UBIGEO`
--

LOCK TABLES `UBIGEO` WRITE;
/*!40000 ALTER TABLE `UBIGEO` DISABLE KEYS */;
/*!40000 ALTER TABLE `UBIGEO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `run_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'/20161230052237-init','2017-11-27 20:32:34'),(2,'/20170113223137-tabla-android','2017-11-27 20:32:35'),(3,'/20170225043926-notificacion','2017-11-27 20:32:36'),(4,'/20170303205246-ubigeo','2017-11-27 20:32:36'),(5,'/20170304221409-sugerencias','2017-11-27 20:32:37'),(6,'/20170308152540-addpactivo','2017-11-27 20:32:38'),(7,'/20170309122036-Product-cnt','2017-11-27 20:32:39');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-27 20:33:11
