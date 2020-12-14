-- MySQL dump 10.16  Distrib 10.1.47-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: c1bairesda_chat_pro
-- ------------------------------------------------------
-- Server version	10.1.47-MariaDB-0ubuntu0.18.04.1

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
-- Current Database: `c1bairesda_chat_pro`
--

/*!40000 DROP DATABASE IF EXISTS `c1bairesda_chat_pro`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c1bairesda_chat_pro` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `c1bairesda_chat_pro`;

--
-- Table structure for table `mirrormx_customer_chat_data`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `data_type_ix` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_data`
--

LOCK TABLES `mirrormx_customer_chat_data` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_data` DISABLE KEYS */;
INSERT INTO `mirrormx_customer_chat_data` VALUES (1,'canned_message','Thanks For Contact Us!','We here to help you. If no reply please contact us at: {support@taskcontrol.net}.'),(2,'canned_message','Thanks for your contact!.','We have received the request and will reply to you from {support@taskcontrol.net} as soon as possible. Please check also your spam folder.');
/*!40000 ALTER TABLE `mirrormx_customer_chat_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_department`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_department` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_department`
--

LOCK TABLES `mirrormx_customer_chat_department` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_department` DISABLE KEYS */;
INSERT INTO `mirrormx_customer_chat_department` VALUES (1,'Support','Product Support'),(2,'Privacy','Privacy '),(3,'Billing','Billing '),(4,'General ','General ');
/*!40000 ALTER TABLE `mirrormx_customer_chat_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_message`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `talk_id` int(10) unsigned NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  KEY `message_fk_talk` (`talk_id`),
  KEY `message_from_id_ix` (`from_id`),
  KEY `message_to_id_ix` (`to_id`),
  KEY `message_datetime_ix` (`datetime`),
  CONSTRAINT `message_fk_talk` FOREIGN KEY (`talk_id`) REFERENCES `mirrormx_customer_chat_talk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_message`
--

LOCK TABLES `mirrormx_customer_chat_message` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_message` DISABLE KEYS */;
INSERT INTO `mirrormx_customer_chat_message` VALUES (1,2,-1,'','2018-02-27 00:11:34',1,'{\"type\":\"talk_start\"}'),(2,2,-1,'15-08-2017 AGENDA.jpg','2018-02-27 00:11:54',1,'{\"type\":\"files\",\"files\":[{\"name\":\"15-08-2017 AGENDA.jpg\",\"size\":154839,\"type\":\"image\\/jpeg\"}]}'),(3,2,-1,'Otra vez lo cambio..cambia??','2020-10-26 17:32:44',1,NULL),(4,3,-1,'','2018-02-27 18:51:52',2,'{\"type\":\"talk_start\"}'),(5,3,-1,'quiero saber si esto funciona','2018-02-27 18:52:00',2,NULL),(6,1,-1,'We here to help you. If no reply please contact us at: admin','2018-02-27 18:53:08',2,NULL),(7,-2,-1,'','2018-02-27 18:53:08',2,'{\"type\":\"talk_owner\",\"id\":1,\"user\":\"admin\"}'),(8,4,-1,'','2019-09-16 13:39:23',3,'{\"type\":\"talk_start\"}'),(9,4,-1,'hello','2019-09-16 13:39:29',3,NULL),(10,-2,-1,'','2019-09-16 13:41:49',3,'{\"type\":\"talk_close\"}'),(11,5,-1,'','2019-09-17 22:37:14',4,'{\"type\":\"talk_start\"}'),(12,5,-1,'hi, would like to know how TaskControl makes de calculation for working hours report','2019-09-17 22:37:39',4,NULL),(13,1,-1,'It makes de addition of the real working hours + additionar hours - holidays - absences for each hhrr','2019-09-17 22:38:24',4,NULL),(14,-2,-1,'','2019-09-17 22:38:24',4,'{\"type\":\"talk_owner\",\"id\":1,\"user\":\"admin\"}'),(15,5,-1,'so I don\'t need to edit any hours ?','2019-09-17 22:38:57',4,NULL),(16,1,-1,'no. Case you need to register any hours change, you do it editing the belonging type of hour (working, absences, additionals etc)','2019-09-17 22:40:07',4,NULL),(17,1,-1,'so when you generate the workings hours report you gonna have all the hours correctly registered.','2019-09-17 22:40:43',4,NULL),(18,5,-1,'Ok!, great thanks for your help','2019-09-17 22:41:08',4,NULL),(19,1,-1,'You\'re welcome!.','2019-09-17 22:41:21',4,NULL),(20,-2,-1,'','2019-09-17 22:41:39',4,'{\"type\":\"talk_close\",\"user\":\"admin\"}'),(21,-2,-1,'','2019-09-17 22:41:40',4,'{\"type\":\"talk_close\"}'),(22,6,-1,'','2019-09-17 22:42:18',5,'{\"type\":\"talk_start\"}'),(23,6,-1,'thanks','2019-09-17 22:42:33',5,NULL),(24,6,-1,'TaskControl Finalization.pod','2019-09-17 22:44:36',5,'{\"type\":\"files\",\"files\":[{\"name\":\"TaskControl Finalization.pod\",\"size\":202800,\"type\":\"\"}]}'),(25,-2,-1,'','2019-09-17 22:45:34',5,'{\"type\":\"talk_close\"}'),(26,7,-1,'','2019-09-17 22:46:22',6,'{\"type\":\"talk_start\"}'),(27,7,-1,'someone\'s there?','2019-09-17 22:48:05',6,NULL),(28,1,-1,'Yes how can I help you?','2019-09-17 22:48:22',6,NULL),(29,-2,-1,'','2019-09-17 22:48:22',6,'{\"type\":\"talk_owner\",\"id\":1,\"user\":\"admin\"}'),(30,7,-1,'Contracts-DER.jpg','2019-09-17 22:48:33',6,'{\"type\":\"files\",\"files\":[{\"name\":\"Contracts-DER.jpg\",\"size\":272508,\"type\":\"image\\/jpeg\"}]}'),(31,7,-1,'tell me if your recevie ok the image pls','2019-09-17 22:48:51',6,NULL),(32,-2,-1,'','2019-09-17 23:12:21',6,'{\"type\":\"talk_close\"}');
/*!40000 ALTER TABLE `mirrormx_customer_chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_shared_file`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_shared_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_shared_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_name` varchar(255) NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(10) unsigned DEFAULT NULL,
  `upload_id` int(10) unsigned NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shared_file_fk_upload` (`upload_id`),
  CONSTRAINT `shared_file_fk_upload` FOREIGN KEY (`upload_id`) REFERENCES `mirrormx_customer_chat_upload` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_shared_file`
--

LOCK TABLES `mirrormx_customer_chat_shared_file` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_shared_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mirrormx_customer_chat_shared_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_talk`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_talk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(32) DEFAULT NULL,
  `department_id` smallint(5) unsigned DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `extra` text,
  PRIMARY KEY (`id`),
  KEY `talk_fk_department` (`department_id`),
  KEY `talk_owner_ix` (`owner`),
  KEY `talk_last_activity_ix` (`last_activity`),
  CONSTRAINT `talk_fk_department` FOREIGN KEY (`department_id`) REFERENCES `mirrormx_customer_chat_department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_talk`
--

LOCK TABLES `mirrormx_customer_chat_talk` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_talk` DISABLE KEYS */;
INSERT INTO `mirrormx_customer_chat_talk` VALUES (1,'closed',1,NULL,'2018-02-27 00:22:16',NULL),(2,'closed',1,1,'2018-02-28 12:27:41',NULL),(3,'closed',1,NULL,'2019-09-16 13:39:23',NULL),(4,'closed',4,1,'2019-09-17 22:41:22',NULL),(5,'closed',1,NULL,'2019-09-17 22:42:18',NULL),(6,'closed',1,1,'2019-09-17 22:48:22',NULL);
/*!40000 ALTER TABLE `mirrormx_customer_chat_talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_upload`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `state` varchar(16) NOT NULL,
  `files_info` text,
  `size` int(10) unsigned DEFAULT NULL,
  `progress` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_fk_message` (`message_id`),
  CONSTRAINT `upload_fk_message` FOREIGN KEY (`message_id`) REFERENCES `mirrormx_customer_chat_message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_upload`
--

LOCK TABLES `mirrormx_customer_chat_upload` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_upload` DISABLE KEYS */;
INSERT INTO `mirrormx_customer_chat_upload` VALUES (1,2,'aborted','[{\"name\":\"15-08-2017 AGENDA.jpg\",\"size\":154839,\"type\":\"image\\/jpeg\"}]',154839,0),(2,24,'uploading','[{\"name\":\"TaskControl Finalization.pod\",\"size\":202800,\"type\":\"\"}]',202800,0),(3,30,'aborted','[{\"name\":\"Contracts-DER.jpg\",\"size\":272508,\"type\":\"image\\/jpeg\"}]',272508,0);
/*!40000 ALTER TABLE `mirrormx_customer_chat_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_user`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `info` text,
  `roles` varchar(128) DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_mail_ix` (`mail`),
  KEY `user_last_activity_ix` (`last_activity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_user`
--

LOCK TABLES `mirrormx_customer_chat_user` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_user` DISABLE KEYS */;
INSERT INTO `mirrormx_customer_chat_user` VALUES (1,'admin','admin','90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad',NULL,'{\"ip\":\"181.224.117.165\"}','ADMIN,OPERATOR','0000-00-00 00:00:00'),(2,'Pedro-1519690294','asdfasd@mail.com','x','/livechat/upload/default-avatars/a.png','{\"ip\":\"181.224.117.165\",\"referer\":\"http:\\/\\/taskcontrol.net\\/livechat\\/php\\/app.php?widget-test\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/64.0.3282.167 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"64.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"es\",\"geoloc\":{\"countryCode\":\"AR\",\"countryName\":\"Argentina\",\"regionCode\":\"B\",\"regionName\":\"Buenos Aires\",\"city\":\"Corti\",\"zipCode\":\"8000\",\"timeZone\":\"America\\/Argentina\\/Buenos_Aires\",\"latitude\":-38.6216,\"longitude\":-62.0602,\"metroCode\":null,\"utcOffset\":180}}','GUEST','2018-02-27 00:12:15'),(3,'Paul-1519757512','no@e.mail.provided','x','/livechat/upload/default-avatars/a.png','{\"ip\":\"181.224.117.165\",\"referer\":\"https:\\/\\/taskcontrol.net\\/livechat\\/php\\/app.php?widget-test\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/64.0.3282.167 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"64.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"es\",\"geoloc\":{\"countryCode\":\"AR\",\"countryName\":\"Argentina\",\"regionCode\":\"B\",\"regionName\":\"Buenos Aires\",\"city\":\"Corti\",\"zipCode\":\"8000\",\"timeZone\":\"America\\/Argentina\\/Buenos_Aires\",\"latitude\":-38.6216,\"longitude\":-62.0602,\"metroCode\":null,\"utcOffset\":180}}','GUEST','2018-02-27 18:59:46'),(4,'charly-1568641163','no@e.mail.provided','x','/livechat/upload/default-avatars/a.png','{\"ip\":\"181.224.117.165\",\"referer\":\"http:\\/\\/www.taskcontrol.net\\/livechat\\/php\\/app.php?widget-test\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/76.0.3809.132 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"76.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"es\",\"geoloc\":{\"countryCode\":\"AR\",\"countryName\":\"Argentina\",\"regionCode\":\"B\",\"regionName\":\"Buenos Aires\",\"city\":\"Corti\",\"zipCode\":\"8000\",\"timeZone\":\"America\\/Argentina\\/Buenos_Aires\",\"latitude\":-38.6216,\"longitude\":-62.0602,\"metroCode\":null,\"utcOffset\":180}}','GUEST','0000-00-00 00:00:00'),(5,'Albert-1568759834','no@e.mail.provided','x','/livechat/upload/default-avatars/r.png','{\"ip\":\"181.224.117.165\",\"referer\":\"http:\\/\\/www.taskcontrol.net\\/home.html\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/76.0.3809.132 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"76.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"es\",\"geoloc\":{\"countryCode\":\"AR\",\"countryName\":\"Argentina\",\"regionCode\":\"B\",\"regionName\":\"Buenos Aires\",\"city\":\"Corti\",\"zipCode\":\"8000\",\"timeZone\":\"America\\/Argentina\\/Buenos_Aires\",\"latitude\":-38.6216,\"longitude\":-62.0602,\"metroCode\":null,\"utcOffset\":180}}','GUEST','0000-00-00 00:00:00'),(6,'Oscar-1568760137','no@e.mail.provided','x','/livechat/upload/default-avatars/r.png','{\"ip\":\"181.224.117.165\",\"referer\":\"http:\\/\\/www.taskcontrol.net\\/home.html\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/76.0.3809.132 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"76.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"es\",\"geoloc\":{\"countryCode\":\"AR\",\"countryName\":\"Argentina\",\"regionCode\":\"B\",\"regionName\":\"Buenos Aires\",\"city\":\"Corti\",\"zipCode\":\"8000\",\"timeZone\":\"America\\/Argentina\\/Buenos_Aires\",\"latitude\":-38.6216,\"longitude\":-62.0602,\"metroCode\":null,\"utcOffset\":180}}','GUEST','0000-00-00 00:00:00'),(7,'John-1568760382','no@e.mail.provided','x','/livechat/upload/default-avatars/r.png','{\"ip\":\"181.224.117.165\",\"referer\":\"http:\\/\\/www.taskcontrol.net\\/home.html\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/76.0.3809.132 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"76.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"es\",\"geoloc\":{\"countryCode\":\"AR\",\"countryName\":\"Argentina\",\"regionCode\":\"B\",\"regionName\":\"Buenos Aires\",\"city\":\"Corti\",\"zipCode\":\"8000\",\"timeZone\":\"America\\/Argentina\\/Buenos_Aires\",\"latitude\":-38.6216,\"longitude\":-62.0602,\"metroCode\":null,\"utcOffset\":180}}','GUEST','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `mirrormx_customer_chat_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_user_department`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_user_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_user_department` (
  `user_id` int(11) NOT NULL,
  `department_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `user_department_uq` (`user_id`,`department_id`),
  KEY `user_department_fk_department` (`department_id`),
  CONSTRAINT `user_department_fk_department` FOREIGN KEY (`department_id`) REFERENCES `mirrormx_customer_chat_department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_department_fk_user` FOREIGN KEY (`user_id`) REFERENCES `mirrormx_customer_chat_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_user_department`
--

LOCK TABLES `mirrormx_customer_chat_user_department` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_user_department` DISABLE KEYS */;
INSERT INTO `mirrormx_customer_chat_user_department` VALUES (1,1),(1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `mirrormx_customer_chat_user_department` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14  5:00:03
