-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: cathedra
-- ------------------------------------------------------
-- Server version	9.4.0

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$luPXfWUlAIBOAUsq2sf4Fi$ZXTjn5/dDIn8bB4k6ZINcA3TPxrw9NyN61MWqjpeOns=','2026-03-20 19:07:41.721626',1,'david','','','',1,1,'2026-03-20 17:59:56.399380');
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
-- Table structure for table `becas`
--

DROP TABLE IF EXISTS `becas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `becas` (
  `id_beca` int NOT NULL AUTO_INCREMENT,
  `nombre_beca` varchar(150) NOT NULL,
  `descripcion` text,
  `porcentaje_cobertura` decimal(5,2) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `requisitos` text,
  `estado` enum('Activa','Cerrada') DEFAULT 'Activa',
  `id_universidad` int DEFAULT NULL,
  PRIMARY KEY (`id_beca`),
  KEY `id_universidad` (`id_universidad`),
  CONSTRAINT `becas_ibfk_1` FOREIGN KEY (`id_universidad`) REFERENCES `universidades` (`id_universidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `becas`
--

LOCK TABLES `becas` WRITE;
/*!40000 ALTER TABLE `becas` DISABLE KEYS */;
INSERT INTO `becas` VALUES (1,'Beca Excelencia','Para promedios altos',100.00,'2026-01-01','2026-06-30','Promedio > 4.5','Activa',1),(2,'Beca Talento','Deportes y artes',50.00,'2026-02-01','2026-07-31','Certificado deportivo','Activa',2),(3,'Beca Social','Bajos recursos',80.00,'2026-01-15','2026-05-15','Estrato 1 o 2','Activa',3),(4,'Beca STEM','Mujeres en ciencia',90.00,'2026-03-01','2026-08-01','Solo mujeres','Activa',4),(5,'Beca Posgrado','Maestrías',30.00,'2026-01-01','2026-12-31','Título profesional','Cerrada',5),(6,'Beca Idiomas','Inglés avanzado',40.00,'2026-04-01','2026-09-01','Nivel B2','Activa',6),(7,'Beca Investigación','Proyectos',75.00,'2026-02-15','2026-11-30','Propuesta aprobada','Activa',7),(8,'Beca Regional','Estudiantes de provincia',60.00,'2026-01-10','2026-04-10','Residencia rural','Activa',8),(9,'Beca Empresa','Convenio privado',100.00,'2026-05-01','2026-10-01','Hijo de empleado','Activa',9),(10,'Beca Liderazgo','Líderes sociales',50.00,'2026-03-15','2026-07-15','Experiencia comunitaria','Activa',10),(11,'Beca Tecnología','Nuevos talentos',25.00,'2026-02-01','2026-06-01','Prueba técnica','Activa',11),(12,'Beca Futuro','Primer semestre',100.00,'2025-11-01','2026-01-31','Admisión nueva','Cerrada',12),(13,'Beca Intercambio','Movilidad',70.00,'2026-06-01','2026-12-31','Pasaporte vigente','Activa',13),(14,'Beca Solidaria','Apoyo alimentación',20.00,'2026-01-20','2026-12-20','Entrevista social','Activa',14);
/*!40000 ALTER TABLE `becas` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-03-20 17:44:20.716383'),(2,'auth','0001_initial','2026-03-20 17:44:23.612672'),(3,'admin','0001_initial','2026-03-20 17:44:24.107037'),(4,'admin','0002_logentry_remove_auto_add','2026-03-20 17:44:24.124027'),(5,'admin','0003_logentry_add_action_flag_choices','2026-03-20 17:44:24.139018'),(6,'contenttypes','0002_remove_content_type_name','2026-03-20 17:44:24.513850'),(7,'auth','0002_alter_permission_name_max_length','2026-03-20 17:44:24.742442'),(8,'auth','0003_alter_user_email_max_length','2026-03-20 17:44:24.795048'),(9,'auth','0004_alter_user_username_opts','2026-03-20 17:44:24.813038'),(10,'auth','0005_alter_user_last_login_null','2026-03-20 17:44:25.020871'),(11,'auth','0006_require_contenttypes_0002','2026-03-20 17:44:25.031137'),(12,'auth','0007_alter_validators_add_error_messages','2026-03-20 17:44:25.049030'),(13,'auth','0008_alter_user_username_max_length','2026-03-20 17:44:25.252218'),(14,'auth','0009_alter_user_last_name_max_length','2026-03-20 17:44:25.459351'),(15,'auth','0010_alter_group_name_max_length','2026-03-20 17:44:25.510320'),(16,'auth','0011_update_proxy_permissions','2026-03-20 17:44:25.527309'),(17,'auth','0012_alter_user_first_name_max_length','2026-03-20 17:44:25.732155'),(18,'sessions','0001_initial','2026-03-20 17:44:25.855333');
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
INSERT INTO `django_session` VALUES ('xk9kd443eadz9v98ge1f5nhpguhpm40t','.eJxVjEEOwiAQRe_C2hAgUAaX7j0DmYFBqoYmpV013t026UK3_733NxFxXWpcO89xzOIqtLj8boTpxe0A-YntMck0tWUeSR6KPGmX9ynz-3a6fwcVe91rZXwwoLGkANqCJeeDBm9ctsGiViUMWLyCYDIisiNQ6BID8UC7nsXnC7jgN4U:1w3fC9:O0sA2V0w3xsY5nIKRd5BTyKC1j_GsGmmDShX5nbBnzU','2026-04-03 19:07:41.871779');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `id_favorito` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_beca` int DEFAULT NULL,
  PRIMARY KEY (`id_favorito`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_beca` (`id_beca`),
  CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`id_beca`) REFERENCES `becas` (`id_beca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES (1,2,1),(2,2,4),(3,3,2),(4,5,3),(5,7,4),(6,9,6),(7,11,7),(8,13,8),(9,14,1),(10,3,13),(11,5,14),(12,7,1),(13,11,4),(14,2,7);
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `id_notificacion` int NOT NULL AUTO_INCREMENT,
  `mensaje` text NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `leida` tinyint(1) DEFAULT '0',
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_notificacion`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,'Tu postulación ha sido recibida','2026-03-05 13:12:50',1,2),(2,'Beca aprobada, revisa tu correo','2026-03-05 13:12:50',0,3),(3,'Nueva beca disponible en tu ciudad','2026-03-05 13:12:50',0,5),(4,'Recordatorio: Cierre de convocatoria','2026-03-05 13:12:50',1,7),(5,'Documentos rechazados por falta de firma','2026-03-05 13:12:50',0,9),(6,'Bienvenido a Cathedra','2026-03-05 13:12:50',1,11),(7,'Actualización de perfil necesaria','2026-03-05 13:12:50',0,13),(8,'Tu beca ha sido renovada','2026-03-05 13:12:50',0,14),(9,'Nueva mensaje del administrador','2026-03-05 13:12:50',0,2),(10,'Entrevista programada para lunes','2026-03-05 13:12:50',1,3),(11,'Beca STEM abierta ahora','2026-03-05 13:12:50',1,5),(12,'Se ha cerrado la beca Posgrado','2026-03-05 13:12:50',0,7),(13,'Resultado de postulación disponible','2026-03-05 13:12:50',1,9),(14,'Alerta de seguridad: nuevo inicio de sesión','2026-03-05 13:12:50',0,11);
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulaciones`
--

DROP TABLE IF EXISTS `postulaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postulaciones` (
  `id_postulacion` int NOT NULL AUTO_INCREMENT,
  `fecha_postulacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('Pendiente','Aprobada','Rechazada') DEFAULT 'Pendiente',
  `id_usuario` int DEFAULT NULL,
  `id_beca` int DEFAULT NULL,
  PRIMARY KEY (`id_postulacion`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_beca` (`id_beca`),
  CONSTRAINT `postulaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postulaciones_ibfk_2` FOREIGN KEY (`id_beca`) REFERENCES `becas` (`id_beca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulaciones`
--

LOCK TABLES `postulaciones` WRITE;
/*!40000 ALTER TABLE `postulaciones` DISABLE KEYS */;
INSERT INTO `postulaciones` VALUES (1,'2026-03-05 13:12:50','Pendiente',2,1),(2,'2026-03-05 13:12:50','Aprobada',3,2),(3,'2026-03-05 13:12:50','Rechazada',5,3),(4,'2026-03-05 13:12:50','Pendiente',7,4),(5,'2026-03-05 13:12:50','Aprobada',9,6),(6,'2026-03-05 13:12:50','Pendiente',11,7),(7,'2026-03-05 13:12:50','Pendiente',13,8),(8,'2026-03-05 13:12:50','Rechazada',14,1),(9,'2026-03-05 13:12:50','Aprobada',2,4),(10,'2026-03-05 13:12:50','Pendiente',3,7),(11,'2026-03-05 13:12:50','Pendiente',5,10),(12,'2026-03-05 13:12:50','Pendiente',7,13),(13,'2026-03-05 13:12:50','Aprobada',9,14),(14,'2026-03-05 13:12:50','Rechazada',11,1);
/*!40000 ALTER TABLE `postulaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(11,'Analista'),(6,'Auditor'),(5,'Consultor'),(10,'Coordinador'),(12,'Director'),(14,'Egresado'),(2,'Estudiante'),(8,'Invitado'),(4,'Moderador'),(9,'Postulante'),(3,'Representante Universidad'),(13,'Secretario'),(7,'Soporte Técnico');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universidades`
--

DROP TABLE IF EXISTS `universidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universidades` (
  `id_universidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `tipo` enum('Publica','Privada') NOT NULL,
  `pagina_web` varchar(200) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_universidad`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universidades`
--

LOCK TABLES `universidades` WRITE;
/*!40000 ALTER TABLE `universidades` DISABLE KEYS */;
INSERT INTO `universidades` VALUES (1,'Universidad Nacional','Bogotá','Cundinamarca','Publica','www.unal.edu.co','Sede principal Bogotá'),(2,'Universidad de los Andes','Bogotá','Cundinamarca','Privada','www.uniandes.edu.co','Excelencia académica'),(3,'Universidad de Antioquia','Medellín','Antioquia','Publica','www.udea.edu.co','Líder en investigación'),(4,'Universidad del Valle','Cali','Valle del Cauca','Publica','www.univalle.edu.co','Principal del occidente'),(5,'Universidad Javeriana','Bogotá','Cundinamarca','Privada','www.javeriana.edu.co','Enfoque integral'),(6,'Universidad del Norte','Barranquilla','Atlántico','Privada','www.uninorte.edu.co','Líder en el Caribe'),(7,'Universidad Industrial de Santander','Bucaramanga','Santander','Publica','www.uis.edu.co','Enfoque técnico'),(8,'Universidad de Caldas','Manizales','Caldas','Publica','www.ucaldas.edu.co','Eje cafetero'),(9,'Universidad de la Sabana','Chía','Cundinamarca','Privada','www.unisabana.edu.co','Campus empresarial'),(10,'Universidad de Córdoba','Montería','Córdoba','Publica','www.unicordoba.edu.co','Sede Montería'),(11,'Universidad Pontificia Bolivariana','Medellín','Antioquia','Privada','www.upb.edu.co','Tradición educativa'),(12,'Universidad del Cauca','Popayán','Cauca','Publica','www.unicauca.edu.co','Ciudad universitaria'),(13,'Universidad ICESI','Cali','Valle del Cauca','Privada','www.icesi.edu.co','Innovación constante'),(14,'Universidad de Nariño','Pasto','Nariño','Publica','www.udenar.edu.co','Sur del país');
/*!40000 ALTER TABLE `universidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_rol` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','Pérez','juan.perez@mail.com','pass123','3001234567','2026-03-05 13:12:50',1),(2,'Maria','García','m.garcia@mail.com','pass123','3002345678','2026-03-05 13:12:50',2),(3,'Carlos','López','c.lopez@mail.com','pass123','3003456789','2026-03-05 13:12:50',2),(4,'Ana','Martínez','a.martinez@mail.com','pass123','3004567890','2026-03-05 13:12:50',3),(5,'Luis','Rodríguez','l.rodriguez@mail.com','pass123','3005678901','2026-03-05 13:12:50',2),(6,'Elena','Sánchez','e.sanchez@mail.com','pass123','3006789012','2026-03-05 13:12:50',4),(7,'Diego','Ramírez','d.ramirez@mail.com','pass123','3007890123','2026-03-05 13:12:50',2),(8,'Paula','Torres','p.torres@mail.com','pass123','3008901234','2026-03-05 13:12:50',5),(9,'Jorge','Ruiz','j.ruiz@mail.com','pass123','3009012345','2026-03-05 13:12:50',2),(10,'Sofía','Castro','s.castro@mail.com','pass123','3101112233','2026-03-05 13:12:50',3),(11,'Andrés','Morales','a.morales@mail.com','pass123','3112223344','2026-03-05 13:12:50',2),(12,'Lucía','Herrera','l.herrera@mail.com','pass123','3123334455','2026-03-05 13:12:50',6),(13,'Mateo','Vargas','m.vargas@mail.com','pass123','3134445566','2026-03-05 13:12:50',2),(14,'Camila','Ríos','c.rios@mail.com','pass123','3145556677','2026-03-05 13:12:50',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-20 14:17:52
