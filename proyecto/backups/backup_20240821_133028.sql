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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Categoria',7,'add_categoria'),(26,'Can change Categoria',7,'change_categoria'),(27,'Can delete Categoria',7,'delete_categoria'),(28,'Can view Categoria',7,'view_categoria'),(29,'Can add Cliente',8,'add_cliente'),(30,'Can change Cliente',8,'change_cliente'),(31,'Can delete Cliente',8,'delete_cliente'),(32,'Can view Cliente',8,'view_cliente'),(33,'Can add Empleado',9,'add_empleado'),(34,'Can change Empleado',9,'change_empleado'),(35,'Can delete Empleado',9,'delete_empleado'),(36,'Can view Empleado',9,'view_empleado'),(37,'Can add Marca',10,'add_marca'),(38,'Can change Marca',10,'change_marca'),(39,'Can delete Marca',10,'delete_marca'),(40,'Can view Marca',10,'view_marca'),(41,'Can add Presentacion',11,'add_presentacion'),(42,'Can change Presentacion',11,'change_presentacion'),(43,'Can delete Presentacion',11,'delete_presentacion'),(44,'Can view Presentacion',11,'view_presentacion'),(45,'Can add Proveedor',12,'add_proveedor'),(46,'Can change Proveedor',12,'change_proveedor'),(47,'Can delete Proveedor',12,'delete_proveedor'),(48,'Can view Proveedor',12,'view_proveedor'),(49,'Can add Producto',13,'add_producto'),(50,'Can change Producto',13,'change_producto'),(51,'Can delete Producto',13,'delete_producto'),(52,'Can view Producto',13,'view_producto'),(53,'Can add Compra',14,'add_compra'),(54,'Can change Compra',14,'change_compra'),(55,'Can delete Compra',14,'delete_compra'),(56,'Can view Compra',14,'view_compra'),(57,'Can add Venta',15,'add_venta'),(58,'Can change Venta',15,'change_venta'),(59,'Can delete Venta',15,'delete_venta'),(60,'Can view Venta',15,'view_venta');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$XKS2bOOsM531XsuhsC5LaR$Zv18pd8KgH3lZgSfvyP2ofADvjjdpXynBDu2J/VM96c=','2024-08-21 18:29:43.932545',1,'admin','','','andreyrimero381@gmail.com',1,1,'2024-08-13 20:01:35.829754');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Bebidas');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_cliente` (`cc_cliente`),
  UNIQUE KEY `telefono` (`telefono`),
  CONSTRAINT `Cliente_cc_cliente_0be5677a_check` CHECK ((`cc_cliente` >= 0)),
  CONSTRAINT `Cliente_telefono_f7801955_check` CHECK ((`telefono` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,123213,'qwewqeqwe','qweqweqwe',123121),(2,2423,'daniel','wsfsdf',213324),(3,123123,'andrea','sfsfsfsf',3243234);
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
  `producto_id` bigint NOT NULL,
  `proveedor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Compra_producto_id_729b7369_fk_Producto_id` (`producto_id`),
  KEY `Compra_proveedor_id_b98cf6f8_fk_Proveedor_id` (`proveedor_id`),
  CONSTRAINT `Compra_producto_id_729b7369_fk_Producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `Compra_proveedor_id_b98cf6f8_fk_Proveedor_id` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app','categoria'),(8,'app','cliente'),(14,'app','compra'),(9,'app','empleado'),(10,'app','marca'),(11,'app','presentacion'),(13,'app','producto'),(12,'app','proveedor'),(15,'app','venta'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-08-13 19:56:40.875712'),(2,'auth','0001_initial','2024-08-13 19:56:41.343065'),(3,'admin','0001_initial','2024-08-13 19:56:41.475228'),(4,'admin','0002_logentry_remove_auto_add','2024-08-13 19:56:41.481735'),(5,'admin','0003_logentry_add_action_flag_choices','2024-08-13 19:56:41.487779'),(6,'app','0001_initial','2024-08-13 19:56:41.953731'),(7,'app','0002_remove_producto_descripcion','2024-08-13 19:56:41.972364'),(8,'app','0003_alter_cliente_telefono_alter_empleado_telefono_and_more','2024-08-13 19:56:42.086960'),(9,'app','0004_alter_cliente_telefono_alter_empleado_telefono_and_more','2024-08-13 19:56:42.092049'),(10,'app','0005_alter_compra_fecha_compra_alter_venta_fecha_venta','2024-08-13 19:56:42.100864'),(11,'app','0006_alter_compra_fecha_compra_alter_venta_fecha_venta','2024-08-13 19:56:42.198078'),(12,'app','0007_alter_cliente_cc_cliente_alter_cliente_telefono_and_more','2024-08-13 19:56:42.695994'),(13,'contenttypes','0002_remove_content_type_name','2024-08-13 19:56:42.770258'),(14,'auth','0002_alter_permission_name_max_length','2024-08-13 19:56:42.827751'),(15,'auth','0003_alter_user_email_max_length','2024-08-13 19:56:42.848478'),(16,'auth','0004_alter_user_username_opts','2024-08-13 19:56:42.854701'),(17,'auth','0005_alter_user_last_login_null','2024-08-13 19:56:42.904782'),(18,'auth','0006_require_contenttypes_0002','2024-08-13 19:56:42.906782'),(19,'auth','0007_alter_validators_add_error_messages','2024-08-13 19:56:42.912815'),(20,'auth','0008_alter_user_username_max_length','2024-08-13 19:56:42.970147'),(21,'auth','0009_alter_user_last_name_max_length','2024-08-13 19:56:43.018463'),(22,'auth','0010_alter_group_name_max_length','2024-08-13 19:56:43.034537'),(23,'auth','0011_update_proxy_permissions','2024-08-13 19:56:43.047046'),(24,'auth','0012_alter_user_first_name_max_length','2024-08-13 19:56:43.104362'),(25,'sessions','0001_initial','2024-08-13 19:56:43.136061');
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
INSERT INTO `django_session` VALUES ('0zpsyktaqphgjh1q8scokjwe7qivaiiw','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1seJPS:yly16T1jubtdfbTAk4zMljci1acGdfhX_TPEWfUNa5g','2024-08-28 19:11:50.672546'),('35q938zjizq6fuabtuvig9ng3wgkqbrw','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1se0EQ:5UtDSrgXAf51c3Z9Ai28fqLrBLfD4SIREl6VSwHVGyM','2024-08-27 22:43:10.475863'),('axnqk9u6vsheasuutp4czas65a2xeps2','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1sgTl1:Tg7F40KWU2ELlh-Xi4xMkMvFZgbBKxXo3yFIksJ-KHo','2024-09-03 18:39:03.013829'),('axpyqjwqerphnc6ldp89skjx486q5m51','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1seJd6:nt2wGgjSMNAicuAgA99l8YQne21ccI7P5XBmSWDPYNU','2024-08-28 19:25:56.477289'),('bdlqg5mitmxywh2ywg4cplkjq4tiyemn','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1seJFn:Il13UlPLRh87dmnkF0-AbA3GWHgMCDVykNy5zp_wt88','2024-08-28 19:01:51.355749'),('cuk451tlrb1czqinnte584tsfzld80sj','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1sdz19:Ih7v12yT5jP78L2Lx6yYqV9GJqUkKbMhlaQSfpZfTCQ','2024-08-27 21:25:23.294157'),('fzjrwthizpl45b1rywjdaft2hiiig937','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1sgVLT:W1uiNIgOYiSMM79vNgGSavZa_rwIAcb2bRFI32U9tEI','2024-09-03 20:20:47.767032'),('h26qberidap2bd0z33bjeefhg9isacob','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1sdzUO:avm91XunywlzrOkyke6poIhNiEzh3ks1-mHeP1q2nBU','2024-08-27 21:55:36.600381'),('hkh7zbjl1v0v9cg31m1mc4gd4crr46dt','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1se045:PMwWa1HfTfEl2H51atNNyEwQ26yq3iqReaBdGYTKVbY','2024-08-27 22:32:29.736660'),('nwgmwaar1cwxlkjy9w4fn9hana85occz','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1seIa0:m7r-9bOyo6XriB-J2tl7aGSJ2SAPgwG4mH41ftBLw-4','2024-08-28 18:18:40.255090'),('ocxwpjwo4i37efdmo3u8ozscyfn4l310','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1sdxiN:I6YGXJ3_tCg_46AziMk6T9xjrqo2trB0jP2odslzB38','2024-08-27 20:01:55.851222'),('rr8tml8ie8wjbgs63ail9yzt6aw2lj9e','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1sdzOO:SaHVIDCTN_39q_DQGUQkCE5FIoPjRdaOQ7TUP0fpnas','2024-08-27 21:49:24.265553'),('stbb890vi3j1vcjnmsjsriwlid2uiz3w','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1sdxk8:pFKnAzAKxj2b3ktvOiYLkIqZjWsJ9HIQDDTzTWPxhYA','2024-08-27 20:03:44.085755'),('vc6vqyrcxw4tnhfalu36emlbnuygvmjf','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1seJNM:-2zi0m8TUD9NEKNALKZjasIuXAE9xCnMUBfdDN3AraU','2024-08-28 19:09:40.907283'),('w403h40ujbcjcza82sq8n78b2alev0ye','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1sdzcT:-w3qu2Qs_wgK0OfcHEn68ijurwq07xBnuhU0r1E5Zz0','2024-08-27 22:03:57.291448'),('yec5ns519ny0i8senks90rmn7r4etwg2','.eJxVjDEOwjAMRe-SGUWJ3DQNIztniOzYJgXUSk07Ie4OlTrA-t97_2UybmvNW5Mlj2zOxpvT70ZYHjLtgO843WZb5mldRrK7Yg_a7HVmeV4O9--gYqvfWhykgVIpPvXqnToIUQcl7brgg4AKsAanhFCYpXCKKESRewAXsDPvD_uHOPU:1sgq5X:qKPQc8RVoSJcNgsOgO80cRGq3DfkNoyJYoTixQf4tmE','2024-09-04 18:29:43.936273');
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
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telefono` (`telefono`),
  CONSTRAINT `Empleado_telefono_fa919083_check` CHECK ((`telefono` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Yeison','fgdf',32012540);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'sdadsa'),(2,'Pepsi');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentacion`
--

LOCK TABLES `presentacion` WRITE;
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
INSERT INTO `presentacion` VALUES (1,'Botella');
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
  `cantidad` int unsigned NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  `categoria_id` bigint NOT NULL,
  `marca_id` bigint NOT NULL,
  `presentacion_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Producto_categoria_id_d52b184f_fk_Categoria_id` (`categoria_id`),
  KEY `Producto_marca_id_c67e5864_fk_Marca_id` (`marca_id`),
  KEY `Producto_presentacion_id_abd188df_fk_Presentacion_id` (`presentacion_id`),
  CONSTRAINT `Producto_categoria_id_d52b184f_fk_Categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `Producto_marca_id_c67e5864_fk_Marca_id` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`),
  CONSTRAINT `Producto_presentacion_id_abd188df_fk_Presentacion_id` FOREIGN KEY (`presentacion_id`) REFERENCES `presentacion` (`id`),
  CONSTRAINT `Producto_cantidad_c00a0c59_check` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (12,'123',123,134.00,1,1,1),(14,'sdf',324,342.00,1,2,1),(15,'rdg',45,4545.00,1,1,1),(16,'124',234,1234.00,1,2,1),(17,'1324',1234,1234.00,1,1,1),(18,'rdt',45,45354.00,1,1,1),(19,'ghhgf',75667,567.00,1,1,1),(20,'fg',45,6465.00,1,1,1),(21,'as',324,23234.00,1,1,1),(24,'dsfsdf',22,123123.00,1,1,1);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `telefono` (`telefono`),
  CONSTRAINT `Proveedor_telefono_05821f62_check` CHECK ((`telefono` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
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
  `total_venta` decimal(9,2) NOT NULL,
  `cliente_id` bigint NOT NULL,
  `empleado_id` bigint NOT NULL,
  `producto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Venta_cliente_id_a2b0be2d_fk_Cliente_id` (`cliente_id`),
  KEY `Venta_empleado_id_8cc8766b_fk_Empleado_id` (`empleado_id`),
  KEY `Venta_producto_id_401c2051_fk_Producto_id` (`producto_id`),
  CONSTRAINT `Venta_cliente_id_a2b0be2d_fk_Cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `Venta_empleado_id_8cc8766b_fk_Empleado_id` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`),
  CONSTRAINT `Venta_producto_id_401c2051_fk_Producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
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

-- Dump completed on 2024-08-21 13:30:28
