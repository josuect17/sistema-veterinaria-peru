-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sistema_veterinaria_db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agenda_cita`
--

DROP TABLE IF EXISTS `agenda_cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda_cita` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `motivo` varchar(200) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `observaciones` longtext DEFAULT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `mascota_id` bigint(20) NOT NULL,
  `veterinario_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agenda_cita_mascota_id_10ddc0b7_fk_clientes_mascota_id` (`mascota_id`),
  KEY `agenda_cita_veterinario_id_a9e51059_fk_auth_user_id` (`veterinario_id`),
  CONSTRAINT `agenda_cita_mascota_id_10ddc0b7_fk_clientes_mascota_id` FOREIGN KEY (`mascota_id`) REFERENCES `clientes_mascota` (`id`),
  CONSTRAINT `agenda_cita_veterinario_id_a9e51059_fk_auth_user_id` FOREIGN KEY (`veterinario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_cita`
--

LOCK TABLES `agenda_cita` WRITE;
/*!40000 ALTER TABLE `agenda_cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda_cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add clinica',7,'add_clinica'),(26,'Can change clinica',7,'change_clinica'),(27,'Can delete clinica',7,'delete_clinica'),(28,'Can view clinica',7,'view_clinica'),(29,'Can add cliente',8,'add_cliente'),(30,'Can change cliente',8,'change_cliente'),(31,'Can delete cliente',8,'delete_cliente'),(32,'Can view cliente',8,'view_cliente'),(33,'Can add mascota',9,'add_mascota'),(34,'Can change mascota',9,'change_mascota'),(35,'Can delete mascota',9,'delete_mascota'),(36,'Can view mascota',9,'view_mascota'),(37,'Can add cita',10,'add_cita'),(38,'Can change cita',10,'change_cita'),(39,'Can delete cita',10,'delete_cita'),(40,'Can view cita',10,'view_cita'),(41,'Can add historia clinica',12,'add_historiaclinica'),(42,'Can change historia clinica',12,'change_historiaclinica'),(43,'Can delete historia clinica',12,'delete_historiaclinica'),(44,'Can view historia clinica',12,'view_historiaclinica'),(45,'Can add receta',13,'add_receta'),(46,'Can change receta',13,'change_receta'),(47,'Can delete receta',13,'delete_receta'),(48,'Can view receta',13,'view_receta'),(49,'Can add detalle receta',11,'add_detallereceta'),(50,'Can change detalle receta',11,'change_detallereceta'),(51,'Can delete detalle receta',11,'delete_detallereceta'),(52,'Can view detalle receta',11,'view_detallereceta'),(53,'Can add vacuna',14,'add_vacuna'),(54,'Can change vacuna',14,'change_vacuna'),(55,'Can delete vacuna',14,'delete_vacuna'),(56,'Can view vacuna',14,'view_vacuna'),(57,'Can add categoria',15,'add_categoria'),(58,'Can change categoria',15,'change_categoria'),(59,'Can delete categoria',15,'delete_categoria'),(60,'Can view categoria',15,'view_categoria'),(61,'Can add proveedor',18,'add_proveedor'),(62,'Can change proveedor',18,'change_proveedor'),(63,'Can delete proveedor',18,'delete_proveedor'),(64,'Can view proveedor',18,'view_proveedor'),(65,'Can add producto',17,'add_producto'),(66,'Can change producto',17,'change_producto'),(67,'Can delete producto',17,'delete_producto'),(68,'Can view producto',17,'view_producto'),(69,'Can add movimiento',16,'add_movimiento'),(70,'Can change movimiento',16,'change_movimiento'),(71,'Can delete movimiento',16,'delete_movimiento'),(72,'Can view movimiento',16,'view_movimiento'),(73,'Can add caja',19,'add_caja'),(74,'Can change caja',19,'change_caja'),(75,'Can delete caja',19,'delete_caja'),(76,'Can view caja',19,'view_caja'),(77,'Can add factura',21,'add_factura'),(78,'Can change factura',21,'change_factura'),(79,'Can delete factura',21,'delete_factura'),(80,'Can view factura',21,'view_factura'),(81,'Can add detalle factura',20,'add_detallefactura'),(82,'Can change detalle factura',20,'change_detallefactura'),(83,'Can delete detalle factura',20,'delete_detallefactura'),(84,'Can view detalle factura',20,'view_detallefactura'),(85,'Can add servicio grooming',22,'add_serviciogrooming'),(86,'Can change servicio grooming',22,'change_serviciogrooming'),(87,'Can delete servicio grooming',22,'delete_serviciogrooming'),(88,'Can view servicio grooming',22,'view_serviciogrooming'),(89,'Can add Consulta Virtual',23,'add_consultavirtual'),(90,'Can change Consulta Virtual',23,'change_consultavirtual'),(91,'Can delete Consulta Virtual',23,'delete_consultavirtual'),(92,'Can view Consulta Virtual',23,'view_consultavirtual'),(93,'Can add Configuración',24,'add_configuracion'),(94,'Can change Configuración',24,'change_configuracion'),(95,'Can delete Configuración',24,'delete_configuracion'),(96,'Can view Configuración',24,'view_configuracion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1200000$lRqrVAWM0EQADk5ZWCUNc6$LX78a9JKBV6KIAHvJcHF8gW2X8XwLuPo1jUJi/zqDPs=','2026-03-07 05:31:20.901096',1,'admin','','','admin@example.com',1,1,'2026-03-06 09:28:29.556283'),(2,'123456',NULL,0,'dr.fernando','Fernando','Salas','fernando@vet.com',1,1,'2026-03-06 17:23:46.014535'),(3,'pbkdf2_sha256$1200000$aW1EqmntjOkQ9KTVPhCW1P$PWGSGoHyaWke10dMlPLJ/BMVMyCHWhtGmgtMuDKOsU8=',NULL,0,'dra.carmen','Carmen','Rios','carmen@vet.com',1,1,'2026-03-06 17:23:49.505206'),(4,'pbkdf2_sha256$720000$qFlJ4ThD5YmOQ81LCEytM4$8woiiMOjgb8fcAT0bclTyPLX8KZxvkAZNyWzEJGeCUQ=','2026-04-25 21:08:57.438945',1,'admin2','','','josuect1798@gmail.com',1,1,'2026-04-04 03:25:37.943913'),(5,'pbkdf2_sha256$720000$oirw1OwnhHd3u7tTJeQqUU$0WpeP4eqaCqUEbg6GRaAIgveQZVhMIc5iarZZ9CG01U=','2026-04-04 14:08:44.764405',0,'dr.mateo','Dr. Mateo','Collantes','mateo@gmail.com',1,1,'2026-04-04 13:17:22.323605'),(6,'pbkdf2_sha256$720000$ILksC281CTb3NKCoZJvS0J$GDqRmW4t6QXa6ZKP1VBm5ekZvH6rOWopzFIBAi+u6ko=','2026-04-25 21:05:32.025888',0,'recepcionista1','Josue','Collantes Torres','josue_c_t@hotmial.com',0,1,'2026-04-25 21:01:00.063541'),(7,'pbkdf2_sha256$720000$s7wtxQOD6KKhii23VlVYwa$TvPlO6TI09jqJu9KKMyL/GFmK4hBVuuckV+0CQBO6dI=','2026-04-25 21:03:49.929051',0,'grooming1','G','G','g@gamil.com',0,1,'2026-04-25 21:03:19.439252');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes_cliente`
--

DROP TABLE IF EXISTS `clientes_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes_cliente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `direccion` longtext DEFAULT NULL,
  `fecha_registro` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_cliente`
--

LOCK TABLES `clientes_cliente` WRITE;
/*!40000 ALTER TABLE `clientes_cliente` DISABLE KEYS */;
INSERT INTO `clientes_cliente` VALUES (1,'JOSUE','COLLANTES','72530555','936108572','josue_c_t@hotmial.com','AV JORGE CHAVEZ SN','2026-04-25 21:57:09.034101',1);
/*!40000 ALTER TABLE `clientes_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes_mascota`
--

DROP TABLE IF EXISTS `clientes_mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes_mascota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `especie` varchar(20) NOT NULL,
  `raza` varchar(100) DEFAULT NULL,
  `sexo` varchar(1) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `peso_actual` decimal(5,2) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `microchip` varchar(50) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `fecha_registro` datetime(6) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_mascota_cliente_id_0959a759_fk_clientes_cliente_id` (`cliente_id`),
  CONSTRAINT `clientes_mascota_cliente_id_0959a759_fk_clientes_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_mascota`
--

LOCK TABLES `clientes_mascota` WRITE;
/*!40000 ALTER TABLE `clientes_mascota` DISABLE KEYS */;
INSERT INTO `clientes_mascota` VALUES (1,'KENNY','CANINO','Cocker Spanish','M','2010-01-01',12.00,'Blanco - caramelo','01','mascotas/tommy_qm9x3eM.jpg','2026-04-25 21:58:05.233599',1,1);
/*!40000 ALTER TABLE `clientes_mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion_configuracion`
--

DROP TABLE IF EXISTS `configuracion_configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion_configuracion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(150) NOT NULL,
  `slogan` varchar(200) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `simbolo_moneda` varchar(10) NOT NULL,
  `nombre_moneda` varchar(50) NOT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `telefono2` varchar(30) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `sitio_web` varchar(200) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(100) NOT NULL,
  `color_primario` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion_configuracion`
--

LOCK TABLES `configuracion_configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion_configuracion` DISABLE KEYS */;
INSERT INTO `configuracion_configuracion` VALUES (1,'VetSystem',NULL,'','S/','Soles',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Perú','#0ac717');
/*!40000 ALTER TABLE `configuracion_configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_clinica`
--

DROP TABLE IF EXISTS `core_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_clinica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `razon_social` varchar(150) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `color_primario` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_clinica`
--

LOCK TABLES `core_clinica` WRITE;
/*!40000 ALTER TABLE `core_clinica` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(10,'agenda','cita'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(8,'clientes','cliente'),(9,'clientes','mascota'),(24,'configuracion','configuracion'),(5,'contenttypes','contenttype'),(7,'core','clinica'),(19,'facturacion','caja'),(20,'facturacion','detallefactura'),(21,'facturacion','factura'),(22,'grooming','serviciogrooming'),(15,'inventario','categoria'),(16,'inventario','movimiento'),(17,'inventario','producto'),(18,'inventario','proveedor'),(11,'medico','detallereceta'),(12,'medico','historiaclinica'),(13,'medico','receta'),(14,'medico','vacuna'),(6,'sessions','session'),(23,'telemedicina','consultavirtual');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-03-06 09:28:05.483185'),(2,'auth','0001_initial','2026-03-06 09:28:06.098633'),(3,'admin','0001_initial','2026-03-06 09:28:06.222990'),(4,'admin','0002_logentry_remove_auto_add','2026-03-06 09:28:06.232494'),(5,'admin','0003_logentry_add_action_flag_choices','2026-03-06 09:28:06.241382'),(6,'clientes','0001_initial','2026-03-06 09:28:06.325685'),(7,'agenda','0001_initial','2026-03-06 09:28:06.457808'),(8,'contenttypes','0002_remove_content_type_name','2026-03-06 09:28:06.532651'),(9,'auth','0002_alter_permission_name_max_length','2026-03-06 09:28:06.599069'),(10,'auth','0003_alter_user_email_max_length','2026-03-06 09:28:06.638250'),(11,'auth','0004_alter_user_username_opts','2026-03-06 09:28:06.648020'),(12,'auth','0005_alter_user_last_login_null','2026-03-06 09:28:06.700929'),(13,'auth','0006_require_contenttypes_0002','2026-03-06 09:28:06.703794'),(14,'auth','0007_alter_validators_add_error_messages','2026-03-06 09:28:06.712469'),(15,'auth','0008_alter_user_username_max_length','2026-03-06 09:28:06.774255'),(16,'auth','0009_alter_user_last_name_max_length','2026-03-06 09:28:06.840278'),(17,'auth','0010_alter_group_name_max_length','2026-03-06 09:28:06.878697'),(18,'auth','0011_update_proxy_permissions','2026-03-06 09:28:06.889882'),(19,'auth','0012_alter_user_first_name_max_length','2026-03-06 09:28:06.960748'),(20,'core','0001_initial','2026-03-06 09:28:06.978360'),(21,'inventario','0001_initial','2026-03-06 09:28:07.234964'),(22,'facturacion','0001_initial','2026-03-06 09:28:07.449193'),(23,'grooming','0001_initial','2026-03-06 09:28:07.575574'),(24,'medico','0001_initial','2026-03-06 09:28:08.217724'),(25,'sessions','0001_initial','2026-03-06 09:28:08.250644'),(26,'telemedicina','0001_initial','2026-03-07 01:08:51.908610'),(27,'agenda','0002_cita_is_active','2026-03-07 01:29:28.680456'),(28,'clientes','0002_cliente_is_active_mascota_is_active','2026-03-07 01:29:28.822415'),(29,'grooming','0002_serviciogrooming_is_active','2026-03-07 01:29:28.906671'),(30,'configuracion','0001_initial','2026-03-07 05:35:46.631350');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('gb9fxesunf6itus4qzpo5g2u1m1xhljd','.eJxVjDEOgzAMAP_iuYoSQ2Jg7M4bkGOnDW0VJAJT1b9XSAztene6N0y8b3naa1qnWWEAD5dfFlmeqRxCH1zui5GlbOsczZGY01YzLppe17P9G2SuGQaIqExehTGmltC5iN2tDcH2HZGVloK3mLhXDl4bJVUKJCi2R9eIa-DzBeHoN20:1w91eH:oSiMoTLW57YT_O-m0yXwQMDD9YIF5LbQFG6G7QD1ENw','2026-04-18 14:06:53.178603'),('lqpzbf8vp4y3s1i2bsszbw1c4hg0u7o1','.eJxVjLsOwjAMAP_FM4qcpiQ2IzvfUDl2QguolfqYEP-OKnWA9e50b-hkW_tuW8rcDQYX8HD6ZVn0WcZd2EPG--R0Gtd5yG5P3GEXd5usvK5H-zfoZenhApWQNKgy0TlmK9SmhCFVS21CkqyBc1MZ1bx5YmlCRW2QY2SPEhk-X92tN1k:1vykG0:X4Y_pFhbm-bbsgbUSm_QVnIqjQaCfmTEt_VVzC-DHM0','2026-03-21 05:31:20.906242'),('rqlrmm1u7jhxeietemxuj21a4jki6590','.eJxVjDEOgzAMAP_iuYoSQ2Jg7M4bkGOnDW0VJAJT1b9XSAztene6N0y8b3naa1qnWWEAD5dfFlmeqRxCH1zui5GlbOsczZGY01YzLppe17P9G2SuGQaIqExehTGmltC5iN2tDcH2HZGVloK3mLhXDl4bJVUKJCi2R9eIa-DzBeHoN20:1w91g4:jFZ_UIzeoeOI_CXs-hA6pbYmxCdxjOJXXlII_SYrAGw','2026-04-18 14:08:44.780975'),('v9h1jkb6yg9c9z4llhuvywccrp7gt1he','.eJxVjLsOwjAMAP8lM4riuE1TRvZ-Q2THLimgVupjQvw7itQB1rvTvU2iYy_p2HRNk5iraczllzHlp85VyIPm-2LzMu_rxLYm9rSbHRbR1-1s_waFtlK3LG0EDMjgMEJwEbrAPcjoBboG0UOrbc-j1xh9cESBfVZ01KtKdObzBa8WNwY:1wGkFF:_SUt6Enovy-P-QhXHQfFSSsuOS8SymeOnDXqLoSusVI','2026-05-09 21:08:57.450383');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacion_caja`
--

DROP TABLE IF EXISTS `facturacion_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturacion_caja` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `monto_inicial` decimal(10,2) NOT NULL,
  `total_ingresos` decimal(10,2) NOT NULL,
  `total_egresos` decimal(10,2) NOT NULL,
  `monto_final` decimal(10,2) NOT NULL,
  `cerrada` tinyint(1) NOT NULL,
  `fecha_cierre` datetime(6) DEFAULT NULL,
  `usuario_cierre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fecha` (`fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacion_caja`
--

LOCK TABLES `facturacion_caja` WRITE;
/*!40000 ALTER TABLE `facturacion_caja` DISABLE KEYS */;
INSERT INTO `facturacion_caja` VALUES (1,'2026-04-25',0.00,25.00,0.00,25.00,0,NULL,NULL);
/*!40000 ALTER TABLE `facturacion_caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacion_detallefactura`
--

DROP TABLE IF EXISTS `facturacion_detallefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturacion_detallefactura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `producto_id` bigint(20) DEFAULT NULL,
  `factura_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `facturacion_detallef_producto_id_bfc64d4a_fk_inventari` (`producto_id`),
  KEY `facturacion_detallef_factura_id_32a734c1_fk_facturaci` (`factura_id`),
  CONSTRAINT `facturacion_detallef_factura_id_32a734c1_fk_facturaci` FOREIGN KEY (`factura_id`) REFERENCES `facturacion_factura` (`id`),
  CONSTRAINT `facturacion_detallef_producto_id_bfc64d4a_fk_inventari` FOREIGN KEY (`producto_id`) REFERENCES `inventario_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacion_detallefactura`
--

LOCK TABLES `facturacion_detallefactura` WRITE;
/*!40000 ALTER TABLE `facturacion_detallefactura` DISABLE KEYS */;
INSERT INTO `facturacion_detallefactura` VALUES (1,'Antiparasitario Canino x1',1,25.00,25.00,1,1);
/*!40000 ALTER TABLE `facturacion_detallefactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacion_factura`
--

DROP TABLE IF EXISTS `facturacion_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturacion_factura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `igv` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `cajero` varchar(100) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`),
  KEY `facturacion_factura_cliente_id_a467a777_fk_clientes_cliente_id` (`cliente_id`),
  CONSTRAINT `facturacion_factura_cliente_id_a467a777_fk_clientes_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacion_factura`
--

LOCK TABLES `facturacion_factura` WRITE;
/*!40000 ALTER TABLE `facturacion_factura` DISABLE KEYS */;
INSERT INTO `facturacion_factura` VALUES (1,'2026-04-25 21:59:04.570496','F-000001',21.19,3.81,25.00,'EFECTIVO','PAGADA','admin2',1);
/*!40000 ALTER TABLE `facturacion_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grooming_serviciogrooming`
--

DROP TABLE IF EXISTS `grooming_serviciogrooming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grooming_serviciogrooming` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bano` tinyint(1) NOT NULL,
  `corte_pelo` tinyint(1) NOT NULL,
  `corte_unas` tinyint(1) NOT NULL,
  `limpieza_oidos` tinyint(1) NOT NULL,
  `glandulas` tinyint(1) NOT NULL,
  `perfume` tinyint(1) NOT NULL,
  `observaciones` longtext DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `cita_id` bigint(20) NOT NULL,
  `peluquero_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cita_id` (`cita_id`),
  KEY `grooming_serviciogrooming_peluquero_id_713d3f2c_fk_auth_user_id` (`peluquero_id`),
  CONSTRAINT `grooming_serviciogrooming_cita_id_adcf4f3d_fk_agenda_cita_id` FOREIGN KEY (`cita_id`) REFERENCES `agenda_cita` (`id`),
  CONSTRAINT `grooming_serviciogrooming_peluquero_id_713d3f2c_fk_auth_user_id` FOREIGN KEY (`peluquero_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grooming_serviciogrooming`
--

LOCK TABLES `grooming_serviciogrooming` WRITE;
/*!40000 ALTER TABLE `grooming_serviciogrooming` DISABLE KEYS */;
/*!40000 ALTER TABLE `grooming_serviciogrooming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_categoria`
--

DROP TABLE IF EXISTS `inventario_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_categoria`
--

LOCK TABLES `inventario_categoria` WRITE;
/*!40000 ALTER TABLE `inventario_categoria` DISABLE KEYS */;
INSERT INTO `inventario_categoria` VALUES (1,'Medicamentos','Inyectables y pastillas'),(2,'Alimentos','Comida seca y húmeda'),(3,'Accesorios','Correas, juguetes');
/*!40000 ALTER TABLE `inventario_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_movimiento`
--

DROP TABLE IF EXISTS `inventario_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_movimiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(10) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `motivo` varchar(200) NOT NULL,
  `comprobante` varchar(100) DEFAULT NULL,
  `producto_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inventario_movimient_producto_id_4356cb23_fk_inventari` (`producto_id`),
  CONSTRAINT `inventario_movimient_producto_id_4356cb23_fk_inventari` FOREIGN KEY (`producto_id`) REFERENCES `inventario_producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_movimiento`
--

LOCK TABLES `inventario_movimiento` WRITE;
/*!40000 ALTER TABLE `inventario_movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario_movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_producto`
--

DROP TABLE IF EXISTS `inventario_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_producto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `precio_compra` decimal(8,2) NOT NULL,
  `precio_venta` decimal(8,2) NOT NULL,
  `stock_actual` int(11) NOT NULL,
  `stock_minimo` int(11) NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `categoria_id` bigint(20) DEFAULT NULL,
  `proveedor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `inventario_producto_categoria_id_7033fb47_fk_inventari` (`categoria_id`),
  KEY `inventario_producto_proveedor_id_2feee190_fk_inventari` (`proveedor_id`),
  CONSTRAINT `inventario_producto_categoria_id_7033fb47_fk_inventari` FOREIGN KEY (`categoria_id`) REFERENCES `inventario_categoria` (`id`),
  CONSTRAINT `inventario_producto_proveedor_id_2feee190_fk_inventari` FOREIGN KEY (`proveedor_id`) REFERENCES `inventario_proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_producto`
--

LOCK TABLES `inventario_producto` WRITE;
/*!40000 ALTER TABLE `inventario_producto` DISABLE KEYS */;
INSERT INTO `inventario_producto` VALUES (1,'MED-001','Antiparasitario Canino x1',NULL,10.00,25.00,48,10,NULL,1,1,1),(2,'MED-002','Vacuna Multiple',NULL,30.00,65.00,12,15,NULL,1,1,1),(3,'ALI-001','Dog Chow Adultos 15kg',NULL,110.00,160.00,8,5,NULL,1,2,2),(4,'ALI-002','Cat Chow Gatitos 3kg','',35.00,50.00,6,5,NULL,1,2,2),(5,'ACC-001','Collar Antipulgas Seresto',NULL,140.00,210.00,10,3,NULL,1,3,2),(6,'SER-001','Consulta Medica General',NULL,0.00,20.00,1000,0,NULL,1,NULL,NULL),(7,'SER-002','Bano y Corte M',NULL,0.00,60.00,999,0,NULL,1,NULL,NULL),(8,'0020','CORTIVET','Capsula para alergia',1.00,3.00,20,10,'2028-01-01',1,1,1),(9,'MED-003','SIMPARICA TRIO 10 - 20 KG','TB ANTIPULGAS, GARRAPATAS Y PARASITOS',40.00,65.00,10,3,'2028-01-04',1,1,2);
/*!40000 ALTER TABLE `inventario_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_proveedor`
--

DROP TABLE IF EXISTS `inventario_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_proveedor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `direccion` longtext DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ruc` (`ruc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_proveedor`
--

LOCK TABLES `inventario_proveedor` WRITE;
/*!40000 ALTER TABLE `inventario_proveedor` DISABLE KEYS */;
INSERT INTO `inventario_proveedor` VALUES (1,'Distribuidora Vet','20123456789','01-555-1234',NULL,NULL,NULL),(2,'PetSupply Peru','20987654321','01-666-4321',NULL,NULL,NULL);
/*!40000 ALTER TABLE `inventario_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico_detallereceta`
--

DROP TABLE IF EXISTS `medico_detallereceta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico_detallereceta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `medicamento` varchar(100) NOT NULL,
  `dosis` varchar(100) NOT NULL,
  `frecuencia` varchar(100) NOT NULL,
  `duracion` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `receta_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `medico_detallereceta_receta_id_87b4dee9_fk_medico_receta_id` (`receta_id`),
  CONSTRAINT `medico_detallereceta_receta_id_87b4dee9_fk_medico_receta_id` FOREIGN KEY (`receta_id`) REFERENCES `medico_receta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico_detallereceta`
--

LOCK TABLES `medico_detallereceta` WRITE;
/*!40000 ALTER TABLE `medico_detallereceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico_detallereceta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico_historiaclinica`
--

DROP TABLE IF EXISTS `medico_historiaclinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico_historiaclinica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `motivo_consulta` longtext NOT NULL,
  `anamnesis` longtext NOT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `temperatura` decimal(4,1) DEFAULT NULL,
  `frecuencia_cardiaca` int(11) DEFAULT NULL,
  `frecuencia_respiratoria` int(11) DEFAULT NULL,
  `mucosas` varchar(50) DEFAULT NULL,
  `tiempo_llenado_capilar` varchar(50) DEFAULT NULL,
  `diagnostico` longtext NOT NULL,
  `tratamiento` longtext NOT NULL,
  `observaciones` longtext DEFAULT NULL,
  `proxima_cita` date DEFAULT NULL,
  `cita_id` bigint(20) DEFAULT NULL,
  `mascota_id` bigint(20) NOT NULL,
  `veterinario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cita_id` (`cita_id`),
  KEY `medico_historiaclini_mascota_id_51fe45ab_fk_clientes_` (`mascota_id`),
  KEY `medico_historiaclinica_veterinario_id_245dfd5d_fk_auth_user_id` (`veterinario_id`),
  CONSTRAINT `medico_historiaclini_mascota_id_51fe45ab_fk_clientes_` FOREIGN KEY (`mascota_id`) REFERENCES `clientes_mascota` (`id`),
  CONSTRAINT `medico_historiaclinica_cita_id_e420eb87_fk_agenda_cita_id` FOREIGN KEY (`cita_id`) REFERENCES `agenda_cita` (`id`),
  CONSTRAINT `medico_historiaclinica_veterinario_id_245dfd5d_fk_auth_user_id` FOREIGN KEY (`veterinario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico_historiaclinica`
--

LOCK TABLES `medico_historiaclinica` WRITE;
/*!40000 ALTER TABLE `medico_historiaclinica` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico_historiaclinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico_receta`
--

DROP TABLE IF EXISTS `medico_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico_receta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `indicaciones_generales` longtext DEFAULT NULL,
  `fecha` datetime(6) NOT NULL,
  `historia_clinica_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `historia_clinica_id` (`historia_clinica_id`),
  CONSTRAINT `medico_receta_historia_clinica_id_f5b1fa06_fk_medico_hi` FOREIGN KEY (`historia_clinica_id`) REFERENCES `medico_historiaclinica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico_receta`
--

LOCK TABLES `medico_receta` WRITE;
/*!40000 ALTER TABLE `medico_receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico_vacuna`
--

DROP TABLE IF EXISTS `medico_vacuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico_vacuna` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_vacuna` varchar(100) NOT NULL,
  `lote` varchar(50) DEFAULT NULL,
  `fecha_aplicacion` date NOT NULL,
  `fecha_proxima_dosis` date DEFAULT NULL,
  `observaciones` longtext DEFAULT NULL,
  `mascota_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) DEFAULT NULL,
  `veterinario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medico_vacuna_mascota_id_f730ddde_fk_clientes_mascota_id` (`mascota_id`),
  KEY `medico_vacuna_producto_id_63da14c3_fk_inventario_producto_id` (`producto_id`),
  KEY `medico_vacuna_veterinario_id_69660832_fk_auth_user_id` (`veterinario_id`),
  CONSTRAINT `medico_vacuna_mascota_id_f730ddde_fk_clientes_mascota_id` FOREIGN KEY (`mascota_id`) REFERENCES `clientes_mascota` (`id`),
  CONSTRAINT `medico_vacuna_producto_id_63da14c3_fk_inventario_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `inventario_producto` (`id`),
  CONSTRAINT `medico_vacuna_veterinario_id_69660832_fk_auth_user_id` FOREIGN KEY (`veterinario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico_vacuna`
--

LOCK TABLES `medico_vacuna` WRITE;
/*!40000 ALTER TABLE `medico_vacuna` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico_vacuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telemedicina_consultavirtual`
--

DROP TABLE IF EXISTS `telemedicina_consultavirtual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telemedicina_consultavirtual` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plataforma` varchar(20) NOT NULL,
  `enlace_reunion` varchar(500) DEFAULT NULL,
  `codigo_acceso` varchar(50) DEFAULT NULL,
  `estado_conexion` varchar(20) NOT NULL,
  `notas_preliminares` longtext DEFAULT NULL,
  `cita_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cita_id` (`cita_id`),
  CONSTRAINT `telemedicina_consultavirtual_cita_id_46cddf6e_fk_agenda_cita_id` FOREIGN KEY (`cita_id`) REFERENCES `agenda_cita` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telemedicina_consultavirtual`
--

LOCK TABLES `telemedicina_consultavirtual` WRITE;
/*!40000 ALTER TABLE `telemedicina_consultavirtual` DISABLE KEYS */;
/*!40000 ALTER TABLE `telemedicina_consultavirtual` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-25 16:59:17
