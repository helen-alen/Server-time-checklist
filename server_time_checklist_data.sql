-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: server_time_checklist_data
-- ------------------------------------------------------
-- Server version	8.0.32

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
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add server time checklist',7,'add_servertimechecklist'),(26,'Can change server time checklist',7,'change_servertimechecklist'),(27,'Can delete server time checklist',7,'delete_servertimechecklist'),(28,'Can view server time checklist',7,'view_servertimechecklist');
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
  `first_name` varchar(30) NOT NULL,
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$YK9lrWc0IyWp$8XdxaEB8qkeB3yS6T+/C0fYvuZJb/jPY6vo2e8fv1VM=','2023-03-20 10:33:18.006884',1,'user','','','1036808976@qq.com',1,1,'2023-03-20 10:33:08.207459');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` int NOT NULL AUTO_INCREMENT,
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'server_time_checklist','servertimechecklist'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-20 10:00:44.784779'),(2,'auth','0001_initial','2023-03-20 10:00:45.972575'),(3,'admin','0001_initial','2023-03-20 10:00:48.242504'),(4,'admin','0002_logentry_remove_auto_add','2023-03-20 10:00:48.559657'),(5,'admin','0003_logentry_add_action_flag_choices','2023-03-20 10:00:48.606531'),(6,'contenttypes','0002_remove_content_type_name','2023-03-20 10:00:48.780067'),(7,'auth','0002_alter_permission_name_max_length','2023-03-20 10:00:48.920719'),(8,'auth','0003_alter_user_email_max_length','2023-03-20 10:00:48.987541'),(9,'auth','0004_alter_user_username_opts','2023-03-20 10:00:49.014440'),(10,'auth','0005_alter_user_last_login_null','2023-03-20 10:00:49.140105'),(11,'auth','0006_require_contenttypes_0002','2023-03-20 10:00:49.160051'),(12,'auth','0007_alter_validators_add_error_messages','2023-03-20 10:00:49.183021'),(13,'auth','0008_alter_user_username_max_length','2023-03-20 10:00:49.337576'),(14,'auth','0009_alter_user_last_name_max_length','2023-03-20 10:00:49.505129'),(15,'auth','0010_alter_group_name_max_length','2023-03-20 10:00:49.578959'),(16,'auth','0011_update_proxy_permissions','2023-03-20 10:00:49.618826'),(17,'server_time_checklist','0001_initial','2023-03-20 10:00:49.714568'),(18,'server_time_checklist','0002_remove_servertimechecklist_sequence_number','2023-03-20 10:00:49.760446'),(19,'server_time_checklist','0003_auto_20230320_0855','2023-03-20 10:00:50.199273'),(20,'sessions','0001_initial','2023-03-20 10:00:50.297012');
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
INSERT INTO `django_session` VALUES ('aij40pmfkgcyd5x71swm5hi4ypdlxaq7','MTRjYzcyYjkxMjhkOGVjYmU1MjMyNDliMmQxNDhlYjIwMjEzYWU3Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMjlmYjY1NzJhMGNlYjhmMDU2MDcxOGI0NmQ0N2M4MWU1ZDA0ZTIwIn0=','2023-04-03 10:33:18.032814');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_time_checklist_servertimechecklist`
--

DROP TABLE IF EXISTS `server_time_checklist_servertimechecklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_time_checklist_servertimechecklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `server_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `time_synced` tinyint(1) DEFAULT NULL,
  `check_time` date DEFAULT NULL,
  `checked_by` varchar(255) DEFAULT NULL,
  `is_adjusted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_time_checklist_servertimechecklist`
--

LOCK TABLES `server_time_checklist_servertimechecklist` WRITE;
/*!40000 ALTER TABLE `server_time_checklist_servertimechecklist` DISABLE KEYS */;
INSERT INTO `server_time_checklist_servertimechecklist` VALUES (1,'192.168.1.10','UPDATE服务器',NULL,NULL,NULL,NULL),(2,'192.168.1.13','内网服务器',NULL,NULL,NULL,NULL),(3,'192.168.1.250','YBM-BACKUP-AGENT',NULL,NULL,NULL,NULL),(4,'192.168.1.29','PACS数据库服务器',NULL,NULL,NULL,NULL),(5,'192.168.1.32','PACS网页服务器',NULL,NULL,NULL,NULL),(6,'192.168.100.10','HIS服务器',NULL,NULL,NULL,NULL),(7,'192.168.100.100','Dell powerEdGE R330',NULL,NULL,NULL,NULL),(8,'192.168.100.102','门诊轮椅',NULL,NULL,NULL,NULL),(9,'192.168.100.103','饭卡前置机',NULL,NULL,NULL,NULL),(10,'192.168.100.105','陪护系统',NULL,NULL,NULL,NULL),(11,'192.168.100.107','汇利斯通自助机',NULL,NULL,NULL,NULL),(13,'192.168.100.11','老HIS服务器',NULL,NULL,NULL,NULL),(14,'192.168.100.110','盈高安全准入',NULL,NULL,NULL,NULL),(15,'192.168.100.12','IBM小机882VIP(ORACLE)',NULL,NULL,NULL,NULL),(16,'192.168.100.121','天智评审系统',NULL,NULL,NULL,NULL),(17,'192.168.100.122','创业接口服务器',NULL,NULL,NULL,NULL),(18,'192.168.100.125','万达前置机',NULL,NULL,NULL,NULL),(19,'192.168.100.126','合理用血数据库服务器',NULL,NULL,NULL,NULL),(20,'192.168.100.13','HIS服务器',NULL,NULL,NULL,NULL),(21,'192.168.100.130','100.130VSS',NULL,NULL,NULL,NULL),(22,'192.168.100.131','食堂饭卡服务器',NULL,NULL,NULL,NULL),(23,'192.168.100.136','输血应用服务器',NULL,NULL,NULL,NULL),(25,'192.168.100.155','容灾小机',NULL,NULL,NULL,NULL),(26,'192.168.100.167','100.167消毒供应系统',NULL,NULL,NULL,NULL),(28,'192.168.100.175','深信服安全感知平台',NULL,NULL,NULL,NULL),(30,'192.168.100.178','Dell PowerEdge R730（门诊发药机服务器）',NULL,NULL,NULL,NULL),(31,'192.168.100.180','100.180生命体征采集',NULL,NULL,NULL,NULL),(32,'192.168.100.184','正元一卡通饭卡扫脸支付数据库',NULL,NULL,NULL,NULL),(33,'192.168.100.191','BI前置机',NULL,NULL,NULL,NULL),(34,'192.168.100.192','医保对账',NULL,NULL,NULL,NULL),(35,'192.168.100.197','横渡数据库审计',NULL,NULL,NULL,NULL),(37,'192.168.100.201','卫计委万达前置机',NULL,NULL,NULL,NULL),(38,'192.168.100.210','IBM （原1.29管理口地址，现1.243管理口地址）',NULL,NULL,NULL,NULL),(40,'192.168.100.215','UPS监控主机',NULL,NULL,NULL,NULL),(41,'192.168.100.217','市民卡、健康卡前置机(30.0.0.82)',NULL,NULL,NULL,NULL),(42,'192.168.100.218','100.218体检系统',NULL,NULL,NULL,NULL),(44,'192.168.100.220','麦迪斯顿系统',NULL,NULL,NULL,NULL),(45,'192.168.100.224','web服务器(包含数据统计）',NULL,NULL,NULL,NULL),(46,'192.168.100.228','100.228接口服务器',NULL,NULL,NULL,NULL),(47,'192.168.100.229','100.229单病种服务器',NULL,NULL,NULL,NULL),(49,'192.168.100.231','100.231嘉禾心电',NULL,NULL,NULL,NULL),(50,'192.168.100.232','病案统计',NULL,NULL,NULL,NULL),(51,'192.168.100.238','门禁服务器',NULL,NULL,NULL,NULL),(53,'192.168.100.240','浙里办体检上传、影像预约',NULL,NULL,NULL,NULL),(55,'192.168.100.248','门诊电子病历数据库服务器',NULL,NULL,NULL,NULL),(56,'192.168.100.249','emr数据库服务器',NULL,NULL,NULL,NULL),(58,'192.168.100.250','EMR备份服务器',NULL,NULL,NULL,NULL),(59,'192.168.100.253','订餐服务器',NULL,NULL,NULL,NULL),(64,'192.168.100.30','预约服务器',NULL,NULL,NULL,NULL),(65,'192.168.100.34','tzzx-drgs服务器',NULL,NULL,NULL,NULL),(66,'192.168.100.36','康体临床思维服务器',NULL,NULL,NULL,NULL),(68,'192.168.100.38','嘉禾EMR新应用服务器',NULL,NULL,NULL,NULL),(72,'192.168.100.47','PACS存储IBM',NULL,NULL,NULL,NULL),(73,'192.168.100.61','分级诊疗前置机',NULL,NULL,NULL,NULL),(74,'192.168.100.62','HDS小机',NULL,NULL,NULL,NULL),(77,'192.168.100.65','HDS存储',NULL,NULL,NULL,NULL),(80,'192.168.100.69','连帆输液服务器',NULL,NULL,NULL,NULL),(81,'192.168.100.7','小机his2',NULL,NULL,NULL,NULL),(82,'192.168.100.70','小机his2',NULL,NULL,NULL,NULL),(83,'192.168.100.71','小机his2',NULL,NULL,NULL,NULL),(87,'192.168.100.8','老HIS存储',NULL,NULL,NULL,NULL),(88,'192.168.100.83','天瑞康健体检系统应用服务器',NULL,NULL,NULL,NULL),(89,'192.168.100.84','天瑞康健体检系统接口服务器',NULL,NULL,NULL,NULL),(90,'192.168.100.88','被服管理系统',NULL,NULL,NULL,NULL),(91,'192.168.100.90','天瑞康建体检系统前置机',NULL,NULL,NULL,NULL),(92,'192.168.100.91','医学文献检索',NULL,NULL,NULL,NULL),(93,'192.168.100.93','创业新版排队叫号服务器',NULL,NULL,NULL,NULL),(94,'192.168.100.98','svn；rtx；健康台州的一个补录的工具',NULL,NULL,NULL,NULL),(95,'192.168.101.100','一体化运行监控平台数据服务器',NULL,NULL,NULL,NULL),(96,'192.168.101.101','医慧一体化运行监控平台应用服务器',NULL,NULL,NULL,NULL),(97,'192.168.101.102','台州中心医院一体化服务管理平台应用服务器',NULL,NULL,NULL,NULL),(98,'192.168.101.103','台州中心医院医慧一体化接入平台应用服务器',NULL,NULL,NULL,NULL),(100,'192.168.101.105','台州中心医院动态数据捕获系统应用服务器',NULL,NULL,NULL,NULL),(101,'192.168.101.107','医慧主数据管理系统应用服务器',NULL,NULL,NULL,NULL),(102,'192.168.101.108','医院大数据服务平台医院运营决策支持系统',NULL,NULL,NULL,NULL),(103,'192.168.101.109','医院大数据服务平台临床辅助决策CDSS',NULL,NULL,NULL,NULL),(104,'192.168.101.11','台州中心医院OA应用服务器01',NULL,NULL,NULL,NULL),(105,'192.168.101.110','医院智能门户平台单点登录系统',NULL,NULL,NULL,NULL),(106,'192.168.101.111','医院医慧智能门户平台工作门户',NULL,NULL,NULL,NULL),(107,'192.168.101.112','上海瓴豆肾内全病程管理数据库服务器',NULL,NULL,NULL,NULL),(108,'192.168.101.113','上海瓴豆肾内全病程管理应用服务器',NULL,NULL,NULL,NULL),(109,'192.168.101.115','门诊电子病历应用服务器（新）',NULL,NULL,NULL,NULL),(110,'192.168.101.119','CDSS数据库',NULL,NULL,NULL,NULL),(111,'192.168.101.12','台州中心医院OA数据库',NULL,NULL,NULL,NULL),(112,'192.168.101.120','CDSS应用1',NULL,NULL,NULL,NULL),(113,'192.168.101.121','CDSS应用服务器2',NULL,NULL,NULL,NULL),(114,'192.168.101.122','CDSS人卫知识库服务器',NULL,NULL,NULL,NULL),(115,'192.168.101.123','图书馆服务器',NULL,NULL,NULL,NULL),(116,'192.168.101.128','台州市中心医院-单病种服务器',NULL,NULL,NULL,NULL),(117,'192.168.101.13','台州中心医院邮件服务器',NULL,NULL,NULL,NULL),(118,'192.168.101.130','LIS与HIS交互服务器（负载）',NULL,NULL,NULL,NULL),(119,'192.168.101.131','台州市中心医院-智慧病房',NULL,NULL,NULL,NULL),(120,'192.168.101.132','台州市中心医院-智慧病房',NULL,NULL,NULL,NULL),(121,'192.168.101.133','台州市中心医院-网站WEB服务器',NULL,NULL,NULL,NULL),(122,'192.168.101.134','台州市中心医院-网站数据库服务器',NULL,NULL,NULL,NULL),(123,'192.168.101.15','台州中心医院科研管理系统服务器',NULL,NULL,NULL,NULL),(124,'192.168.101.16','台州中心医院院感系统数据库web服务器',NULL,NULL,NULL,NULL),(125,'192.168.101.17','台州中心医院院感系统采集参数服务器',NULL,NULL,NULL,NULL),(126,'192.168.101.18','台州中心医院组织库系统服务器（南琼考试系统）',NULL,NULL,NULL,NULL),(127,'192.168.101.181','单病种数据库服务器',NULL,NULL,NULL,NULL),(128,'192.168.101.182','单病种前置机服务器',NULL,NULL,NULL,NULL),(129,'192.168.101.183','单病种应用服务器',NULL,NULL,NULL,NULL),(130,'192.168.101.197','台州中心医院账务支付服务器',NULL,NULL,NULL,NULL),(131,'192.168.101.2','台州中心医院对账平台主数据库服务器',NULL,NULL,NULL,NULL),(132,'192.168.101.20','台州中心医院HRP服务器',NULL,NULL,NULL,NULL),(133,'192.168.101.200','信息集成平台交换系统服务器01',NULL,NULL,NULL,NULL),(134,'192.168.101.201','信息集成平台交换系统服务器02',NULL,NULL,NULL,NULL),(135,'192.168.101.202','信息集成平台信息处理服务器01',NULL,NULL,NULL,NULL),(136,'192.168.101.203','信息集成平台信息处理服务器02',NULL,NULL,NULL,NULL),(137,'192.168.101.204','集成平台数据库服务器',NULL,NULL,NULL,NULL),(138,'192.168.101.205','应用服务器',NULL,NULL,NULL,NULL),(139,'192.168.101.206','数据中心(非结构化数据接入引擎)应用服务器',NULL,NULL,NULL,NULL),(140,'192.168.101.207','ODS数据库服务器',NULL,NULL,NULL,NULL),(141,'192.168.101.21','台州中心医院OA应用服务器02',NULL,NULL,NULL,NULL),(142,'192.168.101.22','云在管理平台',NULL,NULL,NULL,NULL),(143,'192.168.101.23','医慧移动护理应用服务器',NULL,NULL,NULL,NULL),(148,'192.168.101.25','台州中心医院创业测试服务器',NULL,NULL,NULL,NULL),(149,'192.168.101.26','台州中心医院微脉APP服务器',NULL,NULL,NULL,NULL),(151,'192.168.101.29','PACS云服务器',NULL,NULL,NULL,NULL),(152,'192.168.101.3','台州中心医院对账平台缓存服务器',NULL,NULL,NULL,NULL),(153,'192.168.101.30','台州中心医院云随访服务器',NULL,NULL,NULL,NULL),(154,'192.168.101.32','云随访前置机服务器',NULL,NULL,NULL,NULL),(155,'192.168.101.33','台州中心医院病理服务器',NULL,NULL,NULL,NULL),(158,'192.168.101.38','美创大数据库数字化项目-数据仓库',NULL,NULL,NULL,NULL),(159,'192.168.101.39','台州中心医院自助机前置机',NULL,NULL,NULL,NULL),(160,'192.168.101.4','台州中心医院对账平台负载网关服务器',NULL,NULL,NULL,NULL),(161,'192.168.101.40','台州中心医院档案管理服务器',NULL,NULL,NULL,NULL),(162,'192.168.101.41','台州中心医院检查预约登记服务器',NULL,NULL,NULL,NULL),(163,'192.168.101.42','台州中心医院智能输液服务器',NULL,NULL,NULL,NULL),(164,'192.168.101.43','数据备份服务器',NULL,NULL,NULL,NULL),(165,'192.168.101.44','急诊分诊急诊护理',NULL,NULL,NULL,NULL),(166,'192.168.101.45','急诊分诊急诊护理数据库',NULL,NULL,NULL,NULL),(167,'192.168.101.46','美创大数据库数字化项目-ETL服务器',NULL,NULL,NULL,NULL),(168,'192.168.101.5','台州中心医院对账平台从数据库服务器',NULL,NULL,NULL,NULL),(169,'192.168.101.54','合理用药服务器',NULL,NULL,NULL,NULL),(170,'192.168.101.55','审方服务器',NULL,NULL,NULL,NULL),(171,'192.168.101.56','美创大数据库数字化项目-支撑平台服务器',NULL,NULL,NULL,NULL),(172,'192.168.101.58','LIS数据库服务器(2020.06)',NULL,NULL,NULL,NULL),(173,'192.168.101.59','杏和LIS应用服务器',NULL,NULL,NULL,NULL),(174,'192.168.101.6','台州中心医院统一对账服务器',NULL,NULL,NULL,NULL),(175,'192.168.101.60','杏和LIS报告服务器',NULL,NULL,NULL,NULL),(176,'192.168.101.61','杏和LIS测试服务器',NULL,NULL,NULL,NULL),(177,'192.168.101.66','易丰科技在线培训',NULL,NULL,NULL,NULL),(178,'192.168.101.67','台州市中心医院一体化服务应用',NULL,NULL,NULL,NULL),(179,'192.168.101.68','台州市中心医院鉴权集群1',NULL,NULL,NULL,NULL),(180,'192.168.101.69','台州市中心医院鉴权集群2',NULL,NULL,NULL,NULL),(181,'192.168.101.7','微脉支付服务器',NULL,NULL,NULL,NULL),(182,'192.168.101.71','临床路径应用服务器',NULL,NULL,NULL,NULL),(183,'192.168.101.72','台州学院drgs web服务器',NULL,NULL,NULL,NULL),(184,'192.168.101.73','汇理斯通对账数据库服务器',NULL,NULL,NULL,NULL),(185,'192.168.101.74','肾内腹膜透析应用',NULL,NULL,NULL,NULL),(186,'192.168.101.75','肾内腹膜透析前置备用',NULL,NULL,NULL,NULL),(187,'192.168.101.76','肾内腹膜透析数据库',NULL,NULL,NULL,NULL),(188,'192.168.101.79','美创大数据库数字化项目-质控平台',NULL,NULL,NULL,NULL),(189,'192.168.101.80','数据库负载测试',NULL,NULL,NULL,NULL),(190,'192.168.101.80','美创大数据库数字化项目-应用服务器',NULL,NULL,NULL,NULL),(191,'192.168.101.81','微脉外联平台前置机',NULL,NULL,NULL,NULL),(192,'192.168.101.82','微脉外联平台管理后台服务器',NULL,NULL,NULL,NULL),(193,'192.168.101.83','微脉外联平台网关路由服务器',NULL,NULL,NULL,NULL),(194,'192.168.101.84','微脉外联平台缓存redis服务器',NULL,NULL,NULL,NULL),(195,'192.168.101.85','微脉外联平台主数据库服务器',NULL,NULL,NULL,NULL),(196,'192.168.101.86','创业-电子病历评级数据质量管理系统应用服务器',NULL,NULL,NULL,NULL),(197,'192.168.101.87','创业-电子病历评级数据质量管理系统数据库服务器',NULL,NULL,NULL,NULL),(198,'192.168.101.88','创业慧康-医院信息平台-门诊电子病历测试服务器',NULL,NULL,NULL,NULL),(199,'192.168.101.89','嘉和美康-病案归档项目文件服务器1',NULL,NULL,NULL,NULL),(200,'192.168.101.9','科教数据库服务器',NULL,NULL,NULL,NULL),(201,'192.168.101.90','嘉和美康-病案归档项目文件服务器2',NULL,NULL,NULL,NULL),(202,'192.168.101.91','嘉和美康-病案归档项目文件服务器3',NULL,NULL,NULL,NULL),(203,'192.168.101.92','嘉和美康-病案归档项目应用服务器1',NULL,NULL,NULL,NULL),(204,'192.168.101.93','嘉和美康-病案归档项目应用服务器2',NULL,NULL,NULL,NULL),(205,'192.168.101.94','数据脱敏服务器',NULL,NULL,NULL,NULL),(206,'192.168.101.95','病案解析项目-一卡通电子病历平台',NULL,NULL,NULL,NULL),(207,'192.168.101.96','人力资源系统数据库服务器',NULL,NULL,NULL,NULL),(208,'192.168.101.97','人力资源系统附件服务器',NULL,NULL,NULL,NULL),(209,'192.168.101.98','人力资源系统内网应用服务器',NULL,NULL,NULL,NULL),(210,'192.168.101.99','人力资源系统外网应用服务器',NULL,NULL,NULL,NULL),(211,'192.168.102.1','iStroke智能决策平台物理机',NULL,NULL,NULL,NULL),(212,'192.168.102.2','iStroke智能决策平台biomind',NULL,NULL,NULL,NULL),(213,'192.168.102.31','堡垒机',NULL,NULL,NULL,NULL),(214,'192.168.102.44','莱达影像数据库服务器',NULL,NULL,NULL,NULL),(215,'192.168.102.45','莱达影像数据库容灾服务器',NULL,NULL,NULL,NULL),(216,'192.168.103.1','温岭四院PACS对接前置机',NULL,NULL,NULL,NULL),(217,'192.168.103.128','深信服云桌面',NULL,NULL,NULL,NULL),(218,'192.168.103.129','深信服云桌面',NULL,NULL,NULL,NULL),(219,'192.168.103.183','中心医院血糖采集服务器',NULL,NULL,NULL,NULL),(220,'192.168.103.22','眼科医院惠普服务器IPMI',NULL,NULL,NULL,NULL),(221,'192.168.103.23','YBM-PVE',NULL,NULL,NULL,NULL),(222,'192.168.103.230','眼科医院微脉服务器',NULL,NULL,NULL,NULL),(223,'192.168.103.232','眼科医院千方百剂',NULL,NULL,NULL,NULL),(224,'192.168.103.233','眼科医院虚拟机的管理地址',NULL,NULL,NULL,NULL),(225,'192.168.103.235','眼科医院排队叫号',NULL,NULL,NULL,NULL),(226,'192.168.103.236','眼科医院微脉服务器',NULL,NULL,NULL,NULL),(227,'192.168.103.237','眼科医院盼盼病历服务器',NULL,NULL,NULL,NULL),(228,'192.168.103.238','back-up',NULL,NULL,NULL,NULL),(229,'192.168.103.239','眼科医院-server',NULL,NULL,NULL,NULL),(230,'192.168.103.24','眼科医院云贝母',NULL,NULL,NULL,NULL),(231,'192.168.103.25','眼科医院VM服务器管理平台',NULL,NULL,NULL,NULL),(232,'192.168.105.1','HCP_NODE1',NULL,NULL,NULL,NULL),(233,'192.168.105.10','HNAS_SERVICE',NULL,NULL,NULL,NULL),(234,'192.168.105.11','BMC_HCP_NODE1',NULL,NULL,NULL,NULL),(235,'192.168.105.12','BMC_HCP_NODE2',NULL,NULL,NULL,NULL),(236,'192.168.105.13','BMC_HCP_NODE3',NULL,NULL,NULL,NULL),(237,'192.168.105.14','BMC_HCP_NODE4',NULL,NULL,NULL,NULL),(238,'192.168.105.16','CTL0',NULL,NULL,NULL,NULL),(239,'192.168.105.17','CTL1',NULL,NULL,NULL,NULL),(240,'192.168.105.2','HCP_NODE2',NULL,NULL,NULL,NULL),(241,'192.168.105.3','HCP_NODE3',NULL,NULL,NULL,NULL),(242,'192.168.105.4','HCP_NODE4',NULL,NULL,NULL,NULL),(243,'192.168.105.5','LOCAL IP',NULL,NULL,NULL,NULL),(244,'192.168.105.6','LOCAL IP',NULL,NULL,NULL,NULL),(245,'192.168.105.7','SERVICE IP',NULL,NULL,NULL,NULL),(246,'192.168.105.8','SERVICE IP',NULL,NULL,NULL,NULL),(247,'192.168.105.9','HNAS_MANAGER',NULL,NULL,NULL,NULL),(248,'192.168.106.1','超融合虚拟机',NULL,NULL,NULL,NULL),(249,'192.168.106.100','HDS F350',NULL,NULL,NULL,NULL),(250,'192.168.106.101','106.101 DNS1',NULL,NULL,NULL,NULL),(251,'192.168.106.102','106.102 DNS2',NULL,NULL,NULL,NULL),(252,'192.168.106.103','106.103 NTP1',NULL,NULL,NULL,NULL),(253,'192.168.106.104','106.104 NTP2',NULL,NULL,NULL,NULL),(254,'192.168.106.105','奇安信杀毒软件',NULL,NULL,NULL,NULL),(255,'192.168.106.107','云康与工行连接服务器',NULL,NULL,NULL,NULL),(256,'192.168.106.108','安易信运维服务器',NULL,NULL,NULL,NULL),(257,'192.168.106.109','移动医保机审服务器',NULL,NULL,NULL,NULL),(258,'192.168.106.111','自助发药机',NULL,NULL,NULL,NULL),(259,'192.168.106.112','亚华手表服务器',NULL,NULL,NULL,NULL),(260,'192.168.106.113','莱达同步数据服务器',NULL,NULL,NULL,NULL),(261,'192.168.106.114','检验系统',NULL,NULL,NULL,NULL),(262,'192.168.106.119','病案翻拍服务器',NULL,NULL,NULL,NULL),(263,'192.168.106.120','发热门诊监控服务器',NULL,NULL,NULL,NULL),(264,'192.168.106.121','发热门诊监控数据库服务器',NULL,NULL,NULL,NULL),(265,'192.168.106.122','对账平台',NULL,NULL,NULL,NULL),(266,'192.168.106.123','智能导诊系统',NULL,NULL,NULL,NULL),(267,'192.168.106.126','内镜洗消追溯系统数据库服务器',NULL,NULL,NULL,NULL),(268,'192.168.106.157','106.157审方接口服务器',NULL,NULL,NULL,NULL),(269,'192.168.106.2','超融合虚拟机地址',NULL,NULL,NULL,NULL),(270,'192.168.106.3','超融合虚拟机地址',NULL,NULL,NULL,NULL),(271,'192.168.106.30','维保保服务器',NULL,NULL,NULL,NULL),(272,'192.168.106.32','理邦心电服务器',NULL,NULL,NULL,NULL),(273,'192.168.106.34','106.34 共享文档服务器',NULL,NULL,NULL,NULL),(274,'192.168.106.38','106.38HIS与LIS交互服务器',NULL,NULL,NULL,NULL),(275,'192.168.106.4','超融合虚拟机地址',NULL,NULL,NULL,NULL),(276,'192.168.106.40','106.40vte服务器',NULL,NULL,NULL,NULL),(277,'192.168.106.41','CA负载服务器',NULL,NULL,NULL,NULL),(278,'192.168.106.42','CA存储服务器',NULL,NULL,NULL,NULL),(279,'192.168.106.43','服务中心排队叫号服务器',NULL,NULL,NULL,NULL),(280,'192.168.106.44','服务中心抽血叫号服务器',NULL,NULL,NULL,NULL),(281,'192.168.106.45','导航巡视服务器',NULL,NULL,NULL,NULL),(282,'192.168.106.49','急诊会诊人脸识别',NULL,NULL,NULL,NULL),(283,'192.168.106.50','106.50 陪护系统前置机',NULL,NULL,NULL,NULL),(284,'192.168.106.60','106.60 云知声服务器',NULL,NULL,NULL,NULL),(285,'192.168.106.67','医慧移动护理数据库服务器',NULL,NULL,NULL,NULL),(286,'192.168.106.68','106.68 麻醉药剂审核（麻醉药品柜）',NULL,NULL,NULL,NULL),(287,'192.168.106.74','106.74 嘉禾心电数据库服务器',NULL,NULL,NULL,NULL),(288,'192.168.106.77','106.77 莱达影像交互前置机',NULL,NULL,NULL,NULL),(289,'192.168.106.8','超融合平台管理地址',NULL,NULL,NULL,NULL),(290,'192.168.106.83','106.83 票据数据库服务器',NULL,NULL,NULL,NULL),(291,'192.168.106.84','106.84 票据应用服务器',NULL,NULL,NULL,NULL),(292,'192.168.106.86','106.86 票据数据库服务器',NULL,NULL,NULL,NULL),(293,'192.168.106.87','106.87 票据应用服务器',NULL,NULL,NULL,NULL),(294,'192.168.106.9','超融合虚拟机地址',NULL,NULL,NULL,NULL),(295,'192.168.106.90','106.90数据库运维平台',NULL,NULL,NULL,NULL),(296,'192.168.106.91','移动支付前置机',NULL,NULL,NULL,NULL),(297,'192.168.106.94','美创防水坝',NULL,NULL,NULL,NULL),(298,'192.168.106.95','健康证、职业病接口服务器',NULL,NULL,NULL,NULL),(299,'192.168.106.96','肿瘤上报服务器',NULL,NULL,NULL,NULL),(300,'192.168.106.97','门禁服务器',NULL,NULL,NULL,NULL),(301,'192.168.106.98','药房叫号系统',NULL,NULL,NULL,NULL),(302,'192.168.106.99','自动计费服务器',NULL,NULL,NULL,NULL),(303,'192.168.108.1','智慧后勤服务器',NULL,NULL,NULL,NULL),(304,'192.168.108.2','平台堡垒机',NULL,NULL,NULL,NULL),(305,'192.168.108.3','平台服务机',NULL,NULL,NULL,NULL),(306,'192.168.108.4','设备能源服务器',NULL,NULL,NULL,NULL),(307,'192.168.108.6','数据库服务器',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `server_time_checklist_servertimechecklist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-21 16:54:56
