-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: questyme
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'interviewee'),(1,'interviewer');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (2,1,29),(3,1,30),(4,1,31),(1,1,32),(7,2,30),(8,2,31),(5,2,32);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add slot',7,'add_slot'),(26,'Can change slot',7,'change_slot'),(27,'Can delete slot',7,'delete_slot'),(28,'Can view slot',7,'view_slot'),(29,'Can add interviewer_ slot',8,'add_interviewer_slot'),(30,'Can change interviewer_ slot',8,'change_interviewer_slot'),(31,'Can delete interviewer_ slot',8,'delete_interviewer_slot'),(32,'Can view interviewer_ slot',8,'view_interviewer_slot'),(33,'Can add course',9,'add_course'),(34,'Can change course',9,'change_course'),(35,'Can delete course',9,'delete_course'),(36,'Can view course',9,'view_course');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$9xo8RsuEE7pPT3lBFpSwqY$InJvTX4hRSWGxAimrFojPiMBwn74BpPwlJWBdhqEgfw=','2023-06-02 13:30:29.200831',1,'admin','','','admin@masaischoll.com',1,1,'2023-06-02 04:19:25.282388'),(8,'pbkdf2_sha256$600000$NmDTB5DbRKUQMRnZoovKKJ$C3CzaHUCXxRPmgHqCjscd+jSi/mDl5VnTD7QGhItSno=',NULL,0,'abc','abc','abc','abc@abc.in',0,1,'2023-06-02 11:21:00.515100'),(9,'pbkdf2_sha256$600000$scJwB2hEOttDEQAyl4dHcb$7CSVSGx7VcNnMorzwoxC88+CCwcgymNIf6vCXVOILdw=',NULL,0,'kapil','kapil','Agrawal','kapil.Agrawal@masaischool.com',0,1,'2023-06-02 11:21:58.830711'),(12,'pbkdf2_sha256$600000$5NukzQsgjr45ZoDjd846x2$dYH60+udH01Ey1mCjk0XhIyiuQKy71bEaJHj5AOhlQc=',NULL,0,'shishir','shishir','padhan','shishir.padhan@masaischool.com',0,1,'2023-06-02 13:16:14.327574'),(15,'pbkdf2_sha256$600000$j7x3BdrjnZzbtSmGx0YwV1$9kncXA/T+50WVYikkrxZ1SE43qmnLfcV1Nei9iaRXhw=',NULL,0,'pqr','pqr','pqr','pqr@kyu.com',0,1,'2023-06-02 13:19:51.924013');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,8,2),(2,9,1),(5,12,1),(8,15,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-06-02 04:22:30.790724','1','interviewer',1,'[{\"added\": {}}]',3,1),(2,'2023-06-02 04:23:11.308512','2','interviewee',1,'[{\"added\": {}}]',3,1),(3,'2023-06-02 09:46:44.155410','2','interviewee',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(4,'2023-06-02 12:26:20.749453','1','Course object (1)',1,'[{\"added\": {}}]',9,1),(5,'2023-06-02 12:28:09.718240','2','Course object (2)',1,'[{\"added\": {}}]',9,1),(6,'2023-06-02 12:28:14.518055','3','Course object (3)',1,'[{\"added\": {}}]',9,1),(7,'2023-06-02 13:28:48.517401','1','Slot object (1)',1,'[{\"added\": {}}]',7,1),(8,'2023-06-02 13:29:03.410891','2','Slot object (2)',1,'[{\"added\": {}}]',7,1),(9,'2023-06-02 13:29:26.394494','3','Slot object (3)',1,'[{\"added\": {}}]',7,1),(10,'2023-06-02 13:29:49.905991','4','Slot object (4)',1,'[{\"added\": {}}]',7,1),(11,'2023-06-02 13:30:13.850176','5','Slot object (5)',1,'[{\"added\": {}}]',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'myapp','course'),(8,'myapp','interviewer_slot'),(7,'myapp','slot'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-02 03:31:55.011726'),(2,'auth','0001_initial','2023-06-02 03:31:55.299452'),(3,'admin','0001_initial','2023-06-02 03:31:55.374075'),(4,'admin','0002_logentry_remove_auto_add','2023-06-02 03:31:55.389704'),(5,'admin','0003_logentry_add_action_flag_choices','2023-06-02 03:31:55.389704'),(6,'contenttypes','0002_remove_content_type_name','2023-06-02 03:31:55.451913'),(7,'auth','0002_alter_permission_name_max_length','2023-06-02 03:31:55.483850'),(8,'auth','0003_alter_user_email_max_length','2023-06-02 03:31:55.500002'),(9,'auth','0004_alter_user_username_opts','2023-06-02 03:31:55.515933'),(10,'auth','0005_alter_user_last_login_null','2023-06-02 03:31:55.536642'),(11,'auth','0006_require_contenttypes_0002','2023-06-02 03:31:55.552316'),(12,'auth','0007_alter_validators_add_error_messages','2023-06-02 03:31:55.552316'),(13,'auth','0008_alter_user_username_max_length','2023-06-02 03:31:55.589095'),(14,'auth','0009_alter_user_last_name_max_length','2023-06-02 03:31:55.636155'),(15,'auth','0010_alter_group_name_max_length','2023-06-02 03:31:55.652533'),(16,'auth','0011_update_proxy_permissions','2023-06-02 03:31:55.652533'),(17,'auth','0012_alter_user_first_name_max_length','2023-06-02 03:31:55.720542'),(18,'myapp','0001_initial','2023-06-02 03:31:55.936291'),(19,'sessions','0001_initial','2023-06-02 03:31:55.967550');
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
INSERT INTO `django_session` VALUES ('q4xr1oioxlbewpalf30iown5wtzhcazn','.eJxVjMEOwiAQRP-FsyEQFgoevfsNZNkFqRqalPbU-O-2SQ96m8x7M5uIuC41rj3PcWRxFVpcfruE9MrtAPzE9pgkTW2ZxyQPRZ60y_vE-X073b-Dir3ua2u11zh4Lg4hwcBESalinDWBLGXeAxjMBVIAVTA4SOgByTsOylnx-QLozTgK:1q54rN:UiajOBnwV26DTAWQJKHYEd-5dmnl0FFbdmNZCa68WlI','2023-06-16 13:30:29.204932');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_course`
--

DROP TABLE IF EXISTS `myapp_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_course`
--

LOCK TABLES `myapp_course` WRITE;
/*!40000 ALTER TABLE `myapp_course` DISABLE KEYS */;
INSERT INTO `myapp_course` VALUES (1,'Back End'),(2,'Front End'),(3,'DSA');
/*!40000 ALTER TABLE `myapp_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_course_user`
--

DROP TABLE IF EXISTS `myapp_course_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_course_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_course_user_course_id_user_id_3fa2c93c_uniq` (`course_id`,`user_id`),
  KEY `myapp_course_user_user_id_cc92007b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `myapp_course_user_course_id_008f2d70_fk_myapp_course_id` FOREIGN KEY (`course_id`) REFERENCES `myapp_course` (`id`),
  CONSTRAINT `myapp_course_user_user_id_cc92007b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_course_user`
--

LOCK TABLES `myapp_course_user` WRITE;
/*!40000 ALTER TABLE `myapp_course_user` DISABLE KEYS */;
INSERT INTO `myapp_course_user` VALUES (1,1,8),(2,1,9),(3,2,8),(6,2,15),(4,3,8),(5,3,12),(7,3,15);
/*!40000 ALTER TABLE `myapp_course_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_interviewer_slot`
--

DROP TABLE IF EXISTS `myapp_interviewer_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_interviewer_slot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `instructions` longtext NOT NULL,
  `meeting_link` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `status` varchar(5) NOT NULL,
  `interviewee_attended` tinyint(1) NOT NULL,
  `feedback` longtext,
  `rating` int NOT NULL,
  `interviewee_id` int DEFAULT NULL,
  `interviewer_id` int NOT NULL,
  `slot_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_interviewer_slot_interviewee_id_02bddde4_fk_auth_user_id` (`interviewee_id`),
  KEY `myapp_interviewer_slot_interviewer_id_d94798e3_fk_auth_user_id` (`interviewer_id`),
  KEY `myapp_interviewer_slot_slot_id_2f14ca89_fk_myapp_slot_id` (`slot_id`),
  CONSTRAINT `myapp_interviewer_slot_interviewee_id_02bddde4_fk_auth_user_id` FOREIGN KEY (`interviewee_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `myapp_interviewer_slot_interviewer_id_d94798e3_fk_auth_user_id` FOREIGN KEY (`interviewer_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `myapp_interviewer_slot_slot_id_2f14ca89_fk_myapp_slot_id` FOREIGN KEY (`slot_id`) REFERENCES `myapp_slot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_interviewer_slot`
--

LOCK TABLES `myapp_interviewer_slot` WRITE;
/*!40000 ALTER TABLE `myapp_interviewer_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_interviewer_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_slot`
--

DROP TABLE IF EXISTS `myapp_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_slot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slot_name` varchar(200) NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_slot`
--

LOCK TABLES `myapp_slot` WRITE;
/*!40000 ALTER TABLE `myapp_slot` DISABLE KEYS */;
INSERT INTO `myapp_slot` VALUES (1,'Slot-01','10:00:00.000000','11:00:00.000000'),(2,'Slot-02','11:00:00.000000','12:00:00.000000'),(3,'Slot-03','12:00:00.000000','13:00:00.000000'),(4,'Slot-04','14:00:00.000000','15:00:00.000000'),(5,'Slot-05','15:00:00.000000','16:00:00.000000');
/*!40000 ALTER TABLE `myapp_slot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-02 19:01:15
