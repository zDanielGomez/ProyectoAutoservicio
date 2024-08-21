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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$DDpz6L29uoogjZG8ouWXxy$aYEr9J186Ndhk6+NP6724OB6ai54JPhoZp22izHICIg=','2024-08-16 20:31:35.252235',1,'admin','','','dg154906@gmail.com',1,1,'2024-08-16 02:54:48.180398'),(4,'pbkdf2_sha256$870000$DUOkKVBa5CrjXPNKtBhm28$uXz1IEBRVVMnGclMkqFOuznMKxq9r4mTVF2JBPd24Vo=','2024-08-16 20:01:39.831626',1,'gomez','','','gomez@gmail.com',1,1,'2024-08-16 19:59:14.358070');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (3,'erweerwer');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,15042011,'Daniel','Gomez',32020211),(2,401250,'Yuryin','Romero',320123005),(3,1233,'JUAN','Rojas',12345443),(5,123312321,'eqwewqeqweqw','ewew',2312132131);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-08-16 02:53:49.907672'),(2,'auth','0001_initial','2024-08-16 02:53:50.865154'),(3,'admin','0001_initial','2024-08-16 02:53:51.081833'),(4,'admin','0002_logentry_remove_auto_add','2024-08-16 02:53:51.097465'),(5,'admin','0003_logentry_add_action_flag_choices','2024-08-16 02:53:51.125909'),(6,'app','0001_initial','2024-08-16 02:53:52.134434'),(7,'app','0002_remove_producto_descripcion','2024-08-16 02:53:52.189249'),(8,'app','0003_alter_cliente_telefono_alter_empleado_telefono_and_more','2024-08-16 02:53:52.434723'),(9,'app','0004_alter_cliente_telefono_alter_empleado_telefono_and_more','2024-08-16 02:53:52.450351'),(10,'app','0005_alter_compra_fecha_compra_alter_venta_fecha_venta','2024-08-16 02:53:52.489237'),(11,'app','0006_alter_compra_fecha_compra_alter_venta_fecha_venta','2024-08-16 02:53:52.686252'),(12,'app','0007_alter_cliente_cc_cliente_alter_cliente_telefono_and_more','2024-08-16 02:53:53.608322'),(13,'app','0008_alter_venta_fecha_venta','2024-08-16 02:53:53.624322'),(14,'contenttypes','0002_remove_content_type_name','2024-08-16 02:53:53.916343'),(15,'auth','0002_alter_permission_name_max_length','2024-08-16 02:53:54.030351'),(16,'auth','0003_alter_user_email_max_length','2024-08-16 02:53:54.086355'),(17,'auth','0004_alter_user_username_opts','2024-08-16 02:53:54.102355'),(18,'auth','0005_alter_user_last_login_null','2024-08-16 02:53:54.220367'),(19,'auth','0006_require_contenttypes_0002','2024-08-16 02:53:54.224367'),(20,'auth','0007_alter_validators_add_error_messages','2024-08-16 02:53:54.243367'),(21,'auth','0008_alter_user_username_max_length','2024-08-16 02:53:54.368378'),(22,'auth','0009_alter_user_last_name_max_length','2024-08-16 02:53:54.494812'),(23,'auth','0010_alter_group_name_max_length','2024-08-16 02:53:54.543816'),(24,'auth','0011_update_proxy_permissions','2024-08-16 02:53:54.573821'),(25,'auth','0012_alter_user_first_name_max_length','2024-08-16 02:53:54.689342'),(26,'sessions','0001_initial','2024-08-16 02:53:54.749345');
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
INSERT INTO `django_session` VALUES ('2appnavdtt3zysllro0vig9bkifgkkq8','.eJxVjEEOwiAQRe_C2hDoFKEu3XsGMswMUjU0Ke3KeHfbpAvd_vfef6uI61Li2mSOI6uL6tTpd0tIT6k74AfW-6Rpqss8Jr0r-qBN3yaW1_Vw_w4KtrLV3oIXyoYpeLAmZQuMYBzacxbmbBzB4LzpNiUAiHVgAILvsedAQ1KfL-FTN5I:1sf2xZ:M3l3rgzeiDbKUP4c1-h0TXzmwndcOH8zxvC2v68QV4Q','2024-08-30 19:50:05.936015'),('44utbdxex0xztuciyzw7m4j3a2ye941i','.eJxVjEEOwiAQRe_C2hBg6DC6dN8zNDBMpGogKe3KeHdt0oVu_3vvv9QUt7VMW5dlmrO6KKtOv1uK_JC6g3yP9dY0t7ouc9K7og_a9diyPK-H-3dQYi_f2mFAZMs0mBSDtwwerYAAoSHATBKCiJA3AeksjpxkAmeMTQOwgHp_ALcQNsA:1sf1vI:KYKqKLIHLxp2HxpqZtygtdLX5i9aF5gEqO8Zizke4jY','2024-08-30 18:43:40.598402'),('64cgqi7os7jq7j2odx6nq7ptta1povii','.eJxVjEEOwiAQRe_C2hBg6DC6dN8zNDBMpGogKe3KeHdt0oVu_3vvv9QUt7VMW5dlmrO6KKtOv1uK_JC6g3yP9dY0t7ouc9K7og_a9diyPK-H-3dQYi_f2mFAZMs0mBSDtwwerYAAoSHATBKCiJA3AeksjpxkAmeMTQOwgHp_ALcQNsA:1sf1pV:AFBTBbRFG3_bMuLyRDX4whFfzYvcAubPz51eQceMZ5A','2024-08-30 18:37:41.809484'),('bfh3ffyrp3wwqmugmhqq97rc4n83hukr','.eJxVjDsOwjAQRO_iGln-xR9Kes5grddrHECOFCcV4u5gKQWUM-_NvFiEfatx77TGObMzk-z02yXAB7UB8h3abeG4tG2dEx8KP2jn1yXT83K4fwcVev2ug_YGwImiUSUrDLrsjRiRgiRErQlEVipgcY5cUSZ7kGGSkyNp0bL3B-L_N9I:1sf3QH:1iE46o4FTW2TqYFQaiGvOxUTBU067fVSjEcnLi54W-g','2024-08-30 20:19:45.640507'),('bqm0pwtwztr3lyh0tmwn3b4eb020gtww','e30:1sf2Vz:u2Wko0otSaEmrWRSRQQgbpGngv6yO7BdA6pHsq6F1PQ','2024-08-30 19:21:35.634705'),('dtdek9jxwx56debrw7xhvxsv9sbrwqd9','.eJxVjEEOwiAQRe_C2hBg6DC6dN8zNDBMpGogKe3KeHdt0oVu_3vvv9QUt7VMW5dlmrO6KKtOv1uK_JC6g3yP9dY0t7ouc9K7og_a9diyPK-H-3dQYi_f2mFAZMs0mBSDtwwerYAAoSHATBKCiJA3AeksjpxkAmeMTQOwgHp_ALcQNsA:1sf1QU:YxkS_ClqEWPR6Mges3FxpY95uk_W7Zh9CpiLVmwEdYg','2024-08-30 18:11:50.656042'),('lcnm0669celrjzgtyh2rwt9oua4u9a2h','.eJxVjDsOwjAQRO_iGln-xR9Kes5grddrHECOFCcV4u5gKQWUM-_NvFiEfatx77TGObMzk-z02yXAB7UB8h3abeG4tG2dEx8KP2jn1yXT83K4fwcVev2ug_YGwImiUSUrDLrsjRiRgiRErQlEVipgcY5cUSZ7kGGSkyNp0bL3B-L_N9I:1sf3bj:D1_9PoYjJSFKSf4WaIH04-F1-I4vleQ_iRcMjS_yzvw','2024-08-30 20:31:35.256237');
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
INSERT INTO `empleado` VALUES (1,'Yeison','Vanegas',3210530167);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Postobon'),(2,'Pepsico'),(3,'Cocacola'),(4,'Pene');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentacion`
--

LOCK TABLES `presentacion` WRITE;
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
INSERT INTO `presentacion` VALUES (3,'wrewrwer');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (4,'werwerwer',3334,2333.00,3,1,3);
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

-- Dump completed on 2024-08-20 13:43:41
