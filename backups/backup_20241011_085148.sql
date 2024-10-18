-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: db_proyecto
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tipo_documento` varchar(3) NOT NULL,
  `numero_documento` int unsigned NOT NULL,
  `telefono` int unsigned NOT NULL,
  `contrasena` varchar(128) NOT NULL,
  `conf_contrasena` varchar(128) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_documento` (`numero_documento`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Administrador_user_id_949907f5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `administrador_chk_1` CHECK ((`numero_documento` >= 0)),
  CONSTRAINT `administrador_chk_2` CHECK ((`telefono` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Juan','CC',21121212,3227977187,'','',4),(7,'wdwwd','CC',23123123,3103301145,'','',11),(9,'asdfff','CE',11111111,3227977154,'','',14),(10,'Andrye','CC',1052383822,3102107858,'','',15);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Categoria',7,'add_categoria'),(26,'Can change Categoria',7,'change_categoria'),(27,'Can delete Categoria',7,'delete_categoria'),(28,'Can view Categoria',7,'view_categoria'),(29,'Can add Cliente',8,'add_cliente'),(30,'Can change Cliente',8,'change_cliente'),(31,'Can delete Cliente',8,'delete_cliente'),(32,'Can view Cliente',8,'view_cliente'),(33,'Can add Empleado',9,'add_empleado'),(34,'Can change Empleado',9,'change_empleado'),(35,'Can delete Empleado',9,'delete_empleado'),(36,'Can view Empleado',9,'view_empleado'),(37,'Can add Marca',10,'add_marca'),(38,'Can change Marca',10,'change_marca'),(39,'Can delete Marca',10,'delete_marca'),(40,'Can view Marca',10,'view_marca'),(41,'Can add Presentacion',11,'add_presentacion'),(42,'Can change Presentacion',11,'change_presentacion'),(43,'Can delete Presentacion',11,'delete_presentacion'),(44,'Can view Presentacion',11,'view_presentacion'),(45,'Can add Proveedor',12,'add_proveedor'),(46,'Can change Proveedor',12,'change_proveedor'),(47,'Can delete Proveedor',12,'delete_proveedor'),(48,'Can view Proveedor',12,'view_proveedor'),(49,'Can add Producto',13,'add_producto'),(50,'Can change Producto',13,'change_producto'),(51,'Can delete Producto',13,'delete_producto'),(52,'Can view Producto',13,'view_producto'),(53,'Can add Compra',14,'add_compra'),(54,'Can change Compra',14,'change_compra'),(55,'Can delete Compra',14,'delete_compra'),(56,'Can view Compra',14,'view_compra'),(57,'Can add Venta',15,'add_venta'),(58,'Can change Venta',15,'change_venta'),(59,'Can delete Venta',15,'delete_venta'),(60,'Can view Venta',15,'view_venta'),(61,'Can add Administrador',16,'add_administrador'),(62,'Can change Administrador',16,'change_administrador'),(63,'Can delete Administrador',16,'delete_administrador'),(64,'Can view Administrador',16,'view_administrador'),(65,'Can add Detalle venta',17,'add_det_venta'),(66,'Can change Detalle venta',17,'change_det_venta'),(67,'Can delete Detalle venta',17,'delete_det_venta'),(68,'Can view Detalle venta',17,'view_det_venta'),(69,'Can add Detalle Compra',18,'add_det_compra'),(70,'Can change Detalle Compra',18,'change_det_compra'),(71,'Can delete Detalle Compra',18,'delete_det_compra'),(72,'Can view Detalle Compra',18,'view_det_compra');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$1C1FcfI1Av2yY1JRBvUeeI$gdnDA9Sh7v8R+dDJveKExBW3wpv9TNXHsdPGkemUETw=','2024-10-11 08:41:28.173001',1,'admin','','','dg154906@gmail.com',1,1,'2024-09-01 07:18:26.750263'),(2,'pbkdf2_sha256$870000$5U1wrQzh4QJENgaGy8EDPx$XYbSOgHGVmMH2Fc/x+ZxEHUJNkbmPi8gXwguUUGP3ns=','2024-10-11 08:39:22.952850',0,'daniel','','','daniel@gmail.com',0,1,'2024-09-01 07:26:26.219997'),(4,'pbkdf2_sha256$870000$uhNYanx9XORHmuDjvJZjM0$+z3i0gfK+lDIP++rkgsOHkvnxr9D/vZAl0G95PDCz5M=','2024-10-10 06:32:14.413426',1,'Juan','','','juan@gmail.com',1,1,'2024-09-17 20:10:34.018094'),(11,'pbkdf2_sha256$870000$RUZaFwjJH0yE9Jb7Obq3pD$Ots0GsA25sY7hXOebvsYuHkqOnkawhIirkcHIaaay5I=',NULL,1,'user','','','asd@gmail.com',1,1,'2024-10-08 01:15:00.455237'),(14,'pbkdf2_sha256$870000$kQuBrx7jid0LCmCuM9UjkR$kmgtxUsINywTXRjlr4xrMubBDuW1YYAmJVaAQAwLsrw=',NULL,1,'Prueba','','','asdasd@mail.com',1,1,'2024-10-11 00:49:18.067602'),(15,'pbkdf2_sha256$870000$IOi9n5LdXOKn6gKBCwlzTH$3w5TnNvIzvDVG6ENoOMeKS+bZ4ffkAdq45aIEcNW31o=',NULL,1,'Romero','','','andreyrimero381@gmail.com',1,1,'2024-10-11 08:06:38.912000'),(16,'pbkdf2_sha256$870000$kWCrQ06z8nHOZSuSpYYFdb$8CKn7JSb4r19F4t3XezjFvQ4cfpQe2fgGe7zrC43aQw=',NULL,0,'david','','','daniel12333@gmail.com',0,1,'2024-10-11 08:33:28.179297');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (4,'Snacks','Activo'),(5,'Licores','Inactivo'),(6,'Golosinas','Activo'),(10,'Gaseosas','Activo'),(11,'Bebidas energeticas','Activo');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cc_cliente` int unsigned NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `telefono` int unsigned NOT NULL,
  `tipo_documento` varchar(3) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_cliente` (`cc_cliente`),
  UNIQUE KEY `telefono` (`telefono`),
  CONSTRAINT `Cliente_cc_cliente_0be5677a_check` CHECK ((`cc_cliente` >= 0)),
  CONSTRAINT `Cliente_telefono_f7801955_check` CHECK ((`telefono` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (3,2391328546,'Andress','Vargass',3103301142,'CC','Activo'),(4,12132123,'Juan Armando','Montoya',3203302545,'CC','Activo'),(5,105343443,'Daniel Eduardo','Piragauta',3245165685,'CC','Inactivo'),(6,1053443398,'Juan Pablo','Leguizamon',3204521546,'CC','Activo'),(25,1052442859,'Juan Armando','Guzman Gonza',3227481549,'TI','Activo');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_compra` datetime(6) NOT NULL,
  `total_compra` decimal(9,2) NOT NULL,
  `proveedor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Compra_proveedor_id_b98cf6f8_fk_Proveedor_id` (`proveedor_id`),
  CONSTRAINT `Compra_proveedor_id_b98cf6f8_fk_Proveedor_id` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (15,'2024-10-09 00:50:00.000000',2000.00,1),(19,'2024-10-10 06:28:00.000000',2000.00,3),(20,'2024-10-10 06:29:00.000000',200000.00,1),(21,'2024-10-10 13:35:00.000000',500000.00,1),(22,'2024-10-10 23:10:00.000000',90000.00,1),(23,'2024-10-11 08:44:00.000000',10000.00,1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int unsigned NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  `subtotal` decimal(9,2) NOT NULL,
  `id_compra_id` bigint NOT NULL,
  `id_producto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Detalle_Compra_id_compra_id_d7a026d7_fk_Compra_id` (`id_compra_id`),
  KEY `Detalle_Compra_id_producto_id_be6f22c9_fk_Producto_id` (`id_producto_id`),
  CONSTRAINT `Detalle_Compra_id_compra_id_d7a026d7_fk_Compra_id` FOREIGN KEY (`id_compra_id`) REFERENCES `compra` (`id`),
  CONSTRAINT `Detalle_Compra_id_producto_id_be6f22c9_fk_Producto_id` FOREIGN KEY (`id_producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `detalle_compra_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (16,1,2000.00,2000.00,15,17),(20,20,100.00,2000.00,19,23),(21,200,1000.00,200000.00,20,23),(22,100,5000.00,500000.00,21,25),(23,15,6000.00,90000.00,22,26),(24,5,2000.00,10000.00,23,17);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int unsigned NOT NULL,
  `id_producto_id` bigint NOT NULL,
  `id_venta_id` bigint NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Detalle_Venta_id_producto_id_e91b6634_fk_Producto_id` (`id_producto_id`),
  KEY `Detalle_Venta_id_venta_id_3ef7fbd9_fk_Venta_id` (`id_venta_id`),
  CONSTRAINT `Detalle_Venta_id_producto_id_e91b6634_fk_Producto_id` FOREIGN KEY (`id_producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `Detalle_Venta_id_venta_id_3ef7fbd9_fk_Venta_id` FOREIGN KEY (`id_venta_id`) REFERENCES `venta` (`id`),
  CONSTRAINT `detalle_venta_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (99,1,17,88,2000.00,2000.00),(101,1,17,90,2000.00,2000.00),(102,1,21,91,50000.00,50000.00),(103,1,23,92,2000.00,2000.00),(104,4,17,93,2000.00,8000.00),(105,5,17,94,2000.00,10000.00),(106,1,17,95,2000.00,2000.00),(107,1,25,96,1900.00,1900.00),(109,1,17,98,2000.00,2000.00),(110,1,23,98,2000.00,2000.00),(112,2,17,100,2000.00,4000.00),(113,1,23,100,2000.00,2000.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(16,'app','administrador'),(7,'app','categoria'),(8,'app','cliente'),(14,'app','compra'),(18,'app','det_compra'),(17,'app','det_venta'),(9,'app','empleado'),(10,'app','marca'),(11,'app','presentacion'),(13,'app','producto'),(12,'app','proveedor'),(15,'app','venta'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-09-01 07:16:53.616943'),(2,'auth','0001_initial','2024-09-01 07:16:54.873940'),(3,'admin','0001_initial','2024-09-01 07:16:55.173848'),(4,'admin','0002_logentry_remove_auto_add','2024-09-01 07:16:55.188478'),(5,'admin','0003_logentry_add_action_flag_choices','2024-09-01 07:16:55.211248'),(6,'app','0001_initial','2024-09-01 07:16:56.396288'),(7,'app','0002_remove_producto_descripcion','2024-09-01 07:16:56.475609'),(8,'app','0003_alter_cliente_telefono_alter_empleado_telefono_and_more','2024-09-01 07:16:56.792976'),(9,'app','0004_alter_cliente_telefono_alter_empleado_telefono_and_more','2024-09-01 07:16:56.809165'),(10,'app','0005_alter_compra_fecha_compra_alter_venta_fecha_venta','2024-09-01 07:16:56.841751'),(11,'app','0006_alter_compra_fecha_compra_alter_venta_fecha_venta','2024-09-01 07:16:57.032102'),(12,'app','0007_alter_cliente_cc_cliente_alter_cliente_telefono_and_more','2024-09-01 07:16:58.085852'),(13,'app','0008_alter_venta_fecha_venta','2024-09-01 07:16:58.103994'),(14,'app','0009_administrador','2024-09-01 07:16:58.353707'),(15,'app','0010_remove_empleado_apellidos_remove_empleado_nombres_and_more','2024-09-01 07:16:58.922872'),(16,'app','0011_remove_venta_producto','2024-09-01 07:16:59.095431'),(17,'contenttypes','0002_remove_content_type_name','2024-09-01 07:16:59.261923'),(18,'auth','0002_alter_permission_name_max_length','2024-09-01 07:16:59.384074'),(19,'auth','0003_alter_user_email_max_length','2024-09-01 07:16:59.458626'),(20,'auth','0004_alter_user_username_opts','2024-09-01 07:16:59.475219'),(21,'auth','0005_alter_user_last_login_null','2024-09-01 07:16:59.618830'),(22,'auth','0006_require_contenttypes_0002','2024-09-01 07:16:59.623702'),(23,'auth','0007_alter_validators_add_error_messages','2024-09-01 07:16:59.642567'),(24,'auth','0008_alter_user_username_max_length','2024-09-01 07:16:59.772327'),(25,'auth','0009_alter_user_last_name_max_length','2024-09-01 07:16:59.953699'),(26,'auth','0010_alter_group_name_max_length','2024-09-01 07:17:00.009007'),(27,'auth','0011_update_proxy_permissions','2024-09-01 07:17:00.049377'),(28,'auth','0012_alter_user_first_name_max_length','2024-09-01 07:17:00.206939'),(29,'sessions','0001_initial','2024-09-01 07:17:00.272308'),(30,'app','0012_det_venta','2024-09-05 04:47:27.612990'),(31,'app','0013_det_venta_price_det_venta_subtotal','2024-09-05 04:51:50.127829'),(32,'app','0014_rename_price_det_venta_precio','2024-09-05 04:52:20.358391'),(33,'app','0015_alter_compra_fecha_compra_and_more','2024-09-11 21:46:01.136817'),(34,'app','0016_det_compra','2024-09-16 19:18:36.466615'),(35,'app','0017_remove_compra_producto','2024-09-16 19:52:25.188995'),(36,'app','0018_alter_venta_total_venta','2024-09-27 03:05:29.270080'),(37,'app','0019_alter_venta_total_venta','2024-09-27 03:08:38.179016'),(38,'app','0020_alter_det_venta_subtotal','2024-09-27 03:12:37.368004'),(39,'app','0021_alter_producto_cantidad','2024-10-06 00:54:07.826138'),(40,'app','0022_alter_producto_cantidad_alter_producto_precio','2024-10-06 01:05:37.254984'),(41,'app','0023_alter_producto_categoria_alter_producto_marca_and_more','2024-10-07 15:10:17.511372'),(42,'app','0024_alter_compra_proveedor_alter_venta_cliente_and_more','2024-10-09 00:34:03.219880'),(43,'app','0025_cliente_tipo_documento_alter_cliente_cc_cliente_and_more','2024-10-09 01:03:19.001346'),(44,'app','0026_empleado_estado','2024-10-10 01:27:53.768981'),(45,'app','0027_administrador_estado_categoria_estado_cliente_estado_and_more','2024-10-10 01:32:16.998084'),(46,'app','0028_remove_venta_empleado','2024-10-10 02:16:48.686756'),(47,'app','0029_remove_administrador_estado_remove_empleado_estado_and_more','2024-10-10 06:25:25.646308'),(48,'app','0030_alter_producto_cantidad','2024-10-10 07:03:21.468815'),(49,'app','0031_alter_producto_nombre','2024-10-10 07:11:07.713379');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0co4kxiqom2xxqtmuxp8zxp8qimuct6b','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sye8w:MkJmtN5KfoSJ3-x_zdsgvquDzyL8_6HY1zm0PHR_6dg','2024-10-23 16:22:50.178542'),('0jinhibkqt29eeemkanxe99edvz9ba0m','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syrrP:o4Zk5sYYFYs4uw6yqY5xFyRvO2pNIOgxf5FDCPZWhmk','2024-10-24 07:01:39.411632'),('0kk96iwksw7i5kss9wlcrmmtr9dsi4xv','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snwEl:6NHtojOvw7AXgGvUmGH_GTFkmHV8tAjKFqf_PPA5qqU','2024-09-24 08:28:35.706386'),('0nnxpss51z9mus21efi4ppiynx1y43hq','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqmgv:niSuMzcJiuGHC8PJB6iYMEaqxOt9Ks5MeX5rvlHLHEU','2024-10-02 04:53:25.825493'),('0nrdqq0keq7fbbhojlt9hcs5brkeicz9','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1su4rz:JLKXnrtlwXhLuwJJCQ75kNcwFt5jW-M9WK7GJVcjHO4','2024-10-11 01:54:27.247386'),('0oj9upk2s07kt9tx2opslrwsaghgvkwi','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1suHHN:Nv1jaF7-TyoxvuZ2CBnWBpLwh8sDUJKHwfC0clcC_vs','2024-10-11 15:09:29.826506'),('0ygd275omgvn80s4qqqnwhi7875haoz4','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syyJt:Xo9Xuszx7OQRbC61pPCpr5D3XYnsrNjud5SY7mtWSzc','2024-10-24 13:55:29.375628'),('0zodog757wgrwdy17rttyexffv4cd7pk','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxO6H:d99Smov0z45vsOvMm5weH82xggD9CS95cR_x6ypaokw','2024-10-20 05:02:53.509961'),('0zza4efmqzfa5veaaen8yk9ene6z4wa7','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stLCw:KEHXrSpDI0lxN6SzGBt5wRLvgttoe50k6CN-ChV5p7E','2024-10-09 01:09:02.081723'),('1fwohj1ucvpjgqwjapq9aqlavke9nm2z','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1szFtY:ZGlSHPmtUaq7vD1ebZJMQl7wASqPlBOLM_SfOqh1mzc','2024-10-25 08:41:28.180007'),('1gsxdwoqohs1ixyrdkt6041i8oqu3i4w','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stKS5:hLZtZg-BF2gFsDG8urBNeQJ_k6xrZaOG5SN7gjHTaVQ','2024-10-09 00:20:37.618004'),('1mixbatvz88q0cjgu2xsweyj83sfb7au','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sypL0:c6ckXugQ24qd5JuUPyXEs24vPpBlHOLtBJqsmgriPyw','2024-10-24 04:20:02.751858'),('1qnos5gh74wbufc31dg942he0n7uhcix','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snvvl:6pjPDhHj2asoo1Agbbq7fhy0U3uSHW7D-uzMjR_9gS4','2024-09-24 08:08:57.749342'),('1sthq61xt8hqe043m7i94mt6cran7y0y','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syRMX:G1yPidDisjVgKOJmFo6E1bmar755PTHcoYY20c3yvqA','2024-10-23 02:44:01.323252'),('1veenzb6d4efnvy4m2e4la6v1jpguh7e','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1slCZI:6STId2PUz7tp6B7D8BnDCXOj2fzsI5omVrZFytt5zMc','2024-09-16 19:18:28.257821'),('1w3mimwuc06mqmfcx6x22be2b4wq3dwb','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sys5k:y49uyd2mzY8EutaASXNxqyKIxxs2uCM_8U01sEk5ltU','2024-10-24 07:16:28.746124'),('1x2nad217ugjqtip9zcjy4juyfbfv7t1','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sy3eB:Lme-yHivdJug9MsgfOl8FUehOdOrxeBdr5WAZNKAIPQ','2024-10-22 01:24:39.300667'),('1yytufkme43texg1ksup3bwhbjxhgmhr','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxKas:8XwcqDXJ4a_SMr86tDRUNaGIkTBXptemnzmDn6xvXBI','2024-10-20 01:18:14.420816'),('2b8pfcbvhnej334qk2fjhfpn42u4rbsa','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxHtU:RxNmndl63SIbofzgv0ztujfYd9cyPe29Cb4for9dbgY','2024-10-19 22:25:16.101123'),('2e6ymwy8i73d9vbpehsbzkr483qeokxc','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snwxY:UnwPiKxsIUTFSCBiGKS3qoqO0oTPOKVJ05L7fF_Dab0','2024-09-24 09:14:52.086895'),('2l81uro80l4t8wp0d960hyeoji25mml9','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snvgf:tXKXkUVaaHwDAMNlNss7e53B7yXbqskGXo8Ug-_J83Q','2024-09-24 07:53:21.508418'),('2rzm5e0rvvj3nx2la6eq17o6iu2kt5jr','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sm5aD:CSfl1yqzjYEeuyYv8-cCqoF5xASiGSPkmu8DoTIbAkI','2024-09-19 06:03:05.597821'),('2wlecaqarz1mynh6zwi8nnk7xl8gl9un','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1spEJL:aI42u1IndswrQET9BDzSDS-N73GYWMobFmkEMzOPqKY','2024-09-27 21:58:39.804556'),('34gv6antrco2jky928sgcdumx97ksxzv','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syFi4:rGAhxJOky5vaac8RV30XxUDvsMG8LmafZGV39GkfeaM','2024-10-22 14:17:28.692871'),('37y2s8kmbwbh558poltmx666m91bh2h7','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqmL7:kxfj-NRK6s-ye3sv_ogvo3KiwUtdlcFn65Q8F-F5CZ4','2024-10-02 04:30:53.992595'),('3mconto7i0sdwfkbnk61bcbggoqurp7h','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syoze:oy3haClgBvj_roiADhAEyH2c2wNCIxgHJRRlCmROfaU','2024-10-24 03:57:58.177542'),('3z7yotsbvpe1m0lmg240c5j0uumf14dx','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz5ec:F19tF5vBoTvyMrQokDGt8DKXcb-le8PvJ2565vrbWQQ','2024-10-24 21:45:22.800920'),('3zjp6v4ua2eno79ngkd95vz3aq1zt89v','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1synT8:zSe-e6RLPLgAPkLY6egtYFCsca_hFZy5ihqqV2AIB1k','2024-10-24 02:20:18.528787'),('4bolcqid6mahqjgz7stflnevxq6sbyqh','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smnBf:PiBtL7VSfDaC21y7muyV0OQvamaBN0k_6tI51137vRA','2024-09-21 04:36:39.018670'),('4cbw8y4uxpbn4gcoy28hplna4usdopxr','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stJow:Y0wtd6kmOK074hj8vV8tqbw5H3tv_YIJyAMTkBFDmJM','2024-10-08 23:40:10.845653'),('4cfwgao84amgym8o676hecb5gxof8sy2','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz9jD:v9fuVDGzHm2uPNbmxZSbTL1NSrZpg5W3dKUZHA_jmcI','2024-10-25 02:06:23.135349'),('4fo1zu4qbqy1a9mfm0hk4jt2ozvtaoqz','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syo3O:WUMqaJOJaVzIRpOLZ6516Inr03JdyQAlfZ6X9ytoQFc','2024-10-24 02:57:46.648207'),('4nbaipqrwkb4ku32yxhhn3xvzjcwrxs6','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz5Mt:u9LQYCFk-hQA4zpeVDyg08oFRXDUet6PH321EMAzodQ','2024-10-24 21:27:03.665492'),('55yc2egxmf2rhh0ayeceo9ztwc50gboj','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz5Z9:OnUlc4L8YHCnxt4vQga94ubB22ZjABQY8qdLzyqNFLo','2024-10-24 21:39:43.515493'),('5b8hewirui41olgzj66fxswjk6vvydhk','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz2n9:eEXUNxMdkulBYSezPAqdHdWzMcxhl6iOXQhUhflcBYQ','2024-10-24 18:41:59.441709'),('5bx3tvgdody7edewvx363ajm94br3wkh','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxONg:pTcU5GcSS3F-w6Y-BIAJWS8xIQZFy7b-13tB9plyH58','2024-10-20 05:20:52.974622'),('5by48rkw2kf5wzglbatiq8tp6ajw0s76','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stLNx:ibDHXM55zk9WppRBHEHkRvHBxJrKHJGFvFyeQGmKhjE','2024-10-09 01:20:25.784327'),('5ckndg2pjsgwg80f9bh5gadsxbe2hptw','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snv8Y:ZKWd5Kr3oRG6fl_gNWzxYW6ciYVh8KXwrQD52-o8wHo','2024-09-24 07:18:06.210917'),('65cb2cch04y5ctjwokgpeycwkxj6stzp','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz1Qg:ACjIcppK__w3IYhHEtNPVf-uU4rkCcJepdT6G3otphc','2024-10-24 17:14:42.911146'),('65vgb0wk2bw0z3fgrpbsubg3fnoi2vh3','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sy4B1:skPkPnH1h_R6K_bmmRpUXI9XkL1JpYs14ZRznIZDYIg','2024-10-22 01:58:35.411541'),('6m7ujewkjrws51veuuu9ksgdeuzi1418','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1szA8O:feAupqm8b57Biqp4fo55myRWrx87WGv1C4uSTuFAttM','2024-10-25 02:32:24.835781'),('6nzef4p5z9rd3wugwff0p3i17ne8zjdz','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syoft:POpVzTP3bETelTH-gLOnzICB14ai99dC-R4M2wj8Ajc','2024-10-24 03:37:33.818199'),('6p8lt13pcrqmaujdwdnmnfracyw8asc5','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smmYY:EAR4YV1k0v0ieVT6UqUax6XZYtiqsofUiDPlK0OWz2Y','2024-09-21 03:56:14.265481'),('6s4rmfux0n4o7seldyi2eyo3sm1o5yas','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sm2UU:cZbKR_v2dD6Dv_GYnEIgO9DmvUqKAXuxGi5-2CeM8F8','2024-09-19 02:44:58.005741'),('6xp9br9583os9abd41i2lfrhhvxjfu60','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sy3N2:jhH_e81JLkP0HXGjH4E5is_UvHy75YllLFwy3MiHxnI','2024-10-22 01:06:56.839831'),('6zu84yrtetbngowy0aa7x251uhrlzflm','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smmMC:tOToONnh8g8MUFcHee85qIAKXRovETJQpf1j5eIVaYs','2024-09-21 03:43:28.441594'),('7643714u77rh2ijk8m4ofbx02bez46z2','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxJt7:_x0ylGxPjwNAYz8kBcmwu1bPaLL7VNDTkPBFPCuplRc','2024-10-20 00:33:01.181686'),('7oxn9s7uycbnafeznm52i5h54mu8slth','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snxJ6:_piLNnvnCUfxeZ-rCt2EgGl7JAS_wfXpc_NkZM_Cr0A','2024-09-24 09:37:08.324213'),('82pqkcgogngkg5vkrsc5vmfrwxbx0for','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1so7BL:d5ff1bi5_8khG0aPF47vk14mrHjNRRYQVGg2vuNCmk8','2024-09-24 20:09:47.212919'),('853mw9dmj8zo1qp908rt4bzr2mt1dtp6','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syFxr:X8SdsVOFUGwkJi6RwAHL2x8nIo0RNv59oBOuqctOzZ8','2024-10-22 14:33:47.187246'),('8niymfs8szwfstftt5fxzxgmu72ahy9l','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syc6P:WZmsF7q5pLg2bDDBv0xiCBFp9yyHjjcH8f5fx15xNBM','2024-10-23 14:12:05.143166'),('8qfubyggf7b7mxblipagkm8fscdux2de','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz1VV:hmYFmig2m7_tRqwxhh66zoQLAGkRIjHteR1hfz6HDes','2024-10-24 17:19:41.448834'),('8unlky5pux23pgndvxt3x4pnc8tif8u7','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxsci:TGyQPnxFbhqviS7TUiumTRo3FTHk7H7nfa5fLqZBz6g','2024-10-21 13:38:24.515204'),('8zdm6s54qrgqjifkc1mny2i3zgoye1d6','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxfED:m_mhR3_2KudrvTXOKRROVeF52thiQsn4wm7X3Jf2G68','2024-10-20 23:20:13.691264'),('8zxkpkk9dkak3qfyowsno05nzjntqu94','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smmiJ:T8PSyIdmGcfutZR5n-D0DBiCvWsqRDQbbYR8gJjo-To','2024-09-21 04:06:19.553527'),('93b82ze2kupct6gaswpb5xi4ws79z69a','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syniK:Q3EczMI6jN2lNnPvm7_N3d3pfSMMwq3BcPbii31SYKo','2024-10-24 02:36:00.018565'),('99e9q0c8ik9nrwfna86fi7fvtd8r72fo','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxhSb:C--RFLu1GUHKfyN_5c1oZN6CP7yvb1RG72ri8hVB1rc','2024-10-21 01:43:13.052561'),('99iphxbttqar1l9b06of0xbab09r8kyi','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syoTP:6lqNRCyZRgqnVocquY6C5l28xBJjiC_vfNvTsm2yYW0','2024-10-24 03:24:39.177530'),('9gwiuvm3jld7cvvah2k8aseocmwg12ck','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sypqI:HOexFMPaqBUlxhhONQt3ToSUZn01Lf3MJiPhKfmbpsE','2024-10-24 04:52:22.558956'),('9j175btihr58ecote3d8qyxqvhgezk71','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz4jf:iPGNCTMVdmWVx-FKfyJcTHT9ahH9sxeRYBlxBNWB9JY','2024-10-24 20:46:31.012877'),('9p60q8mq8a04afjqg8l1cto394jagee7','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxK4P:ZjoTY4xUdVu6FK-5IJmEHm83C_QVDgEBRYwlxfsm_OY','2024-10-20 00:44:41.851429'),('9pr01c0ywpz6dqc16y8dh1sytqssuwn3','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syrfs:NjeLqXrm27f6a6hoWzbNpqwYOQwb9ibxzvcvoP_l3Fc','2024-10-24 06:49:44.573087'),('9vtk2qy2n9r9ollknogsu4zmtnslx5f2','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1spENz:ZYaTe3-kmhn5PgVO8613GpLcJ7qyeLUGMZvJjgn9wos','2024-09-27 22:03:27.371812'),('a1bf9ug8e69l4xwazgq0gowxtzx7c825','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxcBd:r28IxqEwbq0srXwr8RXzxbfBulByWabRGA__0fopVAI','2024-10-20 20:05:21.296818'),('a2iix0evamoul5i3h289afl6n70dxcho','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stLKE:G5fVpnJI-XmGdodPw6A5vou52a0aCxLflQL32cOvovs','2024-10-09 01:16:34.150832'),('a346wrs98tzutq5gv83f6kp61urlcwaq','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1su3HE:J4qdBCVOZFuLjkOGu1FlpRuxUsR1CtT8uPJVbfJpeFw','2024-10-11 00:12:24.622077'),('a5ft5iaby10ron554ibp6tz2k52mb39i','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1swIKU:50Z9ZScp0nUA5-pVkq-iO_pwuzh1i3Gj06X6SafzzgI','2024-10-17 04:41:02.913719'),('a6flf35su4shnut8kk45ydrnfvjvlg7w','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1so7AF:mXFW9HzYqmteOz3kKA7HNNnyzC_IW73G5bEnpmM02SE','2024-09-24 20:08:39.287272'),('ab5gs1ydgsuujp8jd0qtvkop2crw4b8l','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syoWa:C7l9RWV6O6ZBjd_2csSqrAl4U2xTw5PnWmFPNi7cjo4','2024-10-24 03:27:56.194908'),('acjd3n4lqvjh9oss2zdxjn7uuzur15ss','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snvwS:YsOIzvmt-RJwiPADgf7Z8i2jklMI9_vsPrKGHhW-e9U','2024-09-24 08:09:40.194205'),('adj6al9u51wq2y187ze8rb1zrkf9xd5x','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqRPA:jw_OVZdQRWops40MwYpp_0Qdbh9tS4mmj03-_87mJqY','2024-10-01 06:09:40.972541'),('ahlf4jlfn8e5gfad4eq7iy9uce5cxc8t','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxJZe:PgvEAT-QXgZK4CX__pfE06Kw9pUjo1gFCBwqBmoLvwE','2024-10-20 00:12:54.702812'),('ajtf0q4yo96xqr275gljhao6yhf4bmgo','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxJ4O:t6WzdJ6fAR_RZ6Hdiwkua78WXZYC3mAeXkaVRiF8r0o','2024-10-19 23:40:36.276568'),('amvg2y9l2tifs4jt3bpnxln36uezmtb8','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sy4EJ:la528mdHvj7H3MKlYsP7SpwU2PQIGMLIQq2Twz8klT4','2024-10-22 02:01:59.854742'),('b8z8ah6tkcn557w0zm2op3c2upz5k8fu','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1swI2F:w2dagVtLo9k_lO_7ljcH6yR292L_dfkJyiYtcM8Uwss','2024-10-17 04:22:11.404355'),('bckb2xjcdqmp01hkbkotbs7cd1b93vmx','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sorqh:P5EhFaMqwfwUqgkt0HH9_TfFY1NFPbBvNG_lmFf1t-w','2024-09-26 21:59:35.174434'),('bdhwfdmbgpb39p3lhpf2zaqdd6doew4m','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sr04U:NDOCwY9xFw_8beJL9FBmBK2DV1Yzz7Z25WjbGCot_dM','2024-10-02 14:10:38.223118'),('bho6klybdsybb4kkc3qfp5nbcjacbpjw','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snttG:0KU0d25A2k_btOjWX9dlQZD-lZO6I7vcwAnWBKjGQs4','2024-09-24 05:58:14.272482'),('bkxs1vzaj2cjute6gbkr5gffudbufrmk','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxgU0:UCxPyEXulswcSVwhnbPnV3fpGwfCJFUD7jdEXDftH20','2024-10-21 00:40:36.318908'),('bm739rfnjptxbr0uil0fgry21vvk38hi','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syzYV:D_ESDaLhbk8iRKCIWrIf1exZjG9Tusr0SqnBVA0xUTM','2024-10-24 15:14:39.840470'),('bn6w4utnqzqnaxmkvakzieuf1qscb2l5','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snwNr:PzSHgLO1I9Vv07OKp2vCa56MKYzK9i1n8exMhxnX5-M','2024-09-24 08:37:59.862408'),('bwzvlwafp2j3i9lboi7adaagaxm53jl7','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxN0T:Rh0QkDkIq4xO3D4vY7sSpYB3pejzD7nUgJlKR-XGYoI','2024-10-20 03:52:49.461977'),('by8kupsbwfan79nanw3aeufmwg4ytvan','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snv7r:IqfuA_xq84GGnOrSOfrwsFKujTp9JmFN_O2aY6Xgt8g','2024-09-24 07:17:23.686088'),('c5dd9m084elb633trbnlg0abnmc5lvc4','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1suHjJ:EeNSKL_bwME8mgLr446BQn-0QnqUFe-eCJhnBS0LIZI','2024-10-11 15:38:21.398283'),('c9d97h0ze1t1nrhyyf3ubdonjjxsozkx','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxOT7:HUl4fawtU76e_H3gzE65X2dRnqI8tAZCHb1nhB5-U3E','2024-10-20 05:26:29.678325'),('ckv92ic4sa3kmc3dkt5qydcbdh8ekze3','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxgMS:Rl1J34VaxCDJu9F4cZ5PyTJg8XE31wOEa8cLff2kBQI','2024-10-21 00:32:48.832149'),('cv6daecedbdilf6kuhc1zptzyk2slnww','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1swGGj:0u5Ipe6iaWszLfOUhO7bFZSxBz8W496pq3zZC5AAdo8','2024-10-17 02:29:01.295737'),('d18fog195ue1rq9175l4nf35wn69l3tu','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxhO4:oW-v0Hk_qE8ZJld7gXO6c9cHgcOKW7SDRJ_x_IWMPGQ','2024-10-21 01:38:32.178679'),('d6tnqsda98kx78104eqhxsp0xuzw04yy','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snuV5:s529BD6H8ArJOxODmLjqS_HHTHKyiVfs_WUL1j5bYIQ','2024-09-24 06:37:19.739590'),('d6xh4ocdvn0h0u8sv4ah2vzk2u612tpq','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxIyk:jnD1NSPI0jsv0ap2G_JDBVHbig0ibBT-5YqFNZVWL24','2024-10-19 23:34:46.602562'),('dd40il13v16wefsk2acive8gsfnpzaqg','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1suHI1:DMfipKAwoZ4TFBrXxmOi2uTDTcjHsj2mD7gSBo9_-Gk','2024-10-11 15:10:09.481450'),('dpke9a40odbngg1aou2e9ke7y43t7jh3','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smoWr:-z9fP0hsMJBodPXbVtuDwRby5z34hDjh_dfb9wQfhbY','2024-09-21 06:02:37.494567'),('dteeqk1zr6myr3mfhgfastx4xtcn9m0s','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz9rN:vTBIWIO4PG8Mzuz_5DxC2N5CBAMRFzho0_xR_wqDcFU','2024-10-25 02:14:49.613038'),('e5o046t8qmsvrn3m5azg818itxrwvn3k','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1su2q8:5_MSRVXUQOmt9-gXrd5Q1Io3o5JN_xopkGUDDG4ry1U','2024-10-10 23:44:24.503707'),('ee9f3oxh9fppmbsn1hje6v9vw4pegc25','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syqM2:JE71dbnVTkrOflLdh7Z9gC9fgmpPRFf7KG7Quy29Nu8','2024-10-24 05:25:10.802001'),('efyuaua1mtyt9creucc56k7bnmbh4h5w','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syzd1:BEJ_miVTZiDIDaC_s9zUKflkrlaVOpILAe-gnSb6XRI','2024-10-24 15:19:19.787965'),('egnb3hegs2thtq25n6mvgo1kt2dpbd7k','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1su2jp:xcV7A3QLdJhfdx6G7skIIQL5rPFpWILd47W_ZhsN4wM','2024-10-10 23:37:53.087307'),('ej1v93z0ysd4x8kwfaumabuc0xqhw54i','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz0qP:LNmm7Wus-pZNhH_26pvkDDGGS2pZAtnk4_RJ5qGT2vE','2024-10-24 16:37:13.408267'),('eyqwedihlvzm1am2obad3lafzlmrpxjb','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxJ90:ZYRQWp8iYRxfg9b-uf1B7Z5V9DFyLlNYjm2qcN-MmRE','2024-10-19 23:45:22.777972'),('f39a4agd9mfymhtq5idqpp4mz7nyi5pk','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stKy6:UNqE7iEJCZT3cxV5FNn1-ksPsVOBBrLN8GDozAPc4qc','2024-10-09 00:53:42.706783'),('f3zvm0f7mygwk9scgy3l7u17eme25a2z','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stJOj:N95ree5ekXFygXHVT3JJIEXROqMtZXTt8-758oPcEYA','2024-10-08 23:13:05.093404'),('f9t17511vizegq3yxqqflgxwezjkf25u','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syp1i:7qB_uRjHD4RJC_Hqd4QngEVUpaP9Fj-0BzuzSGw9LY0','2024-10-24 04:00:06.705015'),('flt5b2khnqti8sh71ulqfw3z2jjua3m8','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz1QF:hMdPzBGEoQob9HYRyXd_dwNO0ypnrQ3eQXb68FUIIJA','2024-10-24 17:14:15.450418'),('fn6ftn86ibca7exc75cophsrhozovsjw','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxIVu:Sju_55b_x9XVpK3IW7xRmJKt7yPJ7r6Rao4vaNI6fmg','2024-10-19 23:04:58.498106'),('fsrfw6yzo8d5u042veqb51h4yx4t7ccz','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1suIDC:oAeju7dHP6X7aM_vgbVaUBm_5h1fTeLhSYSigzVSjM4','2024-10-11 16:09:14.643218'),('g5ycephaael1oc1mjd6issycmayprn5x','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smn1T:DtfUsxgPi9qNGvW7DP4ruLUXl5YXIYOuJ64Y2u32fsY','2024-09-21 04:26:07.194043'),('gau4isqrv8og4vu6gxgxdjvo6wbgqp70','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1su2hz:PA4TUum01Or8pyzr5HQzEEsKrEDf682zuQYaILyY0DA','2024-10-10 23:35:59.865319'),('gb5nnfujzrfi25ad30c57h4yxgr4y884','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sm4Eg:XGPMK8Q6E_vBiB-w9IhSOaqAvjjrIv4w6A48lR79p_Y','2024-09-19 04:36:46.671214'),('gedfffkjageydl34m8gjh54z85i1kffm','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxNEu:oFGCUbhfjDQP8heWjiEj5mfzcKImJHFFisb9af6nWAY','2024-10-20 04:07:44.941703'),('gf0jpv3du6y04cdmy8ubg19994lpyns6','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxJiC:T2XsoWqr6JB-4-4Imk-ifWjVUAkiX4m1lHw_iRymlp8','2024-10-20 00:21:44.297787'),('gjg5i7qmr3f7zywodyq8mt3gsptkys6v','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syGR8:FTh4xr0cIOS6pe90c8QwL3HHhP_5C93NI8zosVe5hBw','2024-10-22 15:04:02.031500'),('gjvkkn18m5r40o3wtce5lzunzyntlg5d','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syoA4:YzvTSrRhYsWF1B7q_eUmDzg4dgIPbou6EPdYbfSz7_4','2024-10-24 03:04:40.060645'),('gpdrvqq8ign6tdqrc34h6hz5rv0ajxfg','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stKOJ:HUxFyVtebZvUPDcSM9lK852Qdpi_GqBPaQLHCbgrJXE','2024-10-09 00:16:43.213529'),('gz76gah892e9gv25b26omngajbdlsm5n','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxhpT:P5dpYPx5AzXpiphPgwqJ2q50USMR83LTt2vO-bj0uMA','2024-10-21 02:06:51.792887'),('gznf62oiczcie8annerve2m18h9so0yu','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqm9Z:TFu_rw6l828ayHvmxb7vT9IFODwkmBieBawVowm789M','2024-10-02 04:18:57.362445'),('h3gg61tv5fxqkxcg797k1oa34iwrrhsk','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sycCR:axmqB0IXoeA_c_W7IZpQPhpFmO-4wn4bEhjtQB2pByg','2024-10-23 14:18:19.102586'),('hj5a23ozxjp2xfeg0szxs6amy51o0uu4','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxhL4:gwJ9AKwpaGloCd7Nuf4VTHWOWndGlsqpIiAZY93xYPU','2024-10-21 01:35:26.600621'),('hkds4b31a4gvpnclob2quvn0341g11dc','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smmv8:TG5Kx729zuS9oNSdja6gKQ6NfuKNkClDqZnzFyYOTrM','2024-09-21 04:19:34.557833'),('hvkjjtnh768p2a8k0ix9jwiybibltpg4','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqQtL:-ayen73Il7uTl_oeKlRwU7IxieJY55b97HEKsWwX9t4','2024-10-01 05:36:47.660534'),('hziweiooiii68dz19x4vqnzz4m9er33q','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqnFI:QlzLX2XpSeOVyt2RdM4DUB6isDjSA81otDHk-gWEfjI','2024-10-02 05:28:56.796010'),('i1hd32p6nonts9d0zmlb3kr348ope43v','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz53S:iLu33CdTErJEL2gaBxdNpUc9hopMzJjNvZScPNCyQ0w','2024-10-24 21:06:58.503127'),('icst4jhybcc8y0r2znbxsbxci72kedbw','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sm5CP:tuufKHcEE8TfmIHNrfMn9SudMKxwsDw1R5Jcw7MIpdI','2024-09-19 05:38:29.864816'),('ifsdyvdpi9u94xjh1ims8e0rxt28ja87','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxfFt:4cKdq6SpGsGAaH0QeH5PftKI4km1ETBCXvsDNddsf8s','2024-10-20 23:21:57.586621'),('ikwti2k1jussb4wpr8wzeode41v014qj','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqmbw:TleM0E41g3G-fI9eDFarcw5RxaQJRYkWBSYevgVBqx8','2024-10-02 04:48:16.879448'),('ixqn3rq2yie4kwk4ifdj3tibfbfh0ci1','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snkrm:oJcq-Igg1Cp-60epPevdnvYq63KKTcZnLJTi7TUCPXk','2024-09-23 20:20:06.270610'),('j5ecz75tc82qpiesuc6g0kbuck3uzaet','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxang:RhXVHtM5IO2wmMmTTqU7tuUQ3K_MVdmlNm_6-UK-xLs','2024-10-20 18:36:32.646857'),('jaoadord3g453hb85hercqx2odfmfepp','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1soTJM:KFRsNDwDUn0OudU0O6lgcViLZ2S4DQ1TQ44Nsijcc-s','2024-09-25 19:47:32.434336'),('jdy3vx2nauep1bpy628u0j3zvmyhhrx6','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syHyt:L4e7ZfFiN7lCURHtaiaRKnzkrLtjXxxFlRSIWb6swQs','2024-10-22 16:42:59.419256'),('jgd1il43ngn2aqkt5u64isojuih99l4f','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz4eq:f4G7oVyz_aWUrbU1OG2WlXjR38HHQESH_FxctIfZT5g','2024-10-24 20:41:32.836807'),('jjnlk6cnlax2vs0b04t71n1lil2bipea','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz1XP:Z_VqENPSxOusoBd7dTH1IMUp2HhfRbp3elOiaYgJ_YE','2024-10-24 17:21:39.873788'),('jojgh20a24k7pjqwi2r1pnq877uzk9p4','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sm5WW:DRjC1Z45g3rglBdZSdWKPHFI_btla-Mqf8_5-ZbN48U','2024-09-19 05:59:16.874892'),('jqjocl641luuygbx8wlib17x1w9jihac','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sy3qo:SOFcIzxlcDANRCqoOxH4fL5lIgRUkGWdi8ISQBTQYlg','2024-10-22 01:37:42.018803'),('jrujm5tugwdr6ihprbjas8xt9hc5c9qy','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz5hl:ZGWl7bbGXdRCP6wGlNRFAvGUlDnJ7uQTt64o208t2-U','2024-10-24 21:48:37.512743'),('ju1q1mbk7rrj4ylxrvc3o5rpykhjj0cd','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smmtE:cfCoPeQC3EnkTAzRFAyRrjxVn_kkAXxWkb5jkC9D9aA','2024-09-21 04:17:36.628596'),('jud0qap1hrujeo9kbubqq5eyf4b95a7v','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz5bE:UYJBf52OHt_UKW8lL5nKn1T_OmWxIa1oa-TQV2yEZVE','2024-10-24 21:41:52.792503'),('jxorzbsg2w1msbnqh6kkk2cf7y6j8ghi','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sySTe:rn2haEVe7c9RTP3dQKhft8hVKRuQ5kqmkW6ljvZvOuc','2024-10-23 03:55:26.026471'),('k4vbifqrvpeib4d8dbjdv244zzu1aces','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smmwl:e5oW8-bNoSe5UGg1A3vjZ8IuF9IeAKsEBvWz0-T-c1E','2024-09-21 04:21:15.949501'),('k5371tioqy46ij9jmw3bkcsaytps0hgb','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1soTYy:sirktag2eyygLpgcY5zPk-LJPNYydRBMnwnFP9ojtFo','2024-09-25 20:03:40.298587'),('k8bungwh3sx2ozoq0lohs8r0q0io4yft','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxEKy:i4g1w4zxkeLnhwcUPsgIc1e7cxINPkabhYhjMx5PfiY','2024-10-19 18:37:24.738843'),('kdmw21yx433hyh0ekrqja1c5eq9gmozq','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1swHkU:eSB23J0M7zOpBJhF7tKKpmHhmC3vbZO6LXjDmNLtLkQ','2024-10-17 04:03:50.956628'),('kfc3k8in9w4hq37cj1bhtn3u06ka6dpp','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz9yL:5OLrXf6FfSCtxDJI24jgoZbpsZTge9gDGB28aHfXOLM','2024-10-25 02:22:01.201766'),('kkllvziwjboo6rrx0fjpovgi92rsipbg','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sy41x:lHEZG_KtH0a4E0CsOpQVOXXT97Bp5jkPIh4XlBwwjdY','2024-10-22 01:49:13.189097'),('krdxzx84xrhup2r8dcys3kna7qmh9occ','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz0a6:0NjXH23tFd_baMlmkerPTd0GeJV80UOxXB2vhbG_FQo','2024-10-24 16:20:22.703647'),('kym2g2feva5ihdr5ry5gfz20h4q89wd7','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sr027:Q-osXENkFdthBWF3ah0bWuwnI0wWG1C3GbQ6w5C4QnY','2024-10-02 14:08:11.258099'),('l04ao4t1wjcn4ll3y6atbr93xyez5xbp','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1spCc7:KU0DoGbnORgvVgJbFw8Vo5qTI_aqrPUNeA_gKzlCaHY','2024-09-27 20:09:55.478452'),('l1mbj43qt6powclna2g32kxaaty1czzb','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1swHIN:ewl1q3g5ORZql536klvwhMb2QdZVz3PPtkbxxEJsFP4','2024-10-17 03:34:47.093645'),('l5u5fd0svmvt5igx2ogf3px1u6lot7nt','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sybpu:Nm6EZ_eS09BPol8vg9EGZbrrbYugrtlm_NlXIOMivWQ','2024-10-23 13:55:02.064850'),('l6jqym9wl6hmakjgt0sqy9oqwx6r09mu','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz4hH:RiFbh-VOX_6eSxATPsYAMgkgMH26JpbPpqliZ-07hpQ','2024-10-24 20:44:03.360384'),('ldhei20fqlk2cft3js3qaw5saytamp4t','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1swHOG:Z6RcSMsRDZbN3AD10GYz6_9D4dWhu0f9svZiCw8FZaM','2024-10-17 03:40:52.300749'),('lilnowytyucp98gnco1f6acwk4p99wzr','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sm2np:1XYE3EY3RmTNroO7fWG1Wr2jX0g6VG9saCXDl7oAXZI','2024-09-19 03:04:57.309694'),('lqlk99mx8uvp913heybpaqpvhut9qakp','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxhPh:h2vWe_R9D0kaBvW3daRdKrpJMhlouOt7p5tCmJFIAbk','2024-10-21 01:40:13.961920'),('ltj9m2jykl6stkbq82iyf9juht9eidfj','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqlxk:3brvLOkZCFO_QKl81qE7YaTRfZNiBg4MjLrpMOJtKIE','2024-10-02 04:06:44.049602'),('lxktdcydedvi0nbu2ti5gjbaicnqosi8','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syFuy:i9_b5I3Ckkr0cRfUWTo_rgeXpvTQuUPqdF1rrGVazGc','2024-10-22 14:30:48.099411'),('lxoi32qsga5lgny3eve75z4k1dy3aq76','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smmfG:HIhh1Tj5XEa1Y4BWd3zU09HLPeYXTcZK8JEPfCLvvXU','2024-09-21 04:03:10.907093'),('ly3zgboerx4s29cet424sj3omk317pkw','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxKOv:_VXWZ7I2y8qbe2-74WHgwGE_EgDIibWaD4YgqbckGbQ','2024-10-20 01:05:53.492764'),('m4n7azko5m6ujdr4o3b1e061jaz973xa','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sm4rL:D3kdW1Eml2jWjqAtPAi6U5pmwT-sbArTKcQcc5rTipI','2024-09-19 05:16:43.270279'),('mhhqlly7wzrt8p56qxm0dhxw0m405jeb','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1su4Y3:vZfE11ZisDrv0tNEal5GOpBb6OiyAmsuxFwdGheAQrU','2024-10-11 01:33:51.724794'),('mj94jvichkpw2t8lrxme6f8hdlb3rbbi','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syRj7:TE00LANgeky2eQ-g8ZaalzCyk7VAwNeklRtsPtj9lKM','2024-10-23 03:07:21.033208'),('mpn9bdjk2mvveeo735i2pnk85klpgylp','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxMsz:X2tAazif9ih3_JAd-emqBDcuR35GTxNfYW6DYVAnYqE','2024-10-20 03:45:05.192971'),('mrexvz51rtis76wf3o3pgp87i74uffqk','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syQbE:gD8fCBeATGr-jmIW6oQqR2vEtymZgzZ-r7zM9nWW_CU','2024-10-23 01:55:08.846258'),('mwvq40jhpycrhqkicedztprf5mh7cgx9','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snk27:lbSLsqHrszyKU1gxfgNiKrWeYSf4ZoMlEjY6CVuJYc8','2024-09-23 19:26:43.766780'),('my7oag2zckxsxbgl2ah8j42uxyqseiac','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz4X8:sIy8XmX0VeQqXgmRuZp9pkUKih8xnKyG1GcLN2Zg8SA','2024-10-24 20:33:34.440375'),('n3o2s3mgqyfd7pthf69hfwq3n2pke40s','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syRN4:tjGToFeNzXBzwm0zGDBNKL4-x2oEBoRjWmky6lp-5Cw','2024-10-23 02:44:34.613359'),('n5m0u66qg35r6sg7tx4qgr6vmn53r06k','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz9as:aSGmVrLI5fKlXEie7dzAYMbrVneig_u_RbUfxjAgRTw','2024-10-25 01:57:46.422554'),('n5mxct07c4ldt0r2mdaa4tqauca85u0v','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxIAz:QoGV35siyLRAPr7A2-HvTYi7VEd9sxtWwnZL2zD9mko','2024-10-19 22:43:21.752275'),('n657r2gt9zkzstw0r18yznuwri7bfkwg','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz1aF:0_NLYxP5hubRQ0hE_qTw7MB4UoRI4oQj7nmSayoOP1Q','2024-10-24 17:24:35.292171'),('n67rmqdv3qnlon1txpyolxnx9nnbk18p','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqljJ:75lAU3BMifgYN5_vITCrQndU9enA3VCS-4I2HTdhS0E','2024-10-02 03:51:49.469159'),('na6g2e9i693dfy9fvcq2929838jq1gaf','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz5on:mLAkQB8lfvVHKT9-nQrz9yh3eG8JnZ7O-4DBqUD_xSE','2024-10-24 21:55:53.765815'),('naclp1m9w6lk7pe4jwqkqq8um831mds9','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1spEF7:w-AeibhPmI8jJq0mFBSv8X5Xx4VLUBXhk-px1PQ_798','2024-09-27 21:54:17.006750'),('nek7ycyihui1tno24f8363yindes4kky','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smmXa:KZc3p2OcIAgRlYxW6a5BW6Au4fZGTwbZDGD7FkW9ZKA','2024-09-21 03:55:14.047496'),('nggi0ikax419kx4mxysjlp3da1usb01t','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqnI1:hOFeKQ2Kpt5njdU5hnOn_oCft1eyRW6pbxpwVwumM6Q','2024-10-02 05:31:45.365348'),('nknnam70fqru7sxobbambl3rmfhirus2','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxNgS:_UiuLmn9AovwWGs1Itcwj5xMZnVA4i8GBXxjjWoAfGE','2024-10-20 04:36:12.977110'),('nmnyoez5wdlv30tplyg6311yrboud47l','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxKp6:kLg6W_66uO0WDkXJvX1_6fbGneFP2_8-qc3Wdzmxn4A','2024-10-20 01:32:56.460864'),('nrjkbmngbh1vcqdfc3ews2ijyyok6o36','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxGXK:y6CWT8RNg6-lx31f34ivY7mxBozdn--9eti2kju6mks','2024-10-19 20:58:18.769656'),('oc29qv41vtyod76db9rz2sibdg0nyixb','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syyuv:b5WbHUDcIoZDY_pY5oe5bhA1IQfen8okNriQ6fokQ6s','2024-10-24 14:33:45.148268'),('oi3vke1gw0ph8vkq3ky12798q53dpyns','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sy3si:eAlJygSr4qErJ8IzmSkBz77U1CkcjZgJa6D_GBM9d3k','2024-10-22 01:39:40.221421'),('opd2mz21rfd286bz3wudz06t7go1wuf4','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1soTDS:VQ27QzvN0dNGZOrAlxeWvO-f1w01xlKIII_kSkEfxGA','2024-09-25 19:41:26.912182'),('or4qm9bcyaauldl0v2fhmthx4hdhahj0','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smoD8:AAj1aFhJ6uK6XSZ4Q4ccjq7lRcIi15uxjxj-bPwH3qs','2024-09-21 05:42:14.982947'),('ot0134yekyesu5wqaasekpe318c396sj','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sntdO:9hn-hw9uuBKSHCYpGRebrWKkpWuriabaNPhfVoRIxso','2024-09-24 05:41:50.165093'),('ou6eq1qvgl35daysap5t9qt75k6ekt38','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snwbF:tTN8S6Pw1DU3cxrH1U1hFaX_0WDkRQCxefyGkfXZK2Y','2024-09-24 08:51:49.237916'),('oxa1rd7mgcaz8qnul0ji96wjj78vun7w','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz0G7:DX2lt3DLJDepkr7aEyRaQ0V9XmVt0UzK7j638XAdops','2024-10-24 15:59:43.138488'),('p0vxvrq1v9jwzoqohlzme8nuhtew284h','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smpxk:K6rrkZ62rXZGFtx3EGDsKaEKc7XKDjiE2L_BsXKA4T4','2024-09-21 07:34:28.073583'),('pkkrouwduhcgykvolfh2nxzt8hpuolmt','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stK6y:FJAyMilTmavt28Mx1oiORmM_wr3mkPo61Cx_5ZZK0EM','2024-10-08 23:58:48.538825'),('pp7eb5dnslyxb8xpp6pdxkbuexehau4m','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1swGYA:TX_lv9Z-lKdgL9R7MBDkktXYV98y4Ax2FbNJb_zxC8Q','2024-10-17 02:47:02.245160'),('pr3z3vr4w07y5fy286g70xby83ipysj6','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1swH9G:gbrtWvoWekYPVJqYATARecHRfFtpQOrpA26wPovhPoY','2024-10-17 03:25:22.295970'),('pw1edxhjob1el3iad7z9o3v72y1puenn','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz0P2:mKmwY8Bh78HoNge2mnypCWCzvXMhFbUhHpznOLrTDx8','2024-10-24 16:08:56.816633'),('q6ppvmglhjhr67wikii7pcr200cndy2s','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1suHxW:XszdB3Qz_8qHWVudwdQCVDRwI9puCCVfTg0qv-OBEOc','2024-10-11 15:53:02.566132'),('qco1f9gro7j7t8ozplwj09xkrcy7dszo','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz31z:_w1I5pGEFkz1bHhODJaGuD4ZWOT21EtlGpdaeTekb2I','2024-10-24 18:57:19.894758'),('qczabmyuq9w0sm5thbhax4ni6kxl6h6k','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sypU1:E-5PxH06NMPuSdF42RbjcHe3ZM0JMvMQm5sXwy5cD4A','2024-10-24 04:29:21.906602'),('qda8x0ejqxr6ce9kdyaa7x38w55raths','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smn4y:yhDXPlo4228IrT0bajvEGxvOr9HZaBdP90rG8o3T1mM','2024-09-21 04:29:44.941697'),('qlm91jhfgvo92ubfdfg4hi0rxri9k5e8','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxbcX:wXeqf1Yy-MdKpLqwEzkapU6h6b2HzqxYxPLFjc51eEs','2024-10-20 19:29:05.566370'),('qnlykkgcd3v8t441f5qh92ud6cy41rap','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxIxL:5eolyeo5f-0T_7dfgR-x6k7xEVWOT4uU29hO0KRx2JQ','2024-10-19 23:33:19.442183'),('qr53ottlhkgaimg5m5miwe2oroo7d0m9','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxLrK:N1NxVoYBel1-11sgZi8vFhzhWb6gMvBlIoGWoA_byRQ','2024-10-20 02:39:18.412136'),('r34dxo8gwyd2ntixofouqk23z65ietcg','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1soSqJ:Crlidedz8Bk0mr7UwHfxSluGfetJR2C1aku57wPpY7M','2024-09-25 19:17:31.118369'),('r3swdufw9febl0luuour8go98f5n1ehf','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stL5Y:Hm9oH43k0_RflQOnvVc9cQwv6xq_dPjy-IU1QDGBAlQ','2024-10-09 01:01:24.041479'),('r529u8fl83xqnysaqe0dznd1vul24gfr','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syoa8:8QwEU2mCOvat2x9C3k7099a4han6Z8nAr7NObzGGbvE','2024-10-24 03:31:36.476054'),('r57hbhaq21ygfiu5shazan16pqzbzsyh','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqSBR:NotAtwZiJSsAqVnCe4--Gn11YTnZYFspnZqIxG1hGDs','2024-10-01 06:59:33.080291'),('rbb0qiggkk95r9erglqcv6t06amcgm99','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smnb3:tZL7U81kd7amr890CMrnRE-O3iWEN4f3TLabShxkc1Y','2024-09-21 05:02:53.048888'),('s5lyquvuh9szht567surtsbtzpj3yvuy','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syrpL:TRMs1HPbmHXVQVStgN7quagaI4_TLNApP__Jbub6W8k','2024-10-24 06:59:31.410066'),('sabaz74on3onpp8lojw5njn2zcuqtutz','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syR8J:QE5CZoqzdBvFamgqEtE7Wio5zjEihRghehm8_QQKxgc','2024-10-23 02:29:19.842030'),('sfuzlz9o7wxthl3sfel5jhmfy66r4m6i','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1symon:8a6E3R3gQeglnrxmxbDY0lAOLN_a1hGEBsHFnOyKMDU','2024-10-24 01:38:37.464691'),('smjgd1n0gi09lffurwq660qql58ezzap','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz36L:6h3Ct0scJxuF6zPtnZdEa5YkLKcRViP21YK0_YWNEHU','2024-10-24 19:01:49.052426'),('sn5q730154lu9mg7hv2ysunaetnsmy65','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxh71:CLk092B9_Eb2GvRd4MANx8lrX6HxjDsfYjEJTl1nK2E','2024-10-21 01:20:55.187338'),('sou8fjobg6qyqfbbphd53101qfqlkdxp','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stKgw:ZYAG__AjATTTy1HrwAEmIZxAXE6DsaEAFWQW8Rc2R9U','2024-10-09 00:35:58.035635'),('sycz43l5sxwmg18perb28kymfqrpfh3r','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz6Ad:2_Vwgp8XVGV5vhH2VPykLDONyGwX2cBn1-PbiAQYlkM','2024-10-24 22:18:27.485858'),('t4d98c5guehd918wwc280yzbq1kyopf4','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sntgc:u3Ni4AQEoWtQVYeuQoqVs9oB7mOGw6OLYkNfinO5oyE','2024-09-24 05:45:10.633907'),('t78akbrado4q15mxo3ftbm2wh664hyy4','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syQY8:Pr6ytuuFw1MVZZQiMSCM-9TkrDweDJ-RyxF7X4Lu9bA','2024-10-23 01:51:56.718207'),('tai17n11nax0pc8y5br2mx4ndyf54squ','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syRpA:U8szsI-jRdYKQJTThlC8Vin3AlJbWmFdNbYDrZP5muI','2024-10-23 03:13:36.427741'),('taw7h8eqz8jh425kuykco1qroi7ch7cc','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxJxP:I77eaXq_KuS6rX2gzEDMEtAU3W-bh-bscut71x0Whjw','2024-10-20 00:37:27.785998'),('td3l0zz4baeea42j54err17h8an3nhp0','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxfEz:JvhSy2VrSqYNQEakY_5ZU3FQFZuxpJxNghV172X4bMU','2024-10-20 23:21:01.859640'),('tf1m20iogrmh5n5j24eitbky8m3gc8ac','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1suHhr:fwvouPIGCm2X-sSRwNWM6LJAC5Qfc39X2bo6DTVaVQI','2024-10-11 15:36:51.706784'),('thvle7611omipbqw56n7pa1tnxdl8fzw','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxLTV:rJCcjRNVWyHAv_HD3TB6UId5qBkh8n5ezYyLUo7qse8','2024-10-20 02:14:41.449941'),('tlcokldbaf4mqd21ffwf1kpxurye0px1','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stJGz:Fgy5isznx1m5NhdetNdrSOrtljrlUzwuMlCV2i0SDIw','2024-10-08 23:05:05.829401'),('tlp3nrqhg3yn75bzqztxovjcber5r3bd','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smmlQ:8LjWjywsOAVbfdNBFcoJauslvmiUNUICbroH9Lv5lTE','2024-09-21 04:09:32.403112'),('tr6zcwknu7vi4im22d5u8oxxpus0l0pn','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smmkB:TkAwSTVcIcz8vaoUiAIz89cSFjHYzdHOUIigZn_3GsQ','2024-09-21 04:08:15.672912'),('trzswe1ixij82qwrmfma87teae9qhbiw','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syygJ:symoNAQVC5SIjpa7flVdwkizWsEZwI-7dmSFWYXgrng','2024-10-24 14:18:39.990286'),('tsh6eis1zjye9gsm2ewvv0zynsw3yepx','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sypUd:XgKqU7p--qoPzLZq3tUAvJT3gZsHi4dinh1sn7ub-fw','2024-10-24 04:29:59.911979'),('tulcikr0nma7l0ybm7ghqewc1wpvppnl','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1swFr8:U7rYfEgIihKK7SoQhBNbzrV4F0NFJzpjO2rLo24JorM','2024-10-17 02:02:34.223028'),('u1cbdw950dinn7rb7r5h663nirb5ac9j','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sy3tn:OwrPH5m0xgzb9W4jycMg23_VcahCCMLrXQ9Cr_k5ojo','2024-10-22 01:40:47.660485'),('u4y18oy8hnhrkj6b0dww3az83mhld54t','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1suI5X:l3mo5s9heLjxhju0XrRnjOlQwd2WhZacdXC3NGwLqGs','2024-10-11 16:01:19.155027'),('u56nan5iq8v4985djwy9kvmuol15vaev','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sys3m:jtuOIvGEBU4P9HwO7XJGUJ9qet9-gdNrhxQ2WfNUbNw','2024-10-24 07:14:26.690744'),('ufj9bvmpwifzuwp0yw6jvb5vbw5ag3xo','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxIxp:9pT5SSRSS56SpeCp9QW31G98Ml9PA5yU-A2c7fy69ZY','2024-10-19 23:33:49.060597'),('ukrbs8nvm7i6d8fijnuzjkh8ilfcraot','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syRIW:DWrO-c_l6fG-5ptgj2Cou2CFpYKJOxgKLbRcjmWKsQA','2024-10-23 02:39:52.765378'),('urww7vycxh48kke7ipunqc0sr2e7ylkq','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1soSaz:wWpVelkZycnnnD3d_oCsh6bC1OptojLv-VzLkRUhYIk','2024-09-25 19:01:41.875268'),('us0eor3mcqzfauh5t3ckry1c79zuaxmd','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sy47F:1NY3Ou6vK8uF40XbaTmPluWEv52LLlu4npOrxH9Er2M','2024-10-22 01:54:41.176688'),('ux0ozoe1rxnf26f3g9s1tq57ywfuppcg','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sypHZ:AUslqR92dr4qOnPd9-eupecMiCQde61xzj1oDG80fg8','2024-10-24 04:16:29.495636'),('v0zgrn70u0mnet6w4753ptz2vgx5s42r','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz9QH:q68Mbid_4oII5K9aeKSactRu7LYcOpNEXVEtO-erZ3E','2024-10-25 01:46:49.189182'),('v50toe1ejk16im5xfaz2bqs20590cu4g','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syon5:DS7tHeyGfG06VmohNiZ2d6sB3yfmw--ZWoD3sBykls8','2024-10-24 03:44:59.793064'),('v7gbrxrs39110o5gxfc5qgmtxn2qjbw8','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqRBX:_XzAb--q-y5tfKGUUqgOGPYX23InD_OsybLmKU-n83s','2024-10-01 05:55:35.029476'),('vyiq9844zkxa2plub810u7c45oh31wod','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz5KR:0fCl3Wdczer4X-0Uid7b5iBQCGh2IKOoqf5zC4UR7yU','2024-10-24 21:24:31.220644'),('w3ki8jjmchzq1fvul5ddls63vmatjc2b','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snkQI:t5xx9hnNLtG6aPG4y17up0vzC4TdlE25N6XPznEGjBk','2024-09-23 19:51:42.236895'),('w79bwix0c1wj9b18tin0dfjg3uus62rc','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxMpF:DnkmvwAGg_SqZDDr5WrQ0POFRE6G5uTpETrRpbPZYnk','2024-10-20 03:41:13.217514'),('wd3lj20afd1zuxbut31au9vvc6emjwhz','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smmsa:7Yjljbl4NGYKDe54kp26JWizgC3xg3LWbsALSL0Ssc8','2024-09-21 04:16:56.682540'),('we2jlyw9roig99rkeah545yozf0cw7sf','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syPnQ:u74_G8SUQNhcrSr5uudlUeUQDhYnpEuk-8e9VMtDU4Q','2024-10-23 01:03:40.517327'),('wf1yjqi5kng6tbu1xrkv6n93wfiesv3k','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1swH7f:UYPSY28cwEH3QIsxjRonoVGUHTudVs-nyzUk5NXs57c','2024-10-17 03:23:43.776890'),('wg66cgkho0m41ewkb2hhlkksdascol0e','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqlaE:ybAvCEeC36jBSxdXFrLHXmZS8w3yF23Dhq67JSE3y1Y','2024-10-02 03:42:26.218914'),('wq7cnlr6n7cg0h05nfs8ixe8dbg07vo9','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1smoFz:lZTuCNAEUOvEwd66iyrfaXmqQ8Qjx9-Dr6_bdo053hw','2024-09-21 05:45:11.953414'),('wv9u609iwmjv247u5d7u4fquz53k5wgb','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sz2qq:57fYfuhTIXH0JEjrrKdCXniliVKBMjuUY4VkX76XuLA','2024-10-24 18:45:48.645544'),('wxuzo6qjfucijh808e15mzexkjjxdx8x','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syI43:37OqOnRLZTzo4FuANu-hmNPlyP9cHZjf-LX9mBKBaIA','2024-10-22 16:48:19.218198'),('xc992q6gfwds92qxf9bqbc1yuzuaxeeu','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syrZ9:MXW2asV4hzmT567tT55Ypbz9ffI4Y27pm6HCtGb_9Ig','2024-10-24 06:42:47.350451'),('xctf5uvimaf3gxhxux7t13jd5zcgoouz','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sosS2:tCyRzlxOZZZ0xcUgjzGVX5RKAJUAdUftZOILxfwDKw0','2024-09-26 22:38:10.194744'),('xguf7vjuxdqys94ko66l065qrmxpddp1','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1suHno:RSTJc1rhP4eBpUXw6Wt_ZjSdHGkpqV_xjNnAnhJGTio','2024-10-11 15:43:00.579787'),('xkxfjfmnkrnw20585muhovwkix9w6hni','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stJej:GZ2Wyk-0lPw33wX4oY5Qn8u8iDXZLT0NBKbtqNYvf6w','2024-10-08 23:29:37.731500'),('xvxfzt6tn6dr35mwrgz8xkcwjxlxyso5','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snw62:qbwvbzUb30TTWkVyWcYLKZfpWQYoyIOJxtAQLCJhCvE','2024-09-24 08:19:34.780631'),('y1dgjaj5ohq9auiwzwoud2fkn0nbg2n4','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1stKu8:aGUEe0Bji-QOnCw-uERDQc3T0mF5ACY9GW2OqsediJ8','2024-10-09 00:49:36.735700'),('yimb5xvv0ov0lpzb6jwflbjwrrpop4qf','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1su3vy:o1JNvmORWo8Sv8mjZLIFwfKeCY2SFZPqJLst_wdbng4','2024-10-11 00:54:30.921562'),('yts40w90e8lc1b7yxhyymb5pxuefdw3s','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sorUZ:_PUpJTwj5LlHtTO6UhqBDY3OVQUgzsDAHJpN5yxCn3U','2024-09-26 21:36:43.540196'),('yxg984nzi3hd4ozlujgbksuet9s8va77','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sxshv:jswGdyk4Ut4fu08nvEx71aLe6rQJuu9IG5lHbF8-JhM','2024-10-21 13:43:47.653420'),('z9xd2jrgo5suh9l6m5hvplyomx649rhe','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1syFoY:ifaldRVX7j-Sfeovt4XOsgRHFXk60kK16V44AMsEuss','2024-10-22 14:24:10.167338'),('zek4zgs3bf9fb94rthimydpidzslquz1','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sypvZ:Ujn7apj7Cq7whuZ-a1iLDO_pkcjkBoagd4N5GmBg_y0','2024-10-24 04:57:49.614422'),('zkmugwxa18opgwatzxbfhkdszb0lgvi3','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1spEHq:vDds0HQmqg8kS7Sghv-V9MizSW6GaoRfTtSDWPLeucI','2024-09-27 21:57:06.393722'),('zslk6uzfmzi1rwtw09ma6ycqit78ag3q','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1sqHOE:vhgDWJr7yKBwJHN3Gtdjg71zr62bmEGeOkGUV30y9W0','2024-09-30 19:28:02.434424'),('zwiuvp2cltvye27p9u8fbdvif0m6rqik','.eJxVjMEOwiAQRP-FsyEglaUevfcbyHZ3kaqhSWlPxn-3JD3oaSbzZuatIm5rjluVJU6srsqq0282Ij2lNMAPLPdZ01zWZRp1q-iDVj3MLK_b0f07yFjzvpbeADon1otlg0EuzibLPXXkOXgA32wS4HNKEJDIhG6XgAiAxqnPF-99OHE:1snvF6:3HZSeh2-JFU5vh_EAlJ8ZQfTEFAjDQ0zklUICBl-_hM','2024-09-24 07:24:52.141243');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `telefono` int unsigned NOT NULL,
  `conf_contrasena` varchar(128) NOT NULL,
  `contrasena` varchar(128) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `numero_documento` int unsigned NOT NULL,
  `tipo_documento` varchar(3) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_documento` (`numero_documento`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Empleado_user_id_6f1e7e22_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `empleado_chk_1` CHECK ((`numero_documento` >= 0)),
  CONSTRAINT `Empleado_telefono_fa919083_check` CHECK ((`telefono` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,3227977187,'A123456','A123456','yeison',12312132,'CC',2);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'No aplica','Activo'),(10,'Panaderia1','Inactivo'),(11,'Trident','Activo'),(12,'Ramo','Activo'),(13,'Postobon','Activo'),(14,'Pepsico','Activo'),(15,'Pepsi','Activo'),(16,'Festival','Activo');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentacion`
--

DROP TABLE IF EXISTS `presentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presentacion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentacion`
--

LOCK TABLES `presentacion` WRITE;
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
INSERT INTO `presentacion` VALUES (1,'Bebida','Activo'),(2,'Paquete','Activo'),(5,'Caja','Inactivo');
/*!40000 ALTER TABLE `presentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  `categoria_id` bigint NOT NULL,
  `marca_id` bigint NOT NULL,
  `presentacion_id` bigint NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Producto_nombre_c73d5e3f_uniq` (`nombre`),
  KEY `Producto_categoria_id_d52b184f_fk_Categoria_id` (`categoria_id`),
  KEY `Producto_marca_id_c67e5864_fk_Marca_id` (`marca_id`),
  KEY `Producto_presentacion_id_abd188df_fk_Presentacion_id` (`presentacion_id`),
  CONSTRAINT `Producto_categoria_id_d52b184f_fk_Categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `Producto_marca_id_c67e5864_fk_Marca_id` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`),
  CONSTRAINT `Producto_presentacion_id_abd188df_fk_Presentacion_id` FOREIGN KEY (`presentacion_id`) REFERENCES `presentacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (17,'Chocorramo',102,2000.00,4,12,2,'Activo'),(21,'Galletas Festival x6',50,50000.00,4,16,2,'Inactivo'),(23,'Gansito',218,2000.00,6,12,1,'Activo'),(25,'Ponque Ramo x6',9,1900.00,4,12,1,'Activo'),(26,'Red Bull',15,9000.00,11,13,1,'Activo'),(27,'Colombiana 3L',0,5000.00,10,13,1,'Activo');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombres` varchar(200) NOT NULL,
  `telefono` int unsigned NOT NULL,
  `correo` varchar(200) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telefono` (`telefono`),
  CONSTRAINT `Proveedor_telefono_05821f62_check` CHECK ((`telefono` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Nutresa',32121231,'dg@gmail.com','Activo'),(3,'Cocacola',235205201,'dg@gmail.com','Activo'),(4,'Jumbo',236541,'asdhn@gmail.com','Activo');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_venta` datetime(6) NOT NULL,
  `total_venta` decimal(15,2) NOT NULL,
  `cliente_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Venta_cliente_id_a2b0be2d_fk_Cliente_id` (`cliente_id`),
  CONSTRAINT `Venta_cliente_id_a2b0be2d_fk_Cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (88,'2024-10-09 00:44:00.000000',2000.00,3),(90,'2024-10-09 01:44:00.000000',2000.00,3),(91,'2024-10-10 02:21:00.000000',50000.00,3),(92,'2024-10-10 06:50:00.000000',2000.00,3),(93,'2024-10-10 06:51:00.000000',8000.00,6),(94,'2024-10-10 06:53:00.000000',10000.00,4),(95,'2024-10-10 13:59:00.000000',2000.00,3),(96,'2024-10-10 17:41:00.000000',1900.00,4),(98,'2024-10-10 23:14:00.000000',4000.00,3),(100,'2024-10-11 08:50:00.000000',6000.00,3);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-11  8:51:49
