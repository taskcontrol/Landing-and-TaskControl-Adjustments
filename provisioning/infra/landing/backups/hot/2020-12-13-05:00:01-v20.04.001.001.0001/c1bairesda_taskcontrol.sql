-- MySQL dump 10.16  Distrib 10.1.47-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: c1bairesda_taskcontrol
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
-- Current Database: `c1bairesda_taskcontrol`
--

/*!40000 DROP DATABASE IF EXISTS `c1bairesda_taskcontrol`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c1bairesda_taskcontrol` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `c1bairesda_taskcontrol`;

--
-- Table structure for table `affilation_commision`
--

DROP TABLE IF EXISTS `affilation_commision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affilation_commision` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `affiliative_auth_id` varchar(255) NOT NULL,
  `affilative_login_id` varchar(255) NOT NULL,
  `seller_auth_id` varchar(255) NOT NULL,
  `seller_login_id` varchar(255) NOT NULL,
  `per_comm` varchar(255) NOT NULL,
  `seller_comm_proj` varchar(255) NOT NULL,
  `affiliation_earning` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `date_time` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affilation_commision`
--

LOCK TABLES `affilation_commision` WRITE;
/*!40000 ALTER TABLE `affilation_commision` DISABLE KEYS */;
/*!40000 ALTER TABLE `affilation_commision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affilation_master`
--

DROP TABLE IF EXISTS `affilation_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affilation_master` (
  `affi_id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_by_auth_id` varchar(255) NOT NULL,
  `ref_by_login_id` varchar(255) NOT NULL,
  `affilated_auth_id` varchar(255) NOT NULL,
  `affilated_login_id` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `signup_datetime` varchar(255) NOT NULL,
  PRIMARY KEY (`affi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affilation_master`
--

LOCK TABLES `affilation_master` WRITE;
/*!40000 ALTER TABLE `affilation_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `affilation_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliation_log`
--

DROP TABLE IF EXISTS `affiliation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliation_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL,
  `user_login_id` varchar(255) NOT NULL,
  `amount` float(15,2) NOT NULL,
  `date` date NOT NULL,
  `datetime` varchar(255) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliation_log`
--

LOCK TABLES `affiliation_log` WRITE;
/*!40000 ALTER TABLE `affiliation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `user_auth_id` varchar(50) NOT NULL DEFAULT '',
  `user_login_id` varchar(50) NOT NULL DEFAULT '',
  `user_passwd` varchar(50) NOT NULL DEFAULT '',
  `user_passwd1` varchar(100) NOT NULL DEFAULT '',
  `user_type` varchar(20) NOT NULL DEFAULT '',
  `user_activation_code` varchar(255) NOT NULL DEFAULT '',
  `user_status` tinyint(2) NOT NULL DEFAULT '0',
  `come_form` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `last_login_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`user_auth_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES ('21232f297a57a5a743894a0e4a801fc3','admin','32da88c0ffe3e10556e2b76f0233df96','jl1pc2gh3rs4','Admin','0',1,'','0000-00-00','0000-00-00'),('e0ed18dc67b295f9518eaead0edcbfff','Demo1','c43379ac42850c8cfdbf30ca20f04b93','gLXR3LaSoKerq5CN','User','202007231344301654810870',1,'','2020-07-23','2020-12-12'),('0e5cdeef72a1c1ee0ad3b47a68e9ac08','PMKCFree','5273950f027dc85f4864ec06c8acc1c3','gMbQ7NCm493Hk6CeUw==','User','202007282028361671059216',1,'','2020-07-28','2020-07-28'),('de34ca02307b653e146eb3798e4d5713','Demo2','adb7c316eac7a33a2877338f7dfee7ac','gLXR1Lt0qKSnk5A=','User','202009271226151622014675',1,'','2020-09-27','2020-12-12');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badword_master`
--

DROP TABLE IF EXISTS `badword_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badword_master` (
  `badword_id` int(11) NOT NULL AUTO_INCREMENT,
  `badword_value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`badword_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badword_master`
--

LOCK TABLES `badword_master` WRITE;
/*!40000 ALTER TABLE `badword_master` DISABLE KEYS */;
INSERT INTO `badword_master` VALUES (15,'fuck'),(16,'fuckoff');
/*!40000 ALTER TABLE `badword_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid_master`
--

DROP TABLE IF EXISTS `bid_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bid_master` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(50) NOT NULL DEFAULT '',
  `bid_by_user` varchar(255) NOT NULL DEFAULT '',
  `bid_amount` float(15,2) NOT NULL DEFAULT '0.00',
  `delivery_within` varchar(255) NOT NULL DEFAULT '',
  `bid_desc` text NOT NULL,
  `notification_alert` tinyint(2) NOT NULL DEFAULT '0',
  `shortlist` tinyint(2) NOT NULL DEFAULT '0',
  `decline` tinyint(2) NOT NULL DEFAULT '0',
  `reasons` tinyint(2) NOT NULL DEFAULT '0',
  `bid_status` tinyint(2) NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `date_2` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`bid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid_master`
--

LOCK TABLES `bid_master` WRITE;
/*!40000 ALTER TABLE `bid_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `bid_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer_rating_master`
--

DROP TABLE IF EXISTS `buyer_rating_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer_rating_master` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `rating_by_user` varchar(255) NOT NULL DEFAULT '',
  `rating_to_user` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `date_time` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rating_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer_rating_master`
--

LOCK TABLES `buyer_rating_master` WRITE;
/*!40000 ALTER TABLE `buyer_rating_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `buyer_rating_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_master`
--

DROP TABLE IF EXISTS `category_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_master` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_parent_id` varchar(255) NOT NULL DEFAULT '',
  `cat_path` mediumtext,
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` mediumtext NOT NULL,
  `disp_title` varchar(255) NOT NULL DEFAULT '',
  `cat_status` tinyint(2) NOT NULL DEFAULT '0',
  `disp_order` tinyint(2) NOT NULL DEFAULT '0',
  `total_projects` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=569 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_master`
--

LOCK TABLES `category_master` WRITE;
/*!40000 ALTER TABLE `category_master` DISABLE KEYS */;
INSERT INTO `category_master` VALUES (562,'0','0','Agriculture','Agriculture','Agriculture',1,1,0),(563,'0','0','Construction','Construction','Construction',1,2,22),(564,'0','0','Electronic & Engineering','Electronic & Engineering','Electronic & Engineering',1,3,60),(514,'0','0','Education & Training','Education & Training','Education & Training',1,4,4),(522,'0','0','Finance & Accounting','Finance & Accounting','Finance & Accounting',1,5,3),(523,'0','0','Government','Government','Government',1,6,12),(524,'0','0','Healthcare & Medical','Healthcare & Medicals','Healthcare & Medical',1,7,14),(525,'0','0','Human Resources','Human Resources','Human Resources',1,8,9),(526,'0','0','Insurance','Insurance','Insurance',1,9,4),(527,'0','0','Internet & Information Technology','Internet & Information Technology','Internet & Information Technology',1,10,4),(528,'0','0','Legal & Law Enforcement','Legal & Law Enforcement','Legal & Law Enforcement',1,11,3),(529,'0','0','Manufacturing','Manufacturing','Manufacturing',1,12,6),(530,'0','0','Mining','Mining','Mining',1,13,6),(531,'0','0','Operations & Logistics','Operations & Logistics','Operations & Logistics',1,15,11),(532,'0','0','Retail & Consumer','Retail & Consumer','Retail & Consumer',1,17,0),(533,'0','0','Music & Movies','Music & Movies','Music & Movies',1,14,8),(534,'0','0','Goods & Services','Goods & Services','Goods & Services',1,16,15),(535,'0','0','Sales & Marketing','Sales & Marketing','Sales & Marketing',1,18,29),(536,'0','0','Science & Research','Science & Research','Science & Research',1,19,12),(566,'0','0','Sports & Recreation','Sports & Recreation','Sports & Recreation',1,20,2),(567,'0','0','Telecommunications','Telecommunications','Telecommunications',1,21,0),(568,'0','0','Travel & Tourism','Travel & Tourism','Travel & Tourism',1,22,0);
/*!40000 ALTER TABLE `category_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_master`
--

DROP TABLE IF EXISTS `contact_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_master` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `recevier_name` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `service` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `service_dec` text CHARACTER SET latin1 NOT NULL,
  `image_file` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `budget` text CHARACTER SET latin1 NOT NULL,
  `date` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`contact_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_master`
--

LOCK TABLES `contact_master` WRITE;
/*!40000 ALTER TABLE `contact_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us_master`
--

DROP TABLE IF EXISTS `contact_us_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_us_master` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_country` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `fax` varchar(255) NOT NULL DEFAULT '',
  `disp_order` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us_master`
--

LOCK TABLES `contact_us_master` WRITE;
/*!40000 ALTER TABLE `contact_us_master` DISABLE KEYS */;
INSERT INTO `contact_us_master` VALUES (1,'Argentina','54-9-291-5049425','54-9-291-5049425',0);
/*!40000 ALTER TABLE `contact_us_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_master`
--

DROP TABLE IF EXISTS `country_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_master` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL DEFAULT '',
  `disp_order` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_master`
--

LOCK TABLES `country_master` WRITE;
/*!40000 ALTER TABLE `country_master` DISABLE KEYS */;
INSERT INTO `country_master` VALUES (1,'USA',127),(2,'Italy',64),(3,'India',58),(4,'Canada',20),(5,'Germany',44),(6,'France',42),(7,'Australia',7),(8,'Japan',48),(9,'Austria',8),(10,'Switzerland',116),(11,'Spain',112),(12,'Netherlands',85),(13,'Belgium',13),(14,'Denmark',35),(15,'Sweden',115),(16,'Norway',91),(17,'Brazil',16),(18,'Portugal',99),(19,'Finland',41),(20,'South Korea',111),(21,'China',26),(22,'Hong Kong',55),(23,'Taiwan',119),(24,'Singapore',106),(25,'Pakistan',92),(26,'Afghanistan',0),(27,'Albania',1),(28,'Algeria',2),(29,'Angola',4),(30,'Andorra',3),(31,'Argentina',5),(32,'Armenia',6),(33,'Azerbaijan',9),(34,'Bahamas',10),(35,'Bahrain',11),(36,'Bolivia',14),(37,'Bangladesh',12),(38,'Bosnia Herzegovina',15),(39,'Bulgaria',17),(40,'Burundi',18),(41,'Cambodia',19),(42,'Cape Verde',21),(43,'Cayman',22),(44,'Central African Republic',23),(45,'Chad',24),(46,'Chile',25),(47,'Congo',28),(48,'Costa Rica',29),(49,'Cote d\'Ivoire',30),(50,'Croatia',31),(51,'Cuba',32),(52,'Cyprus',34),(53,'Czech Republic',33),(54,'Ecuador',36),(55,'Egypt',37),(56,'El Salvador',38),(57,'Estonia',39),(58,'Ethiopia',40),(59,'Georgia',43),(60,'Ghana',45),(61,'Greece',46),(62,'Haiti',54),(63,'Hungary',56),(64,'Iceland',57),(65,'Indonesia',59),(66,'Iran',60),(67,'Iraq',61),(68,'Ireland',62),(69,'Israel',63),(70,'Jamaica',47),(71,'Jordan',49),(72,'Kazakhstan',50),(73,'Kenya',51),(74,'Kuwait',52),(75,'Kyrgyzstan',53),(76,'Laos',65),(77,'Latvia',66),(78,'Lebanon',67),(79,'Liberia',68),(80,'Libya',69),(81,'Lithuania',70),(82,'Luxembourg',71),(83,'Macau',72),(84,'Macedonia',73),(85,'Montenegro',79),(86,'Madagascar',74),(87,'Malaysia',75),(88,'Mexico',76),(89,'Moldova',77),(90,'Monaco',78),(91,'Morocco',80),(92,'Mozambique',81),(93,'Myanmar',82),(94,'Namibia',83),(95,'Nepal',84),(96,'New Zeland',86),(97,'Nicaragua',87),(98,'Niger',88),(99,'Nigeria',89),(100,'North Korea',90),(101,'Panama',93),(102,'Papua',94),(103,'Paraguay',95),(104,'Peru',96),(105,'Philippines',97),(106,'Poland',98),(107,'Puerto Rico',100),(108,'Romania',101),(109,'Russia',102),(110,'San Marino',103),(111,'Saudi Arabia',104),(112,'Senegal',105),(113,'Slovakia',107),(114,'Slovenia',108),(115,'Somalia',109),(116,'South Africa',110),(117,'Sri Lanka',113),(118,'Sudan',114),(119,'Syria',117),(120,'Tajikistan',118),(121,'Tanzania',120),(122,'Thailand',121),(123,'Togo',122),(124,'Trinidad',123),(125,'Tunisia',124),(126,'Turkey',125),(127,'Turkmenistan',126),(128,'Uganda',127),(129,'Ukraine',127),(130,'United Arab Emirates',127),(131,'Uruguay',127),(132,'Uzbekistan',127),(133,'Vatican',127),(134,'Venezuela',127),(135,'Viet Nam',127),(136,'Yugoslavia/ Serbia',127),(137,'Yemen',127),(138,'Others',127),(142,'Colombia',27),(143,'UK',127);
/*!40000 ALTER TABLE `country_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `development_cost`
--

DROP TABLE IF EXISTS `development_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `development_cost` (
  `development_id` int(11) NOT NULL AUTO_INCREMENT,
  `development_title` varchar(255) NOT NULL DEFAULT '',
  `dev_max_amount` float(15,2) NOT NULL DEFAULT '0.00',
  `display_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`development_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `development_cost`
--

LOCK TABLES `development_cost` WRITE;
/*!40000 ALTER TABLE `development_cost` DISABLE KEYS */;
INSERT INTO `development_cost` VALUES (8,'Between $50 - $500',500.00,0),(9,'Between $500 - $2500',2500.00,0),(10,'Between $2500 - $5000',5000.00,0),(11,'Between $5000 - $10000',10000.00,0),(12,'Between $10000 - $25000',25000.00,0),(13,'Between $25000 - $50000',50000.00,0),(14,'More than $50000',50000.00,0),(15,'Do your proposal',0.00,0),(16,'To be Negotiated',0.00,0);
/*!40000 ALTER TABLE `development_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dineromail_master`
--

DROP TABLE IF EXISTS `dineromail_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dineromail_master` (
  `dm_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `user_login_id` varchar(255) NOT NULL DEFAULT '',
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `usdAmount` float(15,2) NOT NULL DEFAULT '0.00' COMMENT 'valor correspondiente en dolares',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `trans_type` char(2) NOT NULL DEFAULT '',
  `date` varchar(255) NOT NULL DEFAULT '',
  `currency_id` varchar(9) NOT NULL,
  PRIMARY KEY (`dm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dineromail_master`
--

LOCK TABLES `dineromail_master` WRITE;
/*!40000 ALTER TABLE `dineromail_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `dineromail_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dineromail_pending_deposite`
--

DROP TABLE IF EXISTS `dineromail_pending_deposite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dineromail_pending_deposite` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `user_login_id` varchar(255) NOT NULL DEFAULT '',
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `usdAmount` float(15,2) NOT NULL DEFAULT '0.00' COMMENT 'valor correspondiente en dolares',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `pending_date` date NOT NULL DEFAULT '0000-00-00',
  `currency_id` varchar(9) NOT NULL,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dineromail_pending_deposite`
--

LOCK TABLES `dineromail_pending_deposite` WRITE;
/*!40000 ALTER TABLE `dineromail_pending_deposite` DISABLE KEYS */;
/*!40000 ALTER TABLE `dineromail_pending_deposite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dineromail_transactions`
--

DROP TABLE IF EXISTS `dineromail_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dineromail_transactions` (
  `user_id` varchar(255) NOT NULL,
  `tx_id` varchar(30) NOT NULL,
  `usdAmount` float NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`tx_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dineromail_transactions`
--

LOCK TABLES `dineromail_transactions` WRITE;
/*!40000 ALTER TABLE `dineromail_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `dineromail_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_config`
--

DROP TABLE IF EXISTS `email_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_config` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_title` varchar(25) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `email_adress` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_config`
--

LOCK TABLES `email_config` WRITE;
/*!40000 ALTER TABLE `email_config` DISABLE KEYS */;
INSERT INTO `email_config` VALUES (8,'Contact Us','contactus@taskcontrol.net'),(14,'Support','support@taskcontrol.net'),(15,'No Reply','noreply@taskcontrol.net'),(2,'Privacy','privacy@taskcontrol.net'),(16,'Billing','billing@taskcontrol.net'),(3,'Support','support@taskcontrol.net');
/*!40000 ALTER TABLE `email_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_in_pipeline`
--

DROP TABLE IF EXISTS `email_in_pipeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_in_pipeline` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `send_from` varchar(255) NOT NULL,
  `send_to` varchar(255) NOT NULL,
  `mail_subject` mediumtext NOT NULL,
  `mail_content` mediumtext NOT NULL,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_in_pipeline`
--

LOCK TABLES `email_in_pipeline` WRITE;
/*!40000 ALTER TABLE `email_in_pipeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_in_pipeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_template` (
  `email_id` int(5) NOT NULL AUTO_INCREMENT,
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_content` text NOT NULL,
  `email_id_sending` varchar(255) NOT NULL DEFAULT '',
  `email_timestamp` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template`
--

LOCK TABLES `email_template` WRITE;
/*!40000 ALTER TABLE `email_template` DISABLE KEYS */;
INSERT INTO `email_template` VALUES (1,'header','<strong>Dear TaskControl Customer:</strong>','15',''),(2,'footer','<p><br /><strong>Thank You!<br /> TaskControl Support Team<br /> </strong> </p>\r\n<table cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<p class=\"Estilo1\">Please do not reply to this email. For immediate answers to your questions, please contact us by email (contactus@taskcontrol.net), by clicking \"Chat\" or by clicking \"Tickets\" at the Upper Right corner of our Website Main Page. Thank you. <br /> <br /><strong> Copyright &copy; 2017-2020 TaskControl SaaS. All rights reserved. </strong></p>\r\n<p>This message is confidential and subject to the privacy terms at:&nbsp;<a href=\"https://www.taskcontrol.net/page?5.html\" target=\"_blank\" rel=\"noopener\">https://www.taskcontrol.net/page_5.html</a>&nbsp;including on confidential, privileged or legal entity information, malicious content and monitoring of electronic messages. If you are not the intended recipient, please delete this message and notify the sender immediately. Any unauthorized use is strictly prohibited.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>','15',''),(3,'TaskControl: Your Lost Password ','<p><br>\r\n  <span class=\"Estilo1\"><strong>Here are your account details requested:</strong></span></p>\r\n<p><span class=\"Estilo1\"><strong>\r\nEmail : {$email_id}<br>\r\nPassword : {$password}</strong></span><br>\r\n  <span class=\"Estilo3\"><br>\r\n</span><span class=\"Estilo1\">Advice: Don\'t forget to change your password at least once a month for security reasons.</span><br><span class=\"Estilo3\"><br>\r\n</span><span class=\"Estilo1\"><strong>Best Regards,\r\n      <br>\r\n  TaskControl Support Team </strong></span></p>\r\n','15',''),(4,'Your Invitation to Join TaskControl It\'s FREE !','This invitation is awaiting for you to create an account on a new great site: </p>\r\n<p><strong><a href=\"www.taskcontrol.net\">TaskControl</a></strong>, the best project management software tool in the world.<br>\r\n  <span style=\"text-decoration: underline;\"><span style=\"font-weight: bold;\"><br>\r\n  </span></span><span style=\"text-decoration: underline;\"><span style=\"font-weight: bold;\"><br>\r\n  </span></span><br>\r\n  <strong>And start to use it now: Join in is absolutely FREE for you.</strong><br>\r\n\r\n  ------------------------------------------------------------------<br>\r\n  <strong><br>\r\n  What is TaskControl?</strong><br>\r\n  <br>\r\n  If you haven\'t already heard about <span style=\"font-weight: bold;\">{$link2}. </span>It\'s the leading first professional project management tool in the world dedicated to all industries and project sizes.<br>\r\n  <br>\r\n  <span style=\"font-weight: bold;\">{$link4}</span><br>\r\n<br>','15',''),(5,'Welcome to TaskControl Community','<p><b>Welcome to TaskControl Community! </b> <br> 	 \r\n  <br><br>    \r\n  <strong>Your Account Details:</strong><br>	 \r\n  <br>       \r\n  <strong>UserID</strong>              : {$user_id}<br>       \r\n  <strong>Password</strong>            : {$password}<br>       \r\n  <strong>Email Address</strong>       : {$email_id}<br>	\r\n  <br>    \r\n  Click on this link to login : <strong><a href=\"http://www.taskcontrol.net/login\">http://www.taskcontrol.net/login</a> </strong><br>	\r\n<br>\r\n  For Documentation click here: <strong> <a href=\"http://www.taskcontrol.net/page_3.html\">http://www.taskcontrol.net/page_3.html</a></strong>\r\n <br>  \r\n<br>\r\n  For Demo (English) click here: \r\n <strong>  <a href=\"http://www.taskcontrol.net/signup.php?role=1\">http://www.taskcontrol.net/signup.php?role=1</a><strong>\r\n  <br>\r\n  <br>     \r\n  If you have any questions, please read our FAQ first!</p>\r\n<p>We are Glad to Work For You	\r\n  <script type=\"text/javascript\r\n\r\n<br><strong>Thank You!<br>\r\nTaskControl Support Team<br>\r\n</strong>\r\n<br>\r\n<table cellspacing=\"0\" cellpadding=\"0\">\r\n  <tr>\r\n    <td><p class=\"Estilo1\">        Please do not reply to this email.  For immediate answers to your questions, please contact us by email (contactus@taskcontrol.net), by clicking &quot;Chat\" or by clicking &quot;Tickets&quot;  at the Upper Right corner of our Website Main Page. Thank you. <br>\r\n        <br><strong>\r\n      Copyright &copy; 2017-2020 TaskControl SaaS. All rights reserved.<strong> </p>      </td>\r\n  </tr>\r\n</table>','15',''),(38,'TaskControl: Pending Wallet Deposit ','<br><strong>Pending Request For Wallet Deposit</strong><br> <br>Dear <strong>{$customer_name}</strong>,<br> <br>\r\nYou have been requested to deposit <strong>{$amount}</strong> in your wallet, but the request is still PENDING..<br>\r\n<br>\r\nPlease ensure your funds are deposited as soon as possible to keep your subscription up & running!.<br>\r\n<br>\r\nThank You,<br>\r\nTaskControl Support Team<br><br>\r\n','15',''),(7,'TaskControl: Account Removed','<br>Dear TaskControl Customer,<br><br>We have deleted all the data from your account as we don\'t see any activities nor funds deposit for your subscription plan in your wallet. <br>If this was just a mistake from your side please  <a href=\"mailto:contactus@taskcontrol.net\">contact us</a> to fix the issue immediately.Thanks!.<br><br>','15',''),(9,'TaskControl: Wallet Deposit Completed !','<br><span style=\"font-weight: bold;\">Deposit successfully Transferred!</span><br style=\"font-weight: bold;\"><br>Deposit Details<br> <br>Amount:$ {$amount} was deposited in your TaskControl Wallet.<br>','15',''),(29,'TaskControl: Message from Support Team.','<br>Dear costumer, this is a message from TaskControl Support<br> <br>{$content}<br>  <br>','15',''),(11,'TaskControl: Plans Information Changed','<p><br>\r\n  <strong>Plan Information Changed</strong><br> \r\n  <br>\r\n  We please to inform you that our plan subscriptions pricing has changed.<br>\r\n  We encourage you to check the new prices here: <strong>{$link}.<br>\r\n  This new pricing will be in effect since: mm-dd-yyyy.</strong><br> \r\n  Thanks,</p>\r\n<p><strong>TaskControl Support Team </strong><br>\r\n  <br>   \r\n  <br>\r\n</p>','15',''),(15,'TaskControl: Plan Overdue Reminder','<br><strong>TaskControl.net plan overdue Notice !</strong><br> <br><strong>We kindly reminds you that your plan \r\n {$membership} for an amount of \r\n {$amount} will be valid up to  {$finished_date}.\r\n\r\nPlease reload more funds to your wallet to keep your services up & running. Thanks!<br> ','15',''),(37,'TaskControl: Deposit funds Required',' <br>Dear <strong>{$member_name}</strong>,<br><br>You bought TaskControl <strong>{$membership_name}</strong> on <strong>{$buy_date}</strong> which will<br>expires on <strong>{$exp_date}</strong>. Please reload your wallet as soon as possible so to keep your subscription up & running.<br>\r\nShould you have any question please contact us for more details. Thanks.\r\n<br>  <br><br>   \r\n<br>','15',''),(43,'TaskControl: Account Activated',' <br><strong>Dear User,</strong><br> <br>    Your account is active now. You can access your customer panel at: www.taskcontrol.net/login<br>with your choosed username and password. <br><span id=\"result_box\" class=\"medium_text\"><span title=\"Never forget to change your password frequently to a complex one (12 characters and numbers) to avoid potential security access issues\">></span><br>Welcome on board!<br>TaskControl Support Team<br>','14',''),(22,'TaskControl account temporarily suspended','<br>Sorry,<br><br>your TaskControl account has been temporarily suspended.<br>Please read our <span style=\"font-weight: bold;\">{$terms_link}</span> and contact us.<br>If you have any additional question, please <a style=\"font-family: Tahoma;\" href=\"mailto:contactus@taskcontrol.net\">contact us</a>.<br>  <br>','15',''),(48,'TaskControl: Account Deactivated ',' <br>Dear <strong>{$user}</strong>,<br> <br>You have bought the plan \r\n {$membership} at {$buy_date} but the plan is now overdue and no funds in your wallet so we are cancel it by now. You can reactivated reloading funds in your wallet in the next 24 hours.\r\nShould you have any question please contact us at: contactus@taskcontrol.net<br>Thank you.','15',''),(30,'TaskControl: Blocked User Access',' <br>Dear <strong>{$user_id}</strong>,<br> <br>It seems that you have violated our TaskControl <strong>Terms of Services and/or Privacy Policy</strong>, <br>therefore we have temporarily suspended your user access on our site.<br><br>Please  <a style=\"font-family: Tahoma;\" href=\"mailto:contactus@taskcontrol.net\">contact us for more details</a>.<br>    <br>\r\nTaskControl Support Team','15',''),(35,'TaskControl: Not enough Funds in your wallet!',' <br>Dear Customer: <br><br><strong>{$user}</strong> We kindly reminds you that your funds aren\'t enough to go further {$finished_date} with your subscription {$membership}. <br><br><strong>Please reload at least {$amount} to avoid subscription plan interruption in the next 24 hours.</strong>     <br>Thanks!. <br>\r\nTaskControl Support Team','15',''),(46,'TaskControl: Maintenance Updates for our Services',' <br>Dear TaskControl Member,<br> <br>we are updating our services to serve better to our community so we inform you that our servers bill be under maintenance from: dd-mm-yyyy until dd-mm-yyyy. After that period of time you can keep using your services as normal. Sorry for any inconveniences this might cause. /strong>.<br> <br> Thank you. Best Regards<br>TaskControl Support Team<br> <br>','15',''),(6,'TaskControl: Your Subscription Details','<p><span style=\"font-weight: bold;\">Your Subscription For: {$membership}, <br />Amount: {$amount},<br /> Expiring date: {$finished_date},<br /> Additionals: {$additionals_descrip}, <br />Cost Additionals: {$additionals}, <br /> Discount Amount: {$total_discount}, <br /> <br />**Total Order $: {$total_order}, has been registered under your account.<br /> <br /> </span> We are now setting up your Workspace.<br /> Depending on your Internet speed and traffic it might takes around up to 10/15 minutes to be completed.</p>\r\n<p>Your login URL will be: <strong><a href=\"https://{$company_name}.taskcontrol.net\">https://{$company_name}.taskcontrol.net</a></strong></p>\r\n<p><br /> <strong>Default user: admin, password: admin<br /><br /> <span style=\"color: #ff0000;\">Please change it immediately by a complex password (12 characters/numbers and special characters) as soon as you login to your server, for security reasons and don\'t forget to change it frequently.</span></strong></p>\r\n<p><span style=\"color: #ff0000;\"><strong>IMPORTANT!:</strong></span> Don\'t forget to send us ASAP to: <strong>support@taskcontrol.net:</strong><br /><br />1- Your Public IP address(es) so we can adjust our security infrastructure to accept traffic <strong>ONLY</strong> from that/those IP\'s.</p>\r\n<p>2- Your inactivity hours so we can set security processes to run on those hours avoiding interruptions during your working schedules.</p>\r\n<p><strong>We strongly suggest send us these data right after you receive this email!.</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Thanks for join to TaskControl Community!</strong></p>\r\n','15',''),(8,'TaskControl:Password Changed ','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n\"http://www.w3.org/TR/html4/loose.dtd\">\r\n<html>\r\n<head>\r\n<title>Documento sin t&iacute;tulo</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n</head>\r\n<body><p>  <span class=\"Estilo1\">\r\nWe write you to inform that your password has been changed as per your request.<br>\r\n</span>\r\n  <span class=\"Estilo3\"><br>\r\n  </span><span class=\"Estilo1\"><strong> Change password anytime clicking on \"Change Password\" from your Control Panel.<br>\r\nAdvice: Don\'t forget to change your password frequently to a complex one, we suggest a mix of 12 characters, Lower, UpperCase, numbers and special characters, as a primary prevention security measure.</strong></span></p>\r\n<br>\r\nTaskControl Support Team\r\n</body>\r\n</html>\r\n\r\n','15',''),(10,'TaskControl: Thanks for your Storage Order!','<p><span style=\"font-weight: bold;\">Your Order For: {$storage},  Amount: {$amount}, has been registered under your account.</span><br style=\"font-weight: bold;\">\r\n  <br>\r\nWe are now setting up your required storage capacity.<br>\r\nWe\'ll send you another e-mail as soon as the setting are completed.</p>\r\n<p>Thanks again for being part of the TaskControl Community!</p><br>\r\nTaskControl Support Team\r\n\r\n','15',''),(12,'TaskControl: Thanks for your Renewal!','<p><span style=\"font-weight: bold;\">Your Automatic Renewal for your Subscription: {$membership},  Amount: {$amount},<br>\r\nExpiring date: {$finished_date},  has been registered under your account and the renewal funds has been deducted from your wallet.</span> style=\"font-weight: bold;\">\r\n  <br>\r\nYou don\'t have to do nothing by now.\r\nThe next renewal will be done automatically providing you have enough funds in your wallet.<br>\r\n\r\n<p>Thanks again for being part of Our TaskControl Community!</p><br>\r\n\r\nTaskControl Support Team\r\n','15','');
/*!40000 ALTER TABLE `email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_master`
--

DROP TABLE IF EXISTS `employee_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_master` (
  `size_id` int(2) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `employees` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `disp_order` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`size_id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_master`
--

LOCK TABLES `employee_master` WRITE;
/*!40000 ALTER TABLE `employee_master` DISABLE KEYS */;
INSERT INTO `employee_master` VALUES (1,'Micro Company','1-10',1),(2,'Small Company','11-50',2),(3,'Medium Company','51-249',3),(4,'Big Company','250-600',4);
/*!40000 ALTER TABLE `employee_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escrow_payment_master`
--

DROP TABLE IF EXISTS `escrow_payment_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escrow_payment_master` (
  `ep_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `from_user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `from_user_login_id` varchar(255) NOT NULL DEFAULT '',
  `to_user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `to_user_login_id` varchar(255) NOT NULL DEFAULT '',
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `payment_type` int(11) NOT NULL DEFAULT '0',
  `date` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ep_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escrow_payment_master`
--

LOCK TABLES `escrow_payment_master` WRITE;
/*!40000 ALTER TABLE `escrow_payment_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `escrow_payment_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_time`
--

DROP TABLE IF EXISTS `execution_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_time` (
  `exe_id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_name` varchar(255) NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`exe_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_time`
--

LOCK TABLES `execution_time` WRITE;
/*!40000 ALTER TABLE `execution_time` DISABLE KEYS */;
INSERT INTO `execution_time` VALUES (15,'< 1 Week',0),(16,'1-2 Weeks',0),(17,'2-3 Weeks',0),(18,'3-4 Weeks',0),(19,'4+ Weeks',0),(20,'1 Month',0),(21,'2 Months',0),(22,'3 Months',0),(23,'4 Months',0),(24,'5 Months',0),(25,'6 Months',0),(26,'6+ Months',0),(27,'+ 6 Months',0);
/*!40000 ALTER TABLE `execution_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_master`
--

DROP TABLE IF EXISTS `group_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_master` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `buyer_id` varchar(50) NOT NULL,
  `favorite_sellers_id` text,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_master`
--

LOCK TABLES `group_master` WRITE;
/*!40000 ALTER TABLE `group_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage_master`
--

DROP TABLE IF EXISTS `homepage_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homepage_master` (
  `home_id` int(11) NOT NULL AUTO_INCREMENT,
  `home_title` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `home_page` varchar(255) CHARACTER SET latin1 NOT NULL,
  `home_content` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`home_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage_master`
--

LOCK TABLES `homepage_master` WRITE;
/*!40000 ALTER TABLE `homepage_master` DISABLE KEYS */;
INSERT INTO `homepage_master` VALUES (1,'text1','Homepage Block',''),(2,'Text2','','<span class=\"style3\">REGISTER NOW AND START TO CONTROL THE CHAOS!!<br></span><span class=\"style5\"></span> '),(3,'Text3','','<span class=\"style3\"><blink>TaskControl.net REGISTERING IS FREE!. REGISTER NOW!</blink></span>');
/*!40000 ALTER TABLE `homepage_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry_master`
--

DROP TABLE IF EXISTS `industry_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industry_master` (
  `industry_id` int(11) NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`industry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry_master`
--

LOCK TABLES `industry_master` WRITE;
/*!40000 ALTER TABLE `industry_master` DISABLE KEYS */;
INSERT INTO `industry_master` VALUES (22,'Information & Technology',0),(23,'Translations',16),(24,'Sales & Marketing ',17),(25,'Legal',23),(26,'Electronic & Enginering',18),(27,'Financial & Management',19),(28,'Writing',24),(29,'Arquitecture & Buildings',20),(30,'Entertainment',21),(31,'Pharmacy',22),(32,'Goverment',15),(33,'Mining, Petroleum & Gas',14),(34,'Telecommunications',13),(35,'Retail',2),(36,'Other Services',25),(37,'Manufacturing',4),(38,'Aviation ',6),(39,'Education',8),(40,'HealthCare',9),(41,'Biotechnology',10),(42,'Tourism',11),(43,'Human Resources',12),(44,'Design',1),(45,'Energy',3),(46,'Food',5),(47,'Defense',7),(48,'Virtual Assistance',0);
/*!40000 ALTER TABLE `industry_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_numbers`
--

DROP TABLE IF EXISTS `invoice_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_numbers` (
  `Numero` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'Numero secuencial de comprobante',
  `User_login_id` varchar(255) NOT NULL,
  `NetoPagado` float NOT NULL,
  `FechaFactura` date NOT NULL,
  PRIMARY KEY (`Numero`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tabla que Almacena los numeros de comprobantes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_numbers`
--

LOCK TABLES `invoice_numbers` WRITE;
/*!40000 ALTER TABLE `invoice_numbers` DISABLE KEYS */;
INSERT INTO `invoice_numbers` VALUES (1,'Cliente1',99.99,'2017-10-29');
/*!40000 ALTER TABLE `invoice_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_master`
--

DROP TABLE IF EXISTS `member_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_master` (
  `mem_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `user_login_id` varchar(255) NOT NULL DEFAULT '',
  `mem_fname` varchar(255) NOT NULL DEFAULT '',
  `mem_lname` varchar(255) NOT NULL DEFAULT '',
  `mem_company` varchar(255) NOT NULL,
  `mem_city` varchar(255) NOT NULL DEFAULT '',
  `mem_state` varchar(255) NOT NULL DEFAULT '',
  `mem_country` int(11) NOT NULL DEFAULT '0',
  `mem_phone` varchar(255) NOT NULL,
  `mem_mobile` varchar(255) NOT NULL,
  `mem_email` mediumtext NOT NULL,
  `mem_mname` varchar(255) NOT NULL DEFAULT '',
  `mem_organization` varchar(255) NOT NULL DEFAULT '',
  `mem_employes` varchar(255) NOT NULL DEFAULT '',
  `mem_daytime_phone` varchar(255) NOT NULL DEFAULT '',
  `mem_eve_phone` varchar(255) NOT NULL DEFAULT '',
  `mem_fax_no` varchar(255) NOT NULL DEFAULT '',
  `mem_address` varchar(255) NOT NULL DEFAULT '',
  `mem_address1` varchar(255) NOT NULL DEFAULT '',
  `mem_zip_code` varchar(255) NOT NULL DEFAULT '',
  `mem_website` varchar(255) NOT NULL DEFAULT '',
  `mem_category` mediumtext NOT NULL,
  `mem_pro_notice` varchar(255) NOT NULL DEFAULT '',
  `mem_option` varchar(255) NOT NULL DEFAULT '',
  `mem_as_buyer` int(11) NOT NULL,
  `mem_as_seller` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL DEFAULT '0',
  `membership_buy_date` date NOT NULL DEFAULT '2017-01-01',
  `membership_finish_date` date NOT NULL DEFAULT '2017-01-31',
  `transcation_id` int(11) NOT NULL DEFAULT '0',
  `wallet_sum` float(15,2) NOT NULL DEFAULT '0.00',
  `earn_by_site` float(15,2) NOT NULL DEFAULT '0.00',
  `plan_gigas_id` int(11) NOT NULL DEFAULT '0',
  `special_user` tinyint(2) NOT NULL DEFAULT '0',
  `storage_buy_date` date NOT NULL DEFAULT '2017-01-01',
  `forever` tinyint(4) NOT NULL DEFAULT '0',
  `show_buyer` tinyint(1) NOT NULL DEFAULT '0',
  `show_seller` tinyint(1) NOT NULL DEFAULT '0',
  `total_days` tinyint(2) NOT NULL DEFAULT '0',
  `plan_expired` int(1) NOT NULL,
  `discount_percent` float(15,2) NOT NULL,
  `additionals_cost` float(15,2) NOT NULL,
  `additionals_description` varchar(255) NOT NULL,
  `server_ip` text NOT NULL COMMENT 'IP address del droplet',
  `actual_version` varchar(20) NOT NULL COMMENT 'Version actual del aplicativo en este cliente ',
  PRIMARY KEY (`mem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_master`
--

LOCK TABLES `member_master` WRITE;
/*!40000 ALTER TABLE `member_master` DISABLE KEYS */;
INSERT INTO `member_master` VALUES (118,'e0ed18dc67b295f9518eaead0edcbfff','Demo-03','Roberto','Ramirez','Demo-03','Buenos Aires','Buenos Aires',1,'02915049425','','support@taskcontrol.net','','','','','','','Ruta 38 Km 17 Los Abrojos Manzana 234','','8109','','527,528','','1',1,1,0,'2020-12-12','2021-01-11',625,466.01,245.12,0,0,'2020-07-23',0,0,0,0,0,0.00,0.00,'None','',''),(119,'0e5cdeef72a1c1ee0ad3b47a68e9ac08','PMKCFree','karla','ceron','KConsultantservices','Vienna','',916,'4366565472088','','karla.ceron85@gmail.com','','','','','','','Felberstraße','','1150','','526','','on',1,1,0,'2020-07-28','2020-07-28',0,0.00,0.00,0,0,'2020-07-28',0,0,0,0,0,0.00,0.00,'None','',''),(120,'de34ca02307b653e146eb3798e4d5713','Demo-04','John','Smith','Demo-04','Sao Paulo','Sao Paulo',4,'02915049425','','support@taskcontrol.net','','','','','','','Red Square Garden Avenue','','14576','','564,522,527','','1',1,1,0,'2020-12-12','2021-01-11',626,733.00,245.12,0,0,'2020-09-27',0,0,0,0,0,0.00,0.00,'None','','');
/*!40000 ALTER TABLE `member_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_membership_history`
--

DROP TABLE IF EXISTS `member_membership_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_membership_history` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `user_login_id` varchar(255) NOT NULL DEFAULT '',
  `membership_id` int(11) NOT NULL DEFAULT '0',
  `membership_name` varchar(255) NOT NULL DEFAULT '',
  `membership_time` int(11) NOT NULL DEFAULT '0',
  `membership_fees` float(15,2) NOT NULL DEFAULT '0.00',
  `buy_date` date NOT NULL DEFAULT '0000-00-00',
  `finish_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`pk_id`)
) ENGINE=MyISAM AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_membership_history`
--

LOCK TABLES `member_membership_history` WRITE;
/*!40000 ALTER TABLE `member_membership_history` DISABLE KEYS */;
INSERT INTO `member_membership_history` VALUES (374,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 20 GB, 1 TB Transfer',30,129.99,'2020-07-23','2020-08-22'),(375,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 20 GB, 1 TB Transfer',30,129.99,'2020-07-23','2020-08-22'),(376,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',2,'PROFESSIONAL, Up to 15 Users, Unlimted Projects, 40 GB, 2 TB Transfer',30,149.99,'2020-07-23','2020-08-22'),(377,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 20 GB, 1 TB Transfer',30,129.99,'2020-07-23','2020-08-22'),(378,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',3,'ENTERPRISE-ONE, Uo to 25 Users, Unlimited Projects, 140 GB, 5 TB Transfer\r\n',30,199.99,'2020-07-23','2020-08-22'),(379,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 20 GB, 1 TB Transfer',30,129.99,'2020-07-29','2020-08-28'),(380,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 20 GB, 1 TB Transfer',30,129.99,'2020-07-29','2020-08-28'),(381,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 20 GB, 1 TB Transfer',30,129.99,'2020-07-29','2020-08-28'),(382,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-04','2020-10-04'),(383,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-04','2020-10-04'),(384,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-04','2020-10-04'),(385,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-04','2020-10-04'),(386,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-04','2020-10-04'),(387,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-04','2020-10-04'),(388,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-24','2020-10-24'),(389,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-24','2020-10-24'),(390,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-27','2020-10-27'),(391,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-27','2020-10-27'),(392,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-27','2020-10-27'),(393,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-27','2020-10-27'),(394,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-27','2020-10-27'),(395,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-28','2020-10-28'),(396,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-28','2020-10-28'),(397,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-29','2020-10-29'),(398,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-29','2020-10-29'),(399,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-30','2020-10-30'),(400,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-09-30','2020-10-30'),(401,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-10-23','2020-11-22'),(402,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-10-29','2020-11-28'),(403,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-21','2020-12-21'),(404,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-21','2020-12-21'),(405,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-21','2020-12-21'),(406,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-21','2020-12-21'),(407,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-21','2020-12-21'),(408,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-24','2020-12-24'),(409,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-24','2020-12-24'),(410,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-24','2020-12-24'),(411,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(412,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(413,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(414,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(415,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(416,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(417,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(418,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(419,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(420,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(421,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(422,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(423,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(424,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(425,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(426,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(427,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(428,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(429,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(430,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-25','2020-12-25'),(431,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-26','2020-12-26'),(432,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-11-26','2020-12-26'),(433,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-07','2021-01-06'),(434,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-07','2021-01-06'),(435,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-07','2021-01-06'),(436,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-07','2021-01-06'),(437,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-08','2021-01-07'),(438,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-09','2021-01-08'),(439,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-09','2021-01-08'),(440,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-09','2021-01-08'),(441,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-09','2021-01-08'),(442,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-09','2021-01-08'),(443,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-10','2021-01-09'),(444,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-10','2021-01-09'),(445,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-11','2021-01-10'),(446,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-11','2021-01-10'),(447,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-11','2021-01-10'),(448,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-12','2021-01-11'),(449,'de34ca02307b653e146eb3798e4d5713','Demo2',1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,'2020-12-12','2021-01-11');
/*!40000 ALTER TABLE `member_membership_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_plan_master`
--

DROP TABLE IF EXISTS `membership_plan_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership_plan_master` (
  `membership_id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_name` varchar(255) NOT NULL DEFAULT '',
  `membership_time` tinyint(2) NOT NULL DEFAULT '30',
  `membership_fees` float(15,2) NOT NULL DEFAULT '0.00',
  `membership_status` tinyint(2) NOT NULL DEFAULT '0',
  `display_order` tinyint(2) NOT NULL DEFAULT '1',
  `hourly_cost` float(15,3) NOT NULL DEFAULT '0.000',
  `backup_cost` float(15,3) NOT NULL DEFAULT '0.000',
  `snapshot_cost` float(15,3) NOT NULL DEFAULT '0.000',
  `add_giga_cost` float(15,3) NOT NULL DEFAULT '0.000',
  `discount_percentage` float(15,3) NOT NULL DEFAULT '0.000',
  `factor_used` float(15,3) NOT NULL DEFAULT '1.000',
  `total_price` float(15,2) NOT NULL DEFAULT '0.00',
  `description_internal` varchar(255) NOT NULL,
  `max_users` int(11) NOT NULL,
  `gigas_included` int(11) NOT NULL,
  PRIMARY KEY (`membership_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_plan_master`
--

LOCK TABLES `membership_plan_master` WRITE;
/*!40000 ALTER TABLE `membership_plan_master` DISABLE KEYS */;
INSERT INTO `membership_plan_master` VALUES (1,'STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer',30,266.99,1,1,0.022,0.200,0.100,0.050,0.000,1.000,266.99,'2 GB RAM, 2 CPU, 60 GB HD, 3 TB transfer',5,60),(2,'PROFESSIONAL, Up to 15 Users, Unlimted Projects, 80 GB, 4 TB Transfer',30,725.99,1,2,0.030,0.000,0.200,0.200,0.000,1.000,725.99,'4 GB MB RAM, 2 CPUs, 80 GB HD VPS 4 TB Transfer',15,80),(3,'ENTERPRISE-ONE, Up to 30 Users, Unlimited Projects, 160 GB, 5 TB Transfer',30,1269.99,1,3,0.060,0.000,0.200,0.200,0.000,1.000,1269.99,'8 GB RAM, 4 CPUs 160 GB HD VPS 5 TB transfer',30,160);
/*!40000 ALTER TABLE `membership_plan_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercadopago_master`
--

DROP TABLE IF EXISTS `mercadopago_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mercadopago_master` (
  `mp_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `user_login_id` varchar(255) NOT NULL DEFAULT '',
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `usdAmount` float(15,2) NOT NULL COMMENT 'valor correspondiente en dolares',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `trans_type` char(2) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `currency_id` varchar(3) NOT NULL,
  PRIMARY KEY (`mp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercadopago_master`
--

LOCK TABLES `mercadopago_master` WRITE;
/*!40000 ALTER TABLE `mercadopago_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `mercadopago_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercadopago_pending_deposite`
--

DROP TABLE IF EXISTS `mercadopago_pending_deposite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mercadopago_pending_deposite` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `user_login_id` varchar(255) NOT NULL DEFAULT '',
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `usdAmount` float(15,2) NOT NULL COMMENT 'valor correspondiente en dolares',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `pending_date` date NOT NULL DEFAULT '0000-00-00',
  `currency_id` varchar(3) NOT NULL COMMENT 'Indica el tipo de moneda del deposito',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercadopago_pending_deposite`
--

LOCK TABLES `mercadopago_pending_deposite` WRITE;
/*!40000 ALTER TABLE `mercadopago_pending_deposite` DISABLE KEYS */;
/*!40000 ALTER TABLE `mercadopago_pending_deposite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_board_master`
--

DROP TABLE IF EXISTS `message_board_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_board_master` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `sender_auth_id` varchar(255) NOT NULL DEFAULT '',
  `sender_login_id` varchar(255) NOT NULL DEFAULT '',
  `receiver_auth_id` varchar(255) NOT NULL DEFAULT '',
  `receiver_login_id` varchar(255) NOT NULL DEFAULT '',
  `message_desc` text NOT NULL,
  `dates` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_board_master`
--

LOCK TABLES `message_board_master` WRITE;
/*!40000 ALTER TABLE `message_board_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_board_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneybooker_master`
--

DROP TABLE IF EXISTS `moneybooker_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moneybooker_master` (
  `mb_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `user_login_id` varchar(255) NOT NULL DEFAULT '',
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `trans_type` char(2) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `transaction_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneybooker_master`
--

LOCK TABLES `moneybooker_master` WRITE;
/*!40000 ALTER TABLE `moneybooker_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `moneybooker_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneybooker_pending_deposite`
--

DROP TABLE IF EXISTS `moneybooker_pending_deposite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moneybooker_pending_deposite` (
  `mpd_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `user_login_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `pending_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`mpd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneybooker_pending_deposite`
--

LOCK TABLES `moneybooker_pending_deposite` WRITE;
/*!40000 ALTER TABLE `moneybooker_pending_deposite` DISABLE KEYS */;
/*!40000 ALTER TABLE `moneybooker_pending_deposite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neteller_master`
--

DROP TABLE IF EXISTS `neteller_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neteller_master` (
  `nt_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `user_login_id` varchar(255) NOT NULL DEFAULT '',
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `trans_type` char(2) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  PRIMARY KEY (`nt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neteller_master`
--

LOCK TABLES `neteller_master` WRITE;
/*!40000 ALTER TABLE `neteller_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `neteller_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neteller_pending_deposite`
--

DROP TABLE IF EXISTS `neteller_pending_deposite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neteller_pending_deposite` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `user_login_id` varchar(255) NOT NULL DEFAULT '',
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `pending_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neteller_pending_deposite`
--

LOCK TABLES `neteller_pending_deposite` WRITE;
/*!40000 ALTER TABLE `neteller_pending_deposite` DISABLE KEYS */;
/*!40000 ALTER TABLE `neteller_pending_deposite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_master`
--

DROP TABLE IF EXISTS `newsletter_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_master` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(255) NOT NULL DEFAULT '',
  `news_description` text NOT NULL,
  `Submitted_date` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_master`
--

LOCK TABLES `newsletter_master` WRITE;
/*!40000 ALTER TABLE `newsletter_master` DISABLE KEYS */;
INSERT INTO `newsletter_master` VALUES (27,'Edit your projects!','Dear user, we proudly announce you that we have just added a lot of new features for the service. Please check the NEWS  at www.taskcontrol.net!\r\nThe Best\r\nTaskControl Support Team','01/10/20 at 04:40 CET'),(29,'Policy Privacy & Terms of Use Changes','Dear Taskcontrol Customer:\r\n\r\nWe are changing our PP and TOS please review this:\r\nThanks,\r\n','09/20/17 at 15:07 UTC'),(24,'Promo for New Users','Promo for New Users','10/10/12 at 10:30 CET'),(28,'Welcome to TaskControl Community!','Welcome Aboard!','12/03/12 at 11:34 CET');
/*!40000 ALTER TABLE `newsletter_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_master`
--

DROP TABLE IF EXISTS `page_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_master` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `page_category` varchar(255) CHARACTER SET latin1 NOT NULL,
  `page_content` longtext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_master`
--

LOCK TABLES `page_master` WRITE;
/*!40000 ALTER TABLE `page_master` DISABLE KEYS */;
INSERT INTO `page_master` VALUES (1,'Partner','','Partner Content'),(2,'Terms of Service','us','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n\"http://www.w3.org/TR/html4/loose.dtd\">\r\n<html>\r\n<head>\r\n<title>Documento sin t&iacute;tulo</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n<style type=\"text/css\">\r\n<!--\r\n.Estilo1 {\r\n	font-family: Verdana, Arial, Helvetica, sans-serif;\r\n	font-size: 14px;\r\n}\r\n.Estilo3 {\r\n	font-family: Verdana, Arial, Helvetica, sans-serif;\r\n	font-size: 18px;\r\n	font-weight: bold;\r\n}\r\n.Estilo4 {font-family: Verdana, Arial, Helvetica, sans-serif}\r\n-->\r\n</style>\r\n</head>\r\n\r\n<body>\r\n<p class=\"Estilo3\"><br>\r\nTERMS OF SERVICE</p>\r\n<p class=\"Estilo1\"><br>\r\n  <strong>Effective Date October 28th, 2020<br>\r\n  <br>\r\n  </strong>These Terms of Service constitute an agreement (hereinafter the &ldquo;Agreement&rdquo;) applicable to your access to the website www.taskcontrol.net (hereinafter the &ldquo;Site&rdquo;) and use of our services, software, cloud system and other products (hereinafter collectively as the &ldquo;Services&rdquo;). This document is a legally binding agreement between you as the user of the Site (hereinafter referred to as &ldquo;you&rdquo;, &ldquo;your&rdquo; or &ldquo;User&rdquo;) and TaskControl listed in clause 2.1 below (hereinafter referred to as &ldquo;we&rdquo;, &ldquo;our&rdquo; or &ldquo;TaskControl&rdquo;). <br>\r\n  The user acknowledges that, understands and agrees to be bound by its terms, and that the person signing on its behalf has been authorized to do so. The person executing this agreement on User&rsquo;s behalf represents that he or she has the authority to bind User to these terms and conditions.<br>\r\n  <br>\r\n  <strong>1. APPLICATION AND ACCEPTANCE OF THE TERMS<br>\r\n  <br>\r\n  </strong>1.1 Your use of the Site and TaskControl&rsquo;s Services is subject to the terms and conditions contained in this document, the Privacy Policy and any other rules and policies of the Site that we may publish from time to time, as well as any additional agreement. This document and such other rules and policies of the Site are collectively referred to below as the &ldquo;Terms&rdquo;. &nbsp;By accessing the Site or using the Services, you agree to accept and be bound by the Terms.&nbsp;Please do not use the Services or the Site if you do not accept all of the Terms. &nbsp; <br>\r\n  1.2 You may not use the Services and may not accept the Terms if (a) you are not of legal age to form a binding contract with TaskControl, or (b) you are not permitted to receive any Services under the laws of Argentina or other countries / regions including the country / region in which you are resident or from which you use the Services.<br>\r\n  1.3 You acknowledge and agree that TaskControl may amend any Terms at any time by posting the relevant amended and restated Terms on the Site.&nbsp;By continuing to use the Services or the Site, you agree that the amended Terms will apply to you.<br>\r\n  1.4 If we posted or provided a translation of the Spanish language version of the Terms, you agree that the translation is provided for convenience only and that the Spanish language version will govern your uses of the Services or the Site.<br>\r\n  1.5 You may be required to enter into a separate agreement, whether online or offline, with TaskControl or our affiliate for any Service (&ldquo;Additional Agreements&rdquo;).&nbsp;If there is any conflict or inconsistency between the Terms and an Additional Agreement, the Additional Agreement shall take precedence over the Terms only in relation to that Service concerned.  <br>\r\n  <br>\r\n  <strong>2. PROVISION OF SERVICES<br>\r\n  <br>\r\n  </strong>2.1 TaskControl that you are contracting with is registered in Drago 57,\r\n 8th Floor Dept. \"F\", 8000 Bahia Blanca, Buenos Aires, Argentina, who you agree may invoice you for their part of the Services.<br>\r\n  2.2 You must register on the Site in order to access and use some Services. Further, TaskControl reserves the right, without prior notice, to restrict access to or use of certain Services (or any features within the Services) subject to any condition that TaskControl may impose in our discretion.&nbsp;<br>\r\n  2.3 No warranty or representation is given that a particular Service or feature or function thereof or the same type and extent of the Service or features and functions thereof will be available for Users. We may in our sole discretion limit, deny or create different level of access to and use of any Services (or any features within the Services) with respect to different Users.<br>\r\n  2.4 TaskControl may launch, change, upgrade, impose conditions to, suspend, or stop any Services (or any features within the Services) without prior notice except that in case of a fee-based Service, such changes will not substantially adversely affect the paying Users in enjoying that Service.<br>\r\n  <br>\r\n  <strong>3. USERS GENERALLY</strong><br>\r\n  <br>\r\n  3.1 As a condition of your access to and use of the Site or Services, you agree that you will comply with all applicable laws and regulations when using the Site or Services.<br>\r\n  3.2 You agree that (a) you will not copy, reproduce, download, re-publish, sell, distribute or resell any Services or any information, text, images, graphics, video clips, sound, directories, files, databases or listings, etcetera available on or through the Site (the &ldquo;Site Content&rdquo;), and (b) you will not copy, reproduce, download, compile or otherwise use any Site Content or Services for the purposes of operating a business that competes with TaskControl, or otherwise commercially exploiting the Site Content or Services. Systematic retrieval of Site Content from the Site to create or compile, directly or indirectly, a collection, compilation, database or directory (whether through robots, spiders, automatic devices or manual processes) without written permission from TaskControl is prohibited. Use of any content or materials on the Site for any purpose not expressly permitted in the Terms is prohibited. <br>\r\n  3.3 You must read TaskControl&rsquo;s Privacy Policy which governs the protection and use of personal information about Users in the possession of TaskControl and our affiliates. You accept the terms of the Privacy Policy and agree to the use of the personal information about you in accordance with the Privacy Policy.<br>\r\n  3.4 You agree not to undertake any action to undermine the integrity of the software, computer systems or networks of TaskControl and/or any other User nor to gain unauthorized access to such computer systems or networks.<br>\r\n  3.5 By posting or displaying any information, content or material (&ldquo;Public User Content&rdquo;) on the Site or providing any Public User Content to TaskControl or our representative(s), you grant an irrevocable, perpetual, worldwide, royalty-free, and sub-licensable (through multiple tiers) license to TaskControl to display, transmit, distribute, reproduce, publish, duplicate, adapt, modify, translate, create derivative works, and otherwise use any or all of the User Content in any form, media, or technology now known or not currently known, for any purpose which may be beneficial to the operation of the Site or the provision of any Services. You confirm and warrant to TaskControl that you have all the rights, power and authority necessary to grant the above license.<br>\r\n  <br>\r\n  <strong>4. USER ACCOUNT <br>\r\n  <br>\r\n</strong>4.1 User must be registered on the Site to access or use some Services. Except with TaskControl&rsquo;s approval, one User may only register one account on the Site. TaskControl may reject User&rsquo;s application for registration for any reason.<br>\r\n4.2 Upon registering on the Site, TaskControl will assign an account to which User may enter with his / her email and password (the latter will be chosen by a User during registration).<br>\r\n4.3 Each User shall be solely responsible for maintaining the confidentiality and security of his or her password and all activities that occur in the account. No User may share, assign or permit use of the User account or password. The User agrees to notify TaskControl immediately if it becomes aware of any unauthorized use of its password or its account or any other breach of the security of its account.<br>\r\n4.4 User agrees that all activities that occur under your account (including without limitation, posting any information on the Site, upload any information through the Services, clicking to accept any Additional Agreements or rules, subscribing to or making any payment for any Services) will be deemed to have been authorized by the User.<br>\r\n4.5 User acknowledges that sharing of your account with other persons, or allowing multiple users to use your account (collectively, &quot;multiple use&quot;), may cause irreparable harm to TaskControl or other Users of the Site or the Services. User shall indemnify TaskControl, our affiliates, directors, employees, agents and representatives against any loss or damages (including but not limited to loss of profits) suffered as a result of the multiple use of your account. User also agrees that in case of the multiple use of your account or User&rsquo;s failure to maintain the security of your account, TaskControl shall not be liable for any loss or damages arising from such a breach and shall have the right to suspend or terminate User&rsquo;s account without liability to User.<br>\r\n4.6 If a User account is inactive during the course of 30 calendar days, this account can be \'disabled\' and cannot be retrieved without a specific request to TaskControl, by the User of the Services.<br>\r\n<br>\r\n<strong>5. USER&rsquo;S RESPONSIBILITIES<br>\r\n  <br>\r\n</strong>5.1 Each User represents, warrants and agrees that you have full power and authority to accept the Terms, to grant the authorization and to perform the obligations hereunder; <br>\r\n5.2 User will be required to provide information as part of the registration process on the Site or your use of any Service or the User account.&nbsp;Each User represents, warrants and agrees that (a) such information whether submitted during the registration process or thereafter throughout the continuation of the use of the Site or Services is true, accurate, current and complete, and (b) you will maintain and promptly amend all information and material to keep it true, accurate, current and complete.<br>\r\n5.3 Each User represents, warrants and agrees that (a) you shall be solely responsible for obtaining all necessary third party licenses and permissions regarding any content that you submit or post as a Public User Content; (b) any Public User Content that you submit or post does not infringe or violate any of the copyright, patent, trademark, trade name, trade secrets or any other personal or proprietary rights of any third party (&ldquo;Third Party Rights&rdquo;); <br>\r\n5.4 Each User further represents, warrants and agrees that the Public User Content that you submit, shall:<br>\r\na) be true, accurate, complete and lawful;<br>\r\nb) not be false, misleading or deceptive;<br>\r\nc) not contain information that is defamatory, libelous, threatening or harassing, obscene, objectionable, offensive, sexually explicit or harmful to minors;<br>\r\nd) not contain information that is discriminatory or promotes discrimination based on race, sex, religion, nationality, disability, sexual orientation or age;<br>\r\ne) not violate other Terms or any applicable Additional Agreements;<br>\r\nf) not violate any applicable laws and regulations or promote any activities which may violate any applicable laws and regulations;<br>\r\ng) not contain any link directly or indirectly to any other web sites which includes any content that may violate the Terms.<br>\r\n5.5 Each User further represents, warrants and agrees that you shall/are:<br>\r\na) carry on your activities on the Site and Services in compliance with any applicable laws and regulations;<br>\r\nb) carry on your activities in accordance with the Terms and any applicable Additional Agreements;<br>\r\nc) not use the Services or Site to defraud any person or entity (including without limitation use of stolen credit/debit cards);<br>\r\nd) not impersonate any person or entity, misrepresent yourself or your affiliation with any person or entity;<br>\r\ne) not engage in spamming or phishing;<br>\r\nf) not engage in any other unlawful activities (including without limitation those which would constitute a criminal offence, give rise to civil liability,&nbsp;etcetera) or encourage or abet any unlawful activities;<br>\r\ng) not involve attempts to copy, reproduce, exploit or expropriate TaskControl&rsquo;s various proprietary directories and databases;<br>\r\nh) not involve any computer viruses or other destructive devices and codes that have the effect of damaging, interfering with, intercepting or expropriating any software or hardware system, data or personal information;<br>\r\ni) not involve any scheme to undermine the integrity of the data, systems or networks used by TaskControl and/or any user of the Site or gain unauthorized access to such data, systems or networks;<br>\r\nj) not engage in any activities that would otherwise create any liability for TaskControl or our affiliates.<br>\r\n5.6 User may not use the Services and User account to engage in activities which are identical or similar to TaskControl&rsquo;s marketplace business.<br>\r\n5.7 TaskControl does not endorse, verify or otherwise certify the contents of any comments or information made by any User. Each User is solely responsible for the contents of their communications and may be held legally liable or accountable for the content of their comments or other information.<br>\r\n5.8 User acknowledges and agrees that each User is solely responsible for observing applicable laws and regulations in its respective jurisdictions to ensure that all use of the Site and Services are in compliance with the same.<br>\r\n<br>\r\n<strong>6. BREACHES BY USERS<br>\r\n  <br>\r\n</strong>6.1 If any User breaches any Terms, or if TaskControl has reasonable grounds to believe that a User is in breach of any Terms, TaskControl shall have the right to take such disciplinary actions as it deems appropriate, including without limitation: (i) suspending or terminating the User&rsquo;s account and any and all accounts determined to be related to such account by TaskControl in its discretion; (ii) restricting, downgrading, suspending or terminating the subscription of, access to, or current or future use of any Service; (iii) imposing other restrictions on the User&rsquo;s use of any features or functions of any Service as TaskControl may consider appropriate in its sole discretion; and (iv) any other corrective actions, discipline or penalties as TaskControl may deem necessary or appropriate in its sole discretion. <br>\r\n  6.2 Without limiting the generality of the provisions of the Terms, a User would be considered as being in breach of the Terms in any of the following circumstances:<br>\r\n  a) TaskControl has reasonable grounds to suspect that such User has used a stolen credit card or other false or misleading information in any transaction,<br>\r\n  b) TaskControl has reasonable grounds to suspect that any information provided by the User is not current or complete or is untrue, inaccurate, or misleading, or<br>\r\n  c) TaskControl believes that the User&rsquo;s actions may cause financial loss or legal liability to TaskControl or our affiliates or any other Users.<br>\r\n  6.3 TaskControl reserves the right to cooperate fully with governmental authorities, private investigators and/or injured third parties in the investigation of any suspected criminal or civil wrongdoing.&nbsp;Further, TaskControl may disclose the User\'s identity and contact information, if requested by a government or law enforcement body, an injured third party, or as a result of a subpoena or other legal action. TaskControl shall not be liable for damages or results arising from such disclosure, and User agrees not to bring any action or claim against TaskControl for such disclosure.<br>\r\n  6.4 TaskControl may, at any time and in our reasonable discretion, impose limitations on, suspend or terminate the User&rsquo;s use of any Service or the Site without being liable to the User if TaskControl has received notice that the User is in breach of any agreement and such breach involves or is reasonably suspected of involving dishonest or fraudulent activities.&nbsp;<br>\r\n  6.5 Each User agrees to indemnify TaskControl, our affiliates, directors, employees, agents and representatives and to hold them harmless, from any and all damages, losses, claims and liabilities (including legal costs on a full indemnity basis) which may arise from the use of any Services or the User Data, as well as the use of the Site or from your breach of the Terms.<br>\r\n  6.6 Each User further agrees that TaskControl is not responsible, and shall have no liability to you or anyone else for any User Content (Public User Content or User Data) or other material transmitted over the Site or over the Services, including fraudulent, untrue, misleading, inaccurate, defamatory, offensive or illicit material and that the risk of damage from such material rests entirely with each User. TaskControl reserves the right, at our own expense, to assume the exclusive defense and control of any matter otherwise subject to indemnification by the User, in which event the User shall cooperate with TaskControl in asserting any available defenses.<br>  \r\n  <br>\r\n  <strong>7. SERVICES</strong><br>\r\n  <br>    \r\n  7.1 Use of the Services. During the Term, defined in clause 12.1 below. User may access and use the Services pursuant to: (a) the terms of any outstanding order for access to the Services (&ldquo;Order&rdquo;), including such features and functions as the Order requires; and (b) TaskControl&rsquo;s policies posted on its Site, as such policies may be updated from time to time.<br>\r\n    7.2 Documentation: User may reproduce and use TaskControl\'s standard manuals related to use of the Services (&ldquo;Documentation&rdquo;) solely as necessary to support Users&rsquo; use of the Services.<br>\r\n    7.3 Service fees. User must pay to TaskControl the fee established in each Order (the &quot;Subscription Fee&quot;) for each Term. TaskControl will not refund the Subscription Fee under any circumstances.<br>\r\n    7.4 Services Revisions. TaskControl may revise the functions of the services at any time, including, without limitation, modification or deletion of subsequent functions and features or the reduction of service levels.<br>    \r\n  <br>\r\n    <strong>8. USER DATA<br>\r\n  <br>\r\n</strong>8.1 Use of User Data. Unless it receives User&rsquo;s prior written consent, TaskControl: (a) shall not access, process, or otherwise use User Data other than as necessary to facilitate the Services; and (b) shall not intentionally grant any third party access to User Data, except subcontractors that are subject to a reasonable nondisclosure agreement. Notwithstanding the foregoing, TaskControl may disclose User Data as required by applicable law or by proper legal or governmental authority. <br>\r\n  8.2 Risk of Exposure. User recognizes and agrees that hosting data online involves risks of unauthorized disclosure or exposure and that, in accessing and using the Services, User assumes such risks. TaskControl offers no representation, warranty, or guarantee that User Data will not be exposed or disclosed through errors or the actions of third parties.<br>\r\n  8.3 Data Accuracy. TaskControl shall have no responsibility or liability for the accuracy of data uploaded to the Services by User, including without limitation User Data and any other data uploaded by Users.<br>\r\n  8.4 Data Deletion. TaskControl may permanently erase User Data if User&rsquo;s account is delinquent, suspended, deactivated or terminated for 30 days or more.<br>  \r\n  <br>\r\n  <strong>9. CONFIDENTIAL INFORMATION<br>\r\n  <br>\r\n</strong>9.1 &ldquo;Confidential Information&rdquo; refers to the following items that Taskcontrol discloses to User: (a) any document that TaskControl marks &ldquo;Confidential&rdquo;; (b) any information that TaskControl orally designates as &ldquo;Confidential&rdquo; at the time of disclosure, provided TaskControl confirms such designation in writing within 5 business days; (c) the Documentation, whether or not marked or designated confidential; and (d) any other nonpublic, sensitive information User should reasonably consider a trade secret or otherwise confidential. Notwithstanding the foregoing, Confidential Information does not include information that: (i) is in User&rsquo;s possession at the time of disclosure; (ii) is independently developed by User without use of or reference to Confidential Information; (iii) becomes known publicly, before or after disclosure, other than as a result of User&rsquo;s improper action or inaction; or (iv) is approved for release in writing by User. User is on notice that the Confidential Information may include TaskControl&rsquo;s valuable trade secrets.<br>\r\n  9.2 Nondisclosure. User shall not use Confidential Information for any purpose other than use the Services (the &ldquo;Purpose&rdquo;). User: (a) shall not disclose Confidential Information to any employee or contractor of User unless such person needs access in order to facilitate the Purpose and executes a nondisclosure agreement with User with terms no less restrictive than those of this section 9; and (b) shall not disclose Confidential Information to any other third party without TaskControl&rsquo;s prior written consent. Without limiting the generality of the foregoing, User shall protect Confidential Information with the same degree of care it uses to protect its own confidential information of similar nature and importance, but with no less than reasonable care. User shall promptly notify TaskControl of any misuse or misappropriation of Confidential Information that comes to User&rsquo;s attention. Notwithstanding the foregoing, User may disclose Confidential Information as required by applicable law or by proper legal or governmental authority. User shall give TaskControl prompt notice of any such legal or governmental demand and reasonably cooperate with TaskControl in any effort to seek a protective order or otherwise to contest such required disclosure, at TaskControl&rsquo;s expense.<br>\r\n  9.3. Injunction. User agrees that breach of this Article 9 would cause TaskControl irreparable injury, for which monetary damages would not provide adequate compensation, and that in addition to any other remedy, TaskControl will be entitled to injunctive relief against such breach or threatened breach, without proving actual damage or posting a bond or other security.<br>\r\n  9.4. Retention of Rights. This Agreement does not transfer ownership of Confidential Information or grant a license thereto. TaskControl will retain all right, title, and interest in and to all Confidential Information.<br>  \r\n  <br>\r\n  <strong>10. SUPPORT <br>\r\n  <br>\r\n</strong>10.1 Support Service Scope. Support services via email and chat from the Site are covered by this Agreement.<br>\r\n  10.2 User Requirements. User responsibilities and/or requirements in support of this Agreement include: <br>\r\n  - Payment for all support costs at the agreed interval.<br>\r\n  - Description of the user to solve a problem or a request related to the service.<br>\r\n  10.3 Service Availability. Coverage parameters specific to the service(s) covered in this Agreement are as follows:<br>\r\n  - Email support (support@taskcontrol.net): Monitored 9:00 am. to 5:00 pm. monday &ndash; friday (Argentina time)<br>\r\n  - Emails received outside of office hours will be collected, however no action can be guaranteed until the next working day.<br>  \r\n  <br>\r\n  <strong>11. LIMITATION OF LIABILITY<br>\r\n  <br>\r\n</strong><strong>11.1 USER ACCEPTS THE SITE AND SERVICES &ldquo;AS IS&rdquo; AND AS AVAILABLE, WITH NO REPRESENTATION OR WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NONINFRINGEMENT OF INTELLECTUAL PROPERTY RIGHTS, OR ANY IMPLIED WARRANTY ARISING FROM STATUTE, COURSE OF DEALING, COURSE OF PERFORMANCE, OR USAGE OF TRADE. WITHOUT LIMITING THE GENERALITY OF THE FOREGOING: (a) TASKCONTROL HAS NO OBLIGATION TO INDEMNIFY OR DEFEND USER OR USERS AGAINST CLAIMS RELATED TO INFRINGEMENT OF INTELLECTUAL PROPERTY; (b) TASKCONTROL DOES NOT REPRESENT OR WARRANT THAT THE SITE OR SERVICES WILL PERFORM WITHOUT INTERRUPTION OR ERROR; AND (c) TASKCONTROL DOES NOT REPRESENT OR WARRANT THAT THE SITE OR SERVICES ARE SECURE FROM HACKING OR OTHER UNAUTHORIZED INTRUSION OR THAT USER DATA WILL REMAIN PRIVATE OR SECURE.</strong><br>\r\n  11.2 Any material downloaded or otherwise obtained through the Site or any Service, including but not limited to, the Cloud, is done at each User\'s sole discretion and risk and each User is solely responsible for any damage to User&rsquo;s computer system or TaskControl&rsquo;s computer system or loss of data that may result from the download of any such material. No advice or information, whether oral or written, obtained by any User from TaskControl or through or from the Site shall create any warranty not expressly stated herein.<br>\r\n  11.3 The Site may make available to User services or products provided by independent third parties. We do not have any control over their Services or Products and we do not have any liability for such third parties. <br>\r\n  11.4 Each User hereby agrees to indemnify and save TaskControl, our affiliates, directors, officers and employees harmless, from any and all losses, claims, liabilities (including legal costs on a full indemnity basis) which may arise from such User\'s use of the Site or Services or from your breach of any of the terms and conditions of the Terms. Each User hereby further agrees to indemnify and save TaskControl, our affiliates, directors, officers and employees harmless, from any and all losses, damages, claims, liabilities (including legal costs on a full indemnity basis) which may arise from User\'s breach of any representations and warranties made by User to TaskControl. &nbsp;<br>\r\n  11.5 TaskControl is not responsible and shall have no liability for any material uploaded by Users, including defamatory, offensive or illicit material and that the risk of damages from such material rests entirely with each User. TaskControl reserves the right, at our own expense, to assume the exclusive defense and control of any matter otherwise subject to indemnification by the User, in which event the User shall cooperate with TaskControl in asserting any available defenses. <br>\r\n  11.6 TaskControl shall not be liable for any special, direct, indirect, punitive, incidental or consequential damages or any damages whatsoever (including but not limited to damages for loss of profits or savings, business interruption, loss of information), whether in contract, negligence, tort, equity or otherwise or any other damages resulting from any of the following.<br>\r\n  a) the use or the inability to use the Site or Services;<br>\r\n  b) any defect in data, information or services;<br>\r\n  c) violation of Third Party Rights or claims;<br>\r\n  d) unauthorized access by third parties to data or private information of any User;<br>\r\n  e) statements or conduct of any User of the Site; or;<br>\r\n  f) any matters relating to Services however arising, including negligence.<br>\r\n  g) use of the Site for hacking in any way possible current or in the future.<br>\r\n  11.7 Notwithstanding any of the foregoing provisions, the aggregate liability of TaskControl, our employees, agents, affiliates, representatives or anyone acting on our behalf with respect to each User for all claims arising from the use of the Site or Services during any calendar year shall be limited to the greater of the amount of fees the User has paid to TaskControl during the calendar year. The preceding sentence shall not preclude the requirement by the User to prove actual damages. All claims arising from the use of the Site or Services must be filed within one (1) year from the date the cause of action arose or such longer period as prescribed under any applicable law governing this Term of Use.<br>\r\n  11.8 The limitations and exclusions of liability to you under the Terms shall apply to the maximum extent permitted by law and shall apply whether or not TaskControl has been advised of or should have been aware of the possibility of any such losses arising.<br>\r\n  11.9 TaskControl does not guarantee that the Services, or any portion thereof, will function on any particular hardware or devices. You understand and acknowledge that the Services may be subject to malfunctions and delays inherent in the use of the Internet and electronic communications. You are responsible for any and all software and hardware requirements necessary or preferable for using the Services, including but not limited to acquiring and updating compatible hardware or devices necessary to access and use the Services and Applications and any updates thereto, as well as obtaining the data network access necessary to use the Services. <br>\r\n  11.10 User shall defend, indemnify, and hold harmless TaskControl against any &ldquo;Indemnified Claim,&rdquo; meaning any third party claim, suit, or proceeding arising out of or related to User\'s alleged or actual use of, misuse of, or failure to use the Services, including without limitation: (a) claims by Users or by User\'s employees, as well as by User&rsquo;s own customers (if any); (b) claims related to unauthorized disclosure or exposure of personally identifiable information or other private information, including User Data; (c) claims related to infringement or violation of a copyright, trademark, trade secret, or privacy or confidentiality right by written material, images, logos or other content uploaded to the Services through User&rsquo;s account, including without limitation by User Data; and (d) claims that use of the Services through User&rsquo;s account harasses, defames, or defrauds a third party or violates any other law or restriction. Indemnified Claims include, without limitation, claims arising out of or related to TaskControl&rsquo;s negligence. User&rsquo;s obligations set forth in this Section 10 include retention and payment of attorneys and payment of court costs, as well as settlement at User&rsquo;s expense and payment of judgments. TaskControl will have the right, not to be exercised unreasonably, to reject any settlement or compromise that requires that it admit wrongdoing or liability or subjects it to any ongoing affirmative obligations.<br>  \r\n  <br>\r\n  <strong>12. TERM &amp; TERMINATION<br>\r\n  <br>\r\n</strong>12.1. Term. The term of this Agreement (the &ldquo;Term&rdquo;) shall commence on the date User clicks &ldquo;Accepted and Agreed To&rdquo; on the Site (the &ldquo;Effective Date&rdquo;) and continue for the period set forth in the Order. Thereafter, the Term will renew for successive subscribed periods, unless either party refuses such renewal by written notice 30 or more days before the renewal date.<br>\r\n  12.2. Termination for Cause. Either party may terminate this Agreement for the other&rsquo;s material breach by written notice, effective in 30 days unless the other party first cures such breach. The breach referred to in this clause is based on a failure to abide by the Terms of Service set forth in this Agreement, the Privacy Policies, any other policy or rule set forth by TaskControl on the Site or any additional agreement online or offline.<br>\r\n  12.3. Effects of Termination. Upon termination of this Agreement, User shall cease all use of the Service and delete, destroy, or return all copies of the Documentation in its possession or control. The following provisions will survive termination or expiration of this Agreement: (a) any obligation of User to pay fees incurred before termination; (b) Clauses and Sections related to (Intellectual Property), (Confidential Information), (Limitation of Liability), and (Indemnification); and (c) any other provision of this Agreement that must survive to fulfill its essential purpose.<br>  \r\n  <br>\r\n  <strong>13. FEES AND PAYMENT<br>\r\n  <br>\r\n</strong>13.1 All rights and privileges provided herein to you under these Terms of Service are subject to your payment of applicable fee, if any, to TaskControl, provided however, that TaskControl expressly reserves the right to provide the Services free of charge during the Term, and further provided, that TaskControl, solely at its own discretion and upon termination of this Agreement, may elect to provide the same or similar Services for a fee. <br>\r\n  13.2 Payment for Services shall be at prices as agreed upon between you and TaskControl. TaskControl offers multiple Service Plans for Users, with different fees and functionality features for each plan (&quot;Service Plan&quot;). Payment for a Service Plan, if any, shall be made in advance and is non-refundable, that is there will be no refunds, full or partial. <br>\r\n  13.3 For instance, if you cancel your subscription to your Service plan before it ends, you will still be responsible for paying any applicable fees for the remainder of the selected subscription period. All fees are exclusive of taxes, levies, or duties imposed by taxing authorities; you are responsible for paying any such applicable tax. You acknowledge that the amount billed for the subscription may vary for reasons that include, differing amounts due to promotional offers, differing amounts due to changes in your account, or changes in the amount of applicable sales tax, and you authorize us to bill you for such varying amounts. <br>\r\n  13.4 In case of non-payment for any reason, TaskControl reserves the right to immediately bar the User\'s access to the Services.<br>  \r\n  <br>\r\n  <strong>14. SOFTWARE<br>\r\n  <br>\r\n</strong>14.1 TaskControl may offer certain software, to be used in conjunction with the Services, for downloading from or through this Website (&quot;Software&quot;). Such Software shall be licensed subject to the terms of the applicable End User License Agreement. Both the Software and any accompanying documentation made available through this Website are the copyrighted works of TaskControl. You must agree to the terms of the applicable end user license agreement prior to use of such Software. <br>\r\n  14.2 Except as otherwise specifically provided herein or in the applicable end user license agreement or as otherwise agreed by TaskControl in writing, you may not use, copy, republish, frame, emulate, clone, download, transmit, rent, lease, loan, sell, assign, modify, distribute, license, sublicense, decompile, disassemble, create a derivative work, otherwise reverse engineer, or transfer the licensed program, or any subset of the Website, its products or services. Any such unauthorized use shall result in immediate and automatic termination of this license and may result in criminal and/or civil prosecution. <br>\r\n  14.3 Warranties, if any, with respect to such software shall only apply as expressly set forth in the applicable end user license agreement. TaskControl hereby expressly disclaims all further representations and warranties of any kind, express or implied, including warranties of merchantability, fitness for any particular purpose or non-infringement with respect to the software. Without limiting the foregoing, TaskControl makes no warranty that: either the Services or Software will meet your requirements; either the Services or Software will be uninterrupted, timely, secure, or error-free. <br>\r\n  14.4 Service and Software Updates. You recognize and agree to the condition that the Services will be updated and modified from time to time. These modifications may take the form of bug fixes, enhanced functions, new modules, changes in the user interface, conformity to new regulations, or other forms. Such updates and modifications can be made without advanced notice. If you download the Software, it may automatically download and install subsequent updates for such Software from TaskControl. These updates are designed to improve, enhance and further develop the Software and may take the form of bug fixes, enhanced functions, new software modules and completely new versions. You agree to receive such updates (and permit TaskControl to deliver these to you) as part of your use of the Software.<br>  \r\n  <br>\r\n  <strong>15. FORCE MAJEURE<br>\r\n  <br>\r\n</strong>15.1 Under no circumstances shall TaskControl be held liable for any delay or failure or disruption of the content or services delivered through the Site resulting directly or indirectly from acts of nature, forces or causes beyond our reasonable control, including without limitation, Internet failures, computer, telecommunications or any other equipment failures, electrical power failures, strikes, labor disputes, riots, insurrections, civil disturbances, shortages of labor or materials, fires, flood, storms, explosions, acts of God, war, governmental actions, orders of domestic or foreign courts or tribunals or non-performance of third parties.<br>\r\n<br>\r\n<strong>16. INTELLECTUAL PROPERTY RIGHTS<br>\r\n  <br>\r\n</strong>16.1 TaskControl is the sole owner or lawful licensee of all the rights and interests in the Site and the Site Content, Services and any feature within the Services. The Site, Site Content and Services embody trade secrets and other intellectual property rights protected under worldwide copyright and other laws. All title, ownership and intellectual property rights in the Site and Site Content shall remain with TaskControl, our affiliates or licensors of the Site Content, as the case may be. All rights not otherwise claimed under the Terms or by TaskControl are hereby reserved.<br>\r\n  16.2 &quot; TaskControl &quot; and related icons and logos are registered trademarks or service marks of TaskControl and are protected under applicable copyright, trademark and other proprietary rights laws. The unauthorized copying, modification, use or publication of these marks is strictly prohibited.<br>\r\n  16.3 TaskControl may have independent third parties involved in the provision of the Services (e.g., the authentication and verification service providers or payment platform). You may not use any trademark, service mark or logo of such independent third parties without prior written approval from such parties.<br>  \r\n  <br>\r\n  <strong>17. NOTICES<br>\r\n  <br>\r\n</strong>17.1 All legal notices or demands to or upon TaskControl shall be made in writing and sent to TaskControl personally to the following entity and address:TaskControl, Drago 57, 8th Floor &quot;F&quot; , 8000 Bahia Blanca, Buenos Aires, Argentina. The notices shall be effective when they are received by TaskControl in the above-mentioned manner.<br>\r\n<br>\r\n<strong>18. GENERAL PROVISIONS<br>\r\n  <br>\r\n</strong>18.1 Subject to any Additional Agreements, the Terms constitute the entire agreement between you and TaskControl with respect to and govern your use of the Site and Services, superseding any prior written or oral agreements in relation to the same subject matter herein.<br>\r\n  18.2 TaskControl and you are independent contractors, and no agency, partnership, joint venture, employee-employer or franchiser-franchisee relationship is intended or created by the Terms.<br>\r\n  18.3 If any provision of the Terms is held to be invalid or unenforceable, such provision shall be deleted and the remaining provisions shall remain valid and be enforced.<br>\r\n  18.4 Headings are for reference purposes only and in no way define, limit, construe or describe the scope or extent of such section.<br>\r\n  18.5 TaskControl failure to enforce any right or failure to act with respect to any breach by you under the Terms will not constitute a waiver of that right nor a waiver of TaskControl&rsquo;s right to act with respect to subsequent or similar breaches.<br>\r\n  18.6 TaskControl shall have the right to assign the Terms (including all of our rights, titles, benefits, interests, and obligations and duties in the Terms to any person or entity (including any affiliates of TaskControl). You may not assign, in whole or part, the Terms to any person or entity.<br>\r\n  18.7 These Terms shall be governed by and construed in accordance with the laws of Argentina, excluding its conflict of law rules. You further expressly consent and agree to submit to the exclusive jurisdiction and venue of a court of competent jurisdiction located in Buenos Aires, Argentina.<br>\r\n  18.8 Should you choose to provide inputs, ideas and/or suggestions regarding problems with or proposed modifications or improvements to the Websites and Services (“Feedback”) then you hereby grant to us an unrestricted, perpetual, irrevocable, non-exclusive, fully-paid, royalty-free right to exploit the Feedback in any manner and for any purpose, including to improve the Websites and Services and create other products and services.<br>\r\n  18.9 You grant us permission to include your name, logos, and trademarks in our promotional and marketing materials and communications.<br>\r\n  18.10 We may offer \"beta\" versions or features of the Services (each, a \"Beta Service\"). Any production candidate or non-production version of Services or other version of the Services designated as a beta or testing version is considered a Beta Service under this TOS. We will determine, at our sole discretion, the availability, duration, features, and components of each Beta Service. If we permit you to use a Beta Service, you agree that information we provide relating to the Beta Service is Confidential Information, and you specifically agree, in addition to the other requirements set forth in this TOS, to not: (i) use the Beta Service for benchmarking or performance testing or to publicly disseminate performance information or analysis from any source relating to the Service; (ii) modify or create derivative works of the Beta Service or remove any product identification, proprietary, copyright or other notices contained in the Beta Service; or (iii) allow any other individual to access or use the Beta Service. We, at our sole discretion, shall determine whether or not to continue to offer any Beta Service, and may cease offering any Beta Service at any time.<br>\r\n</p>\r\n<p class=\"Estilo4\"></p>\r\n<p class=\"Estilo1\">&nbsp;</p>\r\n</body>\r\n</html>\r\n'),(13,'Tour','works','<br>TOUR of works'),(17,'Become A Buyer','works','Become A Buyer'),(18,'Terms And Conditions','works','<p><strong>TERMS AND CONDITIONS<br>\n    <br>\n</strong>Please review carefully the terms and conditions set forth below before using the TaskControl.net web site. The terms \"You\", \"Your\", \"User\", or \"Users\" refer to anyone accessing our services or web site for any reason. The terms \"We\", \"Us\", or \"Our\" refer to TaskControl.net (or TaskControl.net). The TaskControl.net web site is offered to you conditionally on your acceptance of the terms, conditions, restrictions and notices contained herein. TaskControl.net may amend or modify these terms and conditions without notice, effective immediately, by updating this posting. Your use of the TaskControl.net web site constitutes your agreement to all such terms, conditions, restrictions and notices.\n<br>\n<br>\n<strong>ELIGIBILITY FOR REQUIREMENTS<br>\n  <br>\n</strong>TaskControl.net shall have absolute discretion as to whether or not it accepts a particular applicant or site for participation in the service. TaskControl.net\\\'s web site is available only to individuals who can form legally binding contracts under applicable law. The services of this web site are not available to minors. If Users do not qualify, they cannot legally use any of TaskControl.net\\\'s services including, but not limited to, those that require the User\\\'s ability to form legally binding contracts.<br>\n<br>\n<strong> REMOVAL FROM NETWORK<br>\n  <br>\n</strong>TaskControl.net reserves the right to terminate the participation of any member or site without reason but expressly including any member site that TaskControl.net judges to be in violation of the terms and conditions. Members in violation of TaskControl.net\\\'s Terms and Conditions will be immediately deactivated. TaskControl.net may deactivate members with no prior notification. Members found in violation of the Terms and Conditions will not receive any credit or payment from TaskControl.net. Members that are terminated by TaskControl.net on any basis other than violation of these Terms and Conditions will be entitled to receive any payment due from TaskControl.net.\n           \n-<br>\n<br>\n<strong>DESCRIPTION OF SERVICES<br>\n  <br>\n</strong>TaskControl.net offers a wide range of tools, content, products, services, benefits, and other resources on its web site. These services are for use only under a non-exclusive, non-transferable, and non-assignable license under these terms and conditions of use. You do not have the right to copy, sell, or otherwise exploit for any commercial purpose the services or content (in whole or in part), access to this service or use of this service. Some of the services offered at TaskControl.net may include feedback to questions by Users of this service and/or articles with original content and opinions. Use of this content or links to this content is at the User\\\'s own risk.\n              \nUser understands and agrees to the following:Some of the content provided at TaskControl.net may relate to various subjects such as information pertaining to tax guidance, legal matters, financial matters, and other matters for which the content of is provided in an advisory nature. This information is provided solely for informational and general non-advisory purposes. If desired, Users should use their own efforts to confirm such information with a professional(s) in the pertinent field(s). All of the information that TaskControl.net provides should not be considered professional, medical, legal, technical, or any other discipline-specific advice.\n              \nTaskControl.net is a dynamic time-sensitive web site. As such, the information on TaskControl.net will be changed frequently. It is possible that some information could be considered offensive, harmful, or inaccurate, and in some cases may be mislabeled or deceptively labeled accidentally by TaskControl.net or accidentally or purposefully by a third-party, regardless of whether such third parties are with or without a legitimate business purpose.\n              \nTaskControl.net provides unmonitored access to third-party content. TaskControl.net is only acting as a venue and/or portal, and has no liability based on, or related to, the third-party content on this Site, whether arising under the laws of copyright or other intellectual property, defamation, libel, privacy, obscenity, or any other legal discipline. This web site may contain links to third-party web sites. TaskControl.net does not control nor always review the web sites to which we link from TaskControl.net. We, therefore, cannot endorse the content, products, services, practices, policies, or performance of the web sites we link to from TaskControl.net, and Users should not treat any link as such an endorsement or acceptance of veracity or value.\n              \nTaskControl.net does not have the resources to nor does it undertake any obligation to, control, research, verify, validate, or approve the content that is received or viewed on its web site. We expect that the User will undertake necessary activities and practices and will use caution and common sense when using TaskControl.net.\n               \n-<br>\n<br>\n<strong> PAYMENTS<br>\n  <br>\n</strong>GoitGlobal will send payments through the payments gateways services if the member requests it and their account balance is equal to or greater than $50. All amounts are stated in and all payments will be made in US funds. GoitGlobal reserves the right to suspend a withdrawal if the source of the funds is suspected to be fraudulent. Any funds received from an account having made a fraudulent deposit (e.g. stolen credit card) will be reversed immediately. If in a fraudulent payment situation a withdrawal has already been processed, you will be expected to return the funds to your GoitGlobal account or face account termination.As previously stated, any member site that GoitGlobal removes from the service due to violation of the Terms and Conditions will receive no credit or payment .\n                   \n-<br>\n<br>\n<strong>E-MAIL ADDRESSES<br>\n  <br>\n</strong>Members agree not to post their e-mail address on the site, except in the \"e-mail\" field of the signup form, or when asked by TaskControl.net at any other time. There should be no need to give anyone your e-mail address. It is automatically provided if you choose a Freelancer (or you are the Freelancer chosen for) a Project Request, and before that time you can use the message board to communicate. This does not only apply to e-mail addresses, but to all methods of communication, including phone, Facebook, ICQ, AIM, MSN Messenger, Skype etc... See \"Avoiding Commissions\" below for the reason.\n                       \n- <br>\n<br>\n<strong>PROVIDING CONTACT INFORMATION<br>\n  <br>\n</strong>You are prohibited from making direct contact with another member, unless it\\\'s for a Project Request you have been picked for, or you have picked a Freelancer for. This includes giving out your e-mail address, ICQ/MSN/Skype number, phone number, or any other method of contact outside of this site. TaskControl.net provides you with message boards, which should be sufficient for pre-Project Request planning.\n                           \n-<br>\n<br>\n<strong>AVOIDING COMMISSIONS<br>\n  <br>\n</strong>You are strictly prohibited from attempting to negotiate the fee for a project with another member directly (outside of GoitGlobal) after that project has been created/opened and before that project has been closed (basically, during an ongoing project). But this also applies to any project that was closed without a Freelancer being chosen, and then contacting them about the project anyway. Both parties are responsible for notifying GoitGlobal if the payment amount increases (above the bid amount) after the project is closed. Receiving a larger amount than the original project bid, without notifying us, will be considered an attempt to avoid the commissions.\n                            When a Freelancer requests a withdrawal, we always review all payments received for each project to verify that they match the bid. If at the time of a withdrawal request the Freelancer has failed to notify GoitGlobal staff of a payment received above the amount of his bid (a total payment above US$ 100), GoitGlobal reserves the right to deduct double the fee for the amount that should have been reported. We believe our commissions are very fair and justified for the service we provide, therefore we will absolutely not tolerate any of this activity on GoitGlobal.\n                             \n-<br>\n<br>\n<strong>COPYRIGHTS<br>\n  <br>\n</strong>No copyrighted material can be posted on GoitGlobal. This includes programming-related content, scripts or code which is sold or owned by the author, or graphic design content which is sold or owned by the author. Only posting sections, excerpts or examples of such content, will be permitted. A \"section\" or \"excerpt\" being no more than 10% of the original content, and \"example\" being a draft or pseudo-coded program. This is necessary to protect the author\'s intellectual property rights.\n                                 \n-<br>\n<br>\n<strong>ELIGIBILITY FOR REQUIREMENTS<br>\n  <br>\n</strong>TaskControl.net shall have absolute discretion as to whether or not it accepts a particular applicant or site for participation in the service. TaskControl.net\\\'s web site is available only to individuals who can form legally binding contracts under applicable law. The services of this web site are not available to minors. If Users do not qualify, they cannot legally use any of TaskControl.net\\\'s services including, but not limited to, those that require the User\\\'s ability to form legally binding contracts.\n                                     \n-<br>\n<br>\n<strong>MODIFICATIONS<br>\n  <br>\n</strong>TaskControl.net reserves the right to change the Terms of Service at any time. It is the member\\\'s responsibility to check these Terms and Conditions from time to time for such changes. In the event TaskControl.net offers any additional or replacement services then this agreement shall apply to such services in the absence of any new agreement specific to such services which is entered into between the parties.\n                                         \n- <br>\n<br>\n<strong>USER CONTENT<br>\n  <br>\n</strong>User is solely responsible for content or any other information User provides to TaskControl.net. User understands and agrees to the following:\n                                            \nTaskControl.net is only acting as a venue for the online distribution and publication of User content. However, no warranties as to the actual distribution or publication of User content are made or implied. TaskControl.net has the right (but no obligation) to take any action deemed appropriate with respect to User content if it is believed that such content may create liability for TaskControl.net, harm our business operation or reputation, or cause TaskControl.net to lose the services of our suppliers. User represents and warrants that User\\\'s content:  \n                                            \n(a) will not infringe upon or misappropriate any copyright, patent, trademark, trade secret, or other intellectual property right or proprietary right or right of publicity or privacy;\n                                            \n(b) will not violate any law or regulation;\n                                            \n(c) will not be defamatory or trade libelous;\n                                            \n(d) will not be obscene or contain child pornography;\n                                            \n(e) will not include incomplete, false or inaccurate information about User or any other individual; and\n                                            \n(f) will not contain any viruses or other computer programming routines that are intended to damage, detrimentally interfere with, surreptitiously intercept or expropriate any system, data or personal information. \n                                            \nBy submitting User content to TaskControl.net (including, but not limited to creating your Account; posting a resume, posting a profile, posting a portfolio, posting a Project Request; sending messages through or to TaskControl.net). You hereby grant to TaskControl.net a worldwide, perpetual, irrevocable, royalty-free license to use, copy, modify, display, and perform User content, under all User intellectual property and proprietary rights worldwide.\n                                            \nFor the avoidance of doubt, providing links to content hosted on servers other than that of TaskControl.net will not be considered \\\"submitting\\\" such content for purposes of this license grant. Such license cover exclusively the User content submitted directly to TaskControl.net, and does not apply to the work performed by the user as a consequence of the use of TaskControl.net. All the rights for the work performed remain property of the lawful owner.<br>\n<br>\n<strong>USER RESTRICTIONS<br>\n  <br>\n</strong>- Advertising\n                                                \nUsers are prohibited from advertising your website on TaskControl.net. Any URL posted in a bid, Project Request description, or the message board, must relate to a Project Request on TaskControl.net. An example of a permissible URL: User\\\'s portfolio or resume\\\' page.<br>\n<br>\n- Bidding Freelancers can only place bids that equal the total amount of money they are requesting for the Project Request. You cannot post an hourly bid or any other abnormal type of bid. This applies to Project Buyers too. Project Buyers cannot create Project Requests that directly or indirectly require Freelancers to place hourly or other abnormal bids.<br>\n<br>\n- Hirer agrees that:<br>\n<br>\n* Hirer will not redistribute any of the content on TaskControl.net.<br>\n* Hirer will not use Hirer\\\'s Account to post false or misleading Project Request descriptions.<br>\n* Hirer will not post Project Request descriptions that are inappropriate to TaskControl.net\\\'s audience, viewers, or visitors in the judgment and discretion of TaskControl.net.<br>\n* Hirer will not falsify Hirer\\\'s own or any other identity.<br>\n* Hirer will comply with all TaskControl.net\\\'s policies.<br>\n<br>\n- Freelancer agrees that:<br>\n<br>\n* Freelancer will not redistribute any of the content on TaskControl.net.<br>\n* Freelancer will not falsify Freelancer\\\'s own or any other identity.<br>\n* Where required they will obtain suitable identification to satisfy money laundering requirements<br>\n* Freelancer will comply with all TaskControl.net policies.<br>\n<br>\n- General Restrictions</p>\n<p>* Users will not use any automated collection mechanism or any manual process to monitor or copy the web pages comprising the TaskControl.net web site or the \n                                                        content contained therein without the prior written permission of TaskControl.net.<br>\n  * Users (Hirers and Freelancers) will not distribute unsolicited commercial messages (\"spam\") through User\\\'s account.<br>\n  * Users (Hirers and Freelancers) will not contact employers or Freelancers through our site or through information gained from our site with the intent of subverting them from using our services.<br>\n  * Users (Hirers and Freelancers) will not engage in personal attacks, negative or other unfair criticism or other forms of discourteous and unprofessional online conduct or practices.\n                                                             \n  <br>\n  <br>\n '),(6,'PROJECT REQUEST GUIDELINES','works','<h3>How do I open a new project?</h3>\r\n\r\n<p>Click on the &#39;Post project&#39; link on the header to land on the New project page. Select up to three job types and then give a description of the project. You may attach a file if you want (2,5 mb max uploading). Fill in the rest of the fields and then click on &#39;Submit project&#39;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>How do I close, cancel or extend my project?</h3>\r\n\r\n<p>Log in to your account, click on the &#39;Buyer Activity&#39; link and choose the applicable option. A menu will be displayed for you to make changes or close a project by selecting a provider. You are also given the possibility to extend your project duration up to 7 days more.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Why must I fill the &#39;Days open for bidding&#39; field in?</h3>\r\n\r\n<p>Providers need to know how much time is available for bidding before project ends. This gives everyone a guideline to work within. However, you can extend the bidding time of your project any time.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>What is a budget range?</h3>\r\n\r\n<p>The budget range is an approximate estimate of how much you are willing to pay for a specific project. You define your budget range by choosing a minimum and a maximum spending limits. This is necessary because it helps providers deciding on how much to bid.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Can I re-open a closed project?</h3>\r\n\r\n<p>No. You need to post a new project.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>What does it mean that a project is frozen?</h3>\r\n\r\n<p>A project is frozen when the bidding period expires. When the project is frozen, it&#39;s your time to either select a provider or extend the bidding time. project will continue to be frozen until the selected provider accepts (or rejects) your project.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>What would happen if for any reason the project failed?</h3>\r\n\r\n<p>Goitglobal only gets you in touch with outsourcers from all over the world. It is not responsible for any project&#39;s failure. Goitglobal will not provide for arbitration between the parts, who should find a solution by themselves.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Providers - Bidding on projects FAQ</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>How do I place a bid on a project?</h3>\r\n\r\n<p>Click the &#39;Place Bid&#39; link on the project page. You will be redirected to the bid page, where you can enter the bid amount, provide an estimated time for the project completion and add details of your bid (optional). When placing a bid, you can choose to be notified via e-mail when lower bids are placed on the same project by checking the corresponding box. All bids are reviewed manually, they will appear to be delayed as it takes time to do this review. The reviewing staff will check for contact information, any information of this kind will be edited out.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Can I change a bid I have already placed on a project?</h3>\r\n\r\n<p>Yes, you can change your bid by clicking the place bid button again. The buyer will see your latest bid.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Can I cancel a bid I have already placed?</h3>\r\n\r\n<p>Yes, you can cancel your bid by going to the &#39;My Account&#39; area, clicking the &#39;provider activity&#39; link and then the &#39;Retract your bid&#39; button.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Can I ask a question about a posted project?</h3>\r\n\r\n<p>If you need to ask a buyer a question to get any details about the project, you can post a message either on the public or the private message board. You can access these boards by clicking on one of the corresponding text links on the project page.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Can I estimate the cost of a project when bidding?</h3>\r\n\r\n<p>You shouldn&#39;t estimate the cost of a project and post it as a bid.You could end up bidding yourself too high, or on the other end, you could put in a lot of work and not be receiving adequate compensation. When you place a bid, you enter into a tax binding contract and you would be required to perform the work for the amount you have bid. If you require more information to make an accurate bid, you can use the public and private message boards.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Terms And Conditions FAQ</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Can I provide my contact information?</h3>\r\n\r\n<p>No. We get buyers and providers in touch with each other for very small fees. Exchanging of contact information is therefore not allowed. Your account will be suspended and your funds frozen if you do.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>What kind of projects is it not allowed to post?</h3>\r\n\r\n<p>Projects requiring illegal software, illegal hacking or spamming tools are strictly forbidden. It is also forbidden to post projects for purposes of advertising products, services or websites.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>What happens if I violate the terms?</h3>\r\n\r\n<p>Your account will be temporarily suspended for minor violations. Repeated offenses or more serious violations can result in cancellation or banning of your account.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>What if I commit a violation without knowing it?</h3>\r\n\r\n<p>Upon registering with Goitglobal, it is your responsibility to read and understand the terms and conditions of this site. You must accept them in order to successfully sign up. Ignorance of the terms and conditions is no excuse.</p>\r\n'),(4,'Contact Us','works','<a href=\"mailto:contactus@taskcontrol.net\">'),(8,'Features','Product Features','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n\"http://www.w3.org/TR/html4/loose.dtd\">\r\n<html>\r\n<head>\r\n<title>Documento sin t&iacute;tulo</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n</head>\r\n\r\n<body>\r\n<h4><br>\r\n  TaskControl has the following features:<br>\r\n</h4>\r\n<blockquote>\r\n  <h5>1- Scope Management</h5>\r\n  <h5>2- Time Management</h5>\r\n  <h5>3- Cost Management<br>\r\n    </h5>\r\n</blockquote>\r\n<h5>We based all our product on PMI (Project Management Institute) guidelines.<br>\r\n  Take a tour over the demos to check how it will help you in the daily project management.<br>\r\n</h5>\r\n</body>\r\n</html>\r\n'),(9,'Pricing','Plans','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n\"http://www.w3.org/TR/html4/loose.dtd\">\r\n<html>\r\n<head>\r\n<title>Documento sin t&iacute;tulo</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n<style type=\"text/css\">\r\n<!--\r\n.Estilo4 {font-family: \"Times New Roman\", Times, serif}\r\n-->\r\n</style>\r\n</head>\r\n\r\n<body>\r\n<h4>PLAN SUBSCRIPTION PRICING\r\n  <br>\r\n  <br>\r\n            \r\nStarter Plan:<br>\r\n \r\n(includes TaskControl Project Management Software Tool over a 512 MB RAM, 20 GB HD, 1 CPU VPS ,1 Weekly Backup). Unlimited Projects, Unlimited Users..................... USD 12<br>\r\n  <br>\r\n  Medium Size Plan:<br>\r\n  (includes TaskControl Project Management Software Tool over a 1 GB MB RAM, 30 GB HD, 1 CPU VPS, 1 Weekly Backup). Unlimited Projects, Unlimited Users.....................\r\nUSD 23 <br>\r\n  <br>\r\n  Big Size Plan:<br>\r\n  (includes TaskControl Project Management Software Tool over a 2 GB MB RAM, 40 GB HD, 2 CPUs VPS plus 1 Weekly Backup). Unlimited Projects, Unlimited Users.....\r\n  USD 45.20 <br>\r\n  <br>\r\n  Custom Plan (kindly contact us at: contactus@TaskControl.co). We\'ll arrange a plan to suite your needs. <br>\r\n\r\n    </h4>\r\n  <blockquote>\r\n    <h5>&nbsp; </h5>\r\n    </blockquote>\r\n</body>\r\n</html>\r\n'),(10,'News','News','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n\"http://www.w3.org/TR/html4/loose.dtd\">\r\n<html>\r\n<head>\r\n<title>Documento sin t&iacute;tulo</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n<style type=\"text/css\">\r\n<!--\r\n.Estilo4 {\r\n	font-size: 24px;\r\n	color: #2c3e50;\r\n}\r\n.Estilo5 {color: #0033FF}\r\n.Estilo6 {color: #0000FF}\r\n-->\r\n</style>\r\n</head>\r\n\r\n<body>\r\n<blockquote>\r\n  <h5><span class=\"Estilo4\">We are working actually on these features:</span><span class=\"Estilo5\"><br>  \r\n  </span><br>\r\n  <br>\r\n  <span class=\"Estilo6\">1- Implementing VideoChat for Project Teams </span></h5>\r\n  <h5 class=\"Estilo6\">2- Adjusting Application for Mobiles (Android &amp; iOS) </h5>\r\n  <h5 class=\"Estilo6\">3- Translating Application Catalog in Several Languages </h5>\r\n  <h5 class=\"Estilo6\">4- Forum for TaskControl Community </h5>\r\n  <h5 class=\"Estilo6\">5- Services: Customizing Customer Templates (please ask us) </h5>\r\n  <h5 class=\"Estilo6\">6- We need your feedback to add more features to TaskControl!. We work for you!. Please contactus@taskcontrol.co. </h5>\r\n  <h5 class=\"Estilo6\"><strong><br>\r\n  THANK YOU!</strong></h5>\r\n  <p class=\"Estilo6\">&nbsp;</p>\r\n  <p>&nbsp;</p>\r\n</blockquote>\r\n</body>\r\n</html>\r\n'),(5,'Privacy Policy','Privacy Policy','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n\"http://www.w3.org/TR/html4/loose.dtd\">\r\n<html>\r\n<head>\r\n<title>Documento sin t&iacute;tulo</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n<style type=\"text/css\">\r\n<!--\r\n.Estilo1 {\r\n	font-family: Verdana, Arial, Helvetica, sans-serif;\r\n	font-size: 14px;\r\n}\r\n.Estilo2 {font-size: 18px}\r\n-->\r\n</style>\r\n</head>\r\n\r\n<body>\r\n <p class=\"Estilo1\">&nbsp;</p>\r\n <p class=\"Estilo1 Estilo2\"><strong>PRIVACY POLICY\r\n     </strong>\r\n  </p>\r\n <p class=\"Estilo1\"><strong><br>\r\n Effective Date Jun 1st, 2020 <br>\r\n <br>\r\n </strong>TaskControl is a platform that provides project management services. We operate www.taskcontrol.net (hereinafter referred to as the &ldquo;Site&rdquo;). We recognize the importance of privacy as well as the importance of maintaining the confidentiality of personal information. This Privacy Policy applies to all services provided by us and sets out how we may collect, use and disclose information in relation to users of the Site. If you are a user from the Site you are contracting with TaskControl Drago 57 8th Floor, 8000 Bahia Blanca, Buenos Aires, Argentina (hereinafter referred to as &ldquo;us&rdquo;, &ldquo;we&rdquo;, &ldquo;our&rdquo; or &ldquo;TaskControl&rdquo;). </p>\r\n<p class=\"Estilo1\">All capitalized terms not defined in this document shall have the meanings ascribed to them in the Terms of Service of the Site.<br>\r\n  You may use our services and products via mobile device either through mobile applications or mobile optimized websites. This Privacy Policy also applies to such use of our services and products.<br>\r\n  <br>\r\n  <br>  \r\n  <strong>A. COLLECTION OF INFORMATION</strong><br>\r\n  <br>  \r\n  1. Your privacy is important to us and we have taken steps to ensure that we do not collect more information from you than is necessary for us to provide you with our services and to protect your account.<br>\r\n  2. Information including, but not limited to, name, surname, address, phone number, email address, language and user preferences (&quot;Registration Information&quot;) may be collected at the time of user registration on the Site.<br>\r\n  3. In connection with any transaction and payment services, information, including but not limited to, bank account numbers, billing information, credit/debit card numbers and expiration dates (&quot;Account Information&quot;) may be collected to, among other things, to facilitate the payment of services through the Site.<br>\r\n  4. We record and retain details of users&rsquo; activities on the Site. Information relating to such transactions including, but not limited to, the types and specifications of the services that the user requires (&ldquo;Activities Information&rdquo;).<br>\r\n  5. We record and retain records of users\' browsing activities on our platform including but not limited to IP addresses, browsing patterns and user behavioral patterns. In addition, we gather statistical information about the Site and visitors to the Site including, but not limited to, IP addresses, browser software, operating system, software and hardware attributes, pages viewed, number of sessions and unique visitors (together &quot;Browsing Information&quot;).<br>\r\n  6. Registration Information, Account Information, Activities Information and Browsing Information generally relate to business entities and are together referred to as business data (&ldquo;Business Data&rdquo;). Insofar and only insofar as they constitute personally identifiable data of living individuals, such information is together referred to as personal data (&ldquo;Personal Data&rdquo;).<br>\r\n  7. It is mandatory for users of the Site to provide certain categories of Business Data and Personal Data (as specified at the time of collection). In the event that users do not provide any or sufficient Business Data and/or Personal Data marked as mandatory, we may not be able to complete the registration process or provide such users with our products or services.<br>\r\n  <br>\r\n  <br>\r\n  <strong>B. USE OF PERSONAL DATA</strong><br>\r\n  <br>\r\n  If you provide any Personal Data to us, you are deemed to have authorized us to collect, retain and use that Personal Data for the following purposes:<br>\r\n  1. verifying your identity;<br>\r\n  2. verifying your eligibility to register as a user of the Site;<br>\r\n  3. processing your registration as a user, providing you with a log-in identification for the Site and maintaining and managing your registration;<br>\r\n  4. providing you with customer service and responding to your queries, feedback, claims or disputes;<br>\r\n  5. performing research or statistical analysis in order to improve the content and layout of the Site, to improve our product offerings and services and for marketing and promotional purposes;<br>\r\n  6. subject to obtaining your consent in such form as may be required under the applicable law, we (including our Service Providers as defined in C.1 below) may use your name, phone number, residential address, email address and other data (&quot;Marketing Data&quot;) to provide notices, surveys, product alerts, communications and other marketing materials to you relating to products and services offered by us on the Site.<br>\r\n  7. We collect your e-mail address for the purpose of distributing our daily, weekly or monthly newsletter service. The email address provided will be used for delivery of information you have requested from this Site. In order to qualify to receive e-mail related services from TaskControl you will be required to confirm your e-mail address, you will begin to receive newsletter updates from TaskControl until such time that the service is discontinued, or you choose to unsubscribe. <br>\r\n  8. making such disclosures as may be required for any of the above purposes or as required by law, regulations and guidelines or in respect of any investigations, claims or potential claims brought on or against us.<br>\r\n  <br>\r\n  <br>\r\n  <strong>C. DISCLOSURE OF PERSONAL DATA</strong><br>\r\n  <br>\r\n  1. You further agree that we may disclose and transfer (whether within or outside the jurisdiction of the TaskControl entity) your Personal Data to service providers engaged by us to assist us with providing you with our services (including but not limited to data entry, database management, promotions, products and services alerts, payment extension services and verification services) (&quot;Service Providers&quot;). These Service Providers are under a duty of confidentiality to us and are only permitted to use your Personal Data in connection with the purposes specified at B.1 to B.8 above, and not for their own purposes.<br>\r\n  2. You agree that we may disclose and transfer (whether within or outside the jurisdiction of the TaskControl entity), for the purposes specified at B.1 to B.8 above, your Personal Data to other affiliated companies and/or their designated Service Providers of TaskControl.<br>\r\n  3. When necessary we may also disclose and transfer (whether within or outside the jurisdiction of TaskControl entity) your Personal Data to our professional advisers, law enforcement agencies, insurers, government and regulatory and other organizations for the purposes specified at B.8 above.<br>\r\n  4. Any Personal Data supplied by you will be retained by us and will be accessible by our employees, any Service Providers engaged by us and third parties referred to at C.2 and C.3 above, for or in relation to any of the purposes stated in B.1 to B.8 above.<br>\r\n  5. We may share your Account Information with banks or payment platforms to enable your transactions on the Site to be completed. While we have in place up-to-date technology and internal procedures to keep your Account Information and other Personal Data secure from intruders, there is no guarantee that such technology or procedures can eliminate all of the risks of theft, loss or misuse.<br>\r\n  6. We may provide statistical information to third parties, but when we do so, we do not provide personally-identifying information without your permission.<br>\r\n  7. We have established relationships with other parties and websites to offer you the benefit of products and services which we do not offer. We offer you access to these other parties and their websites either through the use of hyperlinks to these sites from the Site. In some cases, you may be required to submit personal information to register or apply for products or services provided by such third parties. This Privacy Policy does not apply to these third-party sites. The privacy policies of those other parties may differ from ours, and we have no control over the information that you submit to those third parties. You should read the relevant privacy policy for those third-party sites before responding to any offers, products or services advertised by those parties.<br>\r\n  <br>\r\n  <br>\r\n  <strong>D. RIGHT TO ACCESS/CORRECT PERSONAL DATA<br>\r\n  </strong><br>\r\n  Under the applicable laws, you have the right of access to personal information held by us and to request correction or deletion of the information.\r\n  If you have any questions regarding this Privacy Policy or if you wish to access or correct your Personal Data, you may send your request in writing to the following address:\r\n  TaskControl Drago 57 8th Floor, 8000 Bahia Blanca,  Buenos Aires, Argentina \r\n  Email privacy@taskcontrol.net \r\n  Ph. 54-11-6925-4009.<br>\r\n  <br>\r\n  <br>\r\n  <strong>E. COOKIES</strong><br>\r\n  <br>\r\n  We use &quot;cookies&quot; to store specific information about you and track your visits to the Site. It is not uncommon for websites to use cookies to enhance identification of their users.<br>\r\n  A &quot;cookie&quot; is a small amount of data that is sent to your browser and stored on your computer\'s hard drive. If you do not de-activate or erase the cookie, each time you use the same computer to access the Site, our web servers will be notified of your visit to the Site and in turn we may have knowledge of your visit and the pattern of your usage.<br>\r\n  Generally, we use cookies to identify you and enable us to i) access your Registration Information or Account Information so you do not have to re-enter it; ii) gather statistical information about usage by users; iii) research visiting patterns and help target advertisements based on user interests; iv) assist our partners to track user visits to the Site and process orders; and v) track progress and participation in promotions.<br>\r\n  You can determine if and how a cookie will be accepted by configuring the browser which is installed in the computer you are using to access the Site. If you choose, you can change those configurations. By setting your preferences in the browser, you can accept all cookies or you can choose to be notified when a cookie is sent or you can choose to reject all cookies. If you reject all cookies by choosing the cookie-disabling function in your browser, you may be required to re-enter information on the Site more often and certain features of the Site may be unavailable.<br>  \r\n  <strong><br>\r\n  <br>\r\n  F. MINORS</strong><br>  \r\n  <br>\r\n  The Site and their contents are not targeted to minors (those under the age of 18) and we do not intend to sell any of our products or services to minors. However, we have no way of distinguishing the age of individuals who access our Site. If a minor has provided us with personal information without parental or guardian consent, the parent or guardian should contact our Legal Department at the address set out in paragraph D above to remove the information.<br>\r\n  <br>\r\n  <br>\r\n  <strong>G. SECURITY MEASURES</strong><br>\r\n  <br>\r\n  We employ commercially reasonable security methods to prevent unauthorized access to the Site, to maintain data accuracy and to ensure the correct use of the information we hold.<br>\r\n  For registered users of the Site, your Registration Information and Account Information (if any) can be viewed and edited through your account, which is protected by a password. We recommend that you do not divulge your password to anyone. Our personnel will never ask you for your password in an unsolicited phone call or in an unsolicited email. If you share a computer with others, you should not choose to save your log-in information (e.g., user ID and password) on that shared computer. Remember to sign out of your account and close your browser window when you have finished your session.<br>\r\n  No data transmission over the internet or any other network (whether wireless or not) can be guaranteed to be perfectly secure. As a result, while we try to protect the information we hold for you, we cannot guarantee the security of any information you transmit to us and you do so at your own risk.<br>\r\n  <br>\r\n  <br>\r\n  <strong>H. CHANGES TO THIS PRIVACY POLICY<br>\r\n  </strong><br>\r\n  Any changes to this Privacy Policy will be communicated by us posting an amended and restated Privacy Policy on the Site. Once posted on the Site the new Privacy Policy will be effective immediately. You agree that any information we hold about you (as described in this Privacy Policy and whether or not collected prior to or after the new Privacy Policy became effective) will be governed by the latest version of the Privacy Policy.<br>\r\n  <br>\r\n  <br>\r\n  <strong>I. YOUR FEEDBACK</strong><br>\r\n  <br>\r\nWe welcome your input regarding our Privacy Policy and any comments on the services we provide to you. You may send us your comments and responses by post to: TaskControl Drago 57 8th Floor, 8000 Bahia Blanca, Buenos Aires, Argentina or by electronic email to privacy@taskcontrol.net.</p>\r\n</body>\r\n</html>\r\n'),(20,'Resellers','professionals','<p>&nbsp;</p>\r\n<h2 style=\"text-align: center;\"><strong>RESELLERS</strong></h2>\r\n<h4><br />If you are interested in being a reseller of our products in your country or area, do not hesitate to contact us <br />now at: <a href=\"mailto:support@taskcontrol.net\">support@taskcontrol.net</a>.</h4>\r\n<h4>The process is really simple:</h4>\r\n<h4>1- Basically it is about knowing the type of industries in which our services will be offered in order to provide the best quality for the customers.</h4>\r\n<h4>2- You will be provided with complete documentation about our services/products.</h4>\r\n<h4>3- A basic test of technical and functional knowledge is performed, which you must answer correctly.</h4>\r\n<h4>4- A Reseller Agreement is signed between YOU and US.</h4>\r\n<h4>5- You are ready to resell our services in your country or area!.</h4>\r\n<h4><br />We will be happy to hear from you!. <br />Let\'s work together...Let\'s make TaskControl Big for all of us!.&nbsp;</h4>\r\n<p class=\"Estilo4\">&nbsp;</p>\r\n<p class=\"Estilo4\">&nbsp;</p>\r\n<p>&nbsp;</p>'),(3,'FAQ','Frequently Asked Questions','<p class=\"Estilo7\">&nbsp;</p>\r\n<p class=\"Estilo7\"><strong>FAQ - FREQUENTLY ASKED QUESTIONS</strong></p>\r\n<p class=\"Estilo4\">&nbsp;</p>\r\n<p class=\"Estilo4\"><br /><strong>1- What is TASKCONTROL? <br /> <br /> </strong><span class=\"Estilo9\"><span class=\"Estilo10\"><strong>TaskControl its a powerfull Project Management Information Software tool based on the best practices compiled by thousand of project managers practitioners all around the globe</strong>. <br /><br /> It allows the creation, plannning, execution and control of any type of projects, wether simple or very complex projects with local or international human resources assigned in <strong>\"teams\"</strong> including the easy generation and edition of documentation, within each area of knowledge and groups of processes as well as creation, editing and control of Tasks (Gantt), Team Capacity, Cost management as well all essential KPI\'s management inherent&nbsp;to each project category metrics. <br /> <br /> It also allows to easily generate billing for customers, and it is a very simple but effective tool for cost management of materials, services and human resources.</span></span><span class=\"Estilo10\"><br /> <strong><br /> </strong>In short, the software you need to manage from simple to complex projects encouraging the application of Agiles Methodologies.</span><strong><br /> <br /> <br /> 2- What are the main features of TASKCONTROL?</strong><br /><span class=\"Estilo10\"><br /> - Agile Oriented Software<br /> - Easy All-Project-Steps Document Generation!<br /> - Automatic Emails Template Generation!<br /> - Progress Management <br /> - Gantt Charts <br /> - Cost Control<br /> - Scope Control<br />- Capacity Report<br /> - Metrics Report (KPIs)<br />- Risks Report<br /> - Easy Billing to Customers <br /> - International Holidays Management <br /> - Team Replacement Management<br />- Too many to mention all of them here..</span></p>\r\n<p class=\"Estilo4\"><span class=\"Estilo10\">Should you want implemented any other general features please contact us at: <a href=\"mailto:support@taskcontrol.net\">support@taskcontrol.net</a>.&nbsp;We will be glad to meet your needs!. <br /> </span><br /> <br /> <strong>3- Why should I use TaskControl and how it can help me in my company?</strong><br /> <br /> <span class=\"Estilo10\">We all know how chaotic it is to manage several projects organized in compliance with the internal and external policies of our company.<br /> <strong>TaskControl</strong>, comes in hand to help a lot in this matter, allowing&nbsp; to effectively and easily control the generation and management of information for internal&nbsp;and external use, all organized under the best practictes framework, which will result in a drastic and increasing improvement of service&nbsp;quality towards your customers and give you peace of mind in the management and controlling of your projects. </span><br /> <br /> <br /> <strong>4- What is the basic architecture of TASKCONTROL?</strong><br /> <br /> <span class=\"Estilo10\"><strong>TaskControl</strong> allows you to create a <strong>company-id</strong> for your company and you can later create several \"customers\" having each one of them an unlimited number of projects and users(members)&nbsp; (depending on the plan you choose). <br /> For example, you could have your company called \"MyCompany\" and within it, you could register and manage your \"customers\" companies (eg client1 with projectA and projectB and client2 with projectsA, projectB and projectC respectively). You can also upload and assign a team of professionals to&nbsp;these customers &amp; projects based on the needs of your planning and from any country all around the globe. In addition, you will be always communicated thru VideoChat with all of them for all your required meeting every day.<br />Also you will have access to the essential reports of Cost, Time and Scope, Quality and Risk allowing you to know the precise situation of each of these variables at each stage of the project by providing corrective actions if necessary.<br /> </span><br /> <br /> <strong>5- Ok, so what Subscription plan should I choose? <br /> </strong><br /> <span class=\"Estilo10\">If you are a freelancer or handle small projects, you could always opt for the <strong>\"Starter Plan \"</strong> and depending on your growth you may need to upgrade to the&nbsp;<strong>\"Professional Plan\"</strong> (the next available plan). If, on the other hand, you have a large company with many customers and projects, what you need is the<strong> \"Enterprise-One Plan\"</strong> that provides you with even more number of projects and users availables.<br /> <br /> In any case you can contact us (<a href=\"mailto:contactus@taskcontrol.net\">contactus@taskcontrol.net</a></span><span class=\"Estilo10\">) previously. We will gladly advise you for the most convenient service plan for your company or specific case/project. </span><br /> <br /> <br /> <strong>6- Can I have several customers under one company-id?<br /> </strong><br /> <span class=\"Estilo10\"><strong>Yes.</strong> TaskControl is a multi-customer, multi-project application within your company (called <strong>company-id</strong> in our context).<br /><br />Only in case you are the owner of more than one company or whose extension and complexity requires it,&nbsp;you should register them separately under another company-id and hire the appropriate Subscription plan for each of them. <br /> Contact us at <a href=\"mailto:contactus@taskcontrol.net\">contactus@taskcontrol.net</a></span><span class=\"Estilo10\"> for possible discounts in the latter case. <br /> </span><br /> <br /> <strong>7- What about Security?<br /> </strong><span class=\"Estilo10\"><br /> All of our applications are based on international data security best practices&nbsp; (the same one used for banks and financial institutions all around the world). All communications are encrypted and you (as the owner) are the only one that can access your private data.<br /><br /><br /></span><strong>8- Will I pay \"extra\" for applications updates? </strong><br /> <span class=\"Estilo10\"><br /> <strong>No.</strong> In <strong>TaskControl</strong>, we believe that the updates of the application, should be paid only with the user\'s monthly Subscription fee, thus providing applications updates without additional extra cost. Only in exceptional cases (such as new versions of the application with major improvements) will we be able to modify the prices of our plans according to the new functionalities implemented. </span><br /> <br /> <br /> <strong>9- Do you have a 24x7 product support? </strong><br /> <span class=\"Estilo10\"><br /><strong>Yes.&nbsp;</strong>Depending on the subscription plan you choose, we\'ll provide 24x7 support thru chat, mail and support tickets for the <strong>\"Enterprise-One Plan\"</strong>. <br />Our priority are our customers, so you can be sure that we will do our best to answer your questions fast and give quick solutions to solve your issues. <br /> You can contact us at any time through the chat, ticket system or by mail to <a href=\"mailto:support@taskcontrol.net\">support@taskcontrol.net</a></span><span class=\"Estilo10\">. </span><br /> <br /> <br /> <strong>10- What about Privacy for my Projects Data? </strong><br /> <br /> <span class=\"Estilo10\"><strong> All your data is private and will remain that way forever.</strong> Our team is exclusively focused on server administration, maintenance of the software and the required infrastructure tasks to continue offering high quality services for our customers in the cloud. If you need more information, please read our <a href=\"#\" target=\"http://www.taskcontrol.net/page_5.html\">Privacy Policy</a> or contact us at <strong>privacy@taskcontrol.net</strong>. <br />We will be pleased to listen from you.&nbsp;<br /> </span><br /> <br /> <strong>11- What about Security for my Company Data? </strong><br /> <br /> <span class=\"Estilo10\">Customer security is our priority. We work to comply with the best international security practices. For all application communication, we use <strong>SSL</strong> certificates (the same ones used by financial entities worldwide) and keeping monitoring services in the cloud as well as specialized firewalls and access control software that allow us to control and repel any unauthorized attempts of entrance to our customer instances. For more technical details, you can contact us at <a href=\"mailto:support@taskcontrol.net\">support@taskcontrol.net</a></span><span class=\"Estilo10\">. <br /> </span><br /> <br /> <strong>12- Why there is no \"FREE\" Subscription plan ? </strong><br /> <span class=\"Estilo10\"><br /> The \"free\" ends up going out expensive. In <strong>TaskControl</strong> we know it and that is why we do not believe that a professional service can be offered for \"free\". Behind each of our plans, there is a technical and human infrastructure impossible to maintain at no cost. Nevertheless, we strive to maintain a basic service (Starter) with a minimum monthly cost that could be well paid with the tools we bring to manage any kind of complexity projects.&nbsp;</span><br /> <span class=\"Estilo10\">Just as a remembering, we offer our customers, email addresses for your company, videochat and any service you might need for your project, that implies you<strong> DON\'T HAVE TO PAY A CENTS TO ANY OTHER COMPANY in the internet!.</strong><br /></span><br /> <strong>Update Jul-20!:</strong> You can also participate in our \"beta tester customer plan\" for free!. For more info, please&nbsp;<span class=\"Estilo10\"><a href=\"mailto:contactus@taskcontrol.net\">contactus@taskcontrol.net</a></span><span class=\"Estilo10\">&nbsp;.</span><br /> <br /><br /> <strong>13- What about Backups for my Data? </strong><br /> <span class=\"Estilo10\"><br /> Our general policy of backup is defined daily with a weekly retention for all the instances of our customers.&nbsp;Also, if required by customers, you can request a specific backup scheme for your company for a small additional monthly cost. <br /> For more information, please can contact us at: <a href=\"mailto:support@taskcontrol.net\">support@taskcontrol.net</a></span><span class=\"Estilo10\">.<br /> </span><br /> <br /> <strong>14- What Payments Options do you offer? </strong><br /> <span class=\"Estilo10\"><br /> Actually, you can easily load and recharge your wallet through Visa Credit Card or Direct Bank Account Transfer.&nbsp;In any case, please contact us to reload your wallet for these or other payment processors for your region at: <a href=\"mailto:billing@taskcontrol.net\">billing@taskcontrol.net</a></span><span class=\"Estilo10\">. <br /> </span><br /> <br /> <strong>15- How do I Buy / Renew my Subscription?</strong><br /> <br /> <span class=\"Estilo10\"><strong>Pretty easy.</strong> When registering with <strong>TaskControl</strong> (for free), you will access to your customer panel. Thru this, you can reload your wallet, choose and buy a plan and see your transactions history.<br />In addition you can modify your data, change your password, invite your colleagues to join TaskControl etc. <br /> Renewals are automatic every 30 days and you only need to worry about having enough funds in your wallet to renew your plan. In case there are not enough funds for renewal, we will give you reasonable advance notice to allow your reload and avoid a potential interruption of service. </span><br /> <br /> <br /> <strong>16- Can I cancel my Subscription ? </strong><br /> <br /> <span class=\"Estilo10\"><strong>Yes</strong>. In case you wish to cancel your Subscription, you can send us an email with the subject \"Please Cancel My Subscription\" to <a href=\"mailto:billing@taskcontrol.net\">billing@taskcontrol.net</a>&nbsp;</span><span class=\"Estilo10\">with 30 days in advance of the requested unsuscription. In this case, please note that we will not provide refunds of the periods previously paid by the user and that any outstanding debt on the part of the same, must be paid in full before proceeding to the request unsuscription.<br /><br /> In <strong>TaskControl</strong> our goal is to provide the best service to our users and that is why before proceeding to the unsuscription we can request a short survey to know the reason for it and so we can constantly improve our services. If you need more information, please read our <a href=\"#\" target=\"http://www.taskcontrol.net/page_2.html\">Terms of Service</a> and <a href=\"#\" target=\"http://www.taskcontrol.net/page_5.html\">Privacy Policy</a>.</span><br /> <br /> <br /> <strong>17- What will happen with all my data should I decide to cancel my Subscription? </strong><br /> <br /> <span class=\"Estilo10\"><strong>No rush.</strong> In that case, you may request, by pre-validated mail, the export of your data from our servers, within a reasonable period of time (no more than 30 days), which we may send in a compressed format and with a unique personal key to the address indicated or to the one you have registered as a TaskControl customer. If you need more information, please read our <a href=\"#\" target=\"http://www.taskcontrol.net/page_5.html\">Privacy Policy</a>.<br /><br /></span><strong><br />18- Our company already has the design of the project documents. Can you customize them for automatic use in TaskControl? <br /> </strong><br /> <span class=\"Estilo10\"><strong>Yes!</strong>. In TaskControl you have 2 ways of creating and editing documents. First, you load them from our templates catalog and then edit it with any available tool as LibreOffice(R), MS-Office(R) etc. Second method is to load them and filling the data easily using our Templates Edition Module (TEM) thru a simple form.<br /><br /> For the latest, you can use our legal documents catalog or we can customize yours so they can be easily created (filling them) in just a few minutes.<br /></span><span class=\"Estilo10\"><strong>Creates new documents for any industry never has been so easy!</strong>!<br />Should you need general support, application or document customization, please contact us at <strong>support@taskcontrol.ne</strong>t.<br /><br /><br /></span><strong>19- What languages are actually available for the templates catalog?</strong><br /> <span class=\"Estilo10\"><br /> At the moment, our templates catalog of documents, are in English and Spanish language respectively. Anyway, we are already working to translate the set of documents into several languages. <br /> If you need the template module translated in a specific language, please contact us at <strong>support@taskcontrol.ne</strong>t. We will do our best to prioritize your request. </span><br /> <br /> <br /> <strong>20- In Short: </strong><br /> <br /> <span class=\"Estilo10\">For <strong>Technical</strong> specific Inquiries, contact us at: <strong>support@taskcontrol.net</strong>.<br /> For <strong>Privacy</strong> specific Inquiries, contact us at: <strong>privacy@taskcontrol.net</strong>.<br /> For <strong>Billing</strong> specific Inquiries,&nbsp; contact us at: <strong>billing@taskcontrol.net</strong>.<br /> For <strong>Other General </strong>Inquiries,&nbsp; contact us at: <strong>contactus@taskcontrol.net</strong>.<br /> <br /> <strong>Let\'s work together to make this community better and bigger !</strong></span></p>\r\n<p class=\"Estilo4\">&nbsp;</p>\r\n<p>&nbsp;</p>'),(19,'Terms of Services & Privacy Policy','Terms of Use & Privacy Policy','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n\"http://www.w3.org/TR/html4/loose.dtd\">\r\n<html>\r\n<head>\r\n<title>Documento sin t&iacute;tulo</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n<style type=\"text/css\">\r\n<!--\r\n.Estilo1 {\r\n	font-family: Verdana, Arial, Helvetica, sans-serif;\r\n	font-size: 14px;\r\n}\r\n.Estilo3 {\r\n	font-family: Verdana, Arial, Helvetica, sans-serif;\r\n	font-size: 18px;\r\n	font-weight: bold;\r\n}\r\n.Estilo4 {font-family: Verdana, Arial, Helvetica, sans-serif}\r\n-->\r\n</style>\r\n</head>\r\n\r\n<body>\r\n<p class=\"Estilo3\"><br>\r\nTERMS OF SERVICES</p>\r\n<p class=\"Estilo1\"><br>\r\n  <strong>Effective Date Jun 1st, 2020<br>\r\n  <br>\r\n  </strong>These Terms of Service constitute an agreement (hereinafter the &ldquo;Agreement&rdquo;) applicable to your access to the website www.taskcontrol.net (hereinafter the &ldquo;Site&rdquo;) and use of our services, software, cloud system and other products (hereinafter collectively as the &ldquo;Services&rdquo;). This document is a legally binding agreement between you as the user of the Site (hereinafter referred to as &ldquo;you&rdquo;, &ldquo;your&rdquo; or &ldquo;User&rdquo;) and TaskControl listed in clause 2.1 below (hereinafter referred to as &ldquo;we&rdquo;, &ldquo;our&rdquo; or &ldquo;TaskControl&rdquo;). <br>\r\n  The user acknowledges that, understands and agrees to be bound by its terms, and that the person signing on its behalf has been authorized to do so. The person executing this agreement on User&rsquo;s behalf represents that he or she has the authority to bind User to these terms and conditions.<br>\r\n  <br>\r\n  <strong>1. APPLICATION AND ACCEPTANCE OF THE TERMS<br>\r\n  <br>\r\n  </strong>1.1 Your use of the Site and TaskControl&rsquo;s Services is subject to the terms and conditions contained in this document, the Privacy Policy and any other rules and policies of the Site that we may publish from time to time, as well as any additional agreement. This document and such other rules and policies of the Site are collectively referred to below as the &ldquo;Terms&rdquo;. &nbsp;By accessing the Site or using the Services, you agree to accept and be bound by the Terms.&nbsp;Please do not use the Services or the Site if you do not accept all of the Terms. &nbsp; <br>\r\n  1.2 You may not use the Services and may not accept the Terms if (a) you are not of legal age to form a binding contract with TaskControl, or (b) you are not permitted to receive any Services under the laws of U.S.A or other countries / regions including the country / region in which you are resident or from which you use the Services.<br>\r\n  1.3 You acknowledge and agree that TaskControl may amend any Terms at any time by posting the relevant amended and restated Terms on the Site.&nbsp;By continuing to use the Services or the Site, you agree that the amended Terms will apply to you.<br>\r\n  1.4 If we posted or provided a translation of the Spanish language version of the Terms, you agree that the translation is provided for convenience only and that the Spanish language version will govern your uses of the Services or the Site.<br>\r\n  1.5 You may be required to enter into a separate agreement, whether online or offline, with TaskControl or our affiliate for any Service (&ldquo;Additional Agreements&rdquo;).&nbsp;If there is any conflict or inconsistency between the Terms and an Additional Agreement, the Additional Agreement shall take precedence over the Terms only in relation to that Service concerned.  <br>\r\n  <br>\r\n  <strong>2. PROVISION OF SERVICES<br>\r\n  <br>\r\n  </strong>2.1 TaskControl that you are contracting with is registered in [Adress], Argentina, who you agree may invoice you for their part of the Services.<br>\r\n  2.2 You must register on the Site in order to access and use some Services. Further, TaskControl reserves the right, without prior notice, to restrict access to or use of certain Services (or any features within the Services) subject to any condition that TaskControl may impose in our discretion.&nbsp;<br>\r\n  2.3 No warranty or representation is given that a particular Service or feature or function thereof or the same type and extent of the Service or features and functions thereof will be available for Users. We may in our sole discretion limit, deny or create different level of access to and use of any Services (or any features within the Services) with respect to different Users.<br>\r\n  2.4 TaskControl may launch, change, upgrade, impose conditions to, suspend, or stop any Services (or any features within the Services) without prior notice except that in case of a fee-based Service, such changes will not substantially adversely affect the paying Users in enjoying that Service.<br>\r\n  <br>\r\n  <strong>3. USERS GENERALLY</strong><br>\r\n  <br>\r\n  3.1 As a condition of your access to and use of the Site or Services, you agree that you will comply with all applicable laws and regulations when using the Site or Services.<br>\r\n  3.2 You agree that (a) you will not copy, reproduce, download, re-publish, sell, distribute or resell any Services or any information, text, images, graphics, video clips, sound, directories, files, databases or listings, etcetera available on or through the Site (the &ldquo;Site Content&rdquo;), and (b) you will not copy, reproduce, download, compile or otherwise use any Site Content or Services for the purposes of operating a business that competes with TaskControl, or otherwise commercially exploiting the Site Content or Services. Systematic retrieval of Site Content from the Site to create or compile, directly or indirectly, a collection, compilation, database or directory (whether through robots, spiders, automatic devices or manual processes) without written permission from TaskControl is prohibited. Use of any content or materials on the Site for any purpose not expressly permitted in the Terms is prohibited. <br>\r\n  3.3 You must read TaskControl&rsquo;s Privacy Policy which governs the protection and use of personal information about Users in the possession of TaskControl and our affiliates. You accept the terms of the Privacy Policy and agree to the use of the personal information about you in accordance with the Privacy Policy.<br>\r\n  3.4 You agree not to undertake any action to undermine the integrity of the software, computer systems or networks of TaskControl and/or any other User nor to gain unauthorized access to such computer systems or networks.<br>\r\n  3.5 By posting or displaying any information, content or material (&ldquo;Public User Content&rdquo;) on the Site or providing any Public User Content to TaskControl or our representative(s), you grant an irrevocable, perpetual, worldwide, royalty-free, and sub-licensable (through multiple tiers) license to TaskControl to display, transmit, distribute, reproduce, publish, duplicate, adapt, modify, translate, create derivative works, and otherwise use any or all of the User Content in any form, media, or technology now known or not currently known, for any purpose which may be beneficial to the operation of the Site or the provision of any Services. You confirm and warrant to TaskControl that you have all the rights, power and authority necessary to grant the above license.<br>\r\n  <br>\r\n  <strong>4. USER ACCOUNT <br>\r\n  <br>\r\n</strong>4.1 User must be registered on the Site to access or use some Services. Except with TaskControl&rsquo;s approval, one User may only register one account on the Site. TaskControl may reject User&rsquo;s application for registration for any reason.<br>\r\n4.2 Upon registering on the Site, TaskControl will assign an account to which User may enter with his / her email and password (the latter will be chosen by a User during registration).<br>\r\n4.3 Each User shall be solely responsible for maintaining the confidentiality and security of his or her password and all activities that occur in the account. No User may share, assign or permit use of the User account or password. The User agrees to notify TaskControl immediately if it becomes aware of any unauthorized use of its password or its account or any other breach of the security of its account.<br>\r\n4.4 User agrees that all activities that occur under your account (including without limitation, posting any information on the Site, upload any information through the Services, clicking to accept any Additional Agreements or rules, subscribing to or making any payment for any Services) will be deemed to have been authorized by the User.<br>\r\n4.5 User acknowledges that sharing of your account with other persons, or allowing multiple users to use your account (collectively, &quot;multiple use&quot;), may cause irreparable harm to TaskControl or other Users of the Site or the Services. User shall indemnify TaskControl, our affiliates, directors, employees, agents and representatives against any loss or damages (including but not limited to loss of profits) suffered as a result of the multiple use of your account. User also agrees that in case of the multiple use of your account or User&rsquo;s failure to maintain the security of your account, TaskControl shall not be liable for any loss or damages arising from such a breach and shall have the right to suspend or terminate User&rsquo;s account without liability to User.<br>\r\n4.6 If a User account is inactive (no subscription payment) during the course of 30 calendar days, this account can be \'disabled\', their data be \'deleted\' and cannot be retrieved without a specific request to TaskControl, by the User of the Services, in case that recovery may be technically possible.<br>\r\n<br>\r\n<strong>5. USER&rsquo;S RESPONSIBILITIES<br>\r\n  <br>\r\n</strong>5.1 Each User represents, warrants and agrees that you have full power and authority to accept the Terms, to grant the authorization and to perform the obligations hereunder; <br>\r\n5.2 User will be required to provide information as part of the registration process on the Site or your use of any Service or the User account.&nbsp;Each User represents, warrants and agrees that (a) such information whether submitted during the registration process or thereafter throughout the continuation of the use of the Site or Services is true, accurate, current and complete, and (b) you will maintain and promptly amend all information and material to keep it true, accurate, current and complete.<br>\r\n5.3 Each User represents, warrants and agrees that (a) you shall be solely responsible for obtaining all necessary third party licenses and permissions regarding any content that you submit or post as a Public User Content; (b) any Public User Content that you submit or post does not infringe or violate any of the copyright, patent, trademark, trade name, trade secrets or any other personal or proprietary rights of any third party (&ldquo;Third Party Rights&rdquo;); <br>\r\n5.4 Each User further represents, warrants and agrees that the Public User Content that you submit, shall:<br>\r\na) be true, accurate, complete and lawful;<br>\r\nb) not be false, misleading or deceptive;<br>\r\nc) not contain information that is defamatory, libelous, threatening or harassing, obscene, objectionable, offensive, sexually explicit or harmful to minors;<br>\r\nd) not contain information that is discriminatory or promotes discrimination based on race, sex, religion, nationality, disability, sexual orientation or age;<br>\r\ne) not violate other Terms or any applicable Additional Agreements;<br>\r\nf) not violate any applicable laws and regulations or promote any activities which may violate any applicable laws and regulations;<br>\r\ng) not contain any link directly or indirectly to any other web sites which includes any content that may violate the Terms.<br>\r\n5.5 Each User further represents, warrants and agrees that you shall/are:<br>\r\na) carry on your activities on the Site and Services in compliance with any applicable laws and regulations;<br>\r\nb) carry on your activities in accordance with the Terms and any applicable Additional Agreements;<br>\r\nc) not use the Services or Site to defraud any person or entity (including without limitation use of stolen credit/debit cards);<br>\r\nd) not impersonate any person or entity, misrepresent yourself or your affiliation with any person or entity;<br>\r\ne) not engage in spamming or phishing;<br>\r\nf) not engage in any other unlawful activities (including without limitation those which would constitute a criminal offence, give rise to civil liability,&nbsp;etcetera) or encourage or abet any unlawful activities;<br>\r\ng) not involve attempts to copy, reproduce, exploit or expropriate TaskControl&rsquo;s various proprietary directories and databases;<br>\r\nh) not involve any computer viruses or other destructive devices and codes that have the effect of damaging, interfering with, intercepting or expropriating any software or hardware system, data or personal information;<br>\r\ni) not involve any scheme to undermine the integrity of the data, systems or networks used by TaskControl and/or any user of the Site or gain unauthorized access to such data, systems or networks;<br>\r\nj) not engage in any activities that would otherwise create any liability for TaskControl or our affiliates.<br>\r\n5.6 User may not use the Services and User account to engage in activities which are identical or similar to TaskControl&rsquo;s marketplace business.<br>\r\n5.7 TaskControl does not endorse, verify or otherwise certify the contents of any comments or information made by any User. Each User is solely responsible for the contents of their communications and may be held legally liable or accountable for the content of their comments or other information.<br>\r\n5.8 User acknowledges and agrees that each User is solely responsible for observing applicable laws and regulations in its respective jurisdictions to ensure that all use of the Site and Services are in compliance with the same.<br>\r\n<br>\r\n<strong>6. BREACHES BY USERS<br>\r\n  <br>\r\n</strong>6.1 If any User breaches any Terms, or if TaskControl has reasonable grounds to believe that a User is in breach of any Terms, TaskControl shall have the right to take such disciplinary actions as it deems appropriate, including without limitation: (i) suspending or terminating the User&rsquo;s account and any and all accounts determined to be related to such account by TaskControl in its discretion; (ii) restricting, downgrading, suspending or terminating the subscription of, access to, or current or future use of any Service; (iii) imposing other restrictions on the User&rsquo;s use of any features or functions of any Service as TaskControl may consider appropriate in its sole discretion; and (iv) any other corrective actions, discipline or penalties as TaskControl may deem necessary or appropriate in its sole discretion. <br>\r\n  6.2 Without limiting the generality of the provisions of the Terms, a User would be considered as being in breach of the Terms in any of the following circumstances:<br>\r\n  a) TaskControl has reasonable grounds to suspect that such User has used a stolen credit card or other false or misleading information in any transaction,<br>\r\n  b) TaskControl has reasonable grounds to suspect that any information provided by the User is not current or complete or is untrue, inaccurate, or misleading, or<br>\r\n  c) TaskControl believes that the User&rsquo;s actions may cause financial loss or legal liability to TaskControl or our affiliates or any other Users.<br>\r\n  6.3 TaskControl reserves the right to cooperate fully with governmental authorities, private investigators and/or injured third parties in the investigation of any suspected criminal or civil wrongdoing.&nbsp;Further, TaskControl may disclose the User\'s identity and contact information, if requested by a government or law enforcement body, an injured third party, or as a result of a subpoena or other legal action. TaskControl shall not be liable for damages or results arising from such disclosure, and User agrees not to bring any action or claim against TaskControl for such disclosure.<br>\r\n  6.4 TaskControl may, at any time and in our reasonable discretion, impose limitations on, suspend or terminate the User&rsquo;s use of any Service or the Site without being liable to the User if TaskControl has received notice that the User is in breach of any agreement and such breach involves or is reasonably suspected of involving dishonest or fraudulent activities.&nbsp;<br>\r\n  6.5 Each User agrees to indemnify TaskControl, our affiliates, directors, employees, agents and representatives and to hold them harmless, from any and all damages, losses, claims and liabilities (including legal costs on a full indemnity basis) which may arise from the use of any Services or the User Data, as well as the use of the Site or from your breach of the Terms.<br>\r\n  6.6 Each User further agrees that TaskControl is not responsible, and shall have no liability to you or anyone else for any User Content (Public User Content or User Data) or other material transmitted over the Site or over the Services, including fraudulent, untrue, misleading, inaccurate, defamatory, offensive or illicit material and that the risk of damage from such material rests entirely with each User. TaskControl reserves the right, at our own expense, to assume the exclusive defense and control of any matter otherwise subject to indemnification by the User, in which event the User shall cooperate with TaskControl in asserting any available defenses.<br>  \r\n  <br>\r\n  <strong>7. SERVICES</strong><br>\r\n  <br>    \r\n  7.1 Use of the Services. During the Term, defined in clause 12.1 below. User may access and use the Services pursuant to: (a) the terms of any outstanding order for access to the Services (&ldquo;Order&rdquo;), including such features and functions as the Order requires; and (b) TaskControl&rsquo;s policies posted on its Site, as such policies may be updated from time to time.<br>\r\n    7.2 Documentation: User may reproduce and use TaskControl\'s standard manuals related to use of the Services (&ldquo;Documentation&rdquo;) solely as necessary to support Users&rsquo; use of the Services.<br>\r\n    7.3 Service fees. User must pay to TaskControl the fee established in each Order (the &quot;Subscription Fee&quot;) for each Term. TaskControl will not refund the Subscription Fee under any circumstances.<br>\r\n    7.4 Services Revisions. TaskControl may revise the functions of the services at any time, including, without limitation, modification or deletion of subsequent functions and features or the reduction of service levels.<br>    \r\n  <br>\r\n    <strong>8. USER DATA<br>\r\n  <br>\r\n</strong>8.1 Use of User Data. Unless it receives User&rsquo;s prior written consent, TaskControl: (a) shall not access, process, or otherwise use User Data other than as necessary to facilitate the Services; and (b) shall not intentionally grant any third party access to User Data, except subcontractors that are subject to a reasonable nondisclosure agreement. Notwithstanding the foregoing, TaskControl may disclose User Data as required by applicable law or by proper legal or governmental authority. <br>\r\n  8.2 Risk of Exposure. User recognizes and agrees that hosting data online involves risks of unauthorized disclosure or exposure and that, in accessing and using the Services, User assumes such risks. TaskControl offers no representation, warranty, or guarantee that User Data will not be exposed or disclosed through errors or the actions of third parties.<br>\r\n  8.3 Data Accuracy. TaskControl shall have no responsibility or liability for the accuracy of data uploaded to the Services by User, including without limitation User Data and any other data uploaded by Users.<br>\r\n  8.4 Data Deletion. TaskControl may permanently erase User Data if User&rsquo;s account is delinquent, suspended, or terminated for 30 days or more.<br>  \r\n  <br>\r\n  <strong>9. CONFIDENTIAL INFORMATION<br>\r\n  <br>\r\n</strong>9.1 &ldquo;Confidential Information&rdquo; refers to the following items that Taskcontrol discloses to User: (a) any document that TaskControl marks &ldquo;Confidential&rdquo;; (b) any information that TaskControl orally designates as &ldquo;Confidential&rdquo; at the time of disclosure, provided TaskControl confirms such designation in writing within 5 business days; (c) the Documentation, whether or not marked or designated confidential; and (d) any other nonpublic, sensitive information User should reasonably consider a trade secret or otherwise confidential. Notwithstanding the foregoing, Confidential Information does not include information that: (i) is in User&rsquo;s possession at the time of disclosure; (ii) is independently developed by User without use of or reference to Confidential Information; (iii) becomes known publicly, before or after disclosure, other than as a result of User&rsquo;s improper action or inaction; or (iv) is approved for release in writing by User. User is on notice that the Confidential Information may include TaskControl&rsquo;s valuable trade secrets.<br>\r\n  9.2 Nondisclosure. User shall not use Confidential Information for any purpose other than use the Services (the &ldquo;Purpose&rdquo;). User: (a) shall not disclose Confidential Information to any employee or contractor of User unless such person needs access in order to facilitate the Purpose and executes a nondisclosure agreement with User with terms no less restrictive than those of this section 9; and (b) shall not disclose Confidential Information to any other third party without TaskControl&rsquo;s prior written consent. Without limiting the generality of the foregoing, User shall protect Confidential Information with the same degree of care it uses to protect its own confidential information of similar nature and importance, but with no less than reasonable care. User shall promptly notify TaskControl of any misuse or misappropriation of Confidential Information that comes to User&rsquo;s attention. Notwithstanding the foregoing, User may disclose Confidential Information as required by applicable law or by proper legal or governmental authority. User shall give TaskControl prompt notice of any such legal or governmental demand and reasonably cooperate with TaskControl in any effort to seek a protective order or otherwise to contest such required disclosure, at TaskControl&rsquo;s expense.<br>\r\n  9.3. Injunction. User agrees that breach of this Article 9 would cause TaskControl irreparable injury, for which monetary damages would not provide adequate compensation, and that in addition to any other remedy, TaskControl will be entitled to injunctive relief against such breach or threatened breach, without proving actual damage or posting a bond or other security.<br>\r\n  9.4. Retention of Rights. This Agreement does not transfer ownership of Confidential Information or grant a license thereto. TaskControl will retain all right, title, and interest in and to all Confidential Information.<br>  \r\n  <br>\r\n  <strong>10. SUPPORT <br>\r\n  <br>\r\n</strong>10.1 Support Service Scope. Support services via email and chat from the Site are covered by this Agreement.<br>\r\n  10.2 User Requirements. User responsibilities and/or requirements in support of this Agreement include: <br>\r\n  - Payment for all support costs at the agreed interval.<br>\r\n  - Description of the user to solve a problem or a request related to the service.<br>\r\n  10.3 Service Availability. Coverage parameters specific to the service(s) covered in this Agreement are as follows:<br>\r\n  - Email support: Monitored 9:00 am. to 5:00 pm. monday &ndash; friday (Argentina time)<br>\r\n  - Emails received outside of office hours will be collected, however no action can be guaranteed until the next working day.<br>  \r\n  <br>\r\n  <strong>11. LIMITATION OF LIABILITY<br>\r\n  <br>\r\n</strong><strong>11.1 USER ACCEPTS THE SITE AND SERVICES &ldquo;AS IS&rdquo; AND AS AVAILABLE, WITH NO REPRESENTATION OR WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NONINFRINGEMENT OF INTELLECTUAL PROPERTY RIGHTS, OR ANY IMPLIED WARRANTY ARISING FROM STATUTE, COURSE OF DEALING, COURSE OF PERFORMANCE, OR USAGE OF TRADE. WITHOUT LIMITING THE GENERALITY OF THE FOREGOING: (a) TASKCONTROL HAS NO OBLIGATION TO INDEMNIFY OR DEFEND USER OR USERS AGAINST CLAIMS RELATED TO INFRINGEMENT OF INTELLECTUAL PROPERTY; (b) TASKCONTROL DOES NOT REPRESENT OR WARRANT THAT THE SITE OR SERVICES WILL PERFORM WITHOUT INTERRUPTION OR ERROR; AND (c) TASKCONTROL DOES NOT REPRESENT OR WARRANT THAT THE SITE OR SERVICES ARE SECURE FROM HACKING OR OTHER UNAUTHORIZED INTRUSION OR THAT USER DATA WILL REMAIN PRIVATE OR SECURE.</strong><br>\r\n  11.2 Any material downloaded or otherwise obtained through the Site or any Service, including but not limited to, the Cloud, is done at each User\'s sole discretion and risk and each User is solely responsible for any damage to User&rsquo;s computer system or TaskControl&rsquo;s computer system or loss of data that may result from the download of any such material. No advice or information, whether oral or written, obtained by any User from TaskControl or through or from the Site shall create any warranty not expressly stated herein.<br>\r\n  11.3 The Site may make available to User services or products provided by independent third parties. We do not have any control over their Services or Products and we do not have any liability for such third parties. <br>\r\n  11.4 Each User hereby agrees to indemnify and save TaskControl, our affiliates, directors, officers and employees harmless, from any and all losses, claims, liabilities (including legal costs on a full indemnity basis) which may arise from such User\'s use of the Site or Services or from your breach of any of the terms and conditions of the Terms. Each User hereby further agrees to indemnify and save TaskControl, our affiliates, directors, officers and employees harmless, from any and all losses, damages, claims, liabilities (including legal costs on a full indemnity basis) which may arise from User\'s breach of any representations and warranties made by User to TaskControl. &nbsp;<br>\r\n  11.5 TaskControl is not responsible and shall have no liability for any material uploaded by Users, including defamatory, offensive or illicit material and that the risk of damages from such material rests entirely with each User. TaskControl reserves the right, at our own expense, to assume the exclusive defense and control of any matter otherwise subject to indemnification by the User, in which event the User shall cooperate with TaskControl in asserting any available defenses. <br>\r\n  11.6 TaskControl shall not be liable for any special, direct, indirect, punitive, incidental or consequential damages or any damages whatsoever (including but not limited to damages for loss of profits or savings, business interruption, loss of information), whether in contract, negligence, tort, equity or otherwise or any other damages resulting from any of the following.<br>\r\n  a) the use or the inability to use the Site or Services;<br>\r\n  b) any defect in data, information or services;<br>\r\n  c) violation of Third Party Rights or claims;<br>\r\n  d) unauthorized access by third parties to data or private information of any User;<br>\r\n  e) statements or conduct of any User of the Site; or;<br>\r\n  f) any matters relating to Services however arising, including negligence.<br>\r\n  g) use of the Site for hacking in any way possible current or in the future.<br>\r\n  11.7 Notwithstanding any of the foregoing provisions, the aggregate liability of TaskControl, our employees, agents, affiliates, representatives or anyone acting on our behalf with respect to each User for all claims arising from the use of the Site or Services during any calendar year shall be limited to the greater of the amount of fees the User has paid to TaskControl during the calendar year. The preceding sentence shall not preclude the requirement by the User to prove actual damages. All claims arising from the use of the Site or Services must be filed within one (1) year from the date the cause of action arose or such longer period as prescribed under any applicable law governing this Term of Use.<br>\r\n  11.8 The limitations and exclusions of liability to you under the Terms shall apply to the maximum extent permitted by law and shall apply whether or not TaskControl has been advised of or should have been aware of the possibility of any such losses arising.<br>\r\n  11.9 TaskControl does not guarantee that the Services, or any portion thereof, will function on any particular hardware or devices. You understand and acknowledge that the Services may be subject to malfunctions and delays inherent in the use of the Internet and electronic communications. You are responsible for any and all software and hardware requirements necessary or preferable for using the Services, including but not limited to acquiring and updating compatible hardware or devices necessary to access and use the Services and Applications and any updates thereto, as well as obtaining the data network access necessary to use the Services. <br>\r\n  11.10 User shall defend, indemnify, and hold harmless TaskControl against any &ldquo;Indemnified Claim,&rdquo; meaning any third party claim, suit, or proceeding arising out of or related to User\'s alleged or actual use of, misuse of, or failure to use the Services, including without limitation: (a) claims by Users or by User\'s employees, as well as by User&rsquo;s own customers (if any); (b) claims related to unauthorized disclosure or exposure of personally identifiable information or other private information, including User Data; (c) claims related to infringement or violation of a copyright, trademark, trade secret, or privacy or confidentiality right by written material, images, logos or other content uploaded to the Services through User&rsquo;s account, including without limitation by User Data; and (d) claims that use of the Services through User&rsquo;s account harasses, defames, or defrauds a third party or violates any other law or restriction. Indemnified Claims include, without limitation, claims arising out of or related to TaskControl&rsquo;s negligence. User&rsquo;s obligations set forth in this Section 10 include retention and payment of attorneys and payment of court costs, as well as settlement at User&rsquo;s expense and payment of judgments. TaskControl will have the right, not to be exercised unreasonably, to reject any settlement or compromise that requires that it admit wrongdoing or liability or subjects it to any ongoing affirmative obligations.<br>  \r\n  <br>\r\n  <strong>12. TERM &amp; TERMINATION<br>\r\n  <br>\r\n</strong>12.1. Term. The term of this Agreement (the &ldquo;Term&rdquo;) shall commence on the date User clicks &ldquo;Accepted and Agreed To&rdquo; on the Site (the &ldquo;Effective Date&rdquo;) and continue for the period set forth in the Order. Thereafter, the Term will renew for successive subscribed periods, unless either party refuses such renewal by written notice 30 or more days before the renewal date.<br>\r\n  12.2. Termination for Cause. Either party may terminate this Agreement for the other&rsquo;s material breach by written notice, effective in 30 days unless the other party first cures such breach. The breach referred to in this clause is based on a failure to abide by the Terms of Service set forth in this Agreement, the Privacy Policies, any other policy or rule set forth by TaskControl on the Site or any additional agreement online or offline.<br>\r\n  12.3. Effects of Termination. Upon termination of this Agreement, User shall cease all use of the Service and delete, destroy, or return all copies of the Documentation in its possession or control. The following provisions will survive termination or expiration of this Agreement: (a) any obligation of User to pay fees incurred before termination; (b) Clauses and Sections related to (Intellectual Property), (Confidential Information), (Limitation of Liability), and (Indemnification); and (c) any other provision of this Agreement that must survive to fulfill its essential purpose.<br>  \r\n  <br>\r\n  <strong>13. FEES AND PAYMENT<br>\r\n  <br>\r\n</strong>13.1 All rights and privileges provided herein to you under these Terms of Service are subject to your payment of applicable fee, if any, to TaskControl, provided however, that TaskControl expressly reserves the right to provide the Services free of charge during the Term, and further provided, that TaskControl, solely at its own discretion and upon termination of this Agreement, may elect to provide the same or similar Services for a fee. <br>\r\n  13.2 Payment for Services shall be at prices as agreed upon between you and TaskControl. TaskControl offers multiple Service Plans for Users, with different fees and functionality features for each plan (&quot;Service Plan&quot;). Payment for a Service Plan, if any, shall be made in advance and is non-refundable, that is there will be no refunds, full or partial. <br>\r\n  13.3 For instance, if you cancel your subscription to your Service plan before it ends, you will still be responsible for paying any applicable fees for the remainder of the selected subscription period. All fees are exclusive of taxes, levies, or duties imposed by taxing authorities; you are responsible for paying any such applicable tax. You acknowledge that the amount billed for the subscription may vary for reasons that include, differing amounts due to promotional offers, differing amounts due to changes in your account, or changes in the amount of applicable sales tax, and you authorize us to bill you for such varying amounts. <br>\r\n  13.4 In case of non-payment for any reason, TaskControl reserves the right to immediately bar the User\'s access to the Services.<br>  \r\n  <br>\r\n  <strong>14. SOFTWARE<br>\r\n  <br>\r\n</strong>14.1 TaskControl may offer certain software, to be used in conjunction with the Services, for downloading from or through this Website (&quot;Software&quot;). Such Software shall be licensed subject to the terms of the applicable End User License Agreement. Both the Software and any accompanying documentation made available through this Website are the copyrighted works of TaskControl. You must agree to the terms of the applicable end user license agreement prior to use of such Software. <br>\r\n  14.2 Except as otherwise specifically provided herein or in the applicable end user license agreement or as otherwise agreed by TaskControl in writing, you may not use, copy, republish, frame, emulate, clone, download, transmit, rent, lease, loan, sell, assign, modify, distribute, license, sublicense, decompile, disassemble, create a derivative work, otherwise reverse engineer, or transfer the licensed program, or any subset of the Website, its products or services. Any such unauthorized use shall result in immediate and automatic termination of this license and may result in criminal and/or civil prosecution. <br>\r\n  14.3 Warranties, if any, with respect to such software shall only apply as expressly set forth in the applicable end user license agreement. TaskControl hereby expressly disclaims all further representations and warranties of any kind, express or implied, including warranties of merchantability, fitness for any particular purpose or non-infringement with respect to the software. Without limiting the foregoing, TaskControl makes no warranty that: either the Services or Software will meet your requirements; either the Services or Software will be uninterrupted, timely, secure, or error-free. <br>\r\n  14.4 Service and Software Updates. You recognize and agree to the condition that the Services will be updated and modified from time to time. These modifications may take the form of bug fixes, enhanced functions, new modules, changes in the user interface, conformity to new regulations, or other forms. Such updates and modifications can be made without advanced notice. If you download the Software, it may automatically download and install subsequent updates for such Software from TaskControl. These updates are designed to improve, enhance and further develop the Software and may take the form of bug fixes, enhanced functions, new software modules and completely new versions. You agree to receive such updates (and permit TaskControl to deliver these to you) as part of your use of the Software.<br>  \r\n  <br>\r\n  <strong>15. FORCE MAJEURE<br>\r\n  <br>\r\n</strong>15.1 Under no circumstances shall TaskControl be held liable for any delay or failure or disruption of the content or services delivered through the Site resulting directly or indirectly from acts of nature, forces or causes beyond our reasonable control, including without limitation, Internet failures, computer, telecommunications or any other equipment failures, electrical power failures, strikes, labor disputes, riots, insurrections, civil disturbances, shortages of labor or materials, fires, flood, storms, explosions, acts of God, war, governmental actions, orders of domestic or foreign courts or tribunals or non-performance of third parties.<br>\r\n<br>\r\n<strong>16. INTELLECTUAL PROPERTY RIGHTS<br>\r\n  <br>\r\n</strong>16.1 TaskControl is the sole owner or lawful licensee of all the rights and interests in the Site and the Site Content, Services and any feature within the Services. The Site, Site Content and Services embody trade secrets and other intellectual property rights protected under worldwide copyright and other laws. All title, ownership and intellectual property rights in the Site and Site Content shall remain with TaskControl, our affiliates or licensors of the Site Content, as the case may be. All rights not otherwise claimed under the Terms or by TaskControl are hereby reserved.<br>\r\n  16.2 &quot; TaskControl &quot; and related icons and logos are registered trademarks or service marks of TaskControl and are protected under applicable copyright, trademark and other proprietary rights laws. The unauthorized copying, modification, use or publication of these marks is strictly prohibited.<br>\r\n  16.3 TaskControl may have independent third parties involved in the provision of the Services (e.g., the authentication and verification service providers or payment platform). You may not use any trademark, service mark or logo of such independent third parties without prior written approval from such parties.<br>  \r\n  <br>\r\n  <strong>17. NOTICES<br>\r\n  <br>\r\n</strong>17.1 All legal notices or demands to or upon TaskControl shall be made in writing and sent to TaskControl personally to the following entity and address:TaskControl SaaS. Drago 57, 8th Floor &quot;F&quot; , 8000 Bahia Blanca, Pcia. Buenos Aires, Argentina. The notices shall be effective when they are received by TaskControl in the above-mentioned manner.<br>\r\n<br>\r\n<strong>18. GENERAL PROVISIONS<br>\r\n  <br>\r\n</strong>18.1 Subject to any Additional Agreements, the Terms constitute the entire agreement between you and TaskControl with respect to and govern your use of the Site and Services, superseding any prior written or oral agreements in relation to the same subject matter herein.<br>\r\n  18.2 TaskControl and you are independent contractors, and no agency, partnership, joint venture, employee-employer or franchiser-franchisee relationship is intended or created by the Terms.<br>\r\n  18.3 If any provision of the Terms is held to be invalid or unenforceable, such provision shall be deleted and the remaining provisions shall remain valid and be enforced.<br>\r\n  18.4 Headings are for reference purposes only and in no way define, limit, construe or describe the scope or extent of such section.<br>\r\n  18.5 TaskControl failure to enforce any right or failure to act with respect to any breach by you under the Terms will not constitute a waiver of that right nor a waiver of TaskControl&rsquo;s right to act with respect to subsequent or similar breaches.<br>\r\n  18.6 TaskControl shall have the right to assign the Terms (including all of our rights, titles, benefits, interests, and obligations and duties in the Terms to any person or entity (including any affiliates of TaskControl). You may not assign, in whole or part, the Terms to any person or entity.<br>\r\n  18.7 These Terms shall be governed by and construed in accordance with the laws of Argentina, excluding its conflict of law rules. You further expressly consent and agree to submit to the exclusive jurisdiction and venue of a court of competent jurisdiction located in Buenos Aires, Argentina.<br>\r\n  <br>\r\n<p class=\"Estilo3\"><br>\r\n  <strong>PRIVACY POLICY\r\n</strong></p>\r\n<p class=\"Estilo1\"><strong><br>\r\n Effective date July 30, 2017 <br>\r\n <br>\r\n </strong>TaskControl is a platform that provides project management services. We operate www.taskcontrol.net (hereinafter referred to as the &ldquo;Site&rdquo;). We recognize the importance of privacy as well as the importance of maintaining the confidentiality of personal information. This Privacy Policy applies to all services provided by us and sets out how we may collect, use and disclose information in relation to users of the Site. If you are a user from the Site you are contracting with TaskControl LLC. Drago 57, 8th Floor &quot;F&quot; , 8000 Bahia Blanca, Buenos Aires, Argentina (hereinafter referred to as &ldquo;us&rdquo;, &ldquo;we&rdquo;, &ldquo;our&rdquo; or &ldquo;TaskControl&rdquo;). </p>\r\n<p class=\"Estilo1\">All capitalized terms not defined in this document shall have the meanings ascribed to them in the Terms of Service of the Site.<br>\r\n  You may use our services and products via mobile device either through mobile applications or mobile optimized websites. This Privacy Policy also applies to such use of our services and products.<br>\r\n  <br>\r\n  <br>  \r\n  <strong>A. COLLECTION OF INFORMATION</strong><br>\r\n  <br>  \r\n  1. Your privacy is important to us and we have taken steps to ensure that we do not collect more information from you than is necessary for us to provide you with our services and to protect your account.<br>\r\n  2. Information including, but not limited to, name, surname, address, phone number, email address, language and user preferences (&quot;Registration Information&quot;) may be collected at the time of user registration on the Site.<br>\r\n  3. In connection with any transaction and payment services, information, including but not limited to, bank account numbers, billing information, credit/debit card numbers and expiration dates (&quot;Account Information&quot;) may be collected to, among other things, to facilitate the payment of services through the Site.<br>\r\n  4. We record and retain details of users&rsquo; activities on the Site. Information relating to such transactions including, but not limited to, the types and specifications of the services that the user requires (&ldquo;Activities Information&rdquo;).<br>\r\n  5. We record and retain records of users\' browsing activities on our platform including but not limited to IP addresses, browsing patterns and user behavioral patterns. In addition, we gather statistical information about the Site and visitors to the Site including, but not limited to, IP addresses, browser software, operating system, software and hardware attributes, pages viewed, number of sessions and unique visitors (together &quot;Browsing Information&quot;).<br>\r\n  6. Registration Information, Account Information, Activities Information and Browsing Information generally relate to business entities and are together referred to as business data (&ldquo;Business Data&rdquo;). Insofar and only insofar as they constitute personally identifiable data of living individuals, such information is together referred to as personal data (&ldquo;Personal Data&rdquo;).<br>\r\n  7. It is mandatory for users of the Site to provide certain categories of Business Data and Personal Data (as specified at the time of collection). In the event that users do not provide any or sufficient Business Data and/or Personal Data marked as mandatory, we may not be able to complete the registration process or provide such users with our products or services.<br>\r\n  <br>\r\n  <br>\r\n  <strong>B. USE OF PERSONAL DATA</strong><br>\r\n  <br>\r\n  If you provide any Personal Data to us, you are deemed to have authorized us to collect, retain and use that Personal Data for the following purposes:<br>\r\n  1. verifying your identity;<br>\r\n  2. verifying your eligibility to register as a user of the Site;<br>\r\n  3. processing your registration as a user, providing you with a log-in identification for the Site and maintaining and managing your registration;<br>\r\n  4. providing you with customer service and responding to your queries, feedback, claims or disputes;<br>\r\n  5. performing research or statistical analysis in order to improve the content and layout of the Site, to improve our product offerings and services and for marketing and promotional purposes;<br>\r\n  6. subject to obtaining your consent in such form as may be required under the applicable law, we (including our Service Providers as defined in C.1 below) may use your name, phone number, residential address, email address and other data (&quot;Marketing Data&quot;) to provide notices, surveys, product alerts, communications and other marketing materials to you relating to products and services offered by us on the Site.<br>\r\n  7. We collect your e-mail address for the purpose of distributing our daily, weekly or monthly newsletter service. The email address provided will be used for delivery of information you have requested from this Site. In order to qualify to receive e-mail related services from TaskControl you will be required to confirm your e-mail address, you will begin to receive newsletter updates from TaskControl until such time that the service is discontinued, or you choose to unsubscribe. <br>\r\n  8. making such disclosures as may be required for any of the above purposes or as required by law, regulations and guidelines or in respect of any investigations, claims or potential claims brought on or against us.<br>\r\n  <br>\r\n  <br>\r\n  <strong>C. DISCLOSURE OF PERSONAL DATA</strong><br>\r\n  <br>\r\n  1. You further agree that we may disclose and transfer (whether within or outside the jurisdiction of the TaskControl entity) your Personal Data to service providers engaged by us to assist us with providing you with our services (including but not limited to data entry, database management, promotions, products and services alerts, payment extension services and verification services) (&quot;Service Providers&quot;). These Service Providers are under a duty of confidentiality to us and are only permitted to use your Personal Data in connection with the purposes specified at B.1 to B.8 above, and not for their own purposes.<br>\r\n  2. You agree that we may disclose and transfer (whether within or outside the jurisdiction of the TaskControl entity), for the purposes specified at B.1 to B.8 above, your Personal Data to other affiliated companies and/or their designated Service Providers of TaskControl.<br>\r\n  3. When necessary we may also disclose and transfer (whether within or outside the jurisdiction of TaskControl entity) your Personal Data to our professional advisers, law enforcement agencies, insurers, government and regulatory and other organizations for the purposes specified at B.8 above.<br>\r\n  4. Any Personal Data supplied by you will be retained by us and will be accessible by our employees, any Service Providers engaged by us and third parties referred to at C.2 and C.3 above, for or in relation to any of the purposes stated in B.1 to B.8 above.<br>\r\n  5. We may share your Account Information with banks or payment platforms to enable your transactions on the Site to be completed. While we have in place up-to-date technology and internal procedures to keep your Account Information and other Personal Data secure from intruders, there is no guarantee that such technology or procedures can eliminate all of the risks of theft, loss or misuse.<br>\r\n  6. We may provide statistical information to third parties, but when we do so, we do not provide personally-identifying information without your permission.<br>\r\n  7. We have established relationships with other parties and websites to offer you the benefit of products and services which we do not offer. We offer you access to these other parties and their websites either through the use of hyperlinks to these sites from the Site. In some cases, you may be required to submit personal information to register or apply for products or services provided by such third parties. This Privacy Policy does not apply to these third-party sites. The privacy policies of those other parties may differ from ours, and we have no control over the information that you submit to those third parties. You should read the relevant privacy policy for those third-party sites before responding to any offers, products or services advertised by those parties.<br>\r\n  <br>\r\n  <br>\r\n  <strong>D. RIGHT TO ACCESS/CORRECT PERSONAL DATA<br>\r\n  </strong><br>\r\n  Under the applicable laws, you have the right of access to personal information held by us and to request correction or deletion of the information.\r\n  If you have any questions regarding this Privacy Policy or if you wish to access or correct your Personal Data, you may send your request in writing to the following address:\r\n  TaskControl LLc. Drago 57, 8th Floor &quot;F&quot; , 8000 Bahia Blanca, Buenos Aires, Argentina \r\n  Email privacy@taskcontrol.net \r\n  Ph. 54-11-6925-4009.<br>\r\n  <br>\r\n  <br>\r\n  <strong>E. COOKIES</strong><br>\r\n  <br>\r\n  We use &quot;cookies&quot; to store specific information about you and track your visits to the Site. It is not uncommon for websites to use cookies to enhance identification of their users.<br>\r\n  A &quot;cookie&quot; is a small amount of data that is sent to your browser and stored on your computer\'s hard drive. If you do not de-activate or erase the cookie, each time you use the same computer to access the Site, our web servers will be notified of your visit to the Site and in turn we may have knowledge of your visit and the pattern of your usage.<br>\r\n  Generally, we use cookies to identify you and enable us to i) access your Registration Information or Account Information so you do not have to re-enter it; ii) gather statistical information about usage by users; iii) research visiting patterns and help target advertisements based on user interests; iv) assist our partners to track user visits to the Site and process orders; and v) track progress and participation in promotions.<br>\r\n  You can determine if and how a cookie will be accepted by configuring the browser which is installed in the computer you are using to access the Site. If you choose, you can change those configurations. By setting your preferences in the browser, you can accept all cookies or you can choose to be notified when a cookie is sent or you can choose to reject all cookies. If you reject all cookies by choosing the cookie-disabling function in your browser, you may be required to re-enter information on the Site more often and certain features of the Site may be unavailable.<br>  \r\n  <strong><br>\r\n  <br>\r\n  F. MINORS</strong><br>  \r\n  <br>\r\n  The Site and their contents are not targeted to minors (those under the age of 18) and we do not intend to sell any of our products or services to minors. However, we have no way of distinguishing the age of individuals who access our Site. If a minor has provided us with personal information without parental or guardian consent, the parent or guardian should contact our Legal Department at the address set out in paragraph D above to remove the information.<br>\r\n  <br>\r\n  <br>\r\n  <strong>G. SECURITY MEASURES</strong><br>\r\n  <br>\r\n  We employ commercially reasonable security methods to prevent unauthorized access to the Site, to maintain data accuracy and to ensure the correct use of the information we hold.<br>\r\n  For registered users of the Site, your Registration Information and Account Information (if any) can be viewed and edited through your account, which is protected by a password. We recommend that you do not divulge your password to anyone. Our personnel will never ask you for your password in an unsolicited phone call or in an unsolicited email. If you share a computer with others, you should not choose to save your log-in information (e.g., user ID and password) on that shared computer. Remember to sign out of your account and close your browser window when you have finished your session.<br>\r\n  No data transmission over the internet or any other network (whether wireless or not) can be guaranteed to be perfectly secure. As a result, while we try to protect the information we hold for you, we cannot guarantee the security of any information you transmit to us and you do so at your own risk.<br>\r\n  <br>\r\n  <br>\r\n  <strong>H. CHANGES TO THIS PRIVACY POLICY<br>\r\n  </strong><br>\r\n  Any changes to this Privacy Policy will be communicated by us posting an amended and restated Privacy Policy on the Site. Once posted on the Site the new Privacy Policy will be effective immediately. You agree that any information we hold about you (as described in this Privacy Policy and whether or not collected prior to or after the new Privacy Policy became effective) will be governed by the latest version of the Privacy Policy.<br>\r\n  <br>\r\n  <br>\r\n  <strong>I. YOUR FEEDBACK</strong><br>\r\n  <br>\r\nWe welcome your input regarding our Privacy Policy and any comments on the services we provide to you. You may send us your comments and responses by post to: TaskControl LLC. Drago 57, 8th Floor &quot;F&quot; , 8000 Bahia Blanca, Buenos Aires, Argentina or by electronic email to privacy@taskcontrol.net.</p>\r\n</body>\r\n</html>\r\n');
/*!40000 ALTER TABLE `page_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_master`
--

DROP TABLE IF EXISTS `paypal_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_master` (
  `pp_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `user_login_id` varchar(255) NOT NULL DEFAULT '',
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `description` mediumtext NOT NULL,
  `trans_type` char(2) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `total_amount_paid` float(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`pp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=627 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_master`
--

LOCK TABLES `paypal_master` WRITE;
/*!40000 ALTER TABLE `paypal_master` DISABLE KEYS */;
INSERT INTO `paypal_master` VALUES (549,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',129.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 20 GB, 1 TB Transfer','-','2020-07-23 14:37:50',129.99),(550,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',129.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 20 GB, 1 TB Transfer','-','2020-07-23 16:21:54',129.99),(551,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',149.99,1,'Subscription For: PROFESSIONAL, Up to 15 Users, Unlimted Projects, 40 GB, 2 TB Transfer','-','2020-07-23 16:26:13',149.99),(552,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',129.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 20 GB, 1 TB Transfer','-','2020-07-23 16:40:28',129.99),(553,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',199.99,1,'Subscription For: ENTERPRISE-ONE, Uo to 25 Users, Unlimited Projects, 140 GB, 5 TB Transfer\r\n','-','2020-07-23 16:42:14',199.99),(554,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',50.00,1,'Wallet Deposit','+','2020-07-28 10:00:27',53.00),(555,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',129.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 20 GB, 1 TB Transfer','-','2020-07-29 02:36:38',129.99),(556,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',129.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 20 GB, 1 TB Transfer','-','2020-07-29 03:09:00',129.99),(557,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',129.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 20 GB, 1 TB Transfer','-','2020-07-29 03:38:52',129.99),(558,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-04 13:41:02',266.99),(559,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-04 14:36:14',266.99),(560,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-04 14:57:05',266.99),(561,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-04 17:52:57',266.99),(562,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-04 22:02:40',266.99),(563,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-04 22:11:18',266.99),(564,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-24 11:26:42',266.99),(565,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-24 16:44:35',266.99),(566,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-27 00:08:56',266.99),(567,'de34ca02307b653e146eb3798e4d5713','Demo2',400.00,1,'Wallet Deposit','+','2020-09-27 12:28:04',421.90),(568,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-27 14:30:13',266.99),(569,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-27 15:08:46',266.99),(570,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-27 15:34:11',266.99),(571,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-27 21:28:44',266.99),(572,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-28 04:18:41',266.99),(573,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-28 05:17:02',266.99),(574,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-29 12:10:23',266.99),(575,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-29 18:42:55',266.99),(576,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-30 00:28:49',266.99),(577,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-09-30 02:39:32',266.99),(578,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-10-23 00:00:02',266.99),(579,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-10-29 00:00:04',266.99),(580,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-21 20:36:43',266.99),(581,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-21 21:02:04',266.99),(582,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-21 21:34:42',266.99),(583,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-21 22:40:53',266.99),(584,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-21 23:21:45',266.99),(585,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-24 20:36:38',266.99),(586,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-24 21:03:13',266.99),(587,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-24 21:56:02',266.99),(588,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 02:52:32',266.99),(589,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 03:18:23',266.99),(590,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 03:40:04',266.99),(591,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 10:16:35',266.99),(592,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 10:58:39',266.99),(593,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 11:52:21',266.99),(594,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 12:08:53',266.99),(595,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 12:32:47',266.99),(596,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 13:17:30',266.99),(597,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 15:25:59',266.99),(598,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 15:34:57',266.99),(599,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 15:38:33',266.99),(600,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 15:48:10',266.99),(601,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 16:11:38',266.99),(602,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 16:40:45',266.99),(603,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 16:45:38',266.99),(604,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 16:55:08',266.99),(605,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 16:58:53',266.99),(606,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 17:27:07',266.99),(607,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-25 21:41:40',266.99),(608,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-26 13:33:42',266.99),(609,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-11-26 17:05:42',266.99),(610,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-07 13:16:19',266.99),(611,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-07 22:12:01',266.99),(612,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-07 23:23:40',266.99),(613,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-07 23:28:43',266.99),(614,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-08 17:21:18',266.99),(615,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-09 13:05:14',266.99),(616,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-09 16:36:59',266.99),(617,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-09 18:17:13',266.99),(618,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-09 22:31:48',266.99),(619,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-09 22:38:34',266.99),(620,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-10 09:09:21',266.99),(621,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-10 16:51:22',266.99),(622,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-11 14:19:43',266.99),(623,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-11 20:07:13',266.99),(624,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-11 21:00:09',266.99),(625,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-12 00:50:58',266.99),(626,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,1,'Subscription For: STARTER, Up to 5 Users, Unlimited Projects, 60 GB, 3 TB Transfer','-','2020-12-12 02:00:31',266.99);
/*!40000 ALTER TABLE `paypal_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_pending_deposite`
--

DROP TABLE IF EXISTS `paypal_pending_deposite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_pending_deposite` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `user_login_id` varchar(255) NOT NULL DEFAULT '',
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `pending_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_pending_deposite`
--

LOCK TABLES `paypal_pending_deposite` WRITE;
/*!40000 ALTER TABLE `paypal_pending_deposite` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_pending_deposite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_message_master`
--

DROP TABLE IF EXISTS `private_message_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_message_master` (
  `pm_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `sender_auth_id` varchar(255) NOT NULL DEFAULT '',
  `sender_login_id` varchar(255) NOT NULL DEFAULT '',
  `recevier_auth_id` varchar(255) NOT NULL DEFAULT '',
  `recevier_login_id` varchar(255) NOT NULL DEFAULT '',
  `private_msg_desc` text NOT NULL,
  `file` text NOT NULL,
  `date` varchar(100) NOT NULL DEFAULT '',
  `msg_check` tinyint(2) NOT NULL,
  PRIMARY KEY (`pm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_message_master`
--

LOCK TABLES `private_message_master` WRITE;
/*!40000 ALTER TABLE `private_message_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `private_message_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile1_master`
--

DROP TABLE IF EXISTS `profile1_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile1_master` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `buyers_slogan` text NOT NULL,
  `buyers_description` text NOT NULL,
  `buyers_profile_status` tinyint(2) NOT NULL DEFAULT '0',
  `seller_slogan` varchar(255) NOT NULL DEFAULT '',
  `seller_description` text NOT NULL,
  `seller_rate_per_hour` varchar(255) NOT NULL DEFAULT '',
  `seller_exp` varchar(255) NOT NULL DEFAULT '',
  `seller_industry` text NOT NULL,
  `seller_logo` text NOT NULL,
  `mother_lang` varchar(255) NOT NULL,
  `lang_pairs` varchar(255) NOT NULL,
  `translator` tinyint(2) NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile1_master`
--

LOCK TABLES `profile1_master` WRITE;
/*!40000 ALTER TABLE `profile1_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile1_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_master`
--

DROP TABLE IF EXISTS `profile_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_master` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `buyers_slogan` text NOT NULL,
  `buyers_description` text NOT NULL,
  `buyers_profile_status` tinyint(2) NOT NULL DEFAULT '0',
  `seller_slogan` varchar(255) NOT NULL DEFAULT '',
  `seller_description` text NOT NULL,
  `seller_rate_per_hour` varchar(255) NOT NULL DEFAULT '',
  `seller_exp` varchar(255) NOT NULL DEFAULT '',
  `seller_industry` text NOT NULL,
  `seller_logo` text NOT NULL,
  `mother_lang` varchar(255) NOT NULL,
  `lang_pairs` varchar(255) NOT NULL,
  `translator` tinyint(2) NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=267 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_master`
--

LOCK TABLES `profile_master` WRITE;
/*!40000 ALTER TABLE `profile_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_edit_master`
--

DROP TABLE IF EXISTS `project_edit_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_edit_master` (
  `edit_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `edit_date` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`edit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_edit_master`
--

LOCK TABLES `project_edit_master` WRITE;
/*!40000 ALTER TABLE `project_edit_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_edit_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_extend_master`
--

DROP TABLE IF EXISTS `project_extend_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_extend_master` (
  `extend_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(50) NOT NULL DEFAULT '',
  `extend_days` varchar(50) NOT NULL DEFAULT '',
  `extend_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_extend_master`
--

LOCK TABLES `project_extend_master` WRITE;
/*!40000 ALTER TABLE `project_extend_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_extend_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_master`
--

DROP TABLE IF EXISTS `project_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_master` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_posted_by` varchar(50) NOT NULL DEFAULT '',
  `auth_id_of_post_by` varchar(255) NOT NULL DEFAULT '',
  `paypal_transaction_id` varchar(50) NOT NULL DEFAULT '',
  `moneybooker_transaction_id` varchar(50) NOT NULL DEFAULT '',
  `mercadopago_transaction_id` varchar(50) NOT NULL DEFAULT '',
  `dineromail_transaction_id` varchar(50) NOT NULL DEFAULT '',
  `neteller_transaction_id` varchar(50) NOT NULL DEFAULT '',
  `project_post_to` varchar(50) NOT NULL DEFAULT '',
  `auth_id_of_post_to` varchar(255) NOT NULL DEFAULT '',
  `project_title` varchar(50) NOT NULL DEFAULT '',
  `project_category` varchar(50) NOT NULL DEFAULT '',
  `project_description` text NOT NULL,
  `project_file_1` varchar(255) NOT NULL DEFAULT '',
  `project_file_2` varchar(255) NOT NULL DEFAULT '',
  `project_file_3` varchar(255) NOT NULL DEFAULT '',
  `project_level` text NOT NULL,
  `project_budget` text NOT NULL,
  `project_days_open` varchar(50) NOT NULL DEFAULT '',
  `project_hide` tinyint(2) NOT NULL DEFAULT '0',
  `project_allow_bid` tinyint(2) NOT NULL DEFAULT '0',
  `premium_project` tinyint(2) NOT NULL DEFAULT '0',
  `urgent_project` tinyint(2) NOT NULL DEFAULT '0',
  `perimum_transaction_id` int(11) NOT NULL DEFAULT '0',
  `urgent_trascation_id` int(11) NOT NULL DEFAULT '0',
  `project_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1: Project open;  2: Project freezed;  3: Project close for bidding;  4: Project canceded;  5: Project semi-closed (aun le da una semana mas para asignar proveedor);  6: Project complete;  7: Project closed',
  `project_posted_date` date NOT NULL DEFAULT '0000-00-00',
  `award_project_date` date NOT NULL DEFAULT '0000-00-00',
  `project_free` tinyint(2) NOT NULL DEFAULT '0',
  `project_post_time` timestamp NULL DEFAULT NULL,
  `project_closed_date` date NOT NULL DEFAULT '0000-00-00',
  `project_bid_option` tinyint(1) DEFAULT '0',
  `project_bid_groups` text,
  PRIMARY KEY (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_master`
--

LOCK TABLES `project_master` WRITE;
/*!40000 ALTER TABLE `project_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_violations_master`
--

DROP TABLE IF EXISTS `report_violations_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_violations_master` (
  `violation_id` int(11) NOT NULL AUTO_INCREMENT,
  `your_name` varchar(255) NOT NULL DEFAULT '',
  `your_email` text NOT NULL,
  `your_username` varchar(255) NOT NULL DEFAULT '',
  `violation` text NOT NULL,
  `other_person_name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `violation_details` text NOT NULL,
  `submitted_date` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`violation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_violations_master`
--

LOCK TABLES `report_violations_master` WRITE;
/*!40000 ALTER TABLE `report_violations_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_violations_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_portfolio_master`
--

DROP TABLE IF EXISTS `seller_portfolio_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_portfolio_master` (
  `portfolio_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(50) NOT NULL DEFAULT '',
  `user_name` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `sample_file` varchar(255) NOT NULL DEFAULT '',
  `industry` text NOT NULL,
  `budget` text NOT NULL,
  `time_spent` text NOT NULL,
  `categories` text NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`portfolio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_portfolio_master`
--

LOCK TABLES `seller_portfolio_master` WRITE;
/*!40000 ALTER TABLE `seller_portfolio_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller_portfolio_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_rating_master`
--

DROP TABLE IF EXISTS `seller_rating_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_rating_master` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `rating_by_user` varchar(255) NOT NULL DEFAULT '',
  `rating_to_user` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `date_time` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rating_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_rating_master`
--

LOCK TABLES `seller_rating_master` WRITE;
/*!40000 ALTER TABLE `seller_rating_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller_rating_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_skill_master`
--

DROP TABLE IF EXISTS `seller_skill_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_skill_master` (
  `skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `skill_name` varchar(255) NOT NULL DEFAULT '',
  `skill_rate` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`skill_id`)
) ENGINE=MyISAM AUTO_INCREMENT=471 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_skill_master`
--

LOCK TABLES `seller_skill_master` WRITE;
/*!40000 ALTER TABLE `seller_skill_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller_skill_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_earning_deposite`
--

DROP TABLE IF EXISTS `site_earning_deposite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_earning_deposite` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) NOT NULL DEFAULT '',
  `user_login_id` varchar(255) NOT NULL DEFAULT '',
  `deposited_money` float(15,2) NOT NULL DEFAULT '0.00',
  `paid_money` float(15,2) NOT NULL DEFAULT '0.00',
  `earning` float(15,2) NOT NULL DEFAULT '0.00',
  `payment_gateway` varchar(25) NOT NULL DEFAULT '',
  `deposited_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_earning_deposite`
--

LOCK TABLES `site_earning_deposite` WRITE;
/*!40000 ALTER TABLE `site_earning_deposite` DISABLE KEYS */;
INSERT INTO `site_earning_deposite` VALUES (1,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',129.99,6.79,123.20,'Paypal','2020-07-23 14:37:50'),(2,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',129.99,6.79,123.20,'Paypal','2020-07-23 16:21:54'),(3,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',149.99,14.38,135.61,'Paypal','2020-07-23 16:26:13'),(4,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',129.99,6.79,123.20,'Paypal','2020-07-23 16:40:28'),(5,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',199.99,55.52,144.47,'Paypal','2020-07-23 16:42:14'),(6,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',129.99,6.79,123.20,'Paypal','2020-07-29 02:36:38'),(7,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',129.99,6.79,123.20,'Paypal','2020-07-29 03:09:00'),(8,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',129.99,6.79,123.20,'Paypal','2020-07-29 03:38:52'),(9,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-09-04 13:41:02'),(10,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-09-04 14:36:14'),(11,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-09-04 14:57:05'),(12,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-09-04 17:52:57'),(13,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-09-04 22:02:40'),(14,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-09-04 22:11:18'),(15,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-09-24 11:26:42'),(16,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-09-24 16:44:35'),(17,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-09-27 00:08:56'),(18,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-09-27 14:30:13'),(19,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-09-27 15:08:46'),(20,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-09-27 15:34:11'),(21,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-09-27 21:28:44'),(22,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-09-28 04:18:41'),(23,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-09-28 05:17:02'),(24,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-09-29 12:10:23'),(25,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-09-29 18:42:55'),(26,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-09-30 00:28:49'),(27,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-09-30 02:39:32'),(28,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal-AutoRenewal','2020-10-23 00:00:02'),(29,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal-AutoRenewal','2020-10-29 00:00:04'),(30,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-21 20:36:43'),(31,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-21 21:02:04'),(32,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-21 21:34:42'),(33,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-21 22:40:53'),(34,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-21 23:21:45'),(35,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-24 20:36:38'),(36,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-24 21:03:13'),(37,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-24 21:56:02'),(38,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-25 02:52:32'),(39,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-25 03:18:23'),(40,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-25 03:40:04'),(41,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-25 10:16:35'),(42,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-25 10:58:39'),(43,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-25 11:52:21'),(44,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-25 12:08:53'),(45,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-25 12:32:47'),(46,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-25 13:17:30'),(47,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-25 15:25:59'),(48,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-25 15:34:57'),(49,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-25 15:38:33'),(50,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-25 15:48:10'),(51,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-25 16:11:38'),(52,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-25 16:40:45'),(53,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-25 16:45:38'),(54,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-25 16:55:08'),(55,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-25 16:58:53'),(56,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-25 17:27:07'),(57,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-25 21:41:40'),(58,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-11-26 13:33:42'),(59,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-11-26 17:05:42'),(60,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-12-07 13:16:19'),(61,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-12-07 22:12:01'),(62,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-12-07 23:23:40'),(63,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-12-07 23:28:43'),(64,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-12-08 17:21:18'),(65,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-12-09 13:05:14'),(66,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-12-09 16:36:59'),(67,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-12-09 18:17:13'),(68,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-12-09 22:31:48'),(69,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-12-09 22:38:34'),(70,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-12-10 09:09:21'),(71,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-12-10 16:51:22'),(72,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-12-11 14:19:43'),(73,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-12-11 20:07:13'),(74,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-12-11 21:00:09'),(75,'e0ed18dc67b295f9518eaead0edcbfff','Demo1',266.99,21.87,245.12,'Paypal','2020-12-12 00:50:58'),(76,'de34ca02307b653e146eb3798e4d5713','Demo2',266.99,21.87,245.12,'Paypal','2020-12-12 02:00:31');
/*!40000 ALTER TABLE `site_earning_deposite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_earning_project`
--

DROP TABLE IF EXISTS `site_earning_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_earning_project` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `buyer_comm` float(15,2) NOT NULL DEFAULT '0.00',
  `seller_comm` float(15,2) NOT NULL DEFAULT '0.00',
  `submitted_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_earning_project`
--

LOCK TABLES `site_earning_project` WRITE;
/*!40000 ALTER TABLE `site_earning_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_earning_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_plan_master`
--

DROP TABLE IF EXISTS `storage_plan_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_plan_master` (
  `storage_id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_name` varchar(255) NOT NULL DEFAULT '',
  `storage_time` tinyint(2) NOT NULL DEFAULT '30',
  `storage_status` tinyint(2) NOT NULL DEFAULT '0',
  `display_order` tinyint(2) NOT NULL DEFAULT '1',
  `add_giga_cost` float(15,3) NOT NULL DEFAULT '0.000',
  `storage_fees` float(15,3) NOT NULL,
  `total_price` float(15,3) NOT NULL,
  PRIMARY KEY (`storage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_plan_master`
--

LOCK TABLES `storage_plan_master` WRITE;
/*!40000 ALTER TABLE `storage_plan_master` DISABLE KEYS */;
INSERT INTO `storage_plan_master` VALUES (1,'1 GB (Additional)',30,1,1,0.100,0.200,0.200),(2,'2 GB (Additional)',30,1,2,0.200,0.350,0.700),(3,'3 GB (Additional)',30,1,3,0.300,0.450,1.350),(5,'5 GB (Additional)',30,1,4,0.500,0.550,2.750),(10,'10 GB (Additional) ',30,1,5,1.000,1.500,15.000);
/*!40000 ALTER TABLE `storage_plan_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_config`
--

DROP TABLE IF EXISTS `website_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_config` (
  `config_name` varchar(50) NOT NULL DEFAULT '',
  `config_value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_config`
--

LOCK TABLES `website_config` WRITE;
/*!40000 ALTER TABLE `website_config` DISABLE KEYS */;
INSERT INTO `website_config` VALUES ('site_title','TaskControl.net Improve your Quality Of Service Drastically..'),('site_keyword','freelancer project management Agile Methodologies resources\r\nhow to work from home\r\nProject Management Intitute\r\n'),('site_description','TaskControl.net\r\nProject Management Tool\r\n Agile Methodologies\r\nProject Management Intitute\r\n'),('page_size','10'),('google_adsense','<script type=\\\"text/javascript\\\"><!--\r\ngoogle_ad_client = \\\"ca-pub-8681098962504720\\\";\r\n/* GOITGLOBAL468X60 */\r\ngoogle_ad_slot = \\\"3889969259\\\";\r\ngoogle_ad_width = 468;\r\ngoogle_ad_height = 60;\r\n//-->\r\n</script>\r\n<script type=\\\"text/javascript\\\"\r\nsrc=\\\"http://pagead2.googlesyndication.com/pagead/show_ads.js\\\">\r\n</script>'),('euro_dollar','1.088435'),('dollar_euro','0.918750'),('free_portfolio','5'),('premium_portfolio','25'),('project_post_deposite','5'),('minimum_bid_place','0'),('minimum_deposite_amount','0.5'),('minimum_withdaw_amount','0.5'),('fees_Taken_for_post_project','5'),('escrow_payment','0'),('edit_bid','10'),('user_page_size','20'),('comm_form_seller','8.5'),('comm_form_buyer','5'),('minimum_comm_seller','5'),('minimum_comm_buyer','5'),('premium_project_fees','15'),('urgent_project_fee','15'),('paypal_mail','contactus@taskcontrol.net-facilitator@gmail.com'),('paypal_sendbox','1'),('paypal_fix_amount','0,30'),('paypal_percentage','5,40'),('paypal_fix_amount_deposit','0,30'),('paypal_percentage_deposit','5,40'),('paypal_deposit',''),('paypal_last_invoice','0'),('moneybooker_secretWord','probando'),('moneybooker_sendbox','1'),('moneybooker_percentage_withdraw','0.5'),('moneybooker_fix_amount_deposite','2'),('moneybooker_percentage_deposite','0.5'),('moneybooker_fix_amount_withdraw','2'),('moneybooker_mail','billing@taskcontrol.net'),('dineromail_mail','billing@taskcontrol.net'),('dineromail_ipn_password','probando'),('dineromail_fix_amount','0.5'),('dineromail_percentage','2.99'),('dineromail_nro_cuenta','1149274'),('dineromail_percentage_withdraw','2.99'),('dineromail_fix_amount_withdraw','0.5'),('dineromail_deposite',''),('mercadopago_mail','billing@taskcontrol.net'),('mercadopago_sendbox','1'),('mercadopago_clientId','6839117547511212'),('mercadopago_clientSecret','ZqeQSH4fxUMF3kTDCJM27blkoU5CRJ9n'),('mercadopago_fix_amount','0.0'),('mercadopago_percentage','5.99'),('mercadopago_percentage_withdraw','5.99'),('mercadopago_fix_amount_withdraw','0.0'),('mercadopago_deposite',''),('neteller_mail','billing@taskcontrol.net'),('neteller_sendbox','1'),('neteller_fix_amount','0'),('neteller_percentage','0'),('neteller_fix_amount_deposit','0'),('neteller_percentage_deposit','0'),('neteller_deposit',''),('google_adsense_125','<script type=\\\"text/javascript\\\"><!--\r\ngoogle_ad_client = \\\"ca-pub-8681098962504720\\\";\r\n/* GOITGLOBAL125X125 */\r\ngoogle_ad_slot = \\\"6843435651\\\";\r\ngoogle_ad_width = 125;\r\ngoogle_ad_height = 125;\r\n//-->\r\n</script>\r\n<script type=\\\"text/javascript\\\"\r\nsrc=\\\"http://pagead2.googlesyndication.com/pagead/show_ads.js\\\">\r\n</script>'),('partner_email_id','contactus@taskcontrol.net'),('monthly_revenu_sharing_percentage','50'),('my_theme','default'),('comm_for_afflition','0'),('bid_approve','no'),('admin_email','contactus@taskcontrol.net'),('special_user_free_days','30'),('maximum_deposite_amount','999.00');
/*!40000 ALTER TABLE `website_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraw_master`
--

DROP TABLE IF EXISTS `withdraw_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdraw_master` (
  `ww_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_auth_id` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `user_name` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `requested_date` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `estimate_date` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `details` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `withdraw_type` varchar(25) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `trans_type` char(2) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `amount_rec` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `email_to` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `payment_released_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`ww_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw_master`
--

LOCK TABLES `withdraw_master` WRITE;
/*!40000 ALTER TABLE `withdraw_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdraw_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` int(11) NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` enum('0','1','spam') NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_approved` (`comment_approved`),
  KEY `comment_post_ID` (`comment_post_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_category` bigint(20) NOT NULL DEFAULT '0',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` enum('Y','N') NOT NULL DEFAULT 'Y',
  `link_owner` int(11) NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_category` (`link_category`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`,`blog_id`,`option_name`),
  KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_category` int(4) NOT NULL DEFAULT '0',
  `post_excerpt` text NOT NULL,
  `post_status` enum('publish','draft','private','static','object','attachment','inherit','future','pending') NOT NULL DEFAULT 'publish',
  `comment_status` enum('open','closed','registered_only') NOT NULL DEFAULT 'open',
  `ping_status` enum('open','closed') NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` text NOT NULL,
  `post_parent` bigint(20) NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year_experience`
--

DROP TABLE IF EXISTS `year_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `year_experience` (
  `year_expe_id` int(11) NOT NULL AUTO_INCREMENT,
  `expe_title` varchar(255) NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`year_expe_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year_experience`
--

LOCK TABLES `year_experience` WRITE;
/*!40000 ALTER TABLE `year_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `year_experience` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-13  5:00:02
