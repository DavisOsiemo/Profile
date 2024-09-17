-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: 10.79.224.2    Database: mb_profiles
-- ------------------------------------------------------
-- Server version	8.0.18-google

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'e481c9c3-71ba-11eb-8e7a-42010a4fe004:1-10861987232';

--
-- Table structure for table `affiliates`
--

DROP TABLE IF EXISTS `affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `bet_stake` decimal(10,2) NOT NULL DEFAULT '0.00',
  `referrals_done` int(11) NOT NULL DEFAULT '0',
  `status` int(3) NOT NULL DEFAULT '1',
  `summary_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliates`
--

LOCK TABLES `affiliates` WRITE;
/*!40000 ALTER TABLE `affiliates` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribution`
--

DROP TABLE IF EXISTS `attribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utm_source` varchar(100) NOT NULL,
  `utm_medium` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `utm_campaign_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `referrer` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `utm_source` (`utm_source`),
  KEY `referrer` (`referrer`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribution`
--

LOCK TABLES `attribution` WRITE;
/*!40000 ALTER TABLE `attribution` DISABLE KEYS */;
INSERT INTO `attribution` VALUES (4,'MOSSBEST','MOSSBETS_UTM','MOSSBETS_CAMPAIGN','htps://mossbets.com','2022-07-18 13:48:40','2022-11-02 07:54:43'),(5,'2','MPESA_DEPOSIT','DEPOSITS','2','2022-10-31 14:33:43','2022-10-31 11:33:43'),(6,'PICKABOX_STAGING_APP','PICKABOX_STAGING_APP','PICKABOX_STAGING_APP',NULL,'2022-11-23 21:29:01','2022-11-23 18:29:01'),(12,'MB_VIRTUALS','KIRON_PLACEBET','STAGING_APP','STAGING_APP','2022-12-14 15:52:31','2022-12-14 12:52:31'),(13,'STAGING.MOSSBET.LIVE/LEAGUE','KIRON_PLACEBET','STAGING_APP','STAGING_APP','2022-12-14 16:17:33','2022-12-14 13:17:33'),(14,'KIRON_FREEBET','FREEBET','STAGING_APP','STAGING_APP','2022-12-14 18:15:10','2022-12-14 15:15:10'),(15,'HTTP://MOSSBETS/LEAGUE','KIRON_PLACEBET','STAGING_APP','STAGING_APP','2022-12-20 07:08:45','2022-12-20 04:08:45'),(16,'PENALTYSHOOTOUT','PENALTYSHOOTOUT','PENALTYSHOOTOUT',NULL,'2023-01-12 17:49:10','2023-01-12 14:49:10'),(17,'Penalty Shootout','Penalty Shootout','Penalty Shootout',NULL,'2023-01-12 21:21:54','2023-01-12 18:21:54'),(18,'HTTP://MOSSBETS/TOURNAMENT','KIRON_PLACEBET','STAGING_APP','STAGING_APP','2023-02-13 18:55:58','2023-02-13 15:55:58'),(19,'STAGING.MOSSBET.LIVE/TOURNAMENT','KIRON_PLACEBET','STAGING_APP','STAGING_APP','2023-02-13 18:58:11','2023-02-13 15:58:11'),(20,'MB_CRASH','CRASH_PLACEBET','WEB_APP','WEB_APP','2023-08-15 05:15:05','2023-04-15 08:15:05');
/*!40000 ALTER TABLE `attribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `blacklist_reason` varchar(25) NOT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `blacklisted_on` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(45) NOT NULL,
  `token` varchar(250) NOT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `channel_name` (`channel_name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'USSD_APP','USSD_APP',1),(2,'WEB_APP','WEB_APP',1),(3,'MOBILE_APP','MOBILE_APP',1),(4,'DIRECT_DEPOSIT_MPESA','DIRECT_DEPOSIT_MPESA',1),(5,'ADMIN_APP','ADMIN_APP',1),(6,'WITHDRAWAL APP','WITHDRAWAL_APP',1),(7,'WALLET INTEGRATIONS','WALLET_INTEGRATIONS_APP',1),(8,'STAGING_APP','vkR}r(&^JJ+9BVA',1),(9,'RGS_GAME','qWPHlbDZASrsKwonCXoMYYe5qXm076fR',1),(10,'MPESA WITHDRAWAL DLR','GhzAH[ts$+z#Xd{Iv8bS',1),(11,'KRN_TOURNAMENT','bDZASrsKwon&3#',1);
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbox` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msisdn` bigint(20) NOT NULL,
  `short_code` int(11) NOT NULL,
  `link_id` varchar(100) DEFAULT NULL,
  `network` varchar(25) DEFAULT 'UNKNOWN',
  `message` varchar(1000) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `link_id` (`link_id`),
  KEY `profile_id` (`msisdn`,`short_code`,`network`),
  KEY `message` (`message`(767)),
  KEY `created_at` (`created_at`),
  KEY `source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbox`
--

LOCK TABLES `inbox` WRITE;
/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leader_board`
--

DROP TABLE IF EXISTS `leader_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leader_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `stake_amount` decimal(10,3) NOT NULL DEFAULT '0.000',
  `winnings` decimal(10,3) NOT NULL DEFAULT '0.000',
  `status` int(11) NOT NULL,
  `week_number` int(11) NOT NULL,
  `date_period` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`profile_id`,`week_number`),
  KEY `status` (`status`),
  KEY `initiated_date` (`date_period`),
  KEY `stake_amount` (`stake_amount`,`winnings`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leader_board`
--

LOCK TABLES `leader_board` WRITE;
/*!40000 ALTER TABLE `leader_board` DISABLE KEYS */;
INSERT INTO `leader_board` VALUES (1,137,10.000,1.000,1,29,'(2022-07-21) - (2022-07-31) ','2022-07-21 20:11:07','2022-07-21 20:11:07'),(2,136,10.000,1.000,1,29,'(2022-07-21) - (2022-07-31) ','2022-07-21 20:18:27','2022-07-21 20:18:27'),(3,115,20000.000,49000.000,1,44,'2022-10-21 - 2022-11-03','2022-11-03 19:40:37','2022-11-03 19:40:37');
/*!40000 ALTER TABLE `leader_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` bigint(20) NOT NULL,
  `network` varchar(15) NOT NULL,
  `source` varchar(65) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `network` (`network`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_banners`
--

DROP TABLE IF EXISTS `marketing_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `url` varchar(200) NOT NULL,
  `action_url` varchar(200) DEFAULT NULL,
  `app_url` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` date NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_banners`
--

LOCK TABLES `marketing_banners` WRITE;
/*!40000 ALTER TABLE `marketing_banners` DISABLE KEYS */;
INSERT INTO `marketing_banners` VALUES (1,'promo-1','Free Bet','https://storage.googleapis.com/mbg-assets/images/mossbet-1670147982.jpg','https://staging.mossbet.live/freegame',NULL,1,'2022-10-26','2022-12-08 02:14:21');
/*!40000 ALTER TABLE `marketing_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_promotion`
--

DROP TABLE IF EXISTS `marketing_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `url` varchar(200) NOT NULL,
  `action_url` varchar(200) DEFAULT NULL,
  `app_url` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `starting_date` datetime NOT NULL,
  `ending_date` datetime NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `status` (`status`),
  KEY `starting_date` (`starting_date`,`ending_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_promotion`
--

LOCK TABLES `marketing_promotion` WRITE;
/*!40000 ALTER TABLE `marketing_promotion` DISABLE KEYS */;
INSERT INTO `marketing_promotion` VALUES (1,'FREE BET','<h2>happy hour promotion</h2> <p>Open to all new and existing customers.</p> <ul><li>Customers will be required to</li> <li>Winners are chosen randomly by the MossBets promotion systems</li></ul> <p>Promo runs every weekday as from 6am - 2pm.</p>','https://storage.googleapis.com/mbg-assets/images/mossbet-1670147982.jpg',NULL,NULL,1,'2022-12-06 16:51:01','2023-03-01 15:22:54','2022-12-06','2022-12-06 13:51:01');
/*!40000 ALTER TABLE `marketing_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_promotion_custome`
--

DROP TABLE IF EXISTS `marketing_promotion_custome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_promotion_custome` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `promotion_id` int(11) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promotion_id` (`promotion_id`,`profile_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_promotion_custome`
--

LOCK TABLES `marketing_promotion_custome` WRITE;
/*!40000 ALTER TABLE `marketing_promotion_custome` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_promotion_custome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbox`
--

DROP TABLE IF EXISTS `outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbox` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `short_code` varchar(12) NOT NULL,
  `created_by` varchar(65) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`),
  KEY `profile_id` (`profile_id`),
  KEY `message` (`message`(767))
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbox`
--

LOCK TABLES `outbox` WRITE;
/*!40000 ALTER TABLE `outbox` DISABLE KEYS */;
INSERT INTO `outbox` VALUES (22,129,'Karibu Customer,Use OTP 951743\n-\nClick to link to verify: https://mossbets.com/verify/WkcxOEhDVzIyNg/951743\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-18 14:31:19','2022-07-18 11:31:19'),(23,120,'Karibu Customer,Use OTP 450488\n-\nClick to link to verify: https://mossbets.com/verify/WkcxOEZTWTI0OA/450488\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-18 14:41:56','2022-07-18 11:41:56'),(24,117,'Karibu Customer,Use OTP 461419\n-\nClick to link to verify: https://mossbets.com/verify/WkcxOFFJSTg0Ng/461419\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-18 14:43:39','2022-07-18 11:43:39'),(25,115,'Karibu Customer,Use OTP 466360\n-\nClick to link to verify: https://mossbets.com/verify/WkcxOEhHTTI0MA/466360\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-18 14:44:28','2022-07-18 11:44:28'),(26,118,'Karibu Customer,Use OTP 386457\n-\nClick to link to verify: https://mossbets.com/verify/WkcxOFZZVzQ4NA/386457\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-18 15:59:19','2022-07-18 12:59:19'),(27,130,'Karibu Customer,Use OTP 825349\n-\nClick to link to verify: https://mossbets.com/verify/WkcxOFRTVTQ4OA/825349\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-18 18:58:59','2022-07-18 15:58:59'),(28,131,'Karibu Customer,Use OTP 547933\n-\nClick to link to verify: https://mossbets.com/verify/WkcxOERPWTQyMA/547933\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-18 19:01:24','2022-07-18 16:01:24'),(29,125,'Karibu Customer,Use OTP 454122\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/454122\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-18 19:09:24','2022-07-18 16:09:24'),(30,132,'Karibu Customer,Use OTP 973932\n-\nClick to link to verify: https://mossbets.com/verify/ZG18KWE088/973932\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-18 19:17:25','2022-07-18 16:17:25'),(31,115,'Reset OTP {vericode}\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/906790\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-18 20:44:18','2022-07-18 17:44:18'),(32,120,'Reset OTP {vericode}\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/908588\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-18 20:44:20','2022-07-18 17:44:20'),(33,117,'Reset OTP 281387\n-\nClick to link to verify: https://mossbets.com/verify/ZG18QII846/281387\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-18 20:46:34','2022-07-18 17:46:34'),(34,115,'Reset OTP 635584\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/635584\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-18 20:48:32','2022-07-18 17:48:32'),(35,115,'Reset OTP 685835\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/685835\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-18 20:51:13','2022-07-18 17:51:13'),(36,120,'Reset OTP 544499\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/544499\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-18 20:51:59','2022-07-18 17:51:59'),(37,132,'Reset OTP 394587\n-\nClick to link to verify: https://mossbets.com/verify/ZG18KWE088/394587\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-18 20:53:18','2022-07-18 17:53:18'),(38,132,'Reset OTP 152525\n-\nClick to link to verify: https://mossbets.com/verify/ZG18KWE088/152525\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-18 21:09:25','2022-07-18 18:09:25'),(39,132,'Reset OTP 510980\n-\nClick to link to verify: https://mossbets.com/verify/ZG18KWE088/510980\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-18 21:15:01','2022-07-18 18:15:01'),(40,120,'Reset OTP 796594\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/796594\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-18 21:22:01','2022-07-18 18:22:01'),(41,115,'Reset OTP 611311\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/611311\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-18 21:23:13','2022-07-18 18:23:13'),(42,120,'Reset OTP 198934\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/198934\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-19 09:59:11','2022-07-19 06:59:11'),(43,117,'Reset OTP 754596\n-\nClick to link to verify: https://mossbets.com/verify/ZG18QII846/754596\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-19 10:06:50','2022-07-19 07:06:50'),(44,117,'Reset OTP 571741\n-\nClick to link to verify: https://mossbets.com/verify/ZG18QII846/571741\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-19 10:15:11','2022-07-19 07:15:11'),(45,125,'Reset OTP 936928\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/936928\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-19 11:15:22','2022-07-19 08:15:22'),(46,125,'Reset OTP 767163\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/767163\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-19 11:22:21','2022-07-19 08:22:21'),(47,133,'Karibu Customer,Use OTP 853064\n-\nClick to link to verify: https://mossbets.com/verify/ZG19HWO224/853064\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-19 14:34:49','2022-07-19 11:34:49'),(48,134,'Karibu Customer,Use OTP 127126\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/127126\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-19 17:06:22','2022-07-19 14:06:22'),(49,135,'Karibu Customer,Use OTP 817216\n-\nClick to link to verify: https://mossbets.com/verify/ZG19XSG664/817216\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-19 17:13:11','2022-07-19 14:13:11'),(50,136,'Karibu Customer,Use OTP 135352\n-\nClick to link to verify: https://mossbets.com/verify/ZG19SWU240/135352\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-19 17:14:48','2022-07-19 14:14:48'),(51,137,'Karibu Customer,Use OTP 304923\n-\nClick to link to verify: https://mossbets.com/verify/ZG19WEY400/304923\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-19 17:27:49','2022-07-19 14:27:49'),(52,122,'Karibu Customer,Use OTP 669456\n-\nClick to link to verify: https://mossbets.com/verify/ZG20VOU604/669456\n-\nGet GUARANTEED KARIBU_BONUS of KES. 30.00/--\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-20 16:12:03','2022-07-20 13:12:03'),(53,115,'Reset OTP 702960\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/702960\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-20 20:07:20','2022-07-20 17:07:20'),(54,120,'Reset OTP 194395\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/194395\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 13:19:21','2022-07-26 10:19:21'),(55,117,'Reset OTP 203948\n-\nClick to link to verify: https://mossbets.com/verify/ZG18QII846/203948\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 13:22:38','2022-07-26 10:22:38'),(56,115,'Reset OTP 599715\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/599715\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 13:24:29','2022-07-26 10:24:29'),(57,115,'Reset OTP 416755\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/416755\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 13:28:28','2022-07-26 10:28:28'),(58,120,'Reset OTP 993685\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/993685\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 13:36:39','2022-07-26 10:36:39'),(59,138,'Karibu Customer,Use OTP 430763\n-\nClick to link to verify: https://mossbets.com/verify/ZG26PKY408/430763\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-26 15:00:54','2022-07-26 12:00:54'),(60,138,'Reset OTP 697845\n-\nClick to link to verify: https://mossbets.com/verify/ZG26PKY408/697845\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 15:01:28','2022-07-26 12:01:28'),(61,123,'Karibu Customer,Use OTP 675093\n-\nClick to link to verify: https://mossbets.com/verify/ZG26UMA682/675093\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-26 15:23:36','2022-07-26 12:23:36'),(62,123,'Reset OTP 241576\n-\nClick to link to verify: https://mossbets.com/verify/ZG26UMA682/241576\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 15:27:15','2022-07-26 12:27:15'),(63,139,'Karibu Customer,Use OTP 852228\n-\nClick to link to verify: https://mossbets.com/verify/ZG26PSA020/852228\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-26 16:24:06','2022-07-26 13:24:06'),(64,139,'Reset OTP 767323\n-\nClick to link to verify: https://mossbets.com/verify/ZG26PSA020/767323\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 16:29:35','2022-07-26 13:29:35'),(65,139,'Reset OTP 912184\n-\nClick to link to verify: https://mossbets.com/verify/ZG26PSA020/912184\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 16:31:47','2022-07-26 13:31:47'),(66,140,'Karibu Customer,Use OTP 915759\n-\nClick to link to verify: https://mossbets.com/verify/ZG26YMW286/915759\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-07-26 16:45:52','2022-07-26 13:45:52'),(67,123,'Reset OTP 844561\n-\nClick to link to verify: https://mossbets.com/verify/ZG26UMA682/844561\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 17:18:56','2022-07-26 14:18:56'),(68,123,'Reset OTP 549870\n-\nClick to link to verify: https://mossbets.com/verify/ZG26UMA682/549870\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 17:32:24','2022-07-26 14:32:24'),(69,123,'Reset OTP 531989\n-\nClick to link to verify: https://mossbets.com/verify/ZG26UMA682/531989\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 17:34:31','2022-07-26 14:34:31'),(70,123,'Reset OTP 835783\n-\nClick to link to verify: https://mossbets.com/verify/ZG26UMA682/835783\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 17:37:18','2022-07-26 14:37:18'),(71,120,'Reset OTP 294763\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/294763\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 19:23:46','2022-07-26 16:23:46'),(72,120,'Reset OTP 166828\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/166828\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 19:43:47','2022-07-26 16:43:47'),(73,115,'Reset OTP 533943\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/533943\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 20:05:17','2022-07-26 17:05:17'),(74,120,'Reset OTP 798125\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/798125\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 20:08:33','2022-07-26 17:08:33'),(75,115,'Reset OTP 271796\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/271796\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 20:12:33','2022-07-26 17:12:33'),(76,123,'Reset OTP 843473\n-\nClick to link to verify: https://mossbets.com/verify/ZG26UMA682/843473\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-26 20:38:26','2022-07-26 17:38:26'),(77,132,'Reset OTP 689004\n-\nClick to link to verify: https://mossbets.com/verify/ZG18KWE088/689004\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-28 19:31:32','2022-07-28 16:31:32'),(78,132,'Reset OTP 378124\n-\nClick to link to verify: https://mossbets.com/verify/ZG18KWE088/378124\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-28 19:34:32','2022-07-28 16:34:32'),(79,132,'Reset OTP 668361\n-\nClick to link to verify: https://mossbets.com/verify/ZG18KWE088/668361\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-28 19:45:12','2022-07-28 16:45:12'),(80,132,'Reset OTP 687372\n-\nClick to link to verify: https://mossbets.com/verify/ZG18KWE088/687372\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-28 19:46:19','2022-07-28 16:46:19'),(81,132,'Reset OTP 697824\n-\nClick to link to verify: https://mossbets.com/verify/ZG18KWE088/697824\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-28 20:02:30','2022-07-28 17:02:30'),(82,132,'Reset OTP 605153\n-\nClick to link to verify: https://mossbets.com/verify/ZG18KWE088/605153\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-28 20:04:30','2022-07-28 17:04:30'),(83,125,'Reset OTP 546180\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/546180\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-29 13:03:42','2022-07-29 10:03:42'),(84,125,'Reset OTP 341193\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/341193\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-07-29 13:14:04','2022-07-29 10:14:04'),(85,115,'Reset OTP 818175\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/818175\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-08-18 19:35:40','2022-08-18 16:35:40'),(86,115,'Reset OTP 344145\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/344145\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-09-08 12:44:31','2022-09-08 09:44:31'),(87,134,'Reset OTP 995132\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/995132\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-09-22 15:39:52','2022-09-22 12:39:52'),(88,134,'Reset OTP 507724\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/507724\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-09-22 17:03:04','2022-09-22 14:03:04'),(89,134,'Reset OTP 945951\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/945951\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-09-22 17:08:13','2022-09-22 14:08:13'),(90,134,'Reset OTP 735551\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/735551\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-09-22 17:47:53','2022-09-22 14:47:53'),(91,134,'Reset OTP 910811\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/910811\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-09-22 18:32:43','2022-09-22 15:32:43'),(92,134,'Reset OTP 934644\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/934644\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-09-23 10:41:15','2022-09-23 07:41:15'),(93,134,'Reset OTP 449053\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/449053\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-09-23 10:49:41','2022-09-23 07:49:41'),(94,115,'Reset OTP 699216\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/699216\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-09-26 14:25:04','2022-09-26 11:25:04'),(95,134,'Reset OTP 407642\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/407642\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-03 11:10:44','2022-10-03 08:10:44'),(96,152,'Karibu Customer,Use OTP 328035\n-\nClick to link to verify: https://mossbets.com/verify/ZJ03FCK800/328035\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-03 11:40:30','2022-10-03 08:40:30'),(97,119,'Karibu Customer,Use OTP 473927\n-\nClick to link to verify: https://mossbets.com/verify/ZJ03QII026/473927\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-03 13:02:01','2022-10-03 10:02:01'),(98,153,'Karibu Customer,Use OTP 784573\n-\nClick to link to verify: https://mossbets.com/verify/ZJ03OUO404/784573\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-03 14:57:52','2022-10-03 11:57:52'),(99,154,'Karibu Customer,Use OTP 605969\n-\nClick to link to verify: https://mossbets.com/verify/ZJ05AMA268/605969\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-05 17:23:50','2022-10-05 14:23:50'),(100,115,'Reset OTP 536567\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/536567\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-05 17:25:00','2022-10-05 14:25:00'),(101,115,'Reset OTP 131714\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/131714\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-05 17:29:25','2022-10-05 14:29:25'),(102,155,'Karibu Customer,Use OTP 838143\n-\nClick to link to verify: https://mossbets.com/verify/ZJ11AEU068/838143\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-11 14:12:42','2022-10-11 11:12:42'),(103,134,'Reset OTP 955980\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/955980\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-11 14:50:50','2022-10-11 11:50:50'),(104,156,'Karibu Customer,Use OTP 499632\n-\nClick to link to verify: https://mossbets.com/verify/ZJ11DCW604/499632\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-11 16:51:42','2022-10-11 13:51:42'),(105,156,'Reset OTP 803619\n-\nClick to link to verify: https://mossbets.com/verify/ZJ11DCW604/803619\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-11 16:55:15','2022-10-11 13:55:15'),(106,156,'Reset OTP 461956\n-\nClick to link to verify: https://mossbets.com/verify/ZJ11DCW604/461956\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-11 17:09:58','2022-10-11 14:09:58'),(107,134,'Reset OTP 168900\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/168900\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-11 17:11:55','2022-10-11 14:11:55'),(108,134,'Reset OTP 492344\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/492344\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-11 17:21:55','2022-10-11 14:21:55'),(109,134,'Reset OTP 785985\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/785985\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-11 17:24:08','2022-10-11 14:24:08'),(110,157,'Karibu Customer,Use OTP 806298\n-\nClick to link to verify: https://mossbets.com/verify/ZJ11GEE626/806298\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-11 17:26:21','2022-10-11 14:26:21'),(111,158,'Karibu Customer,Use OTP 216651\n-\nClick to link to verify: https://mossbets.com/verify/ZJ11VGK682/216651\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-11 17:32:25','2022-10-11 14:32:25'),(112,158,'Reset OTP 597514\n-\nClick to link to verify: https://mossbets.com/verify/ZJ11VGK682/597514\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-11 17:34:34','2022-10-11 14:34:34'),(113,159,'Karibu Customer,Use OTP 475800\n-\nClick to link to verify: https://mossbets.com/verify/ZJ12WEM842/475800\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-12 11:40:11','2022-10-12 08:40:11'),(114,160,'Karibu Customer,Use OTP 153261\n-\nClick to link to verify: https://mossbets.com/verify/ZJ12ZAQ484/153261\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-12 11:53:40','2022-10-12 08:53:40'),(115,134,'Reset OTP 373062\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/373062\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-12 11:57:11','2022-10-12 08:57:11'),(116,161,'Karibu Customer,Use OTP 426926\n-\nClick to link to verify: https://mossbets.com/verify/ZJ13EQC262/426926\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-13 12:55:07','2022-10-13 09:55:07'),(117,161,'Reset OTP 258192\n-\nClick to link to verify: https://mossbets.com/verify/ZJ13EQC262/258192\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-13 12:56:44','2022-10-13 09:56:44'),(118,118,'Reset OTP 692110\n-\nClick to link to verify: https://mossbets.com/verify/ZG18VYW484/692110\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-13 13:40:09','2022-10-13 10:40:09'),(119,162,'Karibu Customer,Use OTP 231315\n-\nClick to link to verify: https://mossbets.com/verify/ZJ13UME820/231315\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-13 13:41:48','2022-10-13 10:41:48'),(120,118,'Reset OTP 885025\n-\nClick to link to verify: https://mossbets.com/verify/ZG18VYW484/885025\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-13 13:54:59','2022-10-13 10:54:59'),(121,161,'Reset OTP 302759\n-\nClick to link to verify: https://mossbets.com/verify/ZJ13EQC262/302759\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-13 14:28:06','2022-10-13 11:28:06'),(122,162,'Reset OTP 579564\n-\nClick to link to verify: https://mossbets.com/verify/ZJ13UME820/579564\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-13 16:27:08','2022-10-13 13:27:08'),(123,115,'Reset OTP 596530\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/596530\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-17 18:31:54','2022-10-17 15:31:54'),(124,134,'Reset OTP 275438\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/275438\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 10:34:17','2022-10-18 07:34:17'),(125,134,'Reset OTP 147925\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/147925\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 11:01:07','2022-10-18 08:01:07'),(126,134,'Reset OTP 890827\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/890827\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 11:45:30','2022-10-18 08:45:30'),(127,153,'Reset OTP 297176\n-\nClick to link to verify: https://mossbets.com/verify/ZJ03OUO404/297176\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 11:59:59','2022-10-18 08:59:59'),(128,134,'Reset OTP 375005\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/375005\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 12:08:09','2022-10-18 09:08:09'),(129,154,'Reset OTP 982835\n-\nClick to link to verify: https://mossbets.com/verify/ZJ05AMA268/982835\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 12:09:49','2022-10-18 09:09:49'),(130,153,'Reset OTP 771595\n-\nClick to link to verify: https://mossbets.com/verify/ZJ03OUO404/771595\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 12:11:41','2022-10-18 09:11:41'),(131,153,'Reset OTP 109451\n-\nClick to link to verify: https://mossbets.com/verify/ZJ03OUO404/109451\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 13:00:43','2022-10-18 10:00:43'),(132,122,'Reset OTP 149107\n-\nClick to link to verify: https://mossbets.com/verify/ZG20VOU604/149107\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 18:18:20','2022-10-18 15:18:20'),(133,122,'Reset OTP 590856\n-\nClick to link to verify: https://mossbets.com/verify/ZG20VOU604/590856\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 18:21:50','2022-10-18 15:21:50'),(134,115,'Reset OTP 907514\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/907514\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 18:40:53','2022-10-18 15:40:53'),(135,134,'Reset OTP 934775\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/934775\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 19:17:09','2022-10-18 16:17:09'),(136,154,'Reset OTP 753660\n-\nClick to link to verify: https://mossbets.com/verify/ZJ05AMA268/753660\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-18 19:23:38','2022-10-18 16:23:38'),(137,165,'Karibu Customer,Use OTP 675398\n-\nClick to link to verify: https://mossbets.com/verify/ZJ19EUU046/675398\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-19 11:24:48','2022-10-19 08:24:48'),(138,165,'Reset OTP 639165\n-\nClick to link to verify: https://mossbets.com/verify/ZJ19EUU046/639165\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-19 12:32:30','2022-10-19 09:32:30'),(139,134,'Reset OTP 558361\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/558361\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-19 15:56:11','2022-10-19 12:56:11'),(140,165,'Reset OTP 603066\n-\nClick to link to verify: https://mossbets.com/verify/ZJ19EUU046/603066\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-19 15:57:30','2022-10-19 12:57:30'),(141,165,'Reset OTP 314198\n-\nClick to link to verify: https://mossbets.com/verify/ZJ19EUU046/314198\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-19 15:59:53','2022-10-19 12:59:53'),(142,154,'Reset OTP 553256\n-\nClick to link to verify: https://mossbets.com/verify/ZJ05AMA268/553256\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-19 16:00:11','2022-10-19 13:00:11'),(143,134,'Reset OTP 403597\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/403597\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-19 16:18:29','2022-10-19 13:18:29'),(144,158,'Reset OTP 563407\n-\nClick to link to verify: https://mossbets.com/verify/ZJ11VGK682/563407\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-19 16:20:07','2022-10-19 13:20:07'),(145,134,'Reset OTP 365317\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/365317\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-19 18:11:55','2022-10-19 15:11:55'),(146,123,'Reset OTP 905437\n-\nClick to link to verify: https://mossbets.com/verify/ZG26UMA682/905437\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-20 11:04:58','2022-10-20 08:04:58'),(147,166,'Karibu Customer,Use OTP 693547\n-\nClick to link to verify: https://mossbets.com/verify/ZJ21EQW044/693547\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-21 11:17:23','2022-10-21 08:17:23'),(148,167,'Karibu Customer,Use OTP 417013\n-\nClick to link to verify: https://mossbets.com/verify/ZJ21KWQ420/417013\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-21 11:36:09','2022-10-21 08:36:09'),(149,153,'Reset OTP 932716\n-\nClick to link to verify: https://mossbets.com/verify/ZJ03OUO404/932716\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-21 13:31:56','2022-10-21 10:31:56'),(150,165,'Reset OTP 486819\n-\nClick to link to verify: https://mossbets.com/verify/ZJ19EUU046/486819\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-21 13:34:10','2022-10-21 10:34:10'),(151,153,'Reset OTP 783317\n-\nClick to link to verify: https://mossbets.com/verify/ZJ03OUO404/783317\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-21 13:37:50','2022-10-21 10:37:50'),(152,165,'Reset OTP 654150\n-\nClick to link to verify: https://mossbets.com/verify/ZJ19EUU046/654150\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-21 13:38:01','2022-10-21 10:38:01'),(153,168,'Karibu Customer,Use OTP 841481\n-\nClick to link to verify: https://mossbets.com/verify/ZJ21WWU206/841481\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-21 15:16:07','2022-10-21 12:16:07'),(154,169,'Karibu Customer,Use OTP 790976\n-\nClick to link to verify: https://mossbets.com/verify/ZJ21UWU086/790976\n-\nGet GUARANTEED Welcome Bonus or FREEBET-\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-21 17:30:51','2022-10-21 14:30:51'),(155,115,'Reset OTP 680902\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/680902\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-21 18:39:35','2022-10-21 15:39:35'),(156,134,'Reset OTP 116899\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/116899\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-25 11:28:46','2022-10-25 08:28:46'),(157,134,'Reset OTP 558810\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/558810\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-25 12:03:00','2022-10-25 09:03:00'),(158,115,'Reset OTP 490572\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/490572\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-26 19:20:05','2022-10-26 16:20:05'),(159,115,'Reset OTP 894744\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/894744\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-27 12:14:11','2022-10-27 09:14:11'),(160,115,'Karibu {username},Use OTP {verify_code}\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-10-31 14:45:38','2022-10-31 11:45:38'),(161,115,'Karibu {username},Use OTP {verify_code}\n-\nClick to link to verify: https://mossbets.com/\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-10-31 14:47:49','2022-10-31 11:47:49'),(162,115,'Karibu {username},Use OTP {verify_code}\n-\nClick to link to verify: https://mossbets.com/\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-10-31 15:02:22','2022-10-31 12:02:22'),(163,115,'Karibu {username},Use OTP {verify_code}\n-\nClick to link to verify: https://mossbets.com/\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-10-31 15:07:52','2022-10-31 12:07:52'),(164,115,'Hi JOSEPHAT,\nKES. 50.00/- received.\nMpesa ref:QJV6Y9BUP0.\n-\nWallet Balances\n-\nBal:50.00.\nBonus:0.00.\n-\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-10-31 15:13:05','2022-10-31 12:13:05'),(165,115,'Hi JOSEPHAT,\nKES. 50.00/- received.\nMpesa ref:QJV6Y9BUP2.\n-\nWallet Balances\n-\nBal:50.00.\nBonus:0.00.\n-\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-10-31 15:15:54','2022-10-31 12:15:54'),(166,115,'Hi JOSEPHAT,\nKES. 50.00/- received.\nMpesa ref:QJV6Y9BUP3.\n-\nWallet Balances\n-\nBal:100.00.\nBonus:0.00.\n-\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-10-31 15:25:13','2022-10-31 12:25:13'),(167,129,'Hi JOSEPHAT,\nKES. 100.00/- received.\nMpesa ref:QJV6Y9BUPH.\n-\nWallet Balances\n-\nBal:100.\nBonus:0.\n-\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-10-31 15:27:28','2022-10-31 12:27:28'),(168,136,'Hi JOSEPHAT,\nKES. 100.00/- received.\nMpesa ref:QJV6Y9BUPL.\n-\nWallet Balances\n-\nBal:100.\nBonus:10.00.\n-\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-10-31 15:35:15','2022-10-31 12:35:15'),(169,125,'Hi Haggai,\nKES. 20000.00/- received.\nMpesa ref:QJV6Y9BUPN.\n-\nWallet Balances\n-\nBal:20000.\nBonus:10.00.\n-\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-10-31 15:39:07','2022-10-31 12:39:07'),(170,115,'Hi JOSEPHAT,\nKES. 20000.00/- received.\nMpesa ref:QJV6Y9BUQK.\n-\nWallet Balances\n-\nBal:20100.00.\nBonus:0.00.\n-\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-10-31 15:41:11','2022-10-31 12:41:11'),(171,135,'Reset OTP 265310\n-\nClick to link to verify: https://mossbets.com/verify/ZG19XSG664/265310\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-10-31 19:09:39','2022-10-31 16:09:39'),(172,178,'Karibu Customer,Use OTP 760862\n-\nClick to link to verify: https://mossbets.com/verify/ZJ31UWU202/760862\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-10-31 23:16:03','2022-10-31 20:16:03'),(173,122,'Reset OTP 112863\n-\nClick to link to verify: https://mossbets.com/verify/ZG20VOU604/112863\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-11-01 11:28:07','2022-11-01 08:28:07'),(174,162,'Reset OTP 247947\n-\nClick to link to verify: https://mossbets.com/verify/ZJ13UME820/247947\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-11-01 13:12:29','2022-11-01 10:12:29'),(175,179,'Karibu Customer,Use OTP 307065\n-\nClick to link to verify: https://mossbets.com/verify/ZK01MQK440/307065\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-11-01 13:38:59','2022-11-01 10:38:59'),(176,180,'Karibu Customer,Use OTP 763802\n-\nClick to link to verify: https://mossbets.com/verify/ZK01KMK224/763802\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MossBets','USER_CREATION','2022-11-01 20:32:05','2022-11-01 17:32:05'),(177,180,'Reset OTP 770245\n-\nClick to link to verify: https://mossbets.com/verify/ZK01KMK224/770245\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-11-01 20:33:39','2022-11-01 17:33:39'),(178,180,'Hi JOSPHAT,\nKES. 50.00/- received.\nMpesa ref:QJV1ZBL3F1.\n-\nWallet Balances\n-\nBal:50.\nBonus:0.\n-\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-11-01 20:41:22','2022-11-01 17:41:22'),(179,123,'Reset OTP 186158\n-\nClick to link to verify: https://mossbets.com/verify/ZG26UMA682/186158\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-11-02 12:16:56','2022-11-02 09:16:56'),(180,123,'Reset OTP 750959\n-\nClick to link to verify: https://mossbets.com/verify/ZG26UMA682/750959\n-\nHelp 07XX-XXX-XXX','MossBets','PASSWORD_RESET','2022-11-02 12:22:55','2022-11-02 09:22:55'),(181,118,'Hi John,\nKES. 20000.00/- received.\nMpesa ref:QJV6Y9BUQX.\n-\nWallet Balances\n-\nBal:20000.\nBonus:10.00.\n-\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-11-02 16:03:50','2022-11-02 13:03:50'),(182,134,'Hi Josphat,\nKES. 20000.00/- received.\nMpesa ref:QJV6Y9BUQD.\n-\nWallet Balances\n-\nBal:20000.\nBonus:10.00.\n-\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-11-02 18:29:24','2022-11-02 15:29:24'),(183,122,'Hi Daniel,\nKES. 20000.00/- received.\nMpesa ref:QJV6Y9BUQS.\n-\nWallet Balances\n-\nBal:20000.\nBonus:10.00.\n-\nHelp 07XX-XXX-XXX','MossBets','MPESA_DEPOSIT','2022-11-02 18:30:32','2022-11-02 15:30:32'),(184,123,'Reset OTP 213828\n-\nClick to link to verify: https://mossbets.com/verify/ZG26UMA682/213828\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-03 16:56:49','2022-11-03 13:56:49'),(185,181,'Karibu Customer,Use OTP 412435\n-\nClick to link to verify: https://mossbets.com/verify/ZK03EIY480/412435\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MOSSBETS_TS','USER_CREATION','2022-11-03 19:05:04','2022-11-03 16:05:04'),(186,123,'Reset OTP 332946\n-\nClick to link to verify: https://mossbets.com/verify/ZG26UMA682/332946\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-04 16:00:08','2022-11-04 13:00:08'),(187,123,'Hi Paul,\nKES. 20000.00/- received.\nMpesa ref:QJV6Y9BUQW.\n-\nWallet Balances\n-\nBal:20030.\nBonus:500.\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','MPESA_DEPOSIT','2022-11-04 16:14:13','2022-11-04 13:14:13'),(188,139,'Hi David,\nKES. 20000.00/- received.\nMpesa ref:QJV6Y9BUQZ.\n-\nWallet Balances\n-\nBal:20030.\nBonus:500.\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','MPESA_DEPOSIT','2022-11-07 17:14:05','2022-11-07 14:14:05'),(189,180,'Reset OTP 412387\n-\nClick to link to verify: https://mossbets.com/verify/ZK01KMK224/412387\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-07 21:50:08','2022-11-07 18:50:08'),(190,183,'Karibu Customer,Use OTP 594429\n-\nClick to link to verify: https://mossbets.com/verify/ZK07DCG480/594429\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MOSSBETS_TS','USER_CREATION','2022-11-07 23:16:29','2022-11-07 20:16:29'),(191,183,'Hi Steve,\nKES. 20000.00/- received.\nMpesa ref:QJV6Y9BUQB.\n-\nWallet Balances\n-\nBal:20030.\nBonus:500.\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','MPESA_DEPOSIT','2022-11-07 23:20:25','2022-11-07 20:20:25'),(192,180,'Reset OTP 486786\n-\nClick to link to verify: https://mossbets.com/verify/ZK01KMK224/486786\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-08 18:24:53','2022-11-08 15:24:53'),(193,183,'Hi Steve,\nKES. 50.00/- received.\nMpesa ref:QJV6Y9BUQ3.\n-\nWallet Balances\n-\nBal:20333.24.\nBonus:209.00.\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','MPESA_DEPOSIT','2022-11-09 13:44:09','2022-11-09 10:44:09'),(194,129,'Reset OTP 111021\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HCW226/111021\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-11 14:49:49','2022-11-11 11:49:49'),(195,129,'Reset OTP 523094\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HCW226/523094\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-11 14:55:26','2022-11-11 11:55:26'),(196,123,'Hi Paul,\nKES. 150000.00/- received.\nMpesa ref:QJV6Y9BUQC.\n-\nWallet Balances\n-\nBal:151175.34.\nBonus:0.00.\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','MPESA_DEPOSIT','2022-11-11 19:51:01','2022-11-11 16:51:01'),(197,181,'Reset OTP 756531\n-\nClick to link to verify: https://mossbets.com/verify/ZK03EIY480/756531\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-15 19:41:32','2022-11-15 16:41:32'),(198,181,'Reset OTP 332462\n-\nClick to link to verify: https://mossbets.com/verify/ZK03EIY480/332462\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-15 19:44:39','2022-11-15 16:44:39'),(199,120,'Reset OTP 668550\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/668550\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-15 19:45:13','2022-11-15 16:45:13'),(200,117,'Reset OTP 824882\n-\nClick to link to verify: https://mossbets.com/verify/ZG18QII846/824882\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-15 19:46:34','2022-11-15 16:46:34'),(201,181,'Reset OTP 888950\n-\nClick to link to verify: https://mossbets.com/verify/ZK03EIY480/888950\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-15 19:52:25','2022-11-15 16:52:25'),(202,120,'Reset OTP 725539\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/725539\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-15 19:54:17','2022-11-15 16:54:17'),(203,181,'Reset OTP 478082\n-\nClick to link to verify: https://mossbets.com/verify/ZK03EIY480/478082\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-15 19:58:19','2022-11-15 16:58:19'),(204,120,'Reset OTP 895876\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/895876\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-16 12:19:00','2022-11-16 09:19:00'),(205,186,'Karibu Customer,Use OTP 596967\n-\nClick to link to verify: https://mossbets.com/verify/ZK16QMM804/596967\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MOSSBETS_TS','USER_CREATION','2022-11-16 13:07:56','2022-11-16 10:07:56'),(206,186,'Reset OTP 442051\n-\nClick to link to verify: https://mossbets.com/verify/ZK16QMM804/442051\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-16 13:13:44','2022-11-16 10:13:44'),(207,186,'Reset OTP 761575\n-\nClick to link to verify: https://mossbets.com/verify/ZK16QMM804/761575\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-16 14:07:01','2022-11-16 11:07:01'),(208,186,'Hi Steven,\nKES. 20000.00/- received.\nMpesa ref:QJV6Y9BUQA.\n-\nWallet Balances\n-\nBal:20030.\nBonus:500.\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','MPESA_DEPOSIT','2022-11-16 14:30:09','2022-11-16 11:30:09'),(209,188,'Karibu Customer,Use OTP 168404\n-\nClick to link to verify: https://mossbets.com/verify/ZK21JCI620/168404\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MOSSBETS_TS','USER_CREATION','2022-11-21 14:15:58','2022-11-21 11:15:58'),(210,188,'Hi Steven,\nKES. 20000.00/- received.\nMpesa ref:QJV6Y9BUQH.\n-\nWallet Balances\n-\nBal:20030.\nBonus:500.\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','MPESA_DEPOSIT','2022-11-21 14:39:56','2022-11-21 11:39:56'),(211,189,'Karibu Customer,Use OTP 471633\n-\nClick to link to verify: https://mossbets.com/verify/ZK21OIY680/471633\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MOSSBETS_TS','USER_CREATION','2022-11-21 14:52:55','2022-11-21 11:52:55'),(212,189,'Reset OTP 562359\n-\nClick to link to verify: https://mossbets.com/verify/ZK21OIY680/562359\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-21 14:54:05','2022-11-21 11:54:05'),(213,164,'Karibu Customer,Use OTP 769972\n-\nClick to link to verify: https://mossbets.com/verify/ZK21UMG884/769972\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 07XX-XXX-XXX','MOSSBETS_TS','USER_CREATION','2022-11-21 15:29:00','2022-11-21 12:29:00'),(214,132,'Reset OTP 224229\n-\nClick to link to verify: https://mossbets.com/verify/ZG18KWE088/224229\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-23 18:55:58','2022-11-23 15:55:58'),(215,134,'Reset OTP 782917\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/782917\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-24 16:58:45','2022-11-24 13:58:45'),(216,167,'Reset OTP 746237\n-\nClick to link to verify: https://mossbets.com/verify/ZJ21KWQ420/746237\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-24 17:00:18','2022-11-24 14:00:18'),(217,134,'Reset OTP 631153\n-\nClick to link to verify: https://mossbets.com/verify/ZG19CMG860/631153\n-\nHelp 07XX-XXX-XXX','MOSSBETS_TS','PASSWORD_RESET','2022-11-24 17:59:47','2022-11-24 14:59:47'),(218,120,'Reset OTP 115754\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/115754\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-11-29 11:36:17','2022-11-29 08:36:17'),(219,115,'Reset OTP 774989\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/774989\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-11-29 13:09:44','2022-11-29 10:09:44'),(220,115,'Reset OTP 365017\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/365017\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-11-29 13:14:17','2022-11-29 10:14:17'),(221,115,'Reset OTP 960419\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/960419\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-11-29 13:17:49','2022-11-29 10:17:49'),(222,115,'Reset OTP 589250\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/589250\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-11-29 13:23:15','2022-11-29 10:23:15'),(223,190,'Karibu Customer,Use OTP 419165\n-\nClick to link to verify: https://mossbets.com/verify/ZL05EKA646/419165\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 0111135736','MOSSBETS_TS','USER_CREATION','2022-12-05 18:23:51','2022-12-05 15:23:51'),(224,190,'Reset OTP 408864\n-\nClick to link to verify: https://mossbets.com/verify/ZL05EKA646/408864\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-05 18:26:32','2022-12-05 15:26:32'),(225,191,'Karibu Customer,Use OTP 163998\n-\nClick to link to verify: https://mossbets.com/verify/ZL07WMK068/163998\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 0111135736','MOSSBETS_TS','USER_CREATION','2022-12-07 14:06:03','2022-12-07 11:06:03'),(226,192,'Karibu Customer,Use OTP 578047\n-\nClick to link to verify: https://mossbets.com/verify/ZL07SUG682/578047\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 0111135736','MOSSBETS_TS','USER_CREATION','2022-12-07 14:12:19','2022-12-07 11:12:19'),(227,193,'Karibu Customer,Use OTP 742711\n-\nClick to link to verify: https://mossbets.com/verify/ZL07GWY240/742711\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 0111135736','MOSSBETS_TS','USER_CREATION','2022-12-07 14:20:05','2022-12-07 11:20:05'),(228,194,'Karibu Customer,Use OTP 878846\n-\nClick to link to verify: https://mossbets.com/verify/ZL07QEW840/878846\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 0111135736','MOSSBETS_TS','USER_CREATION','2022-12-07 14:27:21','2022-12-07 11:27:21'),(229,195,'Karibu Customer,Use OTP 273057\n-\nClick to link to verify: https://mossbets.com/verify/ZL07SCM006/273057\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 0111135736','MOSSBETS_TS','USER_CREATION','2022-12-07 14:30:44','2022-12-07 11:30:44'),(230,115,'Reset OTP 541145\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HGM240/541145\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-14 15:51:55','2022-12-14 12:51:55'),(231,125,'Reset OTP 573779\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/573779\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-14 19:11:11','2022-12-14 16:11:11'),(232,129,'Reset OTP 597981\n-\nClick to link to verify: https://mossbets.com/verify/ZG18HCW226/597981\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-14 19:15:49','2022-12-14 16:15:49'),(233,125,'Reset OTP 944788\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/944788\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-14 19:27:54','2022-12-14 16:27:54'),(234,167,'Reset OTP 510081\n-\nClick to link to verify: https://mossbets.com/verify/ZJ21KWQ420/510081\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-19 13:17:08','2022-12-19 10:17:08'),(235,196,'Karibu,Use OTP 272607\n-\nClick to link to verify: https://mossbets.com/verify/ZL197YOA446/272607\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 0111135736','MOSSBETS_TS','USER_CREATION','2022-12-19 13:18:26','2022-12-19 10:18:26'),(236,167,'Reset OTP 167501\n-\nClick to link to verify: https://mossbets.com/verify/ZJ21KWQ420/167501\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-19 13:24:33','2022-12-19 10:24:33'),(237,120,'Reset OTP 779570\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/779570\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-19 13:26:50','2022-12-19 10:26:50'),(238,125,'Reset OTP 991630\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/991630\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-20 11:07:01','2022-12-20 08:07:01'),(239,125,'Reset OTP 618628\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/618628\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-20 13:13:37','2022-12-20 10:13:37'),(240,125,'Reset OTP 225493\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/225493\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-20 14:23:35','2022-12-20 11:23:35'),(241,125,'Reset OTP 630144\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/630144\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-20 15:03:39','2022-12-20 12:03:39'),(242,125,'Reset OTP 240455\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/240455\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-20 18:49:00','2022-12-20 15:49:00'),(243,167,'Reset OTP 872164\n-\nClick to link to verify: https://mossbets.com/verify/ZJ21KWQ420/872164\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2022-12-24 05:02:23','2022-12-24 02:02:23'),(244,125,'Reset OTP 591086\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/591086\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2023-01-04 11:28:41','2023-01-04 08:28:41'),(245,167,'Reset OTP 935063\n-\nClick to link to verify: https://mossbets.com/verify/ZJ21KWQ420/935063\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2023-01-04 11:29:47','2023-01-04 08:29:47'),(246,166,'Reset OTP 562052\n-\nClick to link to verify: https://mossbets.com/verify/ZJ21EQW044/562052\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2023-01-04 11:33:39','2023-01-04 08:33:39'),(247,166,'Reset OTP 675788\n-\nClick to link to verify: https://mossbets.com/verify/ZJ21EQW044/675788\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2023-01-04 11:35:43','2023-01-04 08:35:43'),(248,154,'Reset OTP 644080\n-\nClick to link to verify: https://mossbets.com/verify/ZJ05AMA268/644080\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2023-01-04 11:36:07','2023-01-04 08:36:07'),(249,153,'Reset OTP 873503\n-\nClick to link to verify: https://mossbets.com/verify/ZJ03OUO404/873503\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2023-01-04 11:36:31','2023-01-04 08:36:31'),(250,125,'Reset OTP 503800\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/503800\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2023-01-09 12:35:26','2023-01-09 09:35:26'),(251,120,'Reset OTP 660908\n-\nClick to link to verify: https://mossbets.com/verify/ZG18FSY248/660908\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2023-01-09 13:47:41','2023-01-09 10:47:41'),(252,115,'Reset OTP: HPC168.{line}{line} Web link: https://portal2.mb-gaming.life. {line}Help 0723000033','MossBets_TS','ADMIN_APP','2023-01-13 14:40:41','2023-01-13 11:40:41'),(253,197,'Karibu,Use OTP 509994\n-\nClick to link to verify: https://mossbets.com/verify/YL14O16JQT65/509994\n-\nGet GUARANTEED Welcome Bonus or FREEBET\nHelp 0111135736','MOSSBETS_TS','USER_CREATION','2023-01-14 13:52:06','2023-01-14 10:52:06'),(254,178,'Reset OTP 744588\n-\nClick to link to verify: https://mossbets.com/verify/ZJ31UWU202/744588\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2023-02-09 15:02:55','2023-02-09 12:02:55'),(255,122,'Reset OTP 145450\n-\nClick to link to verify: https://mossbets.com/verify/ZG20VOU604/145450\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2023-02-09 15:20:02','2023-02-09 12:20:02'),(256,117,'Reset OTP 213177\n-\nClick to link to verify: https://mossbets.com/verify/ZG18QII846/213177\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2023-04-15 11:17:15','2023-04-15 08:17:15'),(257,125,'Reset OTP 397744\n-\nClick to link to verify: https://mossbets.com/verify/ZG18XOQ484/397744\n-\nHelp 0111135736','MOSSBETS_TS','PASSWORD_RESET','2023-05-07 11:19:11','2023-05-07 08:19:11');
/*!40000 ALTER TABLE `outbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbox_dlr`
--

DROP TABLE IF EXISTS `outbox_dlr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbox_dlr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `outbox_id` bigint(20) NOT NULL,
  `correlator` varchar(85) DEFAULT NULL,
  `campaign_id` varchar(85) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sms_pages` decimal(10,3) NOT NULL DEFAULT '0.000',
  `sms_cost` varchar(15) DEFAULT '0.000',
  `received_on` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `outbox_id` (`outbox_id`,`correlator`,`campaign_id`,`sms_pages`),
  KEY `created_at` (`created_at`),
  KEY `description` (`description`),
  KEY `sms_cost` (`sms_cost`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbox_dlr`
--

LOCK TABLES `outbox_dlr` WRITE;
/*!40000 ALTER TABLE `outbox_dlr` DISABLE KEYS */;
INSERT INTO `outbox_dlr` VALUES (18,22,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-18 14:31:19','2022-07-18 14:31:19','2022-07-18 11:31:19'),(19,23,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-18 14:41:56','2022-07-18 14:41:56','2022-07-18 11:41:56'),(20,24,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-18 14:43:40','2022-07-18 14:43:40','2022-07-18 11:43:40'),(21,25,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-18 14:44:28','2022-07-18 14:44:28','2022-07-18 11:44:28'),(22,26,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-18 15:59:19','2022-07-18 15:59:19','2022-07-18 12:59:19'),(23,27,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-18 18:58:59','2022-07-18 18:58:59','2022-07-18 15:58:59'),(24,28,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-18 19:01:24','2022-07-18 19:01:24','2022-07-18 16:01:24'),(25,29,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-18 19:09:24','2022-07-18 19:09:24','2022-07-18 16:09:24'),(26,30,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-18 19:17:25','2022-07-18 19:17:25','2022-07-18 16:17:25'),(27,31,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-18 20:44:19','2022-07-18 20:44:19','2022-07-18 17:44:19'),(28,32,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-18 20:44:20','2022-07-18 20:44:20','2022-07-18 17:44:20'),(29,33,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-18 20:46:35','2022-07-18 20:46:35','2022-07-18 17:46:35'),(30,34,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-18 20:48:32','2022-07-18 20:48:32','2022-07-18 17:48:32'),(31,35,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-18 20:51:13','2022-07-18 20:51:13','2022-07-18 17:51:13'),(32,36,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-18 20:52:00','2022-07-18 20:52:00','2022-07-18 17:52:00'),(33,37,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-18 20:53:18','2022-07-18 20:53:18','2022-07-18 17:53:18'),(34,38,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-18 21:09:25','2022-07-18 21:09:25','2022-07-18 18:09:25'),(35,39,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-18 21:15:02','2022-07-18 21:15:02','2022-07-18 18:15:02'),(36,40,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-18 21:22:01','2022-07-18 21:22:01','2022-07-18 18:22:01'),(37,41,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-18 21:23:13','2022-07-18 21:23:13','2022-07-18 18:23:13'),(38,42,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-19 09:59:11','2022-07-19 09:59:11','2022-07-19 06:59:11'),(39,43,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-19 10:06:50','2022-07-19 10:06:50','2022-07-19 07:06:50'),(40,44,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-19 10:15:11','2022-07-19 10:15:11','2022-07-19 07:15:11'),(41,45,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-19 11:15:22','2022-07-19 11:15:22','2022-07-19 08:15:22'),(42,46,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-19 11:22:21','2022-07-19 11:22:21','2022-07-19 08:22:21'),(43,47,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-19 14:34:49','2022-07-19 14:34:49','2022-07-19 11:34:49'),(44,48,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-19 17:06:22','2022-07-19 17:06:22','2022-07-19 14:06:22'),(45,49,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-19 17:13:11','2022-07-19 17:13:11','2022-07-19 14:13:11'),(46,50,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-19 17:14:48','2022-07-19 17:14:48','2022-07-19 14:14:48'),(47,51,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-19 17:27:50','2022-07-19 17:27:50','2022-07-19 14:27:50'),(48,52,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-20 16:12:04','2022-07-20 16:12:04','2022-07-20 13:12:04'),(49,53,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-20 20:07:21','2022-07-20 20:07:21','2022-07-20 17:07:21'),(50,54,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 13:19:21','2022-07-26 13:19:21','2022-07-26 10:19:21'),(51,55,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 13:22:38','2022-07-26 13:22:38','2022-07-26 10:22:38'),(52,56,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 13:24:29','2022-07-26 13:24:29','2022-07-26 10:24:29'),(53,57,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 13:28:28','2022-07-26 13:28:28','2022-07-26 10:28:28'),(54,58,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 13:36:40','2022-07-26 13:36:40','2022-07-26 10:36:40'),(55,59,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-26 15:00:55','2022-07-26 15:00:55','2022-07-26 12:00:55'),(56,60,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 15:01:28','2022-07-26 15:01:28','2022-07-26 12:01:28'),(57,61,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-26 15:23:37','2022-07-26 15:23:37','2022-07-26 12:23:37'),(58,62,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 15:27:15','2022-07-26 15:27:15','2022-07-26 12:27:15'),(59,63,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-26 16:24:06','2022-07-26 16:24:06','2022-07-26 13:24:06'),(60,64,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 16:29:35','2022-07-26 16:29:35','2022-07-26 13:29:35'),(61,65,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 16:31:47','2022-07-26 16:31:47','2022-07-26 13:31:47'),(62,66,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',2.000,'0.000','2022-07-26 16:45:52','2022-07-26 16:45:52','2022-07-26 13:45:52'),(63,67,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 17:18:56','2022-07-26 17:18:56','2022-07-26 14:18:56'),(64,68,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 17:32:24','2022-07-26 17:32:24','2022-07-26 14:32:24'),(65,69,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 17:34:31','2022-07-26 17:34:31','2022-07-26 14:34:31'),(66,70,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 17:37:19','2022-07-26 17:37:19','2022-07-26 14:37:19'),(67,71,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 19:23:46','2022-07-26 19:23:46','2022-07-26 16:23:46'),(68,72,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 19:43:47','2022-07-26 19:43:47','2022-07-26 16:43:47'),(69,73,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 20:05:17','2022-07-26 20:05:17','2022-07-26 17:05:17'),(70,74,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 20:08:33','2022-07-26 20:08:33','2022-07-26 17:08:33'),(71,75,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 20:12:33','2022-07-26 20:12:33','2022-07-26 17:12:33'),(72,76,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-26 20:38:26','2022-07-26 20:38:26','2022-07-26 17:38:26'),(73,77,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-28 19:31:33','2022-07-28 19:31:33','2022-07-28 16:31:33'),(74,78,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-28 19:34:32','2022-07-28 19:34:32','2022-07-28 16:34:32'),(75,79,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-28 19:45:12','2022-07-28 19:45:12','2022-07-28 16:45:12'),(76,80,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-28 19:46:19','2022-07-28 19:46:19','2022-07-28 16:46:19'),(77,81,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-28 20:02:30','2022-07-28 20:02:30','2022-07-28 17:02:30'),(78,82,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-28 20:04:30','2022-07-28 20:04:30','2022-07-28 17:04:30'),(79,83,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-29 13:03:42','2022-07-29 13:03:42','2022-07-29 10:03:42'),(80,84,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-07-29 13:14:04','2022-07-29 13:14:04','2022-07-29 10:14:04'),(81,85,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-08-18 19:35:41','2022-08-18 19:35:41','2022-08-18 16:35:41'),(82,86,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-09-08 12:44:32','2022-09-08 12:44:32','2022-09-08 09:44:32'),(83,87,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-09-22 15:39:53','2022-09-22 15:39:53','2022-09-22 12:39:53'),(84,88,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-09-22 17:03:04','2022-09-22 17:03:04','2022-09-22 14:03:04'),(85,89,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-09-22 17:08:13','2022-09-22 17:08:13','2022-09-22 14:08:13'),(86,90,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-09-22 17:47:53','2022-09-22 17:47:53','2022-09-22 14:47:53'),(87,91,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-09-22 18:32:43','2022-09-22 18:32:43','2022-09-22 15:32:43'),(88,92,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-09-23 10:41:16','2022-09-23 10:41:16','2022-09-23 07:41:16'),(89,93,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-09-23 10:49:41','2022-09-23 10:49:41','2022-09-23 07:49:41'),(90,94,NULL,NULL,'Successfully published on Queue:MOSSBETS_OUTBOX_QUEUE',1.000,'0.000','2022-09-26 14:25:05','2022-09-26 14:25:05','2022-09-26 11:25:05'),(91,95,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-03 11:10:45','2022-10-03 11:10:45','2022-10-03 08:10:45'),(92,96,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-03 11:40:30','2022-10-03 11:40:30','2022-10-03 08:40:30'),(93,97,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-03 13:02:01','2022-10-03 13:02:01','2022-10-03 10:02:01'),(94,98,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-03 14:57:52','2022-10-03 14:57:52','2022-10-03 11:57:52'),(95,99,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-05 17:23:50','2022-10-05 17:23:50','2022-10-05 14:23:50'),(96,100,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-05 17:25:00','2022-10-05 17:25:00','2022-10-05 14:25:00'),(97,101,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-05 17:29:25','2022-10-05 17:29:25','2022-10-05 14:29:25'),(98,102,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-11 14:12:42','2022-10-11 14:12:42','2022-10-11 11:12:42'),(99,103,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-11 14:50:50','2022-10-11 14:50:50','2022-10-11 11:50:50'),(100,104,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-11 16:51:42','2022-10-11 16:51:42','2022-10-11 13:51:42'),(101,105,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-11 16:55:15','2022-10-11 16:55:15','2022-10-11 13:55:15'),(102,106,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-11 17:09:58','2022-10-11 17:09:58','2022-10-11 14:09:58'),(103,107,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-11 17:11:55','2022-10-11 17:11:55','2022-10-11 14:11:55'),(104,108,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-11 17:21:55','2022-10-11 17:21:55','2022-10-11 14:21:55'),(105,109,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-11 17:24:08','2022-10-11 17:24:08','2022-10-11 14:24:08'),(106,110,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-11 17:26:21','2022-10-11 17:26:21','2022-10-11 14:26:21'),(107,111,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-11 17:32:25','2022-10-11 17:32:25','2022-10-11 14:32:25'),(108,112,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-11 17:34:34','2022-10-11 17:34:34','2022-10-11 14:34:34'),(109,113,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-12 11:40:12','2022-10-12 11:40:12','2022-10-12 08:40:12'),(110,114,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-12 11:53:40','2022-10-12 11:53:40','2022-10-12 08:53:40'),(111,115,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-12 11:57:11','2022-10-12 11:57:11','2022-10-12 08:57:11'),(112,116,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-13 12:55:08','2022-10-13 12:55:08','2022-10-13 09:55:08'),(113,117,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-13 12:56:44','2022-10-13 12:56:44','2022-10-13 09:56:44'),(114,118,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-13 13:40:09','2022-10-13 13:40:09','2022-10-13 10:40:09'),(115,119,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-13 13:41:48','2022-10-13 13:41:48','2022-10-13 10:41:48'),(116,120,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-13 13:54:59','2022-10-13 13:54:59','2022-10-13 10:54:59'),(117,121,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-13 14:28:06','2022-10-13 14:28:06','2022-10-13 11:28:06'),(118,122,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-13 16:27:08','2022-10-13 16:27:08','2022-10-13 13:27:08'),(119,123,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-17 18:31:54','2022-10-17 18:31:54','2022-10-17 15:31:54'),(120,124,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 10:34:17','2022-10-18 10:34:17','2022-10-18 07:34:17'),(121,125,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 11:01:07','2022-10-18 11:01:07','2022-10-18 08:01:07'),(122,126,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 11:45:30','2022-10-18 11:45:30','2022-10-18 08:45:30'),(123,127,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 11:59:59','2022-10-18 11:59:59','2022-10-18 08:59:59'),(124,128,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 12:08:09','2022-10-18 12:08:09','2022-10-18 09:08:09'),(125,129,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 12:09:49','2022-10-18 12:09:49','2022-10-18 09:09:49'),(126,130,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 12:11:41','2022-10-18 12:11:41','2022-10-18 09:11:41'),(127,131,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 13:00:43','2022-10-18 13:00:43','2022-10-18 10:00:43'),(128,132,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 18:18:20','2022-10-18 18:18:20','2022-10-18 15:18:20'),(129,133,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 18:21:50','2022-10-18 18:21:50','2022-10-18 15:21:50'),(130,134,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 18:40:53','2022-10-18 18:40:53','2022-10-18 15:40:53'),(131,135,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 19:17:09','2022-10-18 19:17:09','2022-10-18 16:17:09'),(132,136,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-18 19:23:38','2022-10-18 19:23:38','2022-10-18 16:23:38'),(133,137,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-19 11:24:49','2022-10-19 11:24:49','2022-10-19 08:24:49'),(134,138,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-19 12:32:30','2022-10-19 12:32:30','2022-10-19 09:32:30'),(135,139,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-19 15:56:11','2022-10-19 15:56:11','2022-10-19 12:56:11'),(136,140,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-19 15:57:30','2022-10-19 15:57:30','2022-10-19 12:57:30'),(137,141,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-19 15:59:53','2022-10-19 15:59:53','2022-10-19 12:59:53'),(138,142,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-19 16:00:11','2022-10-19 16:00:11','2022-10-19 13:00:11'),(139,143,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-19 16:18:29','2022-10-19 16:18:29','2022-10-19 13:18:29'),(140,144,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-19 16:20:07','2022-10-19 16:20:07','2022-10-19 13:20:07'),(141,145,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-19 18:11:55','2022-10-19 18:11:55','2022-10-19 15:11:55'),(142,146,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-20 11:04:58','2022-10-20 11:04:58','2022-10-20 08:04:58'),(143,147,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-21 11:17:23','2022-10-21 11:17:23','2022-10-21 08:17:23'),(144,148,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-21 11:36:09','2022-10-21 11:36:09','2022-10-21 08:36:09'),(145,149,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-21 13:31:56','2022-10-21 13:31:56','2022-10-21 10:31:56'),(146,150,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-21 13:34:10','2022-10-21 13:34:10','2022-10-21 10:34:10'),(147,151,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-21 13:37:50','2022-10-21 13:37:50','2022-10-21 10:37:50'),(148,152,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-21 13:38:01','2022-10-21 13:38:01','2022-10-21 10:38:01'),(149,153,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-21 15:16:07','2022-10-21 15:16:07','2022-10-21 12:16:07'),(150,154,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-21 17:30:51','2022-10-21 17:30:51','2022-10-21 14:30:51'),(151,155,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-21 18:39:35','2022-10-21 18:39:35','2022-10-21 15:39:35'),(152,156,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-25 11:28:49','2022-10-25 11:28:49','2022-10-25 08:28:49'),(153,157,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-25 12:03:01','2022-10-25 12:03:01','2022-10-25 09:03:01'),(154,158,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-26 19:20:06','2022-10-26 19:20:06','2022-10-26 16:20:06'),(155,159,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-27 12:14:11','2022-10-27 12:14:11','2022-10-27 09:14:11'),(156,160,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-31 14:45:38','2022-10-31 14:45:38','2022-10-31 11:45:38'),(157,161,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-31 14:47:49','2022-10-31 14:47:49','2022-10-31 11:47:49'),(158,162,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-31 15:02:23','2022-10-31 15:02:23','2022-10-31 12:02:23'),(159,163,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-31 15:07:52','2022-10-31 15:07:52','2022-10-31 12:07:52'),(160,164,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-31 15:13:05','2022-10-31 15:13:05','2022-10-31 12:13:05'),(161,165,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-31 15:15:54','2022-10-31 15:15:54','2022-10-31 12:15:54'),(162,166,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-31 15:25:13','2022-10-31 15:25:13','2022-10-31 12:25:13'),(163,167,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-31 15:27:28','2022-10-31 15:27:28','2022-10-31 12:27:28'),(164,168,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-31 15:35:15','2022-10-31 15:35:15','2022-10-31 12:35:15'),(165,169,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-31 15:39:07','2022-10-31 15:39:07','2022-10-31 12:39:07'),(166,170,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-31 15:41:11','2022-10-31 15:41:11','2022-10-31 12:41:11'),(167,171,NULL,NULL,'Queue Request',1.000,'0.000','2022-10-31 19:09:39','2022-10-31 19:09:39','2022-10-31 16:09:39'),(168,172,NULL,NULL,'Queue Request',2.000,'0.000','2022-10-31 23:16:03','2022-10-31 23:16:03','2022-10-31 20:16:03'),(169,173,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-01 11:28:07','2022-11-01 11:28:07','2022-11-01 08:28:07'),(170,174,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-01 13:12:29','2022-11-01 13:12:29','2022-11-01 10:12:29'),(171,175,NULL,NULL,'Queue Request',2.000,'0.000','2022-11-01 13:39:00','2022-11-01 13:39:00','2022-11-01 10:39:00'),(172,176,NULL,NULL,'Queue Request',2.000,'0.000','2022-11-01 20:32:05','2022-11-01 20:32:05','2022-11-01 17:32:05'),(173,177,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-01 20:33:39','2022-11-01 20:33:39','2022-11-01 17:33:39'),(174,178,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-01 20:41:22','2022-11-01 20:41:22','2022-11-01 17:41:22'),(175,179,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-02 12:16:57','2022-11-02 12:16:57','2022-11-02 09:16:57'),(176,180,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-02 12:22:55','2022-11-02 12:22:55','2022-11-02 09:22:55'),(177,181,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-02 16:03:50','2022-11-02 16:03:50','2022-11-02 13:03:50'),(178,182,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-02 18:29:24','2022-11-02 18:29:24','2022-11-02 15:29:24'),(179,183,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-02 18:30:32','2022-11-02 18:30:32','2022-11-02 15:30:32'),(180,184,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-03 16:56:49','2022-11-03 16:56:49','2022-11-03 13:56:49'),(181,185,NULL,NULL,'Queue Request',2.000,'0.000','2022-11-03 19:05:04','2022-11-03 19:05:04','2022-11-03 16:05:04'),(182,186,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-04 16:00:09','2022-11-04 16:00:09','2022-11-04 13:00:09'),(183,187,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-04 16:14:13','2022-11-04 16:14:13','2022-11-04 13:14:13'),(184,188,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-07 17:14:05','2022-11-07 17:14:05','2022-11-07 14:14:05'),(185,189,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-07 21:50:08','2022-11-07 21:50:08','2022-11-07 18:50:08'),(186,190,NULL,NULL,'Queue Request',2.000,'0.000','2022-11-07 23:16:29','2022-11-07 23:16:29','2022-11-07 20:16:29'),(187,191,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-07 23:20:26','2022-11-07 23:20:26','2022-11-07 20:20:26'),(188,192,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-08 18:24:53','2022-11-08 18:24:53','2022-11-08 15:24:53'),(189,193,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-09 13:44:09','2022-11-09 13:44:09','2022-11-09 10:44:09'),(190,194,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-11 14:49:50','2022-11-11 14:49:50','2022-11-11 11:49:50'),(191,195,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-11 14:55:26','2022-11-11 14:55:26','2022-11-11 11:55:26'),(192,196,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-11 19:51:01','2022-11-11 19:51:01','2022-11-11 16:51:01'),(193,197,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-15 19:41:32','2022-11-15 19:41:32','2022-11-15 16:41:32'),(194,198,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-15 19:44:39','2022-11-15 19:44:39','2022-11-15 16:44:39'),(195,199,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-15 19:45:13','2022-11-15 19:45:13','2022-11-15 16:45:13'),(196,200,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-15 19:46:35','2022-11-15 19:46:35','2022-11-15 16:46:35'),(197,201,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-15 19:52:25','2022-11-15 19:52:25','2022-11-15 16:52:25'),(198,202,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-15 19:54:17','2022-11-15 19:54:17','2022-11-15 16:54:17'),(199,203,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-15 19:58:19','2022-11-15 19:58:19','2022-11-15 16:58:19'),(200,204,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-16 12:19:00','2022-11-16 12:19:00','2022-11-16 09:19:00'),(201,205,NULL,NULL,'Queue Request',2.000,'0.000','2022-11-16 13:07:56','2022-11-16 13:07:56','2022-11-16 10:07:56'),(202,206,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-16 13:13:44','2022-11-16 13:13:44','2022-11-16 10:13:44'),(203,207,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-16 14:07:01','2022-11-16 14:07:01','2022-11-16 11:07:01'),(204,208,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-16 14:30:09','2022-11-16 14:30:09','2022-11-16 11:30:09'),(205,209,NULL,NULL,'Queue Request',2.000,'0.000','2022-11-21 14:15:58','2022-11-21 14:15:58','2022-11-21 11:15:58'),(206,210,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-21 14:39:56','2022-11-21 14:39:56','2022-11-21 11:39:56'),(207,211,NULL,NULL,'Queue Request',2.000,'0.000','2022-11-21 14:52:55','2022-11-21 14:52:55','2022-11-21 11:52:55'),(208,212,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-21 14:54:05','2022-11-21 14:54:05','2022-11-21 11:54:05'),(209,213,NULL,NULL,'Queue Request',2.000,'0.000','2022-11-21 15:29:01','2022-11-21 15:29:01','2022-11-21 12:29:01'),(210,214,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-23 18:55:59','2022-11-23 18:55:59','2022-11-23 15:55:59'),(211,215,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-24 16:58:45','2022-11-24 16:58:45','2022-11-24 13:58:45'),(212,216,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-24 17:00:18','2022-11-24 17:00:18','2022-11-24 14:00:18'),(213,217,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-24 17:59:47','2022-11-24 17:59:47','2022-11-24 14:59:47'),(214,218,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-29 11:36:18','2022-11-29 11:36:18','2022-11-29 08:36:18'),(215,219,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-29 13:09:44','2022-11-29 13:09:44','2022-11-29 10:09:44'),(216,220,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-29 13:14:17','2022-11-29 13:14:17','2022-11-29 10:14:17'),(217,221,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-29 13:17:49','2022-11-29 13:17:49','2022-11-29 10:17:49'),(218,222,NULL,NULL,'Queue Request',1.000,'0.000','2022-11-29 13:23:15','2022-11-29 13:23:15','2022-11-29 10:23:15'),(219,223,NULL,NULL,'Queue Request',2.000,'0.000','2022-12-05 18:23:52','2022-12-05 18:23:52','2022-12-05 15:23:52'),(220,224,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-05 18:26:33','2022-12-05 18:26:33','2022-12-05 15:26:33'),(221,225,NULL,NULL,'Queue Request',2.000,'0.000','2022-12-07 14:06:04','2022-12-07 14:06:04','2022-12-07 11:06:04'),(222,226,NULL,NULL,'Queue Request',2.000,'0.000','2022-12-07 14:12:19','2022-12-07 14:12:19','2022-12-07 11:12:19'),(223,227,NULL,NULL,'Queue Request',2.000,'0.000','2022-12-07 14:20:05','2022-12-07 14:20:05','2022-12-07 11:20:05'),(224,228,NULL,NULL,'Queue Request',2.000,'0.000','2022-12-07 14:27:21','2022-12-07 14:27:21','2022-12-07 11:27:21'),(225,229,NULL,NULL,'Queue Request',2.000,'0.000','2022-12-07 14:30:44','2022-12-07 14:30:44','2022-12-07 11:30:44'),(226,230,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-14 15:51:56','2022-12-14 15:51:56','2022-12-14 12:51:56'),(227,231,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-14 19:11:12','2022-12-14 19:11:12','2022-12-14 16:11:12'),(228,232,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-14 19:15:49','2022-12-14 19:15:49','2022-12-14 16:15:49'),(229,233,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-14 19:27:54','2022-12-14 19:27:54','2022-12-14 16:27:54'),(230,234,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-19 13:17:09','2022-12-19 13:17:09','2022-12-19 10:17:09'),(231,235,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-19 13:18:26','2022-12-19 13:18:26','2022-12-19 10:18:26'),(232,236,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-19 13:24:33','2022-12-19 13:24:33','2022-12-19 10:24:33'),(233,237,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-19 13:26:50','2022-12-19 13:26:50','2022-12-19 10:26:50'),(234,238,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-20 11:07:02','2022-12-20 11:07:02','2022-12-20 08:07:02'),(235,239,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-20 13:13:37','2022-12-20 13:13:37','2022-12-20 10:13:37'),(236,240,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-20 14:23:35','2022-12-20 14:23:35','2022-12-20 11:23:35'),(237,241,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-20 15:03:39','2022-12-20 15:03:39','2022-12-20 12:03:39'),(238,242,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-20 18:49:00','2022-12-20 18:49:00','2022-12-20 15:49:00'),(239,243,NULL,NULL,'Queue Request',1.000,'0.000','2022-12-24 05:02:24','2022-12-24 05:02:24','2022-12-24 02:02:24'),(240,244,NULL,NULL,'Queue Request',1.000,'0.000','2023-01-04 11:28:41','2023-01-04 11:28:41','2023-01-04 08:28:41'),(241,245,NULL,NULL,'Queue Request',1.000,'0.000','2023-01-04 11:29:48','2023-01-04 11:29:48','2023-01-04 08:29:48'),(242,246,NULL,NULL,'Queue Request',1.000,'0.000','2023-01-04 11:33:39','2023-01-04 11:33:39','2023-01-04 08:33:39'),(243,247,NULL,NULL,'Queue Request',1.000,'0.000','2023-01-04 11:35:43','2023-01-04 11:35:43','2023-01-04 08:35:43'),(244,248,NULL,NULL,'Queue Request',1.000,'0.000','2023-01-04 11:36:07','2023-01-04 11:36:07','2023-01-04 08:36:07'),(245,249,NULL,NULL,'Queue Request',1.000,'0.000','2023-01-04 11:36:31','2023-01-04 11:36:31','2023-01-04 08:36:31'),(246,250,NULL,NULL,'Queue Request',1.000,'0.000','2023-01-09 12:35:27','2023-01-09 12:35:27','2023-01-09 09:35:27'),(247,251,NULL,NULL,'Queue Request',1.000,'0.000','2023-01-09 13:47:41','2023-01-09 13:47:41','2023-01-09 10:47:41'),(248,252,'50992776','55102','Operation is Successful.',1.000,'KES.0.80',NULL,'2023-01-13 14:40:41','2023-01-13 11:40:41'),(249,253,NULL,NULL,'Queue Request',1.000,'0.000','2023-01-14 13:52:07','2023-01-14 13:52:07','2023-01-14 10:52:07'),(250,254,NULL,NULL,'Queue Request',1.000,'0.000','2023-02-09 15:02:55','2023-02-09 15:02:55','2023-02-09 12:02:55'),(251,255,NULL,NULL,'Queue Request',1.000,'0.000','2023-02-09 15:20:02','2023-02-09 15:20:02','2023-02-09 12:20:02'),(252,256,NULL,NULL,'Queue Request',1.000,'0.000','2023-04-15 11:17:16','2023-04-15 11:17:16','2023-04-15 08:17:16'),(253,257,NULL,NULL,'Queue Request',1.000,'0.000','2023-05-07 11:19:11','2023-05-07 11:19:11','2023-05-07 08:19:11');
/*!40000 ALTER TABLE `outbox_dlr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `msisdn` bigint(20) NOT NULL,
  `email_address` varchar(85) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `surname` varchar(25) DEFAULT NULL,
  `country_code` int(11) NOT NULL DEFAULT '254',
  `network` varchar(15) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `msisdn` (`msisdn`) USING BTREE,
  KEY `first_name` (`first_name`,`middle_name`,`surname`),
  KEY `country_code` (`country_code`),
  KEY `created_at` (`created_at`),
  KEY `country_code_2` (`country_code`,`network`),
  KEY `email_address` (`email_address`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (115,254704050143,'mukuha@liden.co.ke','Josephat','M','Mukuha',254,'SAFARICOM.KE','2019-03-05 13:16:55','2022-10-31 12:41:11'),(116,254704050141,'mukuha@liden.co.ke','Josephat',NULL,'Mukuha',254,'SAFARICOM','2021-09-10 22:00:00','2022-03-29 10:45:41'),(117,254743433270,'haggai@liden.co.ke','Diego','Santos','Costa',254,'SAFARICOM.KE','2022-03-27 16:04:25','2022-03-27 13:04:25'),(118,254725737216,'khisa@liden.co.ke','John','W','Khisa',254,'SAFARICOM.KE','2022-03-28 18:11:17','2022-11-02 13:03:50'),(119,254712345678,'kai@chelseafc.com','Kai','','Havertz',254,'SAFARICOM.KE','2022-04-06 13:50:34','2022-04-06 10:50:34'),(120,254715583438,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-06-02 13:58:34','2022-06-02 10:58:34'),(121,254712345687,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-06-02 14:16:52','2022-06-02 11:16:52'),(122,254724547995,NULL,'Daniel',NULL,'Karanja',254,'SAFARICOM.KE','2022-06-02 19:13:54','2022-11-02 15:30:32'),(123,254725313171,NULL,'Paul','Kiriinya','Gituma',254,'SAFARICOM.KE','2022-07-02 17:40:37','2022-11-11 16:51:01'),(124,254723868786,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-07-03 06:27:41','2022-07-03 03:27:41'),(125,254725577645,NULL,'Haggai','A','Mudenho',254,'SAFARICOM.KE','2022-07-04 15:16:49','2022-10-31 12:39:06'),(126,254720160963,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-07-10 18:25:22','2022-07-10 15:25:22'),(127,254721946110,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-07-14 20:06:18','2022-07-14 17:06:18'),(129,254704464646,NULL,'JOSEPHAT','M','OMWENGA',254,'SAFARICOM.KE',NULL,'2022-12-14 16:21:36'),(130,254712464624,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-07-18 15:58:59'),(131,254726120256,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-07-18 16:01:24'),(132,254728456883,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-07-18 16:17:25'),(133,254705040143,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-07-19 11:34:49'),(134,254714919776,NULL,'Josphat',NULL,'Muindi',254,'SAFARICOM.KE',NULL,'2022-11-02 15:29:24'),(135,254725560980,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-07-19 14:13:11'),(136,254717267279,NULL,'JOSEPHAT','M','OMWENGA',254,NULL,NULL,'2022-10-31 12:35:15'),(137,254723254595,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-07-19 14:27:49'),(138,254722637296,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-07-26 12:00:54'),(139,254702859823,NULL,'David','Ngugi','Macharia',254,'SAFARICOM.KE',NULL,'2022-11-07 14:14:05'),(140,254707053434,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-07-26 13:45:52'),(141,254724059730,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-08-02 11:15:40','2022-08-02 08:15:40'),(142,254795790392,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-08-07 11:10:07','2022-08-07 08:10:07'),(143,254743115413,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-08-07 22:53:16','2022-08-07 19:53:16'),(144,254114789908,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-08-25 23:24:34','2022-08-25 20:24:34'),(145,254719579685,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-09-02 22:25:02','2022-09-02 19:25:02'),(146,254742993985,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-09-05 11:42:59','2022-09-05 08:42:59'),(147,254727677063,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-09-21 15:27:08','2022-09-21 12:27:08'),(148,254721900735,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-09-21 15:27:41','2022-09-21 12:27:41'),(149,254748035462,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-09-23 12:30:18','2022-09-23 09:30:18'),(150,254719412285,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-09-26 19:35:53','2022-09-26 16:35:53'),(151,254700677685,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-09-29 08:08:19','2022-09-29 05:08:19'),(152,254713315164,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-03 08:40:30'),(153,254714919771,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-03 11:57:52'),(154,254714919772,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-05 14:23:50'),(155,254700112233,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-11 11:12:42'),(156,254700112231,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-11 13:51:42'),(157,254700112232,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-11 14:26:21'),(158,254700112234,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-11 14:32:25'),(159,254700000001,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-12 08:40:11'),(160,254700000002,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-12 08:53:40'),(161,254702225663,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-13 09:55:07'),(162,254769270709,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-13 10:41:48'),(163,254723852481,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-10-17 04:48:33','2022-10-17 01:48:33'),(164,254703968228,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-10-18 16:14:48','2022-10-18 13:14:48'),(165,254714919773,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-19 08:24:48'),(166,254714919774,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE',NULL,'2022-12-12 11:14:24'),(167,254714919775,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE',NULL,'2022-11-01 06:21:28'),(168,254714919778,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-21 12:16:07'),(169,254714919777,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-10-21 14:30:51'),(170,254797259633,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-10-25 14:33:57','2022-10-25 11:33:57'),(171,254114177000,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-10-26 08:07:35','2022-10-26 05:07:35'),(172,254705607297,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-10-26 11:27:15','2022-10-26 08:27:15'),(173,254725831285,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-10-26 15:31:29','2022-10-26 12:31:29'),(174,254707561760,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-10-26 19:50:12','2022-10-26 16:50:12'),(175,254745448626,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-10-27 18:16:34','2022-10-27 15:16:34'),(176,254799100887,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-10-27 18:19:38','2022-10-27 15:19:38'),(177,254746869094,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-10-28 01:02:43','2022-10-27 22:02:43'),(178,254702226553,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE',NULL,'2023-02-09 12:05:06'),(179,254702370370,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-11-01 10:38:59'),(180,254721137826,NULL,'JOSPHAT','M','MUINDI',254,'SAFARICOM.KE',NULL,'2022-11-01 17:49:40'),(181,254723750233,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE',NULL,'2022-11-03 16:08:06'),(182,254700330680,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-11-07 12:44:15','2022-11-07 09:44:15'),(183,254701097750,NULL,'Steve','Osoro','Nyamwaya',254,'SAFARICOM.KE',NULL,'2022-11-09 10:44:09'),(184,254705355703,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-11-08 09:40:26','2022-11-08 06:40:26'),(185,254723476156,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-11-15 19:42:19','2022-11-15 16:42:19'),(186,254703520693,NULL,'Steven',NULL,'Otieno',254,'SAFARICOM.KE',NULL,'2022-11-16 11:30:09'),(187,254711174230,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-11-16 18:48:24','2022-11-16 15:48:24'),(188,254707089565,NULL,'Steven',NULL,'Njoroge',254,'SAFARICOM.KE',NULL,'2022-11-21 11:39:56'),(189,254725737215,NULL,NULL,NULL,NULL,254,NULL,NULL,'2022-11-21 11:52:55'),(190,254797256056,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-12-05 18:23:51','2022-12-05 15:29:45'),(191,254110467103,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-12-07 14:06:03','2022-12-07 11:10:30'),(192,254743269137,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-12-07 14:12:19','2022-12-07 11:14:46'),(193,254715917864,NULL,NULL,NULL,NULL,254,NULL,'2022-12-07 14:20:05','2022-12-07 11:20:05'),(194,254714315465,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-12-07 14:27:20','2022-12-07 11:29:19'),(195,254729245204,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-12-07 14:30:44','2022-12-07 11:33:34'),(196,254796103607,NULL,NULL,NULL,NULL,254,'SAFARICOM.KE','2022-12-19 13:18:26','2022-12-19 10:21:20'),(197,254712121212,NULL,NULL,NULL,NULL,254,NULL,'2023-01-14 13:52:06','2023-01-14 10:52:06');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_attribution`
--

DROP TABLE IF EXISTS `profile_attribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_attribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `account_number` varchar(30) NOT NULL,
  `verification_code` varchar(150) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `access_token` varchar(700) NOT NULL,
  `success_attempts` int(11) NOT NULL DEFAULT '0',
  `failed_attempts` int(11) NOT NULL DEFAULT '0',
  `successful_resets` int(11) NOT NULL DEFAULT '0',
  `failed_verify_attempts` int(11) NOT NULL DEFAULT '0',
  `reset_count` int(11) NOT NULL DEFAULT '0',
  `expiry_date` datetime DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '2',
  `receive_promotional_sms` int(3) NOT NULL DEFAULT '1',
  `display_mode` int(2) NOT NULL DEFAULT '1',
  `national_id` varchar(15) DEFAULT NULL,
  `age_bracket` varchar(30) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `deposit_count` int(11) NOT NULL DEFAULT '0',
  `total_deposits` decimal(25,3) NOT NULL DEFAULT '0.000',
  `total_bonus` decimal(25,3) NOT NULL DEFAULT '0.000',
  `total_withdrawals` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `total_bet_stake` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_winnings` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `total_referrals` int(11) NOT NULL DEFAULT '0',
  `total_freebets` int(11) NOT NULL DEFAULT '0',
  `acquisition_channel` varchar(85) DEFAULT NULL,
  `blocked_timeline` datetime DEFAULT NULL,
  `verify_blocked_timeline` datetime DEFAULT NULL,
  `frequency_of_use` int(3) NOT NULL DEFAULT '1',
  `first_winning_date` datetime DEFAULT NULL,
  `last_winning_date` datetime DEFAULT NULL,
  `first_deposit_date` datetime DEFAULT NULL,
  `last_deposit_date` datetime DEFAULT NULL,
  `first_virtual_bet_date` datetime DEFAULT NULL,
  `last_virtual_bet_date` datetime DEFAULT NULL,
  `last_failed_reset_date` datetime DEFAULT NULL,
  `last_virtual_tournament_bet_date` datetime DEFAULT NULL,
  `last_verified_date` datetime DEFAULT NULL,
  `last_reset_date` datetime DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `last_use_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `attribute_id` int(11) DEFAULT NULL,
  `origin` varchar(30) DEFAULT 'PLAY2WIN',
  `access_token_expiry_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `first_virtual_tournament_bet_date` datetime DEFAULT NULL,
  `first_virtual_jackpot_bet_date` datetime DEFAULT NULL,
  `last_virtual_jackpot_bet_date` datetime DEFAULT NULL,
  `first_crash_game_bet_date` datetime DEFAULT NULL,
  `last_crash_game_bet_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`),
  UNIQUE KEY `access_token` (`access_token`),
  KEY `email_address` (`origin`,`frequency_of_use`),
  KEY `total_deposits` (`total_deposits`,`total_bonus`),
  KEY `total_referrals` (`total_referrals`),
  KEY `status` (`status`,`password`,`verification_code`),
  KEY `success_attempts` (`success_attempts`,`failed_attempts`),
  KEY `last_login_date` (`last_login_date`),
  KEY `blocked_timeline` (`blocked_timeline`),
  KEY `last_reset_date` (`last_reset_date`),
  KEY `successful_resets` (`successful_resets`),
  KEY `deposit_count` (`deposit_count`),
  KEY `total_withdrawals` (`total_withdrawals`),
  KEY `total_winings` (`total_winnings`),
  KEY `receive_promotional_sms` (`receive_promotional_sms`),
  KEY `account_number` (`account_number`),
  KEY `reset_count` (`reset_count`),
  KEY `expiry_date` (`expiry_date`),
  KEY `attribute_id` (`attribute_id`),
  KEY `access_token_expiry_date` (`access_token_expiry_date`),
  KEY `last_verified_date` (`last_verified_date`),
  KEY `failed_verify_attempts` (`failed_verify_attempts`),
  KEY `verify_blocked_timeline` (`verify_blocked_timeline`),
  KEY `last_failed_reset_date` (`last_failed_reset_date`),
  KEY `display_mode` (`display_mode`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_attribution`
--

LOCK TABLES `profile_attribution` WRITE;
/*!40000 ALTER TABLE `profile_attribution` DISABLE KEYS */;
INSERT INTO `profile_attribution` VALUES (34,129,'ZG18HCW226','aFZJVkV6dFcwYkhPUWlQdVRlL25nZz09','MWZwMVltRllWNzNBU01FNGZPdGNvUT09','4ee26e706c09cd554e8a98b93e399bbe',0,9,5,0,0,NULL,1,1,1,NULL,NULL,'KENYA',1,100.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,3,NULL,NULL,'2022-10-31 15:27:28','2022-10-31 15:27:28',NULL,NULL,NULL,NULL,'2022-12-14 19:16:01','2022-12-14 19:15:49','2022-12-14 19:16:01','2022-12-14 19:16:01',4,'STAGING_APP','2022-12-14 20:15:01','2022-07-18 14:31:19','2022-12-14 16:16:01',NULL,NULL,NULL,NULL,NULL),(35,120,'ZG18FSY248','Y0VaOEp1L1FvaWlXQVBqcmczK3R2dz09','cGVFT1loSUhyUEF4UzNzRFk3M2VQckRkR0wrU3FlUkRNVU1oZDkyNXlTTzJFT1RObGthK0RqdGpPaytLTFAyOA==','a2438cc00abe9fc27694b1676a483255',63,0,17,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,30.000,0.0000,422.000,139.4900,0,1,NULL,NULL,NULL,3,NULL,'2023-03-31 12:28:27','2023-03-31 12:28:27',NULL,'2023-01-11 13:17:11','2023-01-11 13:17:11','2023-01-09 13:44:26','2023-04-03 10:55:17','2023-01-09 13:47:52','2023-01-09 13:47:41','2023-05-19 15:27:50','2023-01-09 13:47:52',NULL,'STAGING_APP','2023-05-19 16:26:50','2022-07-18 14:41:56','2023-05-19 12:27:50','2023-02-14 12:47:11',NULL,NULL,NULL,NULL),(36,117,'ZG18QII846','WnVDS3ZGakUxakVUM3RqbVE0Y25qUT09','Z09PeGVYQ0pBcGZRMEFWNFg1ZXRHM1dJS0k3WkJ3dDNxbmwvWlZtNERMVUpsSkVLV2hPeHkzaTROYm51bFhCWg==','689d0a660fd36de0baf9447aa897655a',21,0,7,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,'2023-04-15 11:14:11',NULL,'2023-04-15 11:17:41','2023-04-15 11:17:15','2023-04-26 19:35:14','2023-04-15 11:17:41',NULL,'STAGING_APP','2023-04-26 20:34:14','2022-07-18 14:43:39','2023-04-26 17:21:10',NULL,NULL,NULL,NULL,NULL),(37,115,'ZG18HGM240','K1JKZEoxVmYwcVl5aTJObWVoczRDZz09','R0lmSDFqejVPaFhZeHBJMktvbW1ydVRYVjlwSTkwTjJ1ckV3bm1kTndrbVQ3WkIrRm1uaDNvRTAzcHRsWlp3cg==','1c0c16dbf25ee2ba3616c58889047865',168,0,34,0,0,NULL,1,1,1,NULL,NULL,'KENYA',8,20350.000,30.000,0.0000,16410.000,2427.3706,0,0,NULL,NULL,NULL,11,NULL,'2023-02-09 15:42:06','2022-10-31 14:45:38','2022-10-31 15:41:11','2022-11-03 18:40:44','2023-02-28 16:03:59','2022-12-13 21:00:36','2023-02-14 20:02:31','2022-12-14 15:52:05','2022-12-14 15:51:55','2023-04-26 19:56:01','2022-12-14 15:52:05',NULL,'STAGING_APP','2023-04-26 20:55:01','2022-07-18 14:44:28','2023-04-26 17:23:30','2023-02-14 12:05:11',NULL,NULL,NULL,NULL),(38,118,'ZG18VYW484','S05UYUdmeTJiSmk3T09CSGNmNUVBUT09','LzU3Q2pIVzZpR2FHcUVBeHlxOGN5ZVFDSXY2OUJGZ0NEUFNXM3BUWUdRRmN3TTFxc2gyZUNvRHI3M2tyNzJrVw==','779a2369a4869476baa0d4c77ce3071c',78,0,3,0,0,NULL,1,1,1,NULL,NULL,'KENYA',1,20000.000,10.000,0.0000,121051.000,29887.8600,0,0,NULL,NULL,NULL,2,NULL,'2022-12-05 14:11:00','2022-11-02 16:03:50','2022-11-02 16:03:50','2022-11-03 15:40:57','2022-12-15 18:09:38',NULL,'2023-02-15 15:45:50','2022-10-13 13:55:25','2022-10-13 13:54:59','2023-04-26 13:43:15','2022-10-13 13:55:25',NULL,'STAGING_APP','2023-04-26 14:42:15','2022-07-18 15:59:19','2023-04-26 10:50:10','2023-02-15 15:45:50',NULL,NULL,NULL,NULL),(39,130,'ZG18TSU488','bUxaTkZUV2VoOUdZMENFYjFQbEdUUT09','MWZwMVltRllWNzNBU01FNGZPdGNvUT09','NVkvQ0V3UW5pbEh2NHNvaWdIMHkweDlIWTFJU040MUdVNGdTRU1LZVFwZDY5bzZTMzNhT0pNUEN4VFpjL0NDZw==',0,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-07-18 19:14:25',NULL,'2022-07-18 19:14:25','2022-07-18 19:14:25',NULL,'STAGING_APP','2022-07-18 20:13:25','2022-07-18 18:58:59','2022-07-18 16:14:25',NULL,NULL,NULL,NULL,NULL),(40,131,'ZG18DOY420','Kzh0dmZPa2JpN3J5YlloQUdxRGR5QT09','MWZwMVltRllWNzNBU01FNGZPdGNvUT09','elczeWZQZ21CakFoR1p6MmRZbkt4aDFiR1VPMzdJanE5VExGL2xpZk5iNDZtZXlLTmJDaTMrNTA5bG9heWl3Lw==',0,0,0,0,0,NULL,2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-07-18 19:01:24',NULL,'STAGING_APP',NULL,'2022-07-18 19:01:24','2022-07-18 16:01:24',NULL,NULL,NULL,NULL,NULL),(41,125,'ZG18XOQ484','ZzgwZlBwK0tJZjcwU3FPT1V3QXV1UT09','TUM1RGwyYmdjM29vS0JnWElOa2VFb2xVZXBGeFNiSU5RR040ZDZ4RjB1ZXBqRndzVU5tZHNCQU4wcnd5aEFlKw==','da85993a1f73ee9ef57cd3bb97a2e294',215,6,20,0,7,'2023-05-07 11:21:11',2,1,1,NULL,NULL,'KENYA',1,20000.000,10.000,0.0000,81979.000,62173.1600,0,0,NULL,'2023-05-07 11:23:41',NULL,7,NULL,'2022-12-20 08:55:20','2022-10-31 15:39:06','2022-10-31 15:39:06','2022-11-04 09:41:22','2022-12-20 07:13:13','2023-05-07 11:21:38',NULL,'2022-12-20 18:49:58','2023-05-07 11:19:11','2022-12-22 20:05:35','2022-12-20 18:49:58',NULL,'STAGING_APP','2022-12-22 21:04:35','2022-07-18 19:09:24','2023-05-11 10:05:08',NULL,NULL,NULL,NULL,NULL),(42,132,'ZG18KWE088','UEVUT3hWL1BzK1dnMEJHY3JldCtyUT09','RWQ3V1duaVpuZW9jYUpMcUtMekthekVONzlFVWVBMkIrbmhxc293SXNsWlY5c1dWZUE4ODl4Qk92OWdiYWwyRQ==','c114237dcf88872e7829bb268741dbd1',4,8,16,0,2,'2022-11-23 18:57:58',2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,'2022-07-28 19:28:09',NULL,'2022-07-28 20:05:01','2022-11-23 18:55:58','2022-09-19 14:31:54','2022-07-28 20:05:01',NULL,'STAGING_APP','2022-09-19 15:30:54','2022-07-18 19:17:25','2023-02-15 11:15:48',NULL,NULL,NULL,NULL,NULL),(43,133,'ZG19HWO224','Y2Q2cTdna2tZcVY3K281YTNHNGlCZz09','TGR2cStpbFdYRzFUMUlGZ1J4Y29sNXNFS2IzYW9EcE9HcjJub3VLN0Zkb2JsUldSY3BJaEhTTVpWV3FFL2xETA==','ba4efe5fd94705c3b2db6ea8350fdc32',0,0,0,0,0,NULL,2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-07-19 14:34:49',NULL,'STAGING_APP',NULL,'2022-07-19 14:34:49','2022-07-19 11:34:49',NULL,NULL,NULL,NULL,NULL),(44,134,'ZG19CMG860','dzh5VTdaRExWK3M2Vk92eEJGQUVhUT09','MzBNdWJqaTB2bXl2c3o2VERnNGJnc0FMSVpLRWgwZ2dIMEhjbFpuVmZuaWlIOUpDaHBuNmVtTnF4OFhYSi9Nbg==','86502055e2e6c12b5054f029350db52f',425,0,32,0,0,NULL,1,1,1,NULL,NULL,'KENYA',1,20000.000,10.000,0.0000,13092.000,9748.5900,0,0,NULL,NULL,NULL,8,NULL,'2022-12-15 15:43:17','2022-11-02 18:29:24','2022-11-02 18:29:24','2022-11-03 19:52:54','2023-01-06 17:27:40','2022-10-19 16:21:29',NULL,'2022-11-24 18:00:08','2022-11-24 17:59:47','2023-02-20 17:21:05','2022-11-24 18:00:08',NULL,'STAGING_APP','2023-02-20 18:20:05','2022-07-19 17:06:22','2023-02-20 14:21:05',NULL,NULL,NULL,NULL,NULL),(45,135,'ZG19XSG664','M0tuTXkyZVNUN21aZHhSVFZLdVhvQT09','RTdxTXRJazJjVmgyeE9RQS9vSk93T1prUGJCN2FxSlBjUVhyaGVPZ2c2NVpRWHdmcHZBamVHM2ZOQ1V0M1dTMw==','fd6467c4763e2b9c4e005216657bd50d',0,1,2,0,2,'2022-10-31 19:11:39',2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-07-19 17:13:56','2022-10-31 19:09:39','2022-07-19 17:13:56','2022-07-19 17:13:56',NULL,'STAGING_APP','2022-07-19 18:12:56','2022-07-19 17:13:11','2022-10-31 16:09:39',NULL,NULL,NULL,NULL,NULL),(46,136,'ZG19SWU240','Z3pWSnhTa1Zab1hZTXBHYUZ4aVpFQT09','eVBvOW83eHFhWUZLZy9DelFIMEZEWWExdi82eGtoeG1QbzcyU1VkR0FxdE9CRWRpbWVBSlIvUzRuS1RyRC9sVg==','f4602a959e94be2ddf7770ebfc6cd188',7,1,1,0,0,NULL,2,1,1,NULL,NULL,'KENYA',1,100.000,10.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,'2022-10-31 15:35:15','2022-10-31 15:35:15',NULL,NULL,NULL,NULL,'2022-07-19 17:15:38',NULL,'2022-07-28 18:47:12','2022-07-19 17:15:38',NULL,'STAGING_APP','2022-07-28 19:46:12','2022-07-19 17:14:48','2022-10-31 12:35:15',NULL,NULL,NULL,NULL,NULL),(47,137,'ZG19WEY400','aThYTWNmTVZBa1RGbks1N1ZPSXBkdz09','bWl2VnprbmZCNFE4UUMwREJlQUxRUlowRjJJUDNFMnFCMkk4YUVUVXhKbGdoM045Mit5N3RIRDQrU3h6T3RRbg==','91d4a65d2b92c91b2ca025c4a40a3ff4',0,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-07-19 17:28:56',NULL,'2022-07-19 17:28:56','2022-07-19 17:28:56',NULL,'STAGING_APP','2022-07-19 18:27:56','2022-07-19 17:27:49','2022-07-19 14:28:56',NULL,NULL,NULL,NULL,NULL),(48,122,'ZG20VOU604','SStjMTR1NS9VczV6Qk1tOFpZNFZLZz09','b1hueGtoYjR3ZnZzSWdtRUFMakVXR2ZOTGg3dHZzMFhLcGdvT21EMllDNGxHYUoxTm5YZ0dLUFJFUE9XOVJhdQ==','10b01114ea0ebb173e767834043dd88d',58,43,8,0,0,NULL,2,1,1,NULL,NULL,'KENYA',1,20000.000,10.000,0.0000,21602.000,-32079.8100,0,0,NULL,'2023-04-19 13:09:52',NULL,5,NULL,'2022-11-21 13:16:13','2022-11-02 18:30:32','2022-11-02 18:30:32','2022-11-04 16:25:52','2022-12-05 17:11:11','2023-04-19 13:05:00',NULL,'2023-02-09 15:20:37','2023-02-09 15:20:02','2023-02-09 15:20:37','2023-02-09 15:20:37',NULL,'STAGING_APP','2023-02-09 16:19:37','2022-07-20 16:12:03','2023-04-19 10:05:00',NULL,NULL,NULL,NULL,NULL),(49,138,'ZG26PKY408','ZVR4K2dWRjdKZkpGNStyWEhOWWxmUT09','Qzd3YzduZ3k3akpxOVNCYjBtdThtVlRYRGorR1lheDJvMDMxZ05TRDIwdUp3bEZxTklQcUFscG1VSlJzeWl4QQ==','a5e5e08e3fad4222052fee4d0a9240c7',0,0,2,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-07-26 15:01:56','2022-07-26 15:01:28','2022-07-26 15:01:56','2022-07-26 15:01:56',NULL,'STAGING_APP','2022-07-26 16:00:56','2022-07-26 15:00:54','2022-07-26 12:01:56',NULL,NULL,NULL,NULL,NULL),(50,123,'ZG26UMA682','NlJ4RWtibzMxVk9XQlBUUjRwRTV1QT09','eUdpbGp6cU5MVmRadnZtQklLNlFweVZIYjQ1dkljMGhSa2p4UFlMRExnc1RnaUpMaUo1d3lFMWwwMUs0eDdNTA==','0b0f648f42074663bb0ed4ee9940f004',53,0,14,0,0,NULL,1,1,1,NULL,NULL,'KENYA',2,170060.000,590.000,0.0000,22250.000,19662.8800,0,1,NULL,NULL,NULL,4,NULL,'2022-11-29 18:44:20','2022-11-04 16:14:13','2022-11-11 19:51:01','2022-11-04 16:14:52','2023-01-13 14:48:26','2022-11-04 15:59:07',NULL,'2022-11-04 16:00:52','2022-11-04 16:00:08','2023-01-13 16:26:59','2022-11-04 16:00:52',NULL,'STAGING_APP','2023-01-13 17:25:59','2022-07-26 15:23:36','2023-01-13 13:26:59',NULL,NULL,NULL,NULL,NULL),(51,139,'ZG26PSA020','YUtzeWZWZDNZaXJPK2ttY3l1dHBGUT09','eW1odHZKQVMrbzhvWG1TZ213NWZoOExvZmVmaFA0Q3ZVSXJTMnM5eDZXdXN3N0NUL3l2M0FFUGE2cW9pVTFmaQ==','db8d9f62f00912bf42a1bcd1beb4800b',13,0,3,0,0,NULL,1,1,1,NULL,NULL,'KENYA',1,20030.000,530.000,0.0000,21163.000,-6999.5400,0,0,NULL,NULL,NULL,2,NULL,'2022-11-15 14:31:12','2022-11-07 17:14:05','2022-11-07 17:14:05','2022-11-07 17:18:36','2022-12-06 18:31:06',NULL,NULL,'2022-07-26 16:32:03','2022-07-26 16:31:47','2022-12-08 15:52:36','2022-07-26 16:32:03',NULL,'STAGING_APP','2022-12-08 16:51:36','2022-07-26 16:24:06','2022-12-08 12:52:36',NULL,NULL,NULL,NULL,NULL),(52,140,'ZG26YMW286','NkNmbzFBL3ZBdXFGNTJORGZxb2FQZz09','bjAwOWVzRzBkdFJVTlluREtsR2dmQU8zU0MrU2xuUm94R08wSkFUYm50RyttcDJPU2JFTWRhS1d4bkZCaTZQbQ==','7962dbe5e38e7b0352f802237aba04e8',0,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-07-26 16:58:17',NULL,'2022-07-26 16:58:17','2022-07-26 16:58:17',NULL,'STAGING_APP','2022-07-26 17:57:17','2022-07-26 16:45:52','2022-07-26 13:58:17',NULL,NULL,NULL,NULL,NULL),(53,152,'ZJ03FCK800','NjdDbDZMMlJuOGdSVEpMN2k3aUQwQT09','ejZlR2NrcWxGM1FaVGo0MkFRVDZJS2RuSnBldTk2UnBieVgwcFgyNTFEK0NqcGVRRk05V1ZxVkk0NlViTmplbA==','4b70a80b8e9cf6f184cc796845375828',0,0,0,0,0,NULL,2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-03 11:40:30',4,'STAGING_APP',NULL,'2022-10-03 11:40:30','2022-10-03 08:40:30',NULL,NULL,NULL,NULL,NULL),(54,119,'ZJ03QII026','TUJiU2RVOVZXdDhDd2xnbkQ5Yi9SUT09','NEtqcDFacXFETmNoOTF6OFZTWHpWb3JsRzBWS25YVE9DNmlpaTh2aDdzSDdIVGhyZEpseUxGUEhTL0ZzdDBqUw==','b2879a4d53cd87f23b621bb60a5249e1',0,0,0,0,0,NULL,2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-03 13:02:01',4,'STAGING_APP',NULL,'2022-10-03 13:02:01','2022-10-03 10:02:01',NULL,NULL,NULL,NULL,NULL),(55,153,'ZJ03OUO404','aGZVUWxIa2ZabHg0NjFPZnlTSGNXdz09','UFdIZjlCazRLbVdRVGVtZFVnWjMxaXY4VlVlc3JXcWhsSUprMkxLam80dTAwTE9USXU4WHlpNll2bXV2NXVIYQ==','1e1c166b9a3934b7ec038b8f34639f06',8,5,7,0,6,'2023-01-04 11:38:31',2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-18 13:01:52','2023-01-04 11:36:31','2022-10-18 18:42:35','2022-10-18 13:01:52',4,'STAGING_APP','2022-10-18 19:41:35','2022-10-03 14:57:52','2023-01-04 08:36:31',NULL,NULL,NULL,NULL,NULL),(56,154,'ZJ05AMA268','cC85K3FTWG15UkRKVWlOaEVuazVvdz09','eW52QzduM0hFeFovWXZQTGh6YkF0TjFKZXRpN1k4RnJyUmJreFlKQ0VlMVVVbjNPSFpJMnRiS3l4V0JuR1crdA==','fc7e911689f99688bc6e914b15fea4df',2,0,5,0,9,'2023-01-04 11:38:07',2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-21 13:31:42',NULL,'2022-10-05 17:24:08','2023-01-04 11:36:07','2022-10-05 17:44:40','2022-10-05 17:24:08',4,'STAGING_APP','2022-10-05 18:43:40','2022-10-05 17:23:50','2023-01-04 08:36:07',NULL,NULL,NULL,NULL,NULL),(57,155,'ZJ11AEU068','N3R0NXYyTnZWekdzYnR4MmxCajJJdz09','RzIxdHRDcDc0UTk2NDE0c29pRm5TUnlBbURyVkpDYkVLZW9QMnpieURPRkthUC9sU3d0OVF5b0QzN3JjYzY2cQ==','0fb87d9c4738d874b645ce29e48f5aa5',1,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-11 14:18:55',NULL,'2022-10-11 14:40:18','2022-10-11 14:18:55',4,'STAGING_APP','2022-10-11 15:39:18','2022-10-11 14:12:42','2022-10-11 11:40:18',NULL,NULL,NULL,NULL,NULL),(58,156,'ZJ11DCW604','Q3BHZU9Jc0pvbUo0RjArZkMxTlJsdz09','VXJ1TUtlcEZxV3FINEp4dGdnUFcvcDNSWG5UV1VqRnFmZjI1ZFRhU0thdjJ4b0laUXBycVlpWHR1T1BwYlV6ag==','253b8a8d74d23dce2565efd9fb508cd5',0,0,2,0,4,'2022-10-11 17:11:58',2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-11 17:09:58',NULL,'2022-10-11 16:51:42',NULL,'STAGING_APP',NULL,'2022-10-11 16:51:42','2022-10-11 14:09:58',NULL,NULL,NULL,NULL,NULL),(59,157,'ZJ11GEE626','UGpJWTkwSXpJZm5NTnJPek1VUmhSUT09','b2w0dFkxdSttdlhzQ1RaWEVPOXMweUZqQkhDOUNwK3BlNkI1cytLd0MvQU0yNWtVdkVQUFNqRThHYXo2bzBmbA==','ccde5c9c9bc7720ee0b293efb59b9aa7',0,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-11 17:26:38',NULL,'2022-10-11 17:26:38','2022-10-11 17:26:38',4,'STAGING_APP','2022-10-11 18:25:38','2022-10-11 17:26:21','2022-10-11 14:26:38',NULL,NULL,NULL,NULL,NULL),(60,158,'ZJ11VGK682','b0MrU0p2eDloMTc4RVZuVTFEWWlkZz09','bEZVQmhQR2NKRDBHdlIxNWUxaFcyS0hYKzVPWUZLL2llSkhibzh4WlJEc3A2bjNwWnI1WHArS1RvZDhGbjBsNQ==','851b451babbe2a6ef563185b9d6affd9',0,0,4,0,2,'2022-10-19 16:22:07',2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-11 17:35:31','2022-10-19 16:20:07','2022-10-11 17:35:31','2022-10-11 17:35:31',NULL,'STAGING_APP','2022-10-11 18:34:31','2022-10-11 17:32:25','2022-10-19 13:20:07',NULL,NULL,NULL,NULL,NULL),(61,159,'ZJ12WEM842','MGdxOGx5R1gwZ0xlb1ZNVS80emVvZz09','Uk8zdFNZSjNqUGRxNStGMDZ3S0Z2TVE0YTdiTVB5VzVmMm5ER0xYTFlRaEVrbHpONS9QNlhISnNIaDV1bVpyUA==','418eaddf00066c04f82fab5e72fa92c6',0,0,0,0,0,NULL,2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-12 11:40:11',4,'STAGING_APP',NULL,'2022-10-12 11:40:11','2022-10-12 08:40:11',NULL,NULL,NULL,NULL,NULL),(62,160,'ZJ12ZAQ484','OFJxY2lwTG1maEtnMkZVWHNSeittdz09','amNkNlMvenRiQmZqY2tjR2Fub0hlZ20zUEJJd1lVTVFuZGY4RkdRaSt4SnpQTE4xM1JmbGJCWk9YYis1MGRJRw==','051027893f14717907a177511336792e',0,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-12 11:55:31',NULL,'2022-10-12 11:55:31','2022-10-12 11:55:31',4,'STAGING_APP','2022-10-12 12:54:31','2022-10-12 11:53:40','2022-10-12 08:55:31',NULL,NULL,NULL,NULL,NULL),(63,161,'ZJ13EQC262','UU9vdXhURGRnakY0VUg5TGFHTnpnQT09','Y0xiRWxIRG1ObzZNTFRJWVhBVmE1MlpkeHNxTnNSUW5qUjZGRzJ4SUhnWEpoU2QrditVemw0RTJjdWl6SE1Cag==','3bb05b3e0c28bc9e31d2d61c985d87e8',0,2,3,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-13 14:34:50','2022-10-13 14:28:06','2022-10-13 14:34:50','2022-10-13 14:34:50',NULL,'STAGING_APP','2022-10-13 15:33:50','2022-10-13 12:55:07','2023-02-16 14:09:31',NULL,NULL,NULL,NULL,NULL),(64,162,'ZJ13UME820','TVNNYzFkZHdEaHBvOUdqKytrd3dkQT09','bHFSbzFHNHQxZklTVDFxeVBpUGVpOThSbmpSU2Z0TzM5dnhVTzJzZDdoSmVpNVZBMTJ5NGk2d2NwdjlkeWYxbg==','f355a751f3c1a5d99938a5e9c0258746',1,0,3,0,2,'2022-11-01 13:14:29',2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-13 16:27:46','2022-11-01 13:12:29','2022-10-19 17:36:08','2022-10-13 16:27:46',NULL,'STAGING_APP','2022-10-19 18:35:08','2022-10-13 13:41:48','2022-11-01 10:12:29',NULL,NULL,NULL,NULL,NULL),(65,165,'ZJ19EUU046','OThNYk5oMFBwNmJDWDRiOGtHbmdldz09','R2psdkJHTUkvR3BlMnYxZHNDOXd2TGJEQTNmR2lKZ3Y2dlpiNk9lQ0NDVUJsT1p1UVYrYmVDb0tKUFQ2Z2V1UQ==','d69b778eaff54c5d72b4daa30f7e2280',0,2,5,0,13,'2022-10-21 13:40:01',2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,'2023-01-04 11:39:03',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-04 11:36:03',NULL,NULL,'2022-10-21 13:38:01',NULL,'2022-10-19 11:24:48',NULL,'STAGING_APP',NULL,'2022-10-19 11:24:48','2023-01-04 08:36:03',NULL,NULL,NULL,NULL,NULL),(66,166,'ZJ21EQW044','aFp4VWVCT1BsOTA5eERoK3prUktQZz09','ZWJHR0c2dFlacjVCcHY1cWdJUng0Q1pRZGppamFPd3diNlhPYXZMbithMVlsWGFnKzA1Snk3Zkp0Z2c3R0FvNQ==','337415ce6d2998826677e517e2c61232',5,1,3,0,4,'2023-01-04 11:37:43',2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-21 11:19:09','2023-01-04 11:35:43','2022-12-12 14:14:24','2022-10-21 11:19:09',NULL,'STAGING_APP','2022-12-12 15:13:24','2022-10-21 11:17:23','2023-01-04 08:35:43',NULL,NULL,NULL,NULL,NULL),(67,167,'ZJ21KWQ420','TlJZbUxWanBHZ1RXUG1ZbVlzYWFrQT09','aHUwV3BYUlludDE1RndRKzVBRTE4L1JSQUlvUmJGRFlqTDR0UnV4Q0pxa2wzRk5sSmdTSkRaczNQeG1aL0ovQg==','082c502c6c12ffbb22e42cb7bd42a415',26,20,6,2,13,'2023-01-04 11:31:47',2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,'2023-01-04 11:36:29',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-04 11:35:59',NULL,'2022-10-21 11:37:03','2023-01-04 11:29:47','2022-11-23 18:22:17','2022-10-21 11:37:03',4,'STAGING_APP','2022-11-23 19:21:17','2022-10-21 11:36:09','2023-01-04 08:35:59',NULL,NULL,NULL,NULL,NULL),(68,168,'ZJ21WWU206','RVZJZVo1VGY2ZC9KZithbFlNSnpmdz09','Ym00VTFHTnRESWdyYTQ3NWV1Y2t2RzlON0VaelpnZVlrRnZJd0RMS3NZWm01dWMwM0JZQWt5eW13dDRRWkkyWA==','9c66f0767abf542a7efd0fd3e1a7f9b3',0,0,0,0,0,NULL,2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-21 15:16:07',4,'STAGING_APP',NULL,'2022-10-21 15:16:07','2022-10-21 12:16:07',NULL,NULL,NULL,NULL,NULL),(69,169,'ZJ21UWU086','YXRLeTY4L1lkUnNkZlpua0c5ZWpVUT09','OGJrdlVHbG0wdzJLUG1YOWVqVDZEbm5zRUlOanlmTVhUWkx4d2Y2M3Z3aUlNbkxDRnhHbHlueVBTdjFoR3ordw==','5631173824fb7fd82083e479e2ae9b37',0,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-21 17:32:54',NULL,'2022-10-21 17:32:54','2022-10-21 17:32:54',4,'STAGING_APP','2022-10-21 18:31:54','2022-10-21 17:30:51','2022-10-21 14:32:54',NULL,NULL,NULL,NULL,NULL),(70,178,'ZJ31UWU202','NUo3RUhZdCtHSEs1TkNoZlVJcHU5UT09','TkRNdjZtN0o0K2lXcjMyTHN5Z3FZdzBZT21ocFF6VTdFZlBFVXpJb2NCR1RPYWhaMFRrV3N3U2xYaUpVWHF2OQ==','c44607038350125f3911f3b1771fe09e',17,0,2,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-09 15:03:40','2023-02-09 15:02:55','2023-05-31 12:17:16','2023-02-09 15:03:40',NULL,'STAGING_APP','2023-05-31 13:16:16','2022-10-31 23:16:03','2023-05-31 09:17:16',NULL,NULL,NULL,NULL,NULL),(71,179,'ZK01MQK440','emRPTmdlekoydWFRWWlvVWI0T2Nzdz09','dHhxQjEzOWRkT1d2R2taRHNDK2x3U3N4RU85T2l0UVZJQ3lZZmpRYVpSc3FNWjJrdmwvOG44R1RYWnVDSGdiSA==','37c62ff3a29bffce98e3ed19794e2abd',0,0,0,0,0,NULL,2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-01 13:38:59',NULL,'STAGING_APP',NULL,'2022-11-01 13:38:59','2022-11-01 10:38:59',NULL,NULL,NULL,NULL,NULL),(72,180,'ZK01KMK224','WVdrZU45OGhtais1WHptT3l3SjhLQT09','UUxCWWdPUWZtdFZOTGQ3YzQxVEJCU0pxTkl1WWpWOUF2NWNVUGV6c3hBWUpoa2Fsa3hncWt6YkZldU1qdmViVA==','e2810b07b90cbe450371a58b76e9e7a1',13,0,5,0,0,NULL,1,1,1,NULL,NULL,'KENYA',1,50.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,3,NULL,NULL,'2022-11-01 20:41:22','2022-11-01 20:41:22',NULL,NULL,NULL,NULL,'2022-11-08 18:27:18','2022-11-08 18:24:53','2023-02-06 21:53:15','2022-11-08 18:27:18',NULL,'STAGING_APP','2023-02-06 22:52:15','2022-11-01 20:32:05','2023-02-06 18:53:15',NULL,NULL,NULL,NULL,NULL),(73,181,'ZK03EIY480','MlVpNFJ3K21vRUdOcExNbUt3QUE0UT09','UjRsOTJoaEZmcGUvOXJabjJYZXdqcmVyMUcrZkY1azZzbWRFSnpEVDdRNVQreXJ4V2J0Rlp5emxQRm9STXQrUw==','502859a3a9bbd742b87702f10c6617cd',1,0,6,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-15 19:55:06',NULL,'2022-11-15 19:59:31','2022-11-15 19:58:19','2022-11-15 19:59:31','2022-11-15 19:59:31',NULL,'STAGING_APP','2022-11-15 20:58:31','2022-11-03 19:05:04','2022-11-15 16:59:31',NULL,NULL,NULL,NULL,NULL),(74,183,'ZK07DCG480','Q0MrVU9JMzE5ejBuT01sbmJZNWNudz09','Zkkxc0JzYldMNHNFWHlldndmK1hiN0dtVE1RTFNtbXdsYUE2ay9ybDJpMnJQMGI2djk2T2lxVTRUOXprendOMQ==','759625f80a7ca06b6706decf7063c8e4',2,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',2,20083.000,533.000,0.0000,291.000,250.2400,0,0,NULL,NULL,NULL,2,NULL,'2022-11-08 16:54:05','2022-11-07 23:20:25','2022-11-09 13:44:09','2022-11-08 15:48:38','2022-11-08 17:41:04',NULL,NULL,'2022-11-07 23:19:27',NULL,'2022-11-08 16:48:45','2022-11-07 23:19:27',NULL,'STAGING_APP','2022-11-08 17:47:45','2022-11-07 23:16:29','2022-11-09 10:44:09',NULL,NULL,NULL,NULL,NULL),(75,186,'ZK16QMM804','cFZCcm42cXEyTS9idzJVWS9yMjVDUT09','ZFkxUDQvUWpFeUdWdzdvbUZOd3YxRENaTlZPTTYrNXpGazRBYk5yc1ROL2VQZlorYzFteWFsR0VWUDZ5L1dkSg==','3f41a36732cf0481439cb193411823ef',3,2,3,0,0,NULL,1,1,1,NULL,NULL,'KENYA',1,20030.000,530.000,0.0000,59.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,'2022-11-16 14:30:09','2022-11-16 14:30:09','2022-11-16 14:33:35','2022-11-16 14:38:59',NULL,NULL,'2022-11-16 14:07:54','2022-11-16 14:07:01','2022-11-28 11:39:49','2022-11-16 14:07:54',NULL,'STAGING_APP','2022-11-28 12:38:49','2022-11-16 13:07:56','2022-11-28 08:39:49',NULL,NULL,NULL,NULL,NULL),(76,188,'ZK21JCI620','UUpZSElHTjV3cTBhRTVqMHRyU2RRQT09','VjBrOFJkLzdVS3lvUUMzdnFKM2FSdXpsWE13dFJoTnNtRDN4OUc2STMzeTFaZ3gxZytrM0RsTlJzYi9TbDdMUw==','b7db5f275f0360b9800f13cb1c28ab4f',18,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',1,20030.000,530.000,0.0000,1903.000,463.2800,0,0,NULL,NULL,NULL,2,NULL,'2022-11-21 15:28:13','2022-11-21 14:39:56','2022-11-21 14:39:56','2022-11-21 14:41:40','2022-11-21 18:36:18',NULL,NULL,'2022-11-21 14:16:54',NULL,'2023-04-26 20:31:18','2022-11-21 14:16:54',NULL,'STAGING_APP','2023-04-26 21:30:18','2022-11-21 14:15:58','2023-04-26 17:41:33',NULL,NULL,NULL,NULL,NULL),(77,189,'ZK21OIY680','SVFLVkdDR1lZRTdVVjhIYmRNcEYwZz09','b0hLcWlnMWJJbnh6QXlzQjVqNnRtZmpnM0RBUGFDeFJybm9tVWRyck85NGZuWGNCV1NWdit2TVpuMGt1Z3NYVg==','c7b9e5328842ad1a7ecf4b77e74cc55b',0,0,2,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-21 14:54:30','2022-11-21 14:54:05','2022-11-21 14:54:30','2022-11-21 14:54:30',NULL,'STAGING_APP','2022-11-21 15:53:30','2022-11-21 14:52:55','2022-11-21 11:54:30',NULL,NULL,NULL,NULL,NULL),(78,164,'ZK21UMG884','dXhOalJrYzdwMVRUSFZNM09tc3Fodz09','QjJ5cFpFbmp0b3pTbHhJQUhRWWRvQ0RCK3ZHcktVYVRDZHJuKzQrRzVwT2NIaUt2VVNydnltVS9mcTlkUGNCcw==','53581f3192046e048b2c439d7abc6dc1',0,2,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-21 15:33:53',NULL,'2022-11-21 15:33:53','2022-11-21 15:33:53',NULL,'STAGING_APP','2022-11-21 16:32:53','2022-11-21 15:29:00','2022-12-07 06:50:52',NULL,NULL,NULL,NULL,NULL),(79,190,'ZL05EKA646','WU1BMzl5M0FoTnVxSURxQ2pJU2EyQT09','bGxpeDdLQ2lGc0d3Z0RaOGN4NTZrUW8vRFNDZUtMbHRhOEU2Y3dGWWw1QlVaZ2NmZ1NKTDMyRHk3Sm55T2JlcQ==','bf14b448e35628307252c43a23ea5374',3,0,2,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-05 18:27:25','2022-12-05 18:26:32','2022-12-05 18:40:04','2022-12-05 18:27:25',NULL,'STAGING_APP','2022-12-05 19:39:04','2022-12-05 18:23:51','2022-12-05 15:40:04',NULL,NULL,NULL,NULL,NULL),(80,191,'ZL07WMK068','Ly9Bc1JWKzVuVjNrYzFFU0Q0eUZlQT09','OTFWWlZsU2VTRG11MlM1clIxZ0tMSmFLVUxDbjRPWXc2TVY1aUo4U2ZMWGVwaWc4TU5DU2xrNW5Xa0ZmV1hDTw==','8ac5306e8b76e65b4e7895515814ecff',1,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-07 14:09:25',NULL,'2022-12-07 14:10:30','2022-12-07 14:09:25',NULL,'STAGING_APP','2022-12-07 15:09:30','2022-12-07 14:06:03','2022-12-07 11:10:30',NULL,NULL,NULL,NULL,NULL),(81,192,'ZL07SUG682','UWVyWHdsVlRMNGNDYTFCMnJzS0t4Zz09','eExPVWJqblA4NEJkWWdzdks4dkM0TmV1QUkvdVRHaUxnRmdVMkJYY214M2JPdGdBcVd5NXRxc0gwN1JUdXhTeg==','47c0e530b44fdd8cf29c4b6eff554686',2,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-07 14:13:25',NULL,'2022-12-07 23:06:55','2022-12-07 14:13:25',NULL,'STAGING_APP','2022-12-08 00:05:55','2022-12-07 14:12:19','2022-12-07 20:06:55',NULL,NULL,NULL,NULL,NULL),(82,193,'ZL07GWY240','aVdMbFpTMzdkSTNacGVmZTJ2WC9qUT09','cm5qd3haRW1rSjNvN0xhTmFOUU1sYldaZ05RSVZuT2JZdmQzQlp1QUx6aHFFVUJra1I0VmVMYnhHdHgrcEQ1WA==','6559ec5c7424a1e7a061d1c80478af25',0,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-07 14:20:36',NULL,'2022-12-07 14:20:36','2022-12-07 14:20:36',NULL,'STAGING_APP','2022-12-07 15:19:36','2022-12-07 14:20:05','2022-12-07 11:20:36',NULL,NULL,NULL,NULL,NULL),(83,194,'ZL07QEW840','L1JqR0ExZC9lVk9jbEFaMVZrT2oxdz09','ZTBtNzBaRHJmWmx3dERMUDBXNEs0bUlFWEFSRXpQWUhVMWRQR3hjOUlGN093aWFkZ3B2Q2tseVJZNUN5RjRFeg==','097167ce921fd75963e7ce9df690c297',1,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-07 14:28:05',NULL,'2022-12-07 14:29:19','2022-12-07 14:28:05',NULL,'STAGING_APP','2022-12-07 15:28:19','2022-12-07 14:27:21','2022-12-07 11:29:19',NULL,NULL,NULL,NULL,NULL),(84,195,'ZL07SCM006','UWpOTVNlbUYzdlpmWHMwa2FQQTB0QT09','WGFoaUdJNGYvNmxqWE91Y0hpN2pXWHJMSTU0WUJMSnNYdU0yMTZ6eDBMbG5oWHNWaTlGT1l6N3BkdUFBL3lLcA==','7cfd1c270531fdcf6a05cef7267759c0',1,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-07 14:32:34',NULL,'2022-12-07 14:33:34','2022-12-07 14:32:34',NULL,'STAGING_APP','2022-12-07 15:32:34','2022-12-07 14:30:44','2022-12-07 11:33:34',NULL,NULL,NULL,NULL,NULL),(85,196,'ZL197YOA446','ak1xbG8xZDZjSmNyaCtBU0tVWHRtdz09','azcwaTJBWmRlelZpUmpwV1ZyTHVUV2FyT0JvdU95cGdUbUY5U2RyRXdHQUFtQzFOMG8wODkyMEt6cS81RXFrRA==','feacdf54d3de48e9f6321b97e7952a09',22,0,1,0,0,NULL,1,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,'',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-19 13:19:29',NULL,'2023-04-24 11:35:28','2022-12-19 13:19:29',NULL,'STAGING_APP','2023-04-24 12:34:28','2022-12-19 13:18:26','2023-04-24 08:46:02',NULL,NULL,NULL,NULL,NULL),(86,197,'YL14O16JQT65','SHhFZnkyemg0NVFkTy9iRng1MnZTdz09','VVZjQisxZGQ1OUpDQ0x3NDdmaW92dzc2OEtwd0loTVFtczkrZmhuL3lua1dWcGg0bFk3RkJJZ09xSFdjTDZqRA==','da887fa37cf827b3256a54c322fcfb6e',0,0,0,0,0,NULL,2,1,1,NULL,NULL,'KENYA',0,0.000,0.000,0.0000,0.000,0.0000,0,0,'',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-14 13:52:06',NULL,'STAGING_APP',NULL,'2023-01-14 13:52:06','2023-01-14 10:52:06',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile_attribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_balance`
--

DROP TABLE IF EXISTS `profile_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `currency` enum('KES','UGX','TSH','EUR','USD') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'KES',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `points` int(11) NOT NULL DEFAULT '0',
  `suspense_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`),
  KEY `points` (`points`),
  KEY `currency` (`currency`),
  KEY `suspense_balance` (`suspense_balance`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_balance`
--

LOCK TABLES `profile_balance` WRITE;
/*!40000 ALTER TABLE `profile_balance` DISABLE KEYS */;
INSERT INTO `profile_balance` VALUES (1,115,'KES',9925.00,2895.17,189430,0.00,'2022-10-31 14:45:38','2023-04-26 17:23:29'),(2,129,'KES',10000.00,1000.00,0,0.00,'2022-10-31 15:27:28','2023-04-19 09:49:43'),(3,136,'KES',10000.00,1000.00,0,0.00,'2022-10-31 15:35:15','2023-04-19 09:49:43'),(4,125,'KES',10000.00,504.00,868200,0.00,'2022-10-31 15:39:07','2023-04-19 09:49:43'),(5,180,'KES',10000.00,1000.00,0,0.00,'2022-11-01 20:41:22','2023-04-19 09:49:43'),(6,118,'KES',10000.00,847.00,1260440,23214.00,'2022-11-02 16:03:50','2023-04-26 17:06:52'),(7,134,'KES',10000.00,13563.00,176100,5159.92,'2022-11-02 18:29:24','2023-04-19 09:49:43'),(8,122,'KES',10000.00,1000.00,225890,0.00,'2022-11-02 18:30:32','2023-04-17 10:22:28'),(9,123,'KES',10000.00,272.00,229480,0.00,'2022-11-04 16:14:13','2023-04-19 09:49:43'),(10,139,'KES',10000.00,1000.00,211630,0.00,'2022-11-07 17:14:05','2023-04-19 09:49:43'),(11,183,'KES',10000.00,1000.00,2910,0.00,'2022-11-07 23:20:25','2023-04-19 09:49:43'),(12,186,'KES',10000.00,1000.00,590,0.00,'2022-11-16 14:30:09','2023-04-19 09:49:43'),(13,188,'KES',7675.00,1000.00,19030,0.00,'2022-11-21 14:39:56','2023-04-26 17:41:33'),(14,120,'KES',3000.00,0.00,1139320,0.00,'2023-01-11 14:05:55','2023-04-26 17:25:11'),(15,117,'KES',1000.00,0.00,0,8000.00,'2023-04-15 11:37:00','2023-04-26 17:21:10'),(16,198,'KES',10000.00,0.00,0,0.00,'2023-04-19 12:43:46','2023-04-19 09:49:43'),(17,178,'KES',340.00,0.00,0,0.00,'2023-04-19 13:19:03','2023-04-26 17:36:22'),(18,196,'KES',10000.00,0.00,0,0.00,'2023-04-20 10:09:59','2023-04-26 17:06:52');
/*!40000 ALTER TABLE `profile_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_balance_history`
--

DROP TABLE IF EXISTS `profile_balance_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_balance_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `transaction_id` bigint(20) NOT NULL,
  `current_balance` decimal(25,3) NOT NULL DEFAULT '0.000',
  `prev_balance` decimal(25,3) NOT NULL DEFAULT '0.000',
  `type` enum('DEBIT','CREDIT','REVERSAL','') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`,`transaction_id`),
  KEY `new_balance` (`prev_balance`,`current_balance`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_balance_history`
--

LOCK TABLES `profile_balance_history` WRITE;
/*!40000 ALTER TABLE `profile_balance_history` DISABLE KEYS */;
INSERT INTO `profile_balance_history` VALUES (1,134,380,18566.770,18365.000,'CREDIT','2022-11-04 17:48:45','2022-11-04 17:48:45'),(2,115,390,860472.210,860303.050,'CREDIT','2022-11-04 19:21:55','2022-11-04 19:21:55'),(3,118,422,177902.270,177788.420,'CREDIT','2022-11-07 09:49:37','2022-11-07 09:49:37'),(4,125,429,1671950.910,1671879.390,'CREDIT','2022-11-07 13:56:27','2022-11-07 13:56:27'),(5,139,449,-13908.500,9730.000,'CREDIT','2022-11-07 15:11:26','2022-11-07 15:11:26'),(6,122,450,-19803.560,13067.000,'CREDIT','2022-11-07 15:11:26','2022-11-07 15:11:26'),(7,125,459,1653632.720,1624879.390,'CREDIT','2022-11-07 15:44:22','2022-11-07 15:44:22'),(8,139,462,21585.170,9008.500,'CREDIT','2022-11-07 15:46:22','2022-11-07 15:46:22'),(9,123,469,19074.670,17283.000,'CREDIT','2022-11-07 15:50:22','2022-11-07 15:50:22'),(10,122,476,17675.000,17605.560,'CREDIT','2022-11-07 15:56:22','2022-11-07 15:56:22'),(11,125,484,1631798.060,1614879.390,'CREDIT','2022-11-07 15:58:22','2022-11-07 15:58:22'),(12,139,485,5234.720,2638.500,'CREDIT','2022-11-07 15:58:22','2022-11-07 15:58:22'),(13,125,510,1604846.540,1600781.390,'CREDIT','2022-11-08 10:59:28','2022-11-08 10:59:28'),(14,183,519,20180.610,20030.000,'CREDIT','2022-11-08 13:50:05','2022-11-08 13:50:05'),(15,183,522,20280.240,20180.610,'CREDIT','2022-11-08 13:54:05','2022-11-08 13:54:05'),(16,118,531,177048.260,174592.420,'CREDIT','2022-11-08 15:08:05','2022-11-08 15:08:05'),(17,125,543,1603024.710,1602816.540,'CREDIT','2022-11-10 08:29:38','2022-11-10 08:29:38'),(18,125,551,1603522.570,1601855.710,'CREDIT','2022-11-10 13:11:31','2022-11-10 13:11:31'),(19,125,553,1604439.240,1598522.570,'CREDIT','2022-11-10 13:13:31','2022-11-10 13:13:31'),(20,123,556,2928.670,987.000,'CREDIT','2022-11-10 15:34:28','2022-11-10 15:34:28'),(21,123,562,1282.840,528.670,'CREDIT','2022-11-10 15:44:28','2022-11-10 15:44:28'),(22,123,564,2745.340,1282.840,'CREDIT','2022-11-10 15:44:29','2022-11-10 15:44:29'),(23,123,584,151917.010,150175.340,'CREDIT','2022-11-14 12:56:53','2022-11-14 12:56:53'),(24,123,587,152917.010,150917.010,'CREDIT','2022-11-14 13:22:53','2022-11-14 13:22:53'),(25,118,606,80122.430,76018.260,'CREDIT','2022-11-14 15:58:53','2022-11-14 15:58:53'),(26,118,608,86018.260,80122.430,'CREDIT','2022-11-14 16:00:53','2022-11-14 16:00:53'),(27,118,611,86816.600,80122.430,'CREDIT','2022-11-14 16:04:53','2022-11-14 16:04:53'),(28,123,615,154283.680,151367.010,'CREDIT','2022-11-14 16:14:53','2022-11-14 16:14:53'),(29,125,617,1599822.320,1598326.570,'CREDIT','2022-11-14 16:28:53','2022-11-14 16:28:53'),(30,139,620,2675.570,1209.500,'CREDIT','2022-11-15 11:31:12','2022-11-15 11:31:12'),(31,125,629,1599852.130,1599773.320,'CREDIT','2022-11-15 14:54:02','2022-11-15 14:54:02'),(32,125,633,1599842.330,1599754.130,'CREDIT','2022-11-15 15:00:02','2022-11-15 15:00:02'),(33,122,646,16389.390,16348.560,'CREDIT','2022-11-16 10:22:18','2022-11-16 10:22:18'),(34,122,650,16360.400,16340.390,'CREDIT','2022-11-16 11:10:15','2022-11-16 11:10:15'),(35,122,653,16533.100,16311.400,'CREDIT','2022-11-16 11:14:15','2022-11-16 11:14:15'),(36,125,669,1599599.190,1599499.330,'CREDIT','2022-11-17 14:17:52','2022-11-17 14:17:52'),(37,122,672,6405.300,6386.100,'CREDIT','2022-11-17 16:20:27','2022-11-17 16:20:27'),(38,122,675,6383.930,6356.300,'CREDIT','2022-11-17 16:52:27','2022-11-17 16:52:27'),(39,125,682,1599558.270,1599452.190,'CREDIT','2022-11-18 13:32:55','2022-11-18 13:32:55'),(40,125,684,1599577.070,1599558.270,'CREDIT','2022-11-18 13:32:55','2022-11-18 13:32:55'),(41,123,692,152994.730,148801.680,'CREDIT','2022-11-19 18:41:30','2022-11-19 18:41:30'),(42,134,698,17952.460,17918.000,'CREDIT','2022-11-21 05:55:12','2022-11-21 05:55:12'),(43,134,703,17885.960,17780.460,'CREDIT','2022-11-21 06:17:12','2022-11-21 06:17:12'),(44,134,705,17901.930,17885.960,'CREDIT','2022-11-21 06:17:12','2022-11-21 06:17:12'),(45,134,709,17894.280,17791.930,'CREDIT','2022-11-21 07:35:12','2022-11-21 07:35:12'),(46,122,717,4677.870,4285.930,'CREDIT','2022-11-21 10:16:13','2022-11-21 10:16:13'),(47,134,720,18394.460,17845.280,'CREDIT','2022-11-21 10:26:13','2022-11-21 10:26:13'),(48,188,736,19808.340,19772.000,'CREDIT','2022-11-21 12:10:13','2022-11-21 12:10:13'),(49,188,739,19805.280,19708.340,'CREDIT','2022-11-21 12:14:13','2022-11-21 12:14:13'),(50,188,746,18786.280,18456.280,'CREDIT','2022-11-21 12:28:13','2022-11-21 12:28:13'),(51,134,751,18407.620,18344.460,'CREDIT','2022-11-21 14:32:54','2022-11-21 14:32:54'),(52,123,759,152947.730,152894.730,'CREDIT','2022-11-22 08:13:24','2022-11-22 08:13:24'),(53,123,764,152910.730,152847.730,'CREDIT','2022-11-22 11:53:24','2022-11-22 11:53:24'),(54,123,768,152185.070,151861.730,'CREDIT','2022-11-22 16:22:30','2022-11-22 16:22:30'),(55,123,775,150985.070,150936.070,'CREDIT','2022-11-22 19:10:30','2022-11-22 19:10:30'),(56,125,778,1599477.930,1599430.070,'CREDIT','2022-11-23 14:56:17','2022-11-23 14:56:17'),(57,115,787,835754.050,834024.050,'CREDIT','2022-11-23 15:44:17','2022-11-23 15:44:17'),(58,134,790,17981.270,17947.620,'CREDIT','2022-11-23 15:46:17','2022-11-23 15:46:17'),(59,134,792,18263.610,17981.270,'CREDIT','2022-11-23 15:46:17','2022-11-23 15:46:17'),(60,134,795,18252.550,18214.610,'CREDIT','2022-11-23 16:20:17','2022-11-23 16:20:17'),(61,134,812,18238.680,18192.550,'CREDIT','2022-11-24 08:38:50','2022-11-24 08:38:50'),(62,134,816,18374.340,18138.680,'CREDIT','2022-11-24 09:34:50','2022-11-24 09:34:50'),(63,134,1053,17403.790,17236.340,'CREDIT','2022-11-28 08:20:11','2022-11-28 08:20:11'),(64,134,1057,17398.790,17283.790,'CREDIT','2022-11-28 11:06:11','2022-11-28 11:06:11'),(65,134,1061,17401.090,17378.790,'CREDIT','2022-11-28 13:35:44','2022-11-28 13:35:44'),(66,123,1068,152181.800,149985.070,'CREDIT','2022-11-29 08:44:50','2022-11-29 08:44:50'),(67,123,1072,152139.170,152083.800,'CREDIT','2022-11-29 10:10:50','2022-11-29 10:10:50'),(68,123,1082,151211.210,151090.170,'CREDIT','2022-11-29 15:44:20','2022-11-29 15:44:20'),(69,134,1085,16727.320,16711.090,'CREDIT','2022-11-29 16:04:20','2022-11-29 16:04:20'),(70,134,1126,15638.070,15606.670,'CREDIT','2022-12-01 10:12:12','2022-12-01 10:12:12'),(71,134,1128,15725.980,15638.070,'CREDIT','2022-12-01 10:12:13','2022-12-01 10:12:13'),(72,134,1151,15374.300,15329.220,'CREDIT','2022-12-02 09:12:51','2022-12-02 09:12:51'),(73,118,1197,76476.430,65852.430,'CREDIT','2022-12-05 11:11:00','2022-12-05 11:11:00'),(74,134,1263,20113.620,20099.780,'CREDIT','2022-12-05 16:19:26','2022-12-05 16:19:26'),(75,134,1268,20156.680,19974.620,'CREDIT','2022-12-06 07:22:34','2022-12-06 07:22:34'),(76,134,1277,20124.630,20076.680,'CREDIT','2022-12-06 16:10:59','2022-12-06 16:10:59'),(77,134,1281,20130.830,20084.630,'CREDIT','2022-12-08 07:26:00','2022-12-08 07:26:00'),(78,134,1283,20171.170,20130.830,'CREDIT','2022-12-08 07:32:00','2022-12-08 07:32:00'),(79,134,1289,20164.330,20131.170,'CREDIT','2022-12-08 09:01:22','2022-12-08 09:01:22'),(80,134,1297,19585.630,19569.330,'CREDIT','2022-12-08 10:01:44','2022-12-08 10:01:44'),(81,134,1301,20470.670,19565.630,'CREDIT','2022-12-08 10:16:44','2022-12-08 10:16:44'),(82,134,1303,20486.370,20470.670,'CREDIT','2022-12-08 10:16:44','2022-12-08 10:16:44'),(83,134,1315,20012.170,19936.370,'CREDIT','2022-12-08 10:37:44','2022-12-08 10:37:44'),(84,134,1317,20092.350,20012.170,'CREDIT','2022-12-08 10:43:44','2022-12-08 10:43:44'),(85,134,1319,20115.750,20092.350,'CREDIT','2022-12-08 10:43:44','2022-12-08 10:43:44'),(86,134,1321,20173.930,20115.750,'CREDIT','2022-12-08 10:43:44','2022-12-08 10:43:44'),(87,125,2060,1603406.900,1603365.600,'CREDIT','2022-12-10 06:40:35','2022-12-10 06:40:35'),(88,134,2062,20194.560,20064.930,'CREDIT','2022-12-10 06:40:36','2022-12-10 06:40:36'),(89,134,2069,20075.370,20054.560,'CREDIT','2022-12-13 12:10:22','2022-12-13 12:10:22'),(90,134,2075,19948.540,19867.370,'CREDIT','2022-12-13 13:46:22','2022-12-13 13:46:22'),(91,125,2081,1603402.830,1603259.900,'CREDIT','2022-12-13 16:07:24','2022-12-13 16:07:24'),(92,134,2084,19998.880,19899.540,'CREDIT','2022-12-13 16:10:26','2022-12-13 16:10:26'),(93,115,2103,410.020,51.000,'CREDIT','2022-12-14 13:37:31','2022-12-14 13:37:31'),(94,115,2107,522.110,404.020,'CREDIT','2022-12-14 13:55:31','2022-12-14 13:55:31'),(95,125,2115,1352.890,0.000,'CREDIT','2022-12-14 17:40:39','2022-12-14 17:40:39'),(96,134,2130,25159.920,20000.000,'CREDIT','2022-12-15 12:31:17','2022-12-15 12:31:17'),(97,134,2136,20526.090,20000.000,'CREDIT','2022-12-15 12:43:17','2022-12-15 12:43:17'),(98,125,2145,2453.200,1352.890,'CREDIT','2022-12-20 05:55:20','2022-12-20 05:55:20'),(99,120,2730,1865.290,1725.800,'CREDIT','2023-03-31 09:28:27','2023-03-31 09:28:27'),(100,120,2742,1675.040,1617.290,'CREDIT','2023-08-15 05:15:49','2023-04-15 08:15:49'),(101,117,2748,10007.750,9950.000,'CREDIT','2023-08-15 05:37:56','2023-04-15 08:37:56'),(102,120,2754,1682.790,1625.040,'CREDIT','2023-08-15 05:57:12','2023-04-15 08:57:12'),(103,117,2768,9126.940,8507.750,'CREDIT','2023-08-15 06:05:23','2023-04-15 09:05:23'),(104,117,2774,9246.130,8626.940,'CREDIT','2023-08-15 06:05:47','2023-04-15 09:05:47'),(105,117,2778,9365.320,8746.130,'CREDIT','2023-08-15 06:06:10','2023-04-15 09:06:10'),(106,117,2782,9373.070,9315.320,'CREDIT','2023-08-15 06:06:34','2023-04-15 09:06:34'),(107,117,2792,8880.820,8823.070,'CREDIT','2023-08-15 06:07:26','2023-04-15 09:07:26'),(108,117,2796,8888.570,8830.820,'CREDIT','2023-08-15 06:16:09','2023-04-15 09:16:09'),(109,117,2800,8896.320,8838.570,'CREDIT','2023-08-15 06:17:00','2023-04-15 09:17:00'),(110,117,2804,8904.070,8846.320,'CREDIT','2023-08-15 06:19:34','2023-04-15 09:19:34'),(111,120,2810,1540.540,1482.790,'CREDIT','2023-08-15 06:34:03','2023-04-15 09:34:03'),(112,120,2814,1564.380,1440.540,'CREDIT','2023-08-15 06:34:37','2023-04-15 09:34:37'),(113,120,2822,1572.130,1514.380,'CREDIT','2023-08-15 07:54:32','2023-04-15 10:54:32'),(114,117,2824,8427.910,8304.070,'CREDIT','2023-08-15 07:54:34','2023-04-15 10:54:34'),(115,120,2828,1579.880,1522.130,'CREDIT','2023-08-15 07:59:15','2023-04-15 10:59:15'),(116,117,2832,8451.750,8327.910,'CREDIT','2023-08-15 08:00:29','2023-04-15 11:00:29'),(117,120,2838,1587.630,1529.880,'CREDIT','2023-08-15 08:01:27','2023-04-15 11:01:27'),(118,117,2840,8475.590,8351.750,'CREDIT','2023-08-15 08:01:29','2023-04-15 11:01:29'),(119,120,2846,1595.380,1537.630,'CREDIT','2023-08-15 08:02:01','2023-04-15 11:02:01'),(120,117,2848,8499.430,8375.590,'CREDIT','2023-08-15 08:02:03','2023-04-15 11:02:03'),(121,120,2856,1603.130,1545.380,'CREDIT','2023-08-15 08:03:04','2023-04-15 11:03:04'),(122,117,2858,8523.270,8399.430,'CREDIT','2023-08-15 08:03:05','2023-04-15 11:03:05'),(123,120,2864,1613.980,1533.130,'CREDIT','2023-04-15 11:26:54','2023-04-15 11:26:54'),(124,117,2866,8554.260,8393.270,'CREDIT','2023-04-15 11:26:56','2023-04-15 11:26:56'),(125,120,2872,1624.830,1543.980,'CREDIT','2023-04-15 11:27:22','2023-04-15 11:27:22'),(126,117,2874,8585.250,8424.260,'CREDIT','2023-04-15 11:27:23','2023-04-15 11:27:23'),(127,120,2880,1635.680,1554.830,'CREDIT','2023-04-15 11:27:55','2023-04-15 11:27:55'),(128,120,2886,1646.530,1565.680,'CREDIT','2023-04-15 11:29:45','2023-04-15 11:29:45'),(129,120,2892,1657.380,1576.530,'CREDIT','2023-04-15 11:30:02','2023-04-15 11:30:02'),(130,117,2894,8486.240,8325.250,'CREDIT','2023-04-15 11:30:04','2023-04-15 11:30:04'),(131,120,2900,1668.230,1587.380,'CREDIT','2023-04-15 11:30:49','2023-04-15 11:30:49'),(132,117,2902,8517.230,8356.240,'CREDIT','2023-04-15 11:30:51','2023-04-15 11:30:51'),(133,120,2908,1679.080,1598.230,'CREDIT','2023-04-15 11:31:33','2023-04-15 11:31:33'),(134,117,2910,8548.220,8387.230,'CREDIT','2023-04-15 11:31:35','2023-04-15 11:31:35'),(135,120,2916,1689.930,1609.080,'CREDIT','2023-04-15 11:32:18','2023-04-15 11:32:18'),(136,117,2918,8579.210,8418.220,'CREDIT','2023-04-15 11:32:20','2023-04-15 11:32:20'),(137,120,2922,1772.100,1589.930,'CREDIT','2023-04-17 07:13:39','2023-04-17 07:13:39'),(138,117,2926,10001.300,9990.000,'CREDIT','2023-04-19 10:20:34','2023-04-19 10:20:34'),(139,178,2932,10110.850,9500.000,'CREDIT','2023-04-19 10:21:22','2023-04-19 10:21:22'),(140,117,2938,9992.020,9981.300,'CREDIT','2023-04-19 10:21:38','2023-04-19 10:21:38'),(141,178,2940,10350.870,9610.850,'CREDIT','2023-04-19 10:21:46','2023-04-19 10:21:46'),(142,178,2946,10032.560,9350.870,'CREDIT','2023-04-19 10:23:14','2023-04-19 10:23:14'),(143,178,2952,9714.250,9032.560,'CREDIT','2023-04-19 10:24:54','2023-04-19 10:24:54'),(144,178,2956,9879.270,9214.250,'CREDIT','2023-04-19 10:25:19','2023-04-19 10:25:19'),(145,117,2978,9999.320,9982.020,'CREDIT','2023-04-19 10:29:41','2023-04-19 10:29:41'),(146,188,2982,10024.830,9950.000,'CREDIT','2023-04-19 10:34:12','2023-04-19 10:34:12'),(147,188,2986,10260.080,9974.830,'CREDIT','2023-04-19 10:35:38','2023-04-19 10:35:38'),(148,118,2990,10002.550,9990.000,'CREDIT','2023-04-19 10:36:04','2023-04-19 10:36:04'),(149,118,2994,10016.180,9992.550,'CREDIT','2023-04-19 10:37:51','2023-04-19 10:37:51'),(150,117,3000,10008.880,9987.320,'CREDIT','2023-04-19 10:39:48','2023-04-19 10:39:48'),(151,118,3006,10018.060,9996.180,'CREDIT','2023-04-19 10:40:42','2023-04-19 10:40:42'),(152,117,3008,10029.540,9996.880,'CREDIT','2023-04-19 10:40:47','2023-04-19 10:40:47'),(153,118,3014,10011.330,9978.060,'CREDIT','2023-04-19 10:43:39','2023-04-19 10:43:39'),(154,118,3020,10049.600,9991.330,'CREDIT','2023-04-19 10:44:50','2023-04-19 10:44:50'),(155,188,3022,10365.750,10210.080,'CREDIT','2023-04-19 10:44:51','2023-04-19 10:44:51'),(156,118,3030,10029.700,10009.600,'CREDIT','2023-04-19 10:46:25','2023-04-19 10:46:25'),(157,178,3050,8290.120,7379.270,'CREDIT','2023-04-19 10:48:15','2023-04-19 10:48:15'),(158,118,3052,10022.800,9969.700,'CREDIT','2023-04-19 10:48:24','2023-04-19 10:48:24'),(159,178,3060,8700.970,7790.120,'CREDIT','2023-04-19 10:49:19','2023-04-19 10:49:19'),(160,188,3064,10283.500,10115.750,'CREDIT','2023-04-19 10:50:04','2023-04-19 10:50:04'),(161,118,3068,10048.730,10002.800,'CREDIT','2023-04-19 10:50:43','2023-04-19 10:50:43'),(162,118,3078,10040.500,10008.730,'CREDIT','2023-04-19 10:52:02','2023-04-19 10:52:02'),(163,188,3080,10276.670,10183.500,'CREDIT','2023-04-19 10:52:05','2023-04-19 10:52:05'),(164,117,3088,10014.740,9984.540,'CREDIT','2023-04-19 10:52:41','2023-04-19 10:52:41'),(165,118,3090,10076.430,10020.500,'CREDIT','2023-04-19 10:52:48','2023-04-19 10:52:48'),(166,188,3092,10365.670,10226.670,'CREDIT','2023-04-19 10:52:48','2023-04-19 10:52:48'),(167,118,3102,10068.700,10036.430,'CREDIT','2023-04-19 10:53:38','2023-04-19 10:53:38'),(168,188,3104,10353.420,10265.670,'CREDIT','2023-04-19 10:53:40','2023-04-19 10:53:40'),(169,188,3112,10407.840,10303.420,'CREDIT','2023-04-19 10:54:30','2023-04-19 10:54:30'),(170,118,3114,10104.970,10048.700,'CREDIT','2023-04-19 10:54:37','2023-04-19 10:54:37'),(171,118,3120,10114.070,10084.970,'CREDIT','2023-04-19 10:55:02','2023-04-19 10:55:02'),(172,188,3122,10433.090,10357.840,'CREDIT','2023-04-19 10:55:03','2023-04-19 10:55:03'),(173,118,3132,10106.820,10014.070,'CREDIT','2023-04-19 10:57:19','2023-04-19 10:57:19'),(174,117,3134,10137.070,9914.740,'CREDIT','2023-04-19 10:57:39','2023-04-19 10:57:39'),(175,188,3144,10148.930,9683.090,'CREDIT','2023-04-19 10:58:34','2023-04-19 10:58:34'),(176,188,3154,10029.360,9648.930,'CREDIT','2023-04-19 10:59:23','2023-04-19 10:59:23'),(177,118,3156,10045.070,9806.820,'CREDIT','2023-04-19 10:59:24','2023-04-19 10:59:24'),(178,118,3160,10088.070,9945.070,'CREDIT','2023-04-19 10:59:50','2023-04-19 10:59:50'),(179,188,3170,9974.030,9829.360,'CREDIT','2023-04-19 11:01:31','2023-04-19 11:01:31'),(180,118,3172,10090.080,9488.070,'CREDIT','2023-04-19 11:01:32','2023-04-19 11:01:32'),(181,118,3176,10132.250,9990.080,'CREDIT','2023-04-19 11:02:00','2023-04-19 11:02:00'),(182,188,3180,10141.200,9874.030,'CREDIT','2023-04-19 11:02:55','2023-04-19 11:02:55'),(183,188,3184,10235.870,10041.200,'CREDIT','2023-04-19 11:03:25','2023-04-19 11:03:25'),(184,188,3188,10326.370,10135.870,'CREDIT','2023-04-19 11:03:58','2023-04-19 11:03:58'),(185,188,3192,10346.040,10226.370,'CREDIT','2023-04-19 11:04:32','2023-04-19 11:04:32'),(186,188,3196,10389.880,10246.040,'CREDIT','2023-04-19 11:04:53','2023-04-19 11:04:53'),(187,188,3200,10471.220,10289.880,'CREDIT','2023-04-19 11:05:28','2023-04-19 11:05:28'),(188,118,3210,10313.940,9632.250,'CREDIT','2023-04-19 11:11:14','2023-04-19 11:11:14'),(189,118,3214,10367.950,10013.940,'CREDIT','2023-04-19 11:12:11','2023-04-19 11:12:11'),(190,188,3218,10189.220,10071.220,'CREDIT','2023-04-19 11:14:34','2023-04-19 11:14:34'),(191,188,3222,10211.390,10089.220,'CREDIT','2023-04-19 11:15:09','2023-04-19 11:15:09'),(192,188,3226,10247.730,10111.390,'CREDIT','2023-04-19 11:15:44','2023-04-19 11:15:44'),(193,188,3238,10057.400,9747.730,'CREDIT','2023-04-19 11:18:20','2023-04-19 11:18:20'),(194,188,3242,10091.240,9957.400,'CREDIT','2023-04-19 11:18:40','2023-04-19 11:18:40'),(195,188,3246,10111.740,9991.240,'CREDIT','2023-04-19 11:19:45','2023-04-19 11:19:45'),(196,188,3252,10080.580,9911.740,'CREDIT','2023-04-19 11:20:28','2023-04-19 11:20:28'),(197,188,3256,10124.420,9980.580,'CREDIT','2023-04-19 11:20:57','2023-04-19 11:20:57'),(198,188,3262,10114.920,9924.420,'CREDIT','2023-04-19 11:21:45','2023-04-19 11:21:45'),(199,188,3272,9918.760,9714.920,'CREDIT','2023-04-19 11:23:24','2023-04-19 11:23:24'),(200,188,3276,9966.760,9818.760,'CREDIT','2023-04-19 11:24:01','2023-04-19 11:24:01'),(201,188,3280,9993.930,9866.760,'CREDIT','2023-04-19 11:24:29','2023-04-19 11:24:29'),(202,188,3284,10011.930,9893.930,'CREDIT','2023-04-19 11:24:50','2023-04-19 11:24:50'),(203,188,3290,9994.930,9811.930,'CREDIT','2023-04-19 11:25:47','2023-04-19 11:25:47'),(204,188,3298,9820.430,9694.930,'CREDIT','2023-04-19 11:26:51','2023-04-19 11:26:51'),(205,188,3302,9837.600,9720.430,'CREDIT','2023-04-19 11:28:07','2023-04-19 11:28:07'),(206,188,3308,9760.600,9637.600,'CREDIT','2023-04-19 11:28:58','2023-04-19 11:28:58'),(207,188,3312,9775.270,9660.600,'CREDIT','2023-04-19 11:29:27','2023-04-19 11:29:27'),(208,188,3316,9793.270,9675.270,'CREDIT','2023-04-19 11:29:56','2023-04-19 11:29:56'),(209,188,3320,9811.270,9693.270,'CREDIT','2023-04-19 11:30:32','2023-04-19 11:30:32'),(210,178,3324,8726.640,8650.970,'CREDIT','2023-04-19 11:49:23','2023-04-19 11:49:23'),(211,188,3330,9823.440,9711.270,'CREDIT','2023-04-19 12:20:05','2023-04-19 12:20:05'),(212,188,3334,9840.610,9723.440,'CREDIT','2023-04-19 12:20:48','2023-04-19 12:20:48'),(213,188,3338,9891.110,9740.610,'CREDIT','2023-04-19 12:21:38','2023-04-19 12:21:38'),(214,188,3344,9816.610,9691.110,'CREDIT','2023-04-19 12:22:46','2023-04-19 12:22:46'),(215,188,3350,9858.780,9616.610,'CREDIT','2023-04-19 12:25:01','2023-04-19 12:25:01'),(216,188,3354,9906.780,9758.780,'CREDIT','2023-04-19 12:25:29','2023-04-19 12:25:29'),(217,117,3360,10136.390,10115.070,'CREDIT','2023-04-19 13:23:35','2023-04-19 13:23:35'),(218,117,3364,10179.980,10086.390,'CREDIT','2023-04-19 13:24:34','2023-04-19 13:24:34'),(219,118,3368,10014.830,9950.000,'CREDIT','2023-04-19 15:50:59','2023-04-19 15:50:59'),(220,117,3374,10197.410,10159.980,'CREDIT','2023-04-20 07:01:46','2023-04-20 07:01:46'),(221,117,3380,9285.410,9097.410,'CREDIT','2023-04-20 07:06:21','2023-04-20 07:06:21'),(222,118,3384,9034.250,8964.830,'CREDIT','2023-04-20 07:09:49','2023-04-20 07:09:49'),(223,196,3388,10047.750,9950.000,'CREDIT','2023-04-20 07:11:24','2023-04-20 07:11:24'),(224,196,3394,10084.670,9947.750,'CREDIT','2023-04-20 07:18:14','2023-04-20 07:18:14'),(225,118,3404,9038.670,8984.250,'CREDIT','2023-04-20 12:12:33','2023-04-20 12:12:33'),(226,117,3408,9273.510,9245.410,'CREDIT','2023-04-20 12:13:38','2023-04-20 12:13:38'),(227,117,3412,9283.940,9253.510,'CREDIT','2023-04-20 12:20:27','2023-04-20 12:20:27'),(228,120,3416,10041.090,9950.000,'CREDIT','2023-04-21 11:26:20','2023-04-21 11:26:20'),(229,120,3420,10082.180,9991.090,'CREDIT','2023-04-21 11:33:15','2023-04-21 11:33:15'),(230,188,3424,9959.780,9806.780,'CREDIT','2023-04-23 19:38:33','2023-04-23 19:38:33'),(231,188,3428,10041.950,9859.780,'CREDIT','2023-04-23 19:39:34','2023-04-23 19:39:34'),(232,188,3434,9124.120,8941.950,'CREDIT','2023-04-23 19:43:29','2023-04-23 19:43:29'),(233,188,3438,9206.290,9024.120,'CREDIT','2023-04-24 08:08:58','2023-04-24 08:08:58'),(234,188,3442,9254.290,9106.290,'CREDIT','2023-04-24 08:10:46','2023-04-24 08:10:46'),(235,188,3448,9452.640,8754.290,'CREDIT','2023-04-24 08:11:44','2023-04-24 08:11:44'),(236,118,3450,9120.840,8938.670,'CREDIT','2023-04-24 08:11:49','2023-04-24 08:11:49'),(237,188,3456,9646.830,8952.640,'CREDIT','2023-04-24 08:12:12','2023-04-24 08:12:12'),(238,118,3458,9203.010,9020.840,'CREDIT','2023-04-24 08:12:18','2023-04-24 08:12:18'),(239,118,3464,8964.520,8603.010,'CREDIT','2023-04-24 08:13:00','2023-04-24 08:13:00'),(240,188,3468,9852.260,9396.830,'CREDIT','2023-04-24 08:13:35','2023-04-24 08:13:35'),(241,118,3472,9033.530,8664.520,'CREDIT','2023-04-24 08:14:09','2023-04-24 08:14:09'),(242,188,3478,9525.610,8852.260,'CREDIT','2023-04-24 08:15:05','2023-04-24 08:15:05'),(243,118,3484,9122.540,8733.530,'CREDIT','2023-04-24 08:17:13','2023-04-24 08:17:13'),(244,188,3490,9107.780,8925.610,'CREDIT','2023-04-24 08:20:47','2023-04-24 08:20:47'),(245,196,3498,10166.840,9984.670,'CREDIT','2023-04-24 08:36:41','2023-04-24 08:36:41'),(246,196,3502,10249.010,10066.840,'CREDIT','2023-04-24 08:37:33','2023-04-24 08:37:33'),(247,118,3506,8204.710,8022.540,'CREDIT','2023-04-24 08:41:29','2023-04-24 08:41:29'),(248,118,3510,8453.550,8104.710,'CREDIT','2023-04-24 08:43:44','2023-04-24 08:43:44'),(249,178,3522,8608.810,8426.640,'CREDIT','2023-04-24 08:57:53','2023-04-24 08:57:53'),(250,178,3528,8590.980,8408.810,'CREDIT','2023-04-24 08:59:11','2023-04-24 08:59:11'),(251,117,3534,9212.940,9133.940,'CREDIT','2023-04-24 09:11:42','2023-04-24 09:11:42'),(252,117,3538,9512.780,9162.940,'CREDIT','2023-04-24 09:13:23','2023-04-24 09:13:23'),(253,120,3542,10107.680,9982.180,'CREDIT','2023-04-24 09:54:31','2023-04-24 09:54:31'),(254,188,3546,9089.950,8907.780,'CREDIT','2023-04-24 09:56:28','2023-04-24 09:56:28'),(255,118,3552,8535.720,8353.550,'CREDIT','2023-04-24 09:58:10','2023-04-24 09:58:10'),(256,118,3556,8617.890,8435.720,'CREDIT','2023-04-24 09:58:44','2023-04-24 09:58:44'),(257,120,3560,10189.850,10007.680,'CREDIT','2023-04-24 10:03:14','2023-04-24 10:03:14'),(258,120,3574,10144.520,9889.850,'CREDIT','2023-04-24 10:13:35','2023-04-24 10:13:35'),(259,120,3578,10300.020,10044.520,'CREDIT','2023-04-24 10:15:17','2023-04-24 10:15:17'),(260,178,3582,8673.150,8490.980,'CREDIT','2023-04-24 10:23:03','2023-04-24 10:23:03'),(261,117,3590,9562.780,9462.780,'CREDIT','2023-04-24 10:38:32','2023-04-24 10:38:32'),(262,188,3594,9095.950,8889.950,'CREDIT','2023-04-24 10:47:51','2023-04-24 10:47:51'),(263,118,3598,8217.890,8017.890,'CREDIT','2023-04-24 12:10:25','2023-04-24 12:10:25'),(264,178,3602,8773.150,8573.150,'CREDIT','2023-04-24 12:46:12','2023-04-24 12:46:12'),(265,178,3606,8781.150,8673.150,'CREDIT','2023-04-24 12:51:29','2023-04-24 12:51:29'),(266,178,3610,8809.150,8681.150,'CREDIT','2023-04-24 12:52:10','2023-04-24 12:52:10'),(267,120,3614,10400.020,10200.020,'CREDIT','2023-04-25 08:29:23','2023-04-25 08:29:23'),(268,188,3632,8995.950,8795.950,'CREDIT','2023-04-25 08:34:42','2023-04-25 08:34:42'),(269,188,3636,9095.950,8895.950,'CREDIT','2023-04-25 08:36:14','2023-04-25 08:36:14'),(270,188,3644,9195.950,8995.950,'CREDIT','2023-04-25 08:38:09','2023-04-25 08:38:09'),(271,120,3646,10300.020,10100.020,'CREDIT','2023-04-25 08:38:09','2023-04-25 08:38:09'),(272,117,3648,9427.780,9162.780,'CREDIT','2023-04-25 08:38:15','2023-04-25 08:38:15'),(273,117,3656,9509.780,9327.780,'CREDIT','2023-04-25 08:39:15','2023-04-25 08:39:15'),(274,120,3658,10500.020,10200.020,'CREDIT','2023-04-25 08:39:26','2023-04-25 08:39:26'),(275,188,3660,9563.950,9095.950,'CREDIT','2023-04-25 08:39:35','2023-04-25 08:39:35'),(276,117,3668,9631.780,9409.780,'CREDIT','2023-04-25 08:40:08','2023-04-25 08:40:08'),(277,120,3670,10700.020,10400.020,'CREDIT','2023-04-25 08:40:14','2023-04-25 08:40:14'),(278,188,3672,9782.950,9463.950,'CREDIT','2023-04-25 08:40:16','2023-04-25 08:40:16'),(279,117,3682,9668.780,9531.780,'CREDIT','2023-04-25 08:40:55','2023-04-25 08:40:55'),(280,120,3684,10900.020,10600.020,'CREDIT','2023-04-25 08:41:11','2023-04-25 08:41:11'),(281,188,3686,10136.950,9682.950,'CREDIT','2023-04-25 08:41:20','2023-04-25 08:41:20'),(282,188,3694,10236.950,10036.950,'CREDIT','2023-04-25 08:44:29','2023-04-25 08:44:29'),(283,117,3696,9768.780,9568.780,'CREDIT','2023-04-25 08:44:29','2023-04-25 08:44:29'),(284,120,3698,11225.020,10800.020,'CREDIT','2023-04-25 08:44:45','2023-04-25 08:44:45'),(285,117,3706,9868.780,9668.780,'CREDIT','2023-04-25 08:45:30','2023-04-25 08:45:30'),(286,120,3708,11795.020,11125.020,'CREDIT','2023-04-25 08:45:55','2023-04-25 08:45:55'),(287,120,3714,11810.020,11695.020,'CREDIT','2023-04-25 08:46:24','2023-04-25 08:46:24'),(288,188,3716,10336.950,10136.950,'CREDIT','2023-04-25 08:46:36','2023-04-25 08:46:36'),(289,117,3718,9968.780,9768.780,'CREDIT','2023-04-25 08:46:36','2023-04-25 08:46:36'),(290,117,3724,10068.780,9868.780,'CREDIT','2023-04-25 08:47:38','2023-04-25 08:47:38'),(291,120,3732,10870.020,10310.020,'CREDIT','2023-04-25 08:48:28','2023-04-25 08:48:28'),(292,117,3734,10168.780,9968.780,'CREDIT','2023-04-25 08:48:40','2023-04-25 08:48:40'),(293,120,3742,11075.020,10370.020,'CREDIT','2023-04-25 08:50:39','2023-04-25 08:50:39'),(294,117,3744,10268.780,10068.780,'CREDIT','2023-04-25 08:50:46','2023-04-25 08:50:46'),(295,120,3752,11575.020,10575.020,'CREDIT','2023-04-25 08:51:26','2023-04-25 08:51:26'),(296,117,3754,10368.780,10168.780,'CREDIT','2023-04-25 08:52:21','2023-04-25 08:52:21'),(297,188,3756,10527.950,10136.950,'CREDIT','2023-04-25 08:52:35','2023-04-25 08:52:35'),(298,120,3764,11795.020,11075.020,'CREDIT','2023-04-25 08:53:35','2023-04-25 08:53:35'),(299,117,3766,10468.780,10268.780,'CREDIT','2023-04-25 08:53:42','2023-04-25 08:53:42'),(300,117,3776,10568.780,10368.780,'CREDIT','2023-04-25 08:55:23','2023-04-25 08:55:23'),(301,117,3784,10668.780,10468.780,'CREDIT','2023-04-25 08:55:59','2023-04-25 08:55:59'),(302,120,3786,12795.020,10795.020,'CREDIT','2023-04-25 08:56:13','2023-04-25 08:56:13'),(303,117,3794,10768.780,10568.780,'CREDIT','2023-04-25 08:57:42','2023-04-25 08:57:42'),(304,120,3796,14295.020,12295.020,'CREDIT','2023-04-25 08:57:56','2023-04-25 08:57:56'),(305,188,3798,10440.950,10027.950,'CREDIT','2023-04-25 08:57:57','2023-04-25 08:57:57'),(306,120,3814,14395.020,13695.020,'CREDIT','2023-04-25 09:06:52','2023-04-25 09:06:52'),(307,188,3816,10340.950,10140.950,'CREDIT','2023-04-25 09:07:00','2023-04-25 09:07:00'),(308,117,3818,10768.780,10568.780,'CREDIT','2023-04-25 09:07:00','2023-04-25 09:07:00'),(309,117,3826,10868.780,10668.780,'CREDIT','2023-04-25 09:08:22','2023-04-25 09:08:22'),(310,188,3828,10440.950,10240.950,'CREDIT','2023-04-25 09:08:22','2023-04-25 09:08:22'),(311,120,3830,14890.020,13895.020,'CREDIT','2023-04-25 09:08:22','2023-04-25 09:08:22'),(312,120,3838,14965.020,14390.020,'CREDIT','2023-04-25 09:08:55','2023-04-25 09:08:55'),(313,120,3846,15080.020,14465.020,'CREDIT','2023-04-25 09:09:16','2023-04-25 09:09:16'),(314,117,3848,10806.780,10668.780,'CREDIT','2023-04-25 09:09:19','2023-04-25 09:09:19'),(315,120,3856,15125.020,14580.020,'CREDIT','2023-04-25 09:09:47','2023-04-25 09:09:47'),(316,120,3864,15255.020,14625.020,'CREDIT','2023-04-25 09:10:08','2023-04-25 09:10:08'),(317,117,3866,10737.780,10606.780,'CREDIT','2023-04-25 09:10:09','2023-04-25 09:10:09'),(318,188,3872,10353.950,10040.950,'CREDIT','2023-04-25 09:10:27','2023-04-25 09:10:27'),(319,120,3876,15445.020,14755.020,'CREDIT','2023-04-25 09:10:51','2023-04-25 09:10:51'),(320,117,3878,10784.780,10637.780,'CREDIT','2023-04-25 09:10:52','2023-04-25 09:10:52'),(321,188,3880,10668.950,10253.950,'CREDIT','2023-04-25 09:11:14','2023-04-25 09:11:14'),(322,188,3884,11108.950,10568.950,'CREDIT','2023-04-25 09:12:26','2023-04-25 09:12:26'),(323,117,3890,10843.780,10684.780,'CREDIT','2023-04-25 09:16:54','2023-04-25 09:16:54'),(324,120,3892,15545.020,15345.020,'CREDIT','2023-04-25 09:16:58','2023-04-25 09:16:58'),(325,120,3900,16545.020,14545.020,'CREDIT','2023-04-25 09:17:50','2023-04-25 09:17:50'),(326,117,3901,10943.780,10743.780,'CREDIT','2023-04-25 09:17:50','2023-04-25 09:17:50'),(327,188,3904,11208.950,11008.950,'CREDIT','2023-04-25 09:17:51','2023-04-25 09:17:51'),(328,120,3910,17545.020,15545.020,'CREDIT','2023-04-25 09:19:43','2023-04-25 09:19:43'),(329,117,3912,11043.780,10843.780,'CREDIT','2023-04-25 09:19:43','2023-04-25 09:19:43'),(330,120,3922,16735.020,15545.020,'CREDIT','2023-04-25 09:20:33','2023-04-25 09:20:33'),(331,117,3924,10263.780,9043.780,'CREDIT','2023-04-25 09:20:34','2023-04-25 09:20:34'),(332,120,3930,17105.020,15735.020,'CREDIT','2023-04-25 09:20:55','2023-04-25 09:20:55'),(333,117,3936,9513.780,8263.780,'CREDIT','2023-04-25 09:21:13','2023-04-25 09:21:13'),(334,120,3938,17565.020,16105.020,'CREDIT','2023-04-25 09:21:16','2023-04-25 09:21:16'),(335,120,3944,18075.020,16565.020,'CREDIT','2023-04-25 09:23:09','2023-04-25 09:23:09'),(336,117,3946,10103.780,8513.780,'CREDIT','2023-04-25 09:23:10','2023-04-25 09:23:10'),(337,188,3950,11308.950,11108.950,'CREDIT','2023-04-25 09:25:10','2023-04-25 09:25:10'),(338,188,3954,11408.950,11208.950,'CREDIT','2023-04-25 09:26:30','2023-04-25 09:26:30'),(339,120,3962,18335.020,17075.020,'CREDIT','2023-04-25 09:40:13','2023-04-25 09:40:13'),(340,117,3964,10433.780,9103.780,'CREDIT','2023-04-25 09:40:14','2023-04-25 09:40:14'),(341,120,3968,18565.020,17335.020,'CREDIT','2023-04-25 09:40:36','2023-04-25 09:40:36'),(342,120,3980,18395.020,16565.020,'CREDIT','2023-04-25 09:41:19','2023-04-25 09:41:19'),(343,188,3984,11308.950,11108.950,'CREDIT','2023-04-25 09:41:46','2023-04-25 09:41:46'),(344,188,3988,11527.950,11208.950,'CREDIT','2023-04-25 09:42:45','2023-04-25 09:42:45'),(345,188,3992,11895.950,11427.950,'CREDIT','2023-04-25 09:43:33','2023-04-25 09:43:33'),(346,188,3996,12225.950,11795.950,'CREDIT','2023-04-25 09:44:34','2023-04-25 09:44:34'),(347,188,4002,12450.950,12025.950,'CREDIT','2023-04-25 09:46:22','2023-04-25 09:46:22'),(348,120,4008,18595.020,17395.020,'CREDIT','2023-04-25 09:49:11','2023-04-25 09:49:11'),(349,117,4010,8853.780,7433.780,'CREDIT','2023-04-25 09:49:14','2023-04-25 09:49:14'),(350,120,4016,19065.020,17595.020,'CREDIT','2023-04-25 09:49:39','2023-04-25 09:49:39'),(351,120,4020,19845.020,18065.020,'CREDIT','2023-04-25 09:50:07','2023-04-25 09:50:07'),(352,117,4022,9753.780,7853.780,'CREDIT','2023-04-25 09:50:08','2023-04-25 09:50:08'),(353,120,4028,20255.020,18845.020,'CREDIT','2023-04-25 09:51:57','2023-04-25 09:51:57'),(354,117,4030,10353.780,8753.780,'CREDIT','2023-04-25 09:52:00','2023-04-25 09:52:00'),(355,120,4040,19855.020,18255.020,'CREDIT','2023-04-25 09:52:40','2023-04-25 09:52:40'),(356,118,4058,8757.890,7217.890,'CREDIT','2023-04-26 10:45:32','2023-04-26 10:45:32'),(357,188,4096,12072.950,11950.950,'CREDIT','2023-04-26 10:48:58','2023-04-26 10:48:58'),(358,120,4098,11005.020,9755.020,'CREDIT','2023-04-26 10:48:59','2023-04-26 10:48:59'),(359,118,4102,8289.890,8157.890,'CREDIT','2023-04-26 10:49:26','2023-04-26 10:49:26'),(360,120,4106,12645.020,10005.020,'CREDIT','2023-04-26 10:49:40','2023-04-26 10:49:40'),(361,118,4110,8323.890,8189.890,'CREDIT','2023-04-26 10:50:06','2023-04-26 10:50:06'),(362,188,4112,12128.950,11972.950,'CREDIT','2023-04-26 10:50:09','2023-04-26 10:50:09'),(363,188,4122,12055.950,11928.950,'CREDIT','2023-04-26 10:53:29','2023-04-26 10:53:28'),(364,188,4128,11978.950,11855.950,'CREDIT','2023-04-26 10:54:05','2023-04-26 10:54:05'),(365,188,4132,12005.950,11878.950,'CREDIT','2023-04-26 10:54:31','2023-04-26 10:54:31'),(366,188,4136,12037.950,11905.950,'CREDIT','2023-04-26 10:54:55','2023-04-26 10:54:55'),(367,188,4142,11963.950,11837.950,'CREDIT','2023-04-26 10:55:34','2023-04-26 10:55:34'),(368,188,4148,11904.950,11763.950,'CREDIT','2023-04-26 10:59:55','2023-04-26 10:59:55'),(369,188,4154,11830.950,11704.950,'CREDIT','2023-04-26 11:07:11','2023-04-26 11:07:11'),(370,188,4162,11655.950,11530.950,'CREDIT','2023-04-26 11:14:25','2023-04-26 11:14:25'),(371,188,4166,11680.950,11555.950,'CREDIT','2023-04-26 11:14:43','2023-04-26 11:14:43'),(372,188,4170,11712.950,11580.950,'CREDIT','2023-04-26 11:15:04','2023-04-26 11:15:04'),(373,188,4176,11641.950,11512.950,'CREDIT','2023-04-26 11:15:45','2023-04-26 11:15:45'),(374,188,4180,11668.950,11541.950,'CREDIT','2023-04-26 11:16:09','2023-04-26 11:16:09'),(375,188,4184,11692.950,11568.950,'CREDIT','2023-04-26 11:16:28','2023-04-26 11:16:28'),(376,188,4190,11618.950,11492.950,'CREDIT','2023-04-26 11:18:02','2023-04-26 11:18:02'),(377,188,4194,11641.950,11518.950,'CREDIT','2023-04-26 11:18:23','2023-04-26 11:18:23'),(378,188,4198,11671.950,11541.950,'CREDIT','2023-04-26 12:17:15','2023-04-26 12:17:15'),(379,188,4206,11497.950,11371.950,'CREDIT','2023-04-26 12:18:10','2023-04-26 12:18:10'),(380,188,4214,11332.950,11197.950,'CREDIT','2023-04-26 12:20:43','2023-04-26 12:20:43'),(381,188,4218,11361.950,11232.950,'CREDIT','2023-04-26 12:21:03','2023-04-26 12:21:03'),(382,188,4222,11391.950,11261.950,'CREDIT','2023-04-26 12:21:24','2023-04-26 12:21:24'),(383,188,4226,11432.950,11291.950,'CREDIT','2023-04-26 12:21:50','2023-04-26 12:21:50'),(384,188,4230,11457.950,11332.950,'CREDIT','2023-04-26 12:22:09','2023-04-26 12:22:09'),(385,188,4240,11183.950,11057.950,'CREDIT','2023-04-26 12:23:33','2023-04-26 12:23:33'),(386,188,4246,11109.950,10983.950,'CREDIT','2023-04-26 12:24:14','2023-04-26 12:24:14'),(387,188,4250,11135.950,11009.950,'CREDIT','2023-04-26 12:26:04','2023-04-26 12:26:04'),(388,188,4258,10958.950,10835.950,'CREDIT','2023-04-26 12:27:08','2023-04-26 12:27:08'),(389,188,4262,10987.950,10858.950,'CREDIT','2023-04-26 12:27:31','2023-04-26 12:27:31'),(390,188,4268,10921.950,10787.950,'CREDIT','2023-04-26 12:28:09','2023-04-26 12:28:09'),(391,188,4276,10751.950,10621.950,'CREDIT','2023-04-26 12:29:09','2023-04-26 12:29:09'),(392,188,4282,10676.950,10551.950,'CREDIT','2023-04-26 15:05:20','2023-04-26 15:05:20'),(393,188,4290,10501.950,10376.950,'CREDIT','2023-04-26 15:06:13','2023-04-26 15:06:13'),(394,188,4294,10524.950,10401.950,'CREDIT','2023-04-26 15:06:38','2023-04-26 15:06:38'),(395,188,4304,10450.950,10324.950,'CREDIT','2023-04-26 16:34:23','2023-04-26 16:34:23'),(396,120,4306,11645.020,9645.020,'CREDIT','2023-04-26 16:34:33','2023-04-26 16:34:33'),(397,188,4326,10277.950,10150.950,'CREDIT','2023-04-26 16:36:41','2023-04-26 16:36:41'),(398,120,4328,10645.020,8645.020,'CREDIT','2023-04-26 16:36:50','2023-04-26 16:36:50'),(399,188,4333,10300.950,10177.950,'CREDIT','2023-04-26 16:37:35','2023-04-26 16:37:35'),(400,117,4347,1773.780,353.780,'CREDIT','2023-04-26 16:38:31','2023-04-26 16:38:31'),(401,188,4349,10259.950,10100.950,'CREDIT','2023-04-26 16:38:33','2023-04-26 16:38:33'),(402,117,4357,2093.780,773.780,'CREDIT','2023-04-26 16:38:55','2023-04-26 16:38:55'),(403,188,4365,10248.950,10059.950,'CREDIT','2023-04-26 16:39:23','2023-04-26 16:39:23'),(404,120,4367,8645.020,6645.020,'CREDIT','2023-04-26 16:39:24','2023-04-26 16:39:24'),(405,188,4374,10339.950,10148.950,'CREDIT','2023-04-26 16:40:47','2023-04-26 16:40:47'),(406,178,4388,8633.150,8409.150,'CREDIT','2023-04-26 16:42:00','2023-04-26 16:42:00'),(407,188,4400,10789.950,8939.950,'CREDIT','2023-04-26 16:42:43','2023-04-26 16:42:43'),(408,178,4408,8463.150,8333.150,'CREDIT','2023-04-26 16:43:58','2023-04-26 16:43:58'),(409,188,4412,10743.950,10589.950,'CREDIT','2023-04-26 16:44:01','2023-04-26 16:44:01'),(410,120,4420,8645.020,6645.020,'CREDIT','2023-04-26 16:45:36','2023-04-26 16:45:36'),(411,178,4422,8522.150,8263.150,'CREDIT','2023-04-26 16:45:42','2023-04-26 16:45:42'),(412,117,4424,4093.780,93.780,'CREDIT','2023-04-26 16:45:51','2023-04-26 16:45:51'),(413,188,4430,10776.950,10643.950,'CREDIT','2023-04-26 16:46:41','2023-04-26 16:46:41'),(414,178,4432,8628.150,8422.150,'CREDIT','2023-04-26 16:46:50','2023-04-26 16:46:50'),(415,188,4440,10808.950,10676.950,'CREDIT','2023-04-26 16:47:25','2023-04-26 16:47:25'),(416,188,4446,10850.950,10708.950,'CREDIT','2023-04-26 16:47:52','2023-04-26 16:47:52'),(417,120,4448,9645.020,7645.020,'CREDIT','2023-04-26 16:47:59','2023-04-26 16:47:59'),(418,120,4454,10645.020,8645.020,'CREDIT','2023-04-26 16:48:34','2023-04-26 16:48:34'),(419,178,4456,8722.150,8428.150,'CREDIT','2023-04-26 16:48:42','2023-04-26 16:48:42'),(420,188,4474,10595.950,9850.950,'CREDIT','2023-04-26 16:50:48','2023-04-26 16:50:48'),(421,178,4476,8722.150,6722.150,'CREDIT','2023-04-26 16:50:54','2023-04-26 16:50:54'),(422,120,4484,9645.020,7645.020,'CREDIT','2023-04-26 16:51:41','2023-04-26 16:51:41'),(423,178,4485,9722.150,7722.150,'CREDIT','2023-04-26 16:51:41','2023-04-26 16:51:41'),(424,178,4496,10092.150,8722.150,'CREDIT','2023-04-26 16:52:36','2023-04-26 16:52:36'),(425,188,4518,8725.950,8095.950,'CREDIT','2023-04-26 16:54:15','2023-04-26 16:54:15'),(426,188,4532,7764.950,7625.950,'CREDIT','2023-04-26 16:57:24','2023-04-26 16:57:24'),(427,115,4534,10040.000,9900.000,'CREDIT','2023-04-26 16:57:24','2023-04-26 16:57:24'),(428,120,4536,3645.020,1645.020,'CREDIT','2023-04-26 16:57:31','2023-04-26 16:57:31'),(429,120,4540,4195.020,2645.020,'CREDIT','2023-04-26 16:58:26','2023-04-26 16:58:26'),(430,120,4552,3195.020,1195.020,'CREDIT','2023-04-26 16:59:34','2023-04-26 16:59:34'),(431,178,4553,7092.150,5092.150,'CREDIT','2023-04-26 16:59:34','2023-04-26 16:59:34'),(432,120,4574,1405.020,195.020,'CREDIT','2023-04-26 17:00:51','2023-04-26 17:00:51'),(433,120,4580,1695.020,405.020,'CREDIT','2023-04-26 17:01:10','2023-04-26 17:01:10'),(434,188,4588,7798.950,7664.950,'CREDIT','2023-04-26 17:02:51','2023-04-26 17:02:51'),(435,120,4602,731.020,595.020,'CREDIT','2023-04-26 17:04:01','2023-04-26 17:04:01'),(436,188,4604,7748.950,7598.950,'CREDIT','2023-04-26 17:04:02','2023-04-26 17:04:02'),(437,188,4608,7794.950,7648.950,'CREDIT','2023-04-26 17:04:24','2023-04-26 17:04:24'),(438,188,4624,7679.950,7494.950,'CREDIT','2023-04-26 17:05:32','2023-04-26 17:05:32'),(439,178,4626,892.150,492.150,'CREDIT','2023-04-26 17:05:33','2023-04-26 17:05:33'),(440,188,4634,7620.950,7479.950,'CREDIT','2023-04-26 17:06:34','2023-04-26 17:06:34'),(441,188,4640,10131.000,10000.000,'CREDIT','2023-04-26 17:07:07','2023-04-26 17:07:07'),(442,120,4642,11000.000,9000.000,'CREDIT','2023-04-26 17:07:15','2023-04-26 17:07:15'),(443,188,4650,10209.000,10031.000,'CREDIT','2023-04-26 17:08:43','2023-04-26 17:08:43'),(444,178,4652,10100.000,9900.000,'CREDIT','2023-04-26 17:08:45','2023-04-26 17:08:45'),(445,120,4654,12000.000,10000.000,'CREDIT','2023-04-26 17:08:45','2023-04-26 17:08:45'),(446,188,4662,10269.000,10109.000,'CREDIT','2023-04-26 17:09:10','2023-04-26 17:09:10'),(447,188,4668,10330.000,10169.000,'CREDIT','2023-04-26 17:09:36','2023-04-26 17:09:36'),(448,178,4672,10100.000,9900.000,'CREDIT','2023-04-26 17:09:41','2023-04-26 17:09:41'),(449,188,4684,10279.000,10130.000,'CREDIT','2023-04-26 17:10:43','2023-04-26 17:10:43'),(450,178,4686,10200.000,10000.000,'CREDIT','2023-04-26 17:10:49','2023-04-26 17:10:49'),(451,117,4690,13000.000,9000.000,'CREDIT','2023-04-26 17:11:04','2023-04-26 17:11:04'),(452,120,4694,11000.000,9000.000,'CREDIT','2023-04-26 17:12:21','2023-04-26 17:12:21'),(453,178,4696,10300.000,10100.000,'CREDIT','2023-04-26 17:12:21','2023-04-26 17:12:21'),(454,188,4698,10384.000,10179.000,'CREDIT','2023-04-26 17:12:22','2023-04-26 17:12:22'),(455,178,4706,10400.000,10200.000,'CREDIT','2023-04-26 17:13:32','2023-04-26 17:13:32'),(456,188,4708,10485.000,10284.000,'CREDIT','2023-04-26 17:13:33','2023-04-26 17:13:33'),(457,188,4716,10825.000,9485.000,'CREDIT','2023-04-26 17:14:09','2023-04-26 17:14:09'),(458,120,4726,10000.000,8000.000,'CREDIT','2023-04-26 17:16:19','2023-04-26 17:16:19'),(459,178,4727,10400.000,10200.000,'CREDIT','2023-04-26 17:16:19','2023-04-26 17:16:19'),(460,188,4756,9400.000,8725.000,'CREDIT','2023-04-26 17:19:07','2023-04-26 17:19:07'),(461,188,4778,8655.000,7900.000,'CREDIT','2023-04-26 17:20:08','2023-04-26 17:20:08'),(462,188,4792,8420.000,7655.000,'CREDIT','2023-04-26 17:20:50','2023-04-26 17:20:50'),(463,120,4794,5000.000,3000.000,'CREDIT','2023-04-26 17:20:55','2023-04-26 17:20:55'),(464,178,4796,5300.000,3300.000,'CREDIT','2023-04-26 17:20:55','2023-04-26 17:20:55'),(465,188,4810,8170.000,7420.000,'CREDIT','2023-04-26 17:21:42','2023-04-26 17:21:42'),(466,188,4816,8440.000,7670.000,'CREDIT','2023-04-26 17:22:09','2023-04-26 17:22:09'),(467,115,4828,10025.000,9900.000,'CREDIT','2023-04-26 17:23:17','2023-04-26 17:23:17'),(468,188,4830,8705.000,7940.000,'CREDIT','2023-04-26 17:23:21','2023-04-26 17:23:21'),(469,120,4832,5000.000,3000.000,'CREDIT','2023-04-26 17:23:26','2023-04-26 17:23:26'),(470,188,4850,7925.000,7205.000,'CREDIT','2023-04-26 17:24:59','2023-04-26 17:24:59'),(471,120,4852,4000.000,2000.000,'CREDIT','2023-04-26 17:25:06','2023-04-26 17:25:06'),(472,188,4858,8160.000,7425.000,'CREDIT','2023-04-26 17:25:46','2023-04-26 17:25:46'),(473,188,4862,8480.000,7660.000,'CREDIT','2023-04-26 17:26:11','2023-04-26 17:26:11'),(474,188,4866,8980.000,7980.000,'CREDIT','2023-04-26 17:27:04','2023-04-26 17:27:04'),(475,178,4870,380.000,180.000,'CREDIT','2023-04-26 17:28:25','2023-04-26 17:28:25'),(476,188,4878,8550.000,7880.000,'CREDIT','2023-04-26 17:30:29','2023-04-26 17:30:29'),(477,188,4882,8910.000,8050.000,'CREDIT','2023-04-26 17:32:21','2023-04-26 17:32:21'),(478,188,4888,8570.000,7910.000,'CREDIT','2023-04-26 17:34:03','2023-04-26 17:34:03'),(479,188,4894,8775.000,8070.000,'CREDIT','2023-04-26 17:34:57','2023-04-26 17:34:57'),(480,188,4898,8970.000,8275.000,'CREDIT','2023-04-26 17:35:20','2023-04-26 17:35:20'),(481,188,4908,8765.000,7970.000,'CREDIT','2023-04-26 17:36:12','2023-04-26 17:36:12'),(482,178,4910,340.000,80.000,'CREDIT','2023-04-26 17:36:22','2023-04-26 17:36:22'),(483,188,4918,8175.000,7265.000,'CREDIT','2023-04-26 17:41:13','2023-04-26 17:41:13');
/*!40000 ALTER TABLE `profile_balance_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_bonus`
--

DROP TABLE IF EXISTS `profile_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_bonus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `bonus` decimal(10,3) NOT NULL DEFAULT '0.000',
  `bonus_name` varchar(15) NOT NULL,
  `status` enum('VALID','USED','INVALID','REDEEMED','EXPIRED') NOT NULL,
  `expiry_date` datetime NOT NULL,
  `redeemed_on` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `profile_id` (`profile_id`),
  KEY `bonus` (`bonus`),
  KEY `bonus_name` (`bonus_name`),
  KEY `expiry_date` (`expiry_date`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_bonus`
--

LOCK TABLES `profile_bonus` WRITE;
/*!40000 ALTER TABLE `profile_bonus` DISABLE KEYS */;
INSERT INTO `profile_bonus` VALUES (4,115,30.000,'KARIBU_BONUS','USED','2022-11-19 14:31:19','2022-11-02 18:25:57','2022-07-18 14:31:19','2022-11-02 15:25:57'),(5,115,30.000,'RAFIKI_BONUS','USED','2022-11-19 14:31:19','2022-11-02 18:25:57','2022-07-18 14:41:56','2022-11-02 15:25:57'),(6,117,30.000,'KARIBU_BONUS','VALID','2022-07-19 14:43:39',NULL,'2022-07-18 14:43:39','2022-07-18 11:43:39'),(7,115,30.000,'KARIBU_BONUS','USED','2022-11-19 14:31:19','2022-11-02 18:25:57','2022-07-18 14:44:28','2022-11-02 15:25:57'),(8,118,30.000,'KARIBU_BONUS','VALID','2022-07-19 15:59:19',NULL,'2022-07-18 15:59:19','2022-07-18 12:59:19'),(9,130,30.000,'KARIBU_BONUS','VALID','2022-07-19 18:58:59',NULL,'2022-07-18 18:58:59','2022-07-18 15:58:59'),(10,131,30.000,'KARIBU_BONUS','VALID','2022-07-19 19:01:24',NULL,'2022-07-18 19:01:24','2022-07-18 16:01:24'),(11,125,30.000,'KARIBU_BONUS','VALID','2022-07-19 19:09:24',NULL,'2022-07-18 19:09:24','2022-07-18 16:09:24'),(12,132,30.000,'KARIBU_BONUS','VALID','2022-07-19 19:17:25',NULL,'2022-07-18 19:17:25','2022-07-18 16:17:25'),(13,133,30.000,'KARIBU_BONUS','USED','2022-07-20 14:34:49',NULL,'2022-07-19 14:34:49','2022-07-19 11:34:49'),(14,134,30.000,'KARIBU_BONUS','USED','2022-07-20 17:06:22',NULL,'2022-07-19 17:06:22','2022-07-19 14:06:22'),(15,135,30.000,'KARIBU_BONUS','USED','2022-07-20 17:13:11',NULL,'2022-07-19 17:13:11','2022-07-19 14:13:11'),(16,136,30.000,'KARIBU_BONUS','USED','2022-07-20 17:14:48',NULL,'2022-07-19 17:14:48','2022-07-19 14:14:48'),(17,137,30.000,'KARIBU_BONUS','USED','2022-07-20 17:27:49',NULL,'2022-07-19 17:27:49','2022-07-19 14:27:49'),(18,122,30.000,'KARIBU_BONUS','USED','2022-07-21 16:12:03',NULL,'2022-07-20 16:12:03','2022-07-20 13:12:03'),(19,125,30.000,'KIRON_FREEBET','REDEEMED','2022-12-09 13:58:36','2022-12-09 13:58:36','2022-12-09 13:58:36','2022-12-09 10:58:36'),(20,134,30.000,'KIRON_FREEBET','REDEEMED','2022-12-12 15:34:03','2022-12-12 15:34:03','2022-12-12 15:34:03','2022-12-12 12:34:03'),(21,115,30.000,'KIRON_FREEBET','REDEEMED','2022-12-14 18:15:10','2022-12-14 18:15:10','2022-12-14 18:15:10','2022-12-14 15:15:10'),(22,120,30.000,'KIRON_FREEBET','REDEEMED','2023-01-11 13:17:11','2023-01-11 13:17:11','2023-01-11 13:17:11','2023-01-11 10:17:11'),(23,123,30.000,'KIRON_FREEBET','REDEEMED','2023-01-13 14:48:26','2023-01-13 14:48:26','2023-01-13 14:48:26','2023-01-13 11:48:26');
/*!40000 ALTER TABLE `profile_bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_promo_balance`
--

DROP TABLE IF EXISTS `profile_promo_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_promo_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `currency` enum('KES','UGX','TSH','EUR','USD','ZAR') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'KES',
  `bonus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `expiry_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_promo_balance`
--

LOCK TABLES `profile_promo_balance` WRITE;
/*!40000 ALTER TABLE `profile_promo_balance` DISABLE KEYS */;
INSERT INTO `profile_promo_balance` VALUES (1,115,'KES',0.00,NULL,'2023-02-28 15:01:27','2023-02-28 13:03:59');
/*!40000 ALTER TABLE `profile_promo_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_referal_link`
--

DROP TABLE IF EXISTS `profile_referal_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_referal_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `referal_code` varchar(25) NOT NULL,
  `is_affiliate` int(11) NOT NULL DEFAULT '1',
  `status` int(3) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`,`referal_code`),
  KEY `updated` (`updated`),
  KEY `status` (`status`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_referal_link`
--

LOCK TABLES `profile_referal_link` WRITE;
/*!40000 ALTER TABLE `profile_referal_link` DISABLE KEYS */;
INSERT INTO `profile_referal_link` VALUES (1,125,'AAA005',1,1,'2022-07-20 13:09:36','2022-07-20 10:09:36'),(2,136,'AAA006',1,1,'2022-07-20 14:02:02','2022-07-20 11:02:02'),(3,122,'AAA007',1,1,'2022-07-20 16:13:04','2022-07-20 13:13:04'),(4,138,'AAA008',1,1,'2022-07-26 15:02:47','2022-07-26 12:02:47'),(5,134,'AAA009',1,1,'2022-09-26 12:08:52','2022-09-26 09:08:52'),(6,123,'AAA010',1,1,'2022-09-26 16:49:45','2022-09-26 13:49:45'),(7,167,'AAA011',1,1,'2022-10-25 11:27:43','2022-10-25 08:27:43'),(8,115,'AAA012',1,1,'2022-10-31 17:20:18','2022-10-31 14:20:18'),(9,183,'AAA183',1,1,'2022-11-08 16:11:12','2022-11-08 13:11:12'),(10,180,'AAA180',1,1,'2022-11-15 15:31:03','2022-11-15 12:31:03'),(11,186,'AAA186',1,1,'2022-11-16 14:24:50','2022-11-16 11:24:50'),(12,118,'AAA118',1,1,'2022-11-21 16:21:42','2022-11-21 13:21:42'),(13,166,'AAA166',1,1,'2022-12-12 14:14:36','2022-12-12 11:14:36'),(14,196,'DC6V1A',1,1,'2023-01-06 17:50:42','2023-01-06 14:50:42'),(15,120,'BOEHC1',1,1,'2023-01-11 06:31:46','2023-01-11 03:31:46');
/*!40000 ALTER TABLE `profile_referal_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_referral`
--

DROP TABLE IF EXISTS `profile_referral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_referral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `referred_msisdn` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `amount_paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `source` varchar(65) NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `referred_mobile` (`referred_msisdn`),
  KEY `status` (`status`,`created_at`,`completed_at`,`profile_id`),
  KEY `source` (`source`),
  KEY `amount_paid` (`amount_paid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_referral`
--

LOCK TABLES `profile_referral` WRITE;
/*!40000 ALTER TABLE `profile_referral` DISABLE KEYS */;
INSERT INTO `profile_referral` VALUES (1,115,254723750233,2,0.00,'STAGING_APP',NULL,'2022-11-03 19:05:04','2022-11-03 16:05:04');
/*!40000 ALTER TABLE `profile_referral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms`
--

DROP TABLE IF EXISTS `sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` longtext,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms`
--

LOCK TABLES `sms` WRITE;
/*!40000 ALTER TABLE `sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_history`
--

DROP TABLE IF EXISTS `sms_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext,
  `contacts` int(11) NOT NULL DEFAULT '0',
  `type` varchar(150) NOT NULL DEFAULT 'USERS',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_history`
--

LOCK TABLES `sms_history` WRITE;
/*!40000 ALTER TABLE `sms_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_content`
--

DROP TABLE IF EXISTS `static_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `content` longtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_content`
--

LOCK TABLES `static_content` WRITE;
/*!40000 ALTER TABLE `static_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_code`
--

DROP TABLE IF EXISTS `status_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_code`
--

LOCK TABLES `status_code` WRITE;
/*!40000 ALTER TABLE `status_code` DISABLE KEYS */;
INSERT INTO `status_code` VALUES (2,'BLACKLISTED',3);
/*!40000 ALTER TABLE `status_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_bonus`
--

DROP TABLE IF EXISTS `system_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_bonus`
--

LOCK TABLES `system_bonus` WRITE;
/*!40000 ALTER TABLE `system_bonus` DISABLE KEYS */;
INSERT INTO `system_bonus` VALUES (1,'KARIBU_BONUS',30.00,1,'2022-07-06 00:29:59','2022-07-18 11:00:53'),(2,'FIRST_TIME_PLAYER_DEPOSIT_BONUS',0.50,1,'2022-10-31 12:56:33','2022-11-03 15:05:41'),(3,'KARIBU_FREEBET',30.00,1,'2022-11-10 15:19:11','2022-11-10 12:19:11');
/*!40000 ALTER TABLE `system_bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_configuration`
--

DROP TABLE IF EXISTS `system_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(65) NOT NULL,
  `type_desc` varchar(85) DEFAULT NULL,
  `value` varchar(100) NOT NULL,
  `extra_data` varchar(250) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`),
  KEY `value` (`value`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_configuration`
--

LOCK TABLES `system_configuration` WRITE;
/*!40000 ALTER TABLE `system_configuration` DISABLE KEYS */;
INSERT INTO `system_configuration` VALUES (1,'WITHDRAWAL_LIMIT_WITH_APPROVAL','Mpesa withdrawals that require approvals','1000',NULL,1,'2021-12-07 12:33:12','2022-03-21 15:23:05'),(2,'MAX_WITHDRAWAL_LIMIT_PER_DAY','Mpesa withdrawals limits per day','70000.000',NULL,1,'2021-12-07 12:33:12','2022-03-21 15:27:59'),(3,'MAX_MPESA_DEPOSIT','Maximum M-Pesa Deposit Limits','150000.000',NULL,1,'2021-12-07 12:33:12','2021-12-07 09:34:31'),(4,'MIN_MPESA_WITHDRAWAL','Minimum M-Pesa withdrawal limit','50',NULL,1,'2021-12-07 12:33:12','2022-03-22 17:25:51'),(5,'DEFAULT_TRANSACTIONAL_SENDER_ID','Transactional senderId','PLAY2WIN',NULL,1,'2021-12-07 12:33:12','2022-03-21 15:29:50'),(6,'DEFAULT_SMS_SHORTCODE','Service Shortcode','23311',NULL,1,'2021-12-07 12:33:12','2022-03-21 15:29:50'),(7,'DEFAULT_PROMOTIONAL_SENDER_ID','Promotional SenderId','PLAY2WIN',NULL,1,'2021-12-07 12:33:12','2022-03-21 15:29:50'),(8,'TRANSACTION_SMS_API_URL','Transactional SMS API URL','https://app.apiproxy.co/',NULL,1,'2021-12-07 12:33:12','2022-03-21 15:37:56'),(9,'MPESA_CHECKOUT_URL','Mpesa Express checkout URL','https://app.apiproxy.co/',NULL,1,'2021-12-07 12:33:12','2022-03-21 15:37:56'),(10,'LIDEN_GATEWAY_PWD','LIDEN Gateway','Keny@1-Nb1',NULL,1,'2021-12-07 12:33:12','2022-03-21 15:37:56'),(11,'MPESA_B2C_RESOURCE_ID','Mpesa Payout resource Id','20000','{\"initiator\":\"\",\"initiatorPwd\":\"\"}',1,'2021-12-07 12:33:12','2022-10-31 12:54:07');
/*!40000 ALTER TABLE `system_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_keys`
--

DROP TABLE IF EXISTS `system_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_key` varchar(100) NOT NULL,
  `secret_key` varchar(150) NOT NULL,
  `secret_iv` varchar(75) NOT NULL,
  `encryption_algo` varchar(25) NOT NULL DEFAULT 'AES-256-CBC',
  `allowed_ips` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_key` (`service_key`),
  KEY `secret_key` (`secret_key`,`secret_iv`),
  KEY `encryption_algo` (`encryption_algo`),
  KEY `allowed_ips` (`allowed_ips`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_keys`
--

LOCK TABLES `system_keys` WRITE;
/*!40000 ALTER TABLE `system_keys` DISABLE KEYS */;
INSERT INTO `system_keys` VALUES (1,'315A47CF2CC38166AE56EFFF2D5EF','^UjV1vs^G8{;hcTPN/&/w#S^][wo0OAWUe^d4Kdryc@fQO)TQP2t\')s},%eSpaf','ui5QfDnIJ0','AES-256-CBC','127.0.0.1'),(2,'2AA3A6C551649EE1D1934F3CAB8EE','Q24v*_QcWI[8#>AwLXb\'}tnpoW![g&.fX6:l6(Q\"oVFmuiXg8L/Pzi0R=^@F!(/','RF8scdYkb6','AES-256-CBC','127.0.0.1');
/*!40000 ALTER TABLE `system_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_message`
--

DROP TABLE IF EXISTS `system_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `value` varchar(1000) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_message`
--

LOCK TABLES `system_message` WRITE;
/*!40000 ALTER TABLE `system_message` DISABLE KEYS */;
INSERT INTO `system_message` VALUES (1,'ResetPassword','Reset OTP {vericode}{line}{line}Web link: {link}{line}Help {helpline}',1);
/*!40000 ALTER TABLE `system_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `alias_name` varchar(150) DEFAULT NULL,
  `password` varchar(300) NOT NULL,
  `verification_code` varchar(250) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `status` int(3) NOT NULL DEFAULT '2',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `permissions` varchar(250) DEFAULT NULL,
  `active_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`),
  KEY `updated_at` (`updated_at`),
  KEY `password` (`password`),
  KEY `role_id` (`role_id`),
  KEY `alias_name` (`alias_name`),
  KEY `status` (`status`),
  KEY `verification_code` (`verification_code`),
  KEY `permissions` (`permissions`),
  KEY `active_time` (`active_time`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,115,'Josephat_Mukuha','$2y$08$TmJqQnQ2THVIZm42RmV3Nu1sP/ZUpzwh3Ys.uOw9pXj2xZ0726au6','',1,1,'2022-03-27 13:56:04','2022-03-27 10:56:04','[38,40,41,42]',NULL),(2,117,'DiegoCosta','$2y$08$OUd6cklvM0t1bnNoRWhhM.8sjF6qkOk8SGZI2tvNH9.lyIcDuXoDC','',2,1,'2022-03-27 16:10:10','2022-03-27 13:10:10','[16,15,17,18,19,20,37]',NULL),(3,118,'JohnKhisa','$2y$08$aDNibEhiclN0b0k0WkpPM.vEcD6DOuUOreDwukjkKbB7FR1SG1zIO','',2,1,'2022-03-28 18:11:17','2022-03-28 15:11:17','[18,25,42,41,40,38]',NULL),(4,119,'KaiHavertz','$2y$08$cGQ3MUlJMDNCT2F6RmRyceeO5UM5ziomPAC7O1tiRWcG4KpFTQbQy','$2y$08$VTFsMmhMdUFaRFRJVWNFVe7ThoiSSXwWmZ8UIvFBf.W.Xgbw7xxt2',3,2,'2022-04-06 13:50:34','2022-04-06 10:50:34','null','2022-04-06 16:09:00 TO 2022-04-06 16:12:00'),(5,122,'DanielKaranja','$2y$08$cVhWblF1YUgxTnU3ZVM5UeCusw5fznxzD/166uAhRv0yvG0.wyw/e','',6,1,'2022-11-22 18:29:12','2022-11-22 15:29:12','[15,16,17,18,20,19,21,22,23,24,25,26,27,29,28,30,31,32,33,34,35]',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_audit_log`
--

DROP TABLE IF EXISTS `user_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_audit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_audit_log`
--

LOCK TABLES `user_audit_log` WRITE;
/*!40000 ALTER TABLE `user_audit_log` DISABLE KEYS */;
INSERT INTO `user_audit_log` VALUES (1,1,'VerifyUser&AdminController','Verified account successfully with Verification code:CLO673','2022-03-27 14:41:38','2022-03-27 11:41:38'),(2,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-27 14:55:15','2022-03-27 11:55:15'),(3,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-27 14:59:07','2022-03-27 11:59:07'),(4,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-27 15:27:51','2022-03-27 12:27:51'),(5,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-27 15:36:35','2022-03-27 12:36:35'),(6,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-27 15:49:05','2022-03-27 12:49:05'),(7,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-27 16:03:59','2022-03-27 13:03:59'),(8,2,'VerifyUser&AdminController','Verified account successfully with Verification code:GIT521','2022-03-27 17:04:30','2022-03-27 14:04:30'),(9,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-27 17:06:51','2022-03-27 14:06:51'),(10,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-28 11:52:36','2022-03-28 08:52:36'),(11,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-28 12:08:57','2022-03-28 09:08:57'),(12,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-28 16:26:31','2022-03-28 13:26:31'),(13,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-28 16:41:48','2022-03-28 13:41:48'),(14,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-28 16:42:51','2022-03-28 13:42:51'),(15,2,'VerifyUser&AdminController','Verified account successfully with Verification code:GDT565','2022-03-30 09:32:45','2022-03-30 06:32:45'),(16,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-30 09:33:28','2022-03-30 06:33:28'),(17,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-31 13:28:32','2022-03-31 10:28:32'),(18,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-31 14:06:42','2022-03-31 11:06:42'),(19,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-31 15:11:41','2022-03-31 12:11:41'),(20,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-31 15:12:10','2022-03-31 12:12:10'),(21,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-31 15:17:20','2022-03-31 12:17:20'),(22,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-31 15:29:42','2022-03-31 12:29:42'),(23,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-31 15:40:51','2022-03-31 12:40:51'),(24,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-31 15:42:02','2022-03-31 12:42:02'),(25,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-31 16:18:29','2022-03-31 13:18:29'),(26,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-31 16:39:41','2022-03-31 13:39:41'),(27,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-03-31 16:43:21','2022-03-31 13:43:21'),(28,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-01 09:12:19','2022-04-01 06:12:19'),(29,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-01 09:47:58','2022-04-01 06:47:58'),(30,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-01 10:56:07','2022-04-01 07:56:07'),(31,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-01 10:58:01','2022-04-01 07:58:01'),(32,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-01 13:51:34','2022-04-01 10:51:34'),(33,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-01 13:57:32','2022-04-01 10:57:32'),(34,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-01 18:28:27','2022-04-01 15:28:27'),(35,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-01 19:03:44','2022-04-01 16:03:44'),(36,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-01 19:03:58','2022-04-01 16:03:58'),(37,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-04 13:38:36','2022-04-04 10:38:36'),(38,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-04 14:03:29','2022-04-04 11:03:29'),(39,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-04 14:03:58','2022-04-04 11:03:58'),(40,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-04 14:04:12','2022-04-04 11:04:12'),(41,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-04 14:22:39','2022-04-04 11:22:39'),(42,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 10:26:31','2022-04-06 07:26:31'),(43,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 10:28:37','2022-04-06 07:28:37'),(44,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 10:35:18','2022-04-06 07:35:18'),(45,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 10:38:36','2022-04-06 07:38:36'),(46,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 13:23:42','2022-04-06 10:23:42'),(47,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 13:48:25','2022-04-06 10:48:25'),(48,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 13:49:58','2022-04-06 10:49:58'),(49,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 13:57:24','2022-04-06 10:57:24'),(50,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 14:06:15','2022-04-06 11:06:15'),(51,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 14:06:33','2022-04-06 11:06:33'),(52,4,'VerifyUser&AdminController','Verified account successfully with Verification code:1234','2022-04-06 15:47:29','2022-04-06 12:47:29'),(53,4,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 15:57:07','2022-04-06 12:57:07'),(54,4,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 15:59:04','2022-04-06 12:59:04'),(55,4,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 16:10:26','2022-04-06 13:10:26'),(56,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 17:22:36','2022-04-06 14:22:36'),(57,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 17:26:01','2022-04-06 14:26:01'),(58,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 17:50:28','2022-04-06 14:50:28'),(59,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-06 18:01:54','2022-04-06 15:01:54'),(60,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-08 16:15:58','2022-04-08 13:15:58'),(61,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-08 16:39:28','2022-04-08 13:39:28'),(62,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-11 14:05:57','2022-04-11 11:05:57'),(63,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-11 14:07:00','2022-04-11 11:07:00'),(64,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-11 14:11:28','2022-04-11 11:11:28'),(65,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-11 14:20:36','2022-04-11 11:20:36'),(66,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-11 14:26:39','2022-04-11 11:26:39'),(67,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-11 14:29:06','2022-04-11 11:29:06'),(68,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-11 14:38:14','2022-04-11 11:38:14'),(69,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-11 14:45:31','2022-04-11 11:45:31'),(70,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-11 14:51:26','2022-04-11 11:51:26'),(71,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-11 17:16:14','2022-04-11 14:16:14'),(72,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-14 13:24:24','2022-04-14 10:24:24'),(73,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-19 12:51:29','2022-04-19 09:51:29'),(74,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-19 13:26:22','2022-04-19 10:26:22'),(75,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-19 15:08:56','2022-04-19 12:08:56'),(76,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-19 18:17:36','2022-04-19 15:17:36'),(77,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-26 06:57:55','2022-04-26 03:57:55'),(78,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-26 10:52:20','2022-04-26 07:52:20'),(79,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-26 15:19:46','2022-04-26 12:19:46'),(80,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-27 04:28:41','2022-04-27 01:28:41'),(81,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-27 09:17:46','2022-04-27 06:17:46'),(82,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-27 14:35:20','2022-04-27 11:35:20'),(83,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-27 14:36:36','2022-04-27 11:36:36'),(84,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-27 14:39:33','2022-04-27 11:39:33'),(85,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-04-28 01:37:54','2022-04-27 22:37:54'),(86,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-11-21 12:10:51','2022-11-21 09:10:51'),(87,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-11-22 17:25:55','2022-11-22 14:25:55'),(88,3,'VerifyUser&AdminController','Verified account successfully with Verification code:1234','2022-11-22 17:36:42','2022-11-22 14:36:42'),(89,3,'LoginAdminUser&AdminController','Access to admin account granted!','2022-11-22 17:37:14','2022-11-22 14:37:14'),(90,3,'LoginAdminUser&AdminController','Access to admin account granted!','2022-11-22 17:38:14','2022-11-22 14:38:14'),(91,3,'LoginAdminUser&AdminController','Access to admin account granted!','2022-11-22 17:40:19','2022-11-22 14:40:19'),(92,5,'VerifyUser&AdminController','Verified account successfully with Verification code:1234','2022-11-22 18:38:51','2022-11-22 15:38:51'),(93,5,'VerifyUser&AdminController','Verified account successfully with Verification code:1234','2022-11-22 18:39:23','2022-11-22 15:39:23'),(94,5,'LoginAdminUser&AdminController','Access to admin account granted!','2022-11-22 18:39:34','2022-11-22 15:39:34'),(95,5,'LoginAdminUser&AdminController','Access to admin account granted!','2022-11-23 13:22:20','2022-11-23 10:22:20'),(96,5,'LoginAdminUser&AdminController','Access to admin account granted!','2022-11-29 13:44:48','2022-11-29 10:44:48'),(97,2,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-03 17:26:14','2022-12-03 14:26:14'),(98,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-03 17:26:35','2022-12-03 14:26:35'),(99,5,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-05 14:33:06','2022-12-05 11:33:06'),(100,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-06 10:27:04','2022-12-06 07:27:04'),(101,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-06 10:53:29','2022-12-06 07:53:29'),(102,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-06 14:26:07','2022-12-06 11:26:07'),(103,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-06 14:29:22','2022-12-06 11:29:22'),(104,3,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-06 14:36:40','2022-12-06 11:36:40'),(105,3,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-06 14:41:11','2022-12-06 11:41:11'),(106,3,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-06 15:13:32','2022-12-06 12:13:32'),(107,3,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-07 10:25:58','2022-12-07 07:25:58'),(108,5,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-07 12:40:22','2022-12-07 09:40:22'),(109,5,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-07 19:28:46','2022-12-07 16:28:46'),(110,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-08 04:28:58','2022-12-08 01:28:58'),(111,1,'LoginAdminUser&AdminController','Access to admin account granted!','2022-12-13 18:49:21','2022-12-13 15:49:21'),(112,1,'LoginAdminUser&AdminController','Access to admin account granted!','2023-01-13 14:46:36','2023-01-13 11:46:36');
/*!40000 ALTER TABLE `user_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `success_attempts` int(11) NOT NULL DEFAULT '0',
  `failed_attempts` int(11) NOT NULL DEFAULT '0',
  `cumulative_failed_attempts` int(11) NOT NULL DEFAULT '0',
  `last_successful_login_date` datetime DEFAULT NULL,
  `last_failed_login_date` datetime DEFAULT NULL,
  `activation_date` datetime DEFAULT NULL,
  `blocked_timeline` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `success_attempts` (`success_attempts`,`failed_attempts`,`cumulative_failed_attempts`),
  KEY `activation_date` (`activation_date`,`last_successful_login_date`,`last_failed_login_date`),
  KEY `created_at` (`created_at`),
  KEY `blocked_timeline` (`blocked_timeline`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` VALUES (1,1,45,0,15,'2023-01-13 14:46:36','2023-01-13 14:40:47','2022-03-27 14:41:38','2023-01-13 14:46:36','2022-03-27 13:56:04','2023-01-13 11:46:36'),(2,2,47,0,11,'2022-12-03 17:26:14','2022-04-27 20:47:47','2022-03-30 09:32:45','2022-12-03 17:26:14','2022-03-27 16:10:10','2022-12-03 14:26:14'),(3,3,8,0,1,'2022-12-07 10:25:58','2022-11-22 17:36:08','2022-11-22 17:36:42','2022-12-07 10:25:58','2022-03-28 18:11:17','2022-12-07 07:25:58'),(4,4,4,0,1,'2022-04-06 16:10:26','2022-04-06 15:58:55','2022-04-06 15:47:29','2022-04-06 16:10:26','2022-04-06 13:50:34','2022-04-06 13:10:26'),(5,5,8,0,5,'2022-12-07 19:28:46','2022-12-07 12:40:07','2022-11-22 18:39:23','2022-12-07 19:28:46','2022-11-22 18:29:12','2022-12-07 16:28:46');
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(65) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
INSERT INTO `user_permissions` VALUES (15,'Read System Configurations','Read System Configurations',1,'2022-03-31 15:40:54','2022-03-31 12:40:54',NULL),(16,'Read System Roles','Read System Roles',1,'2022-03-31 15:41:06','2022-03-31 12:41:06',NULL),(17,'Read Admin Users','Read Admin Users',1,'2022-03-31 15:41:14','2022-03-31 12:41:14',NULL),(18,'Search Customer Profile','Search Customer Profile',1,'2022-04-01 13:56:44','2022-04-01 10:56:44',NULL),(19,'Read System Permissions','Read System Permissions',1,'2022-04-04 13:39:15','2022-04-04 10:39:15',NULL),(20,'Create System Role','Create System Role',1,'2022-04-04 14:19:07','2022-04-04 11:19:07',NULL),(21,'Update System Configurations','Update System Configurations',1,'2022-04-04 14:48:15','2022-04-04 11:48:15',NULL),(22,'Update System Role','Update System Role',1,'2022-04-04 14:53:56','2022-04-04 11:53:56',NULL),(23,'Create Affiliate Marketer','Create Affiliate Marketer',1,'2022-04-04 14:57:04','2022-04-04 11:57:04',NULL),(24,'Read Mpesa Deposits','Read Mpesa Deposits',1,'2022-04-04 15:05:17','2022-04-04 12:05:17',NULL),(25,'Set Customer Care Work Schedule','Set Customer Care Work Schedule',1,'2022-04-06 13:24:00','2022-04-06 10:24:00',NULL),(26,'Create Customer Support','Create Customer Support',1,'2022-04-06 13:49:26','2022-04-06 10:49:26',NULL),(27,'Read System Transactions','Read System Transactions',1,'2022-04-08 18:39:01','2022-04-08 15:39:01',NULL),(28,'Read Providers','Read Providers',1,'2022-04-14 14:17:46','2022-04-14 11:17:46',NULL),(29,'Update Provider','Update Provider',1,'2022-04-14 16:05:57','2022-04-14 13:05:57',NULL),(30,'Read Casino Game','Read Casino Game',1,'2022-04-19 19:14:44','2022-04-19 16:14:44',NULL),(31,'Read Game Types','Read Game Types',1,'2022-04-20 11:22:27','2022-04-20 08:22:27',NULL),(32,'Create Casino Game','Create Casino Game',1,'2022-04-20 11:46:46','2022-04-20 08:46:46',NULL),(33,'Update Casino Game','Update Casino Game',1,'2022-04-20 13:36:35','2022-04-20 10:36:35',NULL),(34,'Update CS Administrator','Update CS Administrator',1,'2022-11-22 17:39:46','2022-11-22 14:39:46',NULL),(35,'Create System Admin','Create System Admin',1,'2022-11-22 18:29:12','2022-11-22 15:29:12',NULL),(36,'Update System Admin','Update System Admin',1,'2022-11-23 11:38:47','2022-11-23 08:38:47',NULL),(37,'Approve Suspense Balance','Approve Suspense Balance',1,'2022-12-03 17:26:21','2022-12-03 14:26:21',NULL),(38,'Read Kiron Team Names','Read Kiron Team Names',1,'2022-12-06 10:52:31','2022-12-06 07:52:31',NULL),(39,'Update Super Admin','Update Super Admin',1,'2022-12-06 10:53:14','2022-12-06 07:53:14',NULL),(40,'Update Kiron Team Names','Update Kiron Team Names',1,'2022-12-06 11:30:12','2022-12-06 08:30:12',NULL),(41,'Read Kiron Game Markets','Read Kiron Game Markets',1,'2022-12-06 11:36:52','2022-12-06 08:36:52',NULL),(42,'Update Kiron Game Markets','Update Kiron Game Markets',1,'2022-12-06 13:43:13','2022-12-06 10:43:13',NULL),(43,'Read Mossbet Promotions','Read Mossbet Promotions',1,'2022-12-08 04:50:37','2022-12-08 01:50:37',NULL),(44,'Read Mossbet Banners','Read Mossbet Banners',1,'2022-12-08 04:50:46','2022-12-08 01:50:46',NULL),(45,'Update Mossbet Banners','Update Mossbet Banners',1,'2022-12-08 05:12:31','2022-12-08 02:12:31',NULL),(46,'Read Suspense Balances','Read Suspense Balances',1,'2022-12-08 19:14:38','2022-12-08 16:14:38',NULL),(47,'Read System Stats','Read System Stats',1,'2023-01-13 14:46:39','2023-01-13 11:46:39',NULL);
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(65) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `acl_list` varchar(350) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `status` (`status`),
  KEY `acl_list` (`acl_list`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'Super Admin','System Administrator',NULL,1,'2022-03-28 17:03:57','2022-03-28 15:10:32',NULL),(2,'CS Administrator','Customer Support Administrator',NULL,1,'2022-03-28 17:03:57','2022-03-28 14:03:57',NULL),(3,'Customer Support','Customer Support',NULL,1,'2022-03-28 17:03:57','2022-03-28 14:03:57',NULL),(4,'Affiliate Marketer','Affiliate Marketer',NULL,1,'2022-03-28 17:03:57','2022-03-28 14:03:57',NULL),(5,'Affiliate Support','Affiliate Support',NULL,1,'2022-03-28 17:03:57','2022-03-28 14:03:57',NULL),(6,'System Admin','System Administrator','[15,16,17]',1,'2022-03-28 17:03:57','2022-03-28 14:03:57',NULL),(7,'System User','System User','[4,7]',1,'2022-03-28 17:03:57','2022-03-28 14:03:57',NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-17 17:22:44
