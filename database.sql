# ************************************************************
# Sequel Ace SQL dump
# Version 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.1.0)
# Database: 1_kozari_david
# Generation Time: 2023-12-02 14:24:54 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ingredients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ingredients`;

CREATE TABLE `ingredients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pastry_id` bigint unsigned NOT NULL,
  `free_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ingredients_pastry_id_foreign` (`pastry_id`),
  CONSTRAINT `ingredients_pastry_id_foreign` FOREIGN KEY (`pastry_id`) REFERENCES `pastries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;

INSERT INTO `ingredients` (`id`, `pastry_id`, `free_from`, `created_at`, `updated_at`)
VALUES
	(1,26,'G\r',NULL,NULL),
	(2,37,'L\r',NULL,NULL),
	(3,83,'HC\r',NULL,NULL),
	(4,91,'G\r',NULL,NULL),
	(5,137,'G\r',NULL,NULL),
	(6,60,'Te\r',NULL,NULL),
	(7,129,'HC\r',NULL,NULL),
	(8,122,'To\r',NULL,NULL),
	(9,90,'G\r',NULL,NULL),
	(10,26,'To\r',NULL,NULL),
	(11,94,'L\r',NULL,NULL),
	(12,46,'É\r',NULL,NULL),
	(13,72,'HC\r',NULL,NULL),
	(14,114,'Te\r',NULL,NULL),
	(15,63,'To\r',NULL,NULL),
	(16,12,'Te\r',NULL,NULL),
	(17,128,'É\r',NULL,NULL),
	(18,51,'É\r',NULL,NULL),
	(19,109,'To\r',NULL,NULL),
	(20,109,'G\r',NULL,NULL),
	(21,97,'G\r',NULL,NULL),
	(22,97,'To\r',NULL,NULL),
	(23,24,'L\r',NULL,NULL),
	(24,91,'To\r',NULL,NULL),
	(25,137,'L\r',NULL,NULL),
	(26,84,'G\r',NULL,NULL),
	(27,30,'HC\r',NULL,NULL),
	(28,108,'Te\r',NULL,NULL),
	(29,84,'To\r',NULL,NULL),
	(30,6,'L\r',NULL,NULL),
	(31,108,'L\r',NULL,NULL),
	(32,12,'L\r',NULL,NULL),
	(33,79,'É\r',NULL,NULL),
	(34,72,'G\r',NULL,NULL),
	(35,118,'L\r',NULL,NULL),
	(36,60,'L\r',NULL,NULL),
	(37,52,'É\r',NULL,NULL),
	(38,137,'HC\r',NULL,NULL),
	(39,114,'L\r',NULL,NULL),
	(40,90,'To\r',NULL,NULL),
	(41,20,'HC\r',NULL,NULL),
	(42,63,'G\r',NULL,NULL),
	(43,129,'G\r',NULL,NULL),
	(44,129,'L\r',NULL,NULL),
	(45,15,'É\r',NULL,NULL);

/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table.php',1),
	(2,'2014_10_12_100000_create_password_reset_tokens_table.php',1),
	(3,'2019_08_19_000000_create_failed_jobs_table.php',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table.php',1),
	(5,'2023_11_30_112911_create_navigation_items_table.php',2),
	(6,'2023_11_30_114941_add_role_to_users_table.php',3),
	(7,'2023_11_30_165208_create_pastry_table.php',4),
	(8,'2023_11_30_165426_create_prices_table.php',5),
	(9,'2023_11_30_165655_create_ingredients_table.php',6);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table navigation_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `navigation_items`;

CREATE TABLE `navigation_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `navigation_items` WRITE;
/*!40000 ALTER TABLE `navigation_items` DISABLE KEYS */;

INSERT INTO `navigation_items` (`id`, `title`, `link`, `created_at`, `updated_at`)
VALUES
	(1,'Hero','#hero',NULL,NULL),
	(2,'Intro','#intro',NULL,NULL),
	(3,'About us','#about-us',NULL,NULL);

/*!40000 ALTER TABLE `navigation_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_reset_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table pastries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pastries`;

CREATE TABLE `pastries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `award_winning` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pastries` WRITE;
/*!40000 ALTER TABLE `pastries` DISABLE KEYS */;

INSERT INTO `pastries` (`id`, `name`, `type`, `award_winning`, `created_at`, `updated_at`)
VALUES
	(1,'Süni','vegyes',0,NULL,NULL),
	(2,'Gesztenyealagút','vegyes',0,NULL,NULL),
	(3,'Sajtos pogácsa','sós teasütemény',0,NULL,NULL),
	(4,'Diós-mákos','bejgli',0,NULL,NULL),
	(5,'Sajttorta (málnás)','torta',0,NULL,NULL),
	(6,'Citrom','torta',0,NULL,NULL),
	(7,'Eszterházy','tortaszelet',0,NULL,NULL),
	(8,'Rákóczi-túrós','pite',0,NULL,NULL),
	(9,'Meggyes kocka','tejszínes sütemény',0,NULL,NULL),
	(10,'Legényfogó','torta',1,NULL,NULL),
	(11,'Alpesi karamell','tortaszelet',0,NULL,NULL),
	(12,'Kókuszcsók','édes teasütemény',0,NULL,NULL),
	(13,'Habos mákos','pite',0,NULL,NULL),
	(14,'Szilvás','pite',0,NULL,NULL),
	(15,'Juhtúrós párna','sós teasütemény',0,NULL,NULL),
	(16,'Mákos guba','tortaszelet',0,NULL,NULL),
	(17,'Néró','édes teasütemény',0,NULL,NULL),
	(18,'Sacher','tortaszelet',0,NULL,NULL),
	(19,'Citrom','tortaszelet',0,NULL,NULL),
	(20,'Ribizlihabos-almás réteges','különleges torta',1,NULL,NULL),
	(21,'Három kívánság','torta',1,NULL,NULL),
	(22,'Dobos','torta',0,NULL,NULL),
	(23,'Epres mascarpone','tortaszelet',0,NULL,NULL),
	(24,'Csokoládémousse','torta',0,NULL,NULL),
	(25,'Oroszkrém','torta',0,NULL,NULL),
	(26,'Medvetalp','vegyes',0,NULL,NULL),
	(27,'Trüffel','torta',0,NULL,NULL),
	(28,'Tejszínes gyümölcsös (meggy)','torta',0,NULL,NULL),
	(29,'Mákos-szilvalekváros','bejgli',0,NULL,NULL),
	(30,'Ribizlihabos-﻿almá﻿s réteges tortaszelet','tortaszelet',0,NULL,NULL),
	(31,'Marcipános vágott','édes teasütemény',0,NULL,NULL),
	(32,'Indiáner','vegyes',0,NULL,NULL),
	(33,'Meggyes','pite',0,NULL,NULL),
	(34,'Mákos','bejgli',0,NULL,NULL),
	(35,'Sós karamella','torta',0,NULL,NULL),
	(36,'Legényfogó','tortaszelet',0,NULL,NULL),
	(37,'Rigó Jancsi','torta',0,NULL,NULL),
	(38,'Tejszínes gyümölcsös (erdei gyümölcs)','torta',0,NULL,NULL),
	(39,'Ez+Az (csokoládé és gesztenye)','torta',0,NULL,NULL),
	(40,'Málnás mascarpone','torta',0,NULL,NULL),
	(41,'Dobos','tortaszelet',0,NULL,NULL),
	(42,'Ferrero','torta',0,NULL,NULL),
	(43,'Vegyes házi pite falatok','pite',0,NULL,NULL),
	(44,'Ökörszem','édes teasütemény',0,NULL,NULL),
	(45,'Danubius kocka','tejszínes sütemény',0,NULL,NULL),
	(46,'Sajtkrémmel töltött fánkocska','sós teasütemény',0,NULL,NULL),
	(47,'Túrókrém gyümölccsel díszítve','tortaszelet',0,NULL,NULL),
	(48,'Almás','pite',0,NULL,NULL),
	(49,'Mignon','vegyes',0,NULL,NULL),
	(50,'Csokoládémousse fényes csokoládéval','torta',0,NULL,NULL),
	(51,'Vágott sós (sós omlós)','sós teasütemény',0,NULL,NULL),
	(52,'Nagyi sós','sós teasütemény',0,NULL,NULL),
	(53,'Vegyes sós','sós teasütemény',0,NULL,NULL),
	(54,'Somlói','tortaszelet',0,NULL,NULL),
	(55,'Tiramisu','tortaszelet',0,NULL,NULL),
	(56,'Hegyvidék','tortaszelet',0,NULL,NULL),
	(57,'Szedres csokoládé','tortaszelet',0,NULL,NULL),
	(58,'Pogácsák vegyesen','sós teasütemény',0,NULL,NULL),
	(59,'Lúdláb','torta',0,NULL,NULL),
	(60,'Sacher','torta',0,NULL,NULL),
	(61,'Eszterházy','torta',0,NULL,NULL),
	(62,'Zalavári gesztenye','tortaszelet',0,NULL,NULL),
	(63,'Gesztenyegolyó','vegyes',0,NULL,NULL),
	(64,'Pisztáciás-málnás mascarpone','tortaszelet',0,NULL,NULL),
	(65,'Habos mákos','vegyes',0,NULL,NULL),
	(66,'Franciakrémes','krémes',0,NULL,NULL),
	(67,'Gesztenye kocka','tejszínes sütemény',0,NULL,NULL),
	(68,'Pisztáciás-málnás mascarpone','torta',0,NULL,NULL),
	(69,'Málnás kocka','tejszínes sütemény',0,NULL,NULL),
	(70,'Sajttorta (málnás)','tortaszelet',0,NULL,NULL),
	(71,'Túrókrém gyümölccsel','torta',0,NULL,NULL),
	(72,'Csokis kaland','különleges torta',1,NULL,NULL),
	(73,'Somlói','torta',0,NULL,NULL),
	(74,'Palermo','torta',0,NULL,NULL),
	(75,'Szilvalekváros','bejgli',0,NULL,NULL),
	(76,'Ünnepi diótorta grillázzsal','torta',0,NULL,NULL),
	(77,'Oroszkrém','tortaszelet',0,NULL,NULL),
	(78,'Mini zserbó','édes teasütemény',0,NULL,NULL),
	(79,'Sajtos masni','sós teasütemény',0,NULL,NULL),
	(80,'Zserbó','pite',0,NULL,NULL),
	(81,'Tejszínes gyümölcsös (málna)','torta',0,NULL,NULL),
	(82,'Marcipános csokoládé','torta',0,NULL,NULL),
	(83,'Csokis kaland','tortaszelet',0,NULL,NULL),
	(84,'Marcipán tekercs','édes teasütemény',0,NULL,NULL),
	(85,'Képviselőfánk','vegyes',0,NULL,NULL),
	(86,'Epres omlett','vegyes',0,NULL,NULL),
	(87,'Mini linzer','édes teasütemény',0,NULL,NULL),
	(88,'Linzerkarika','vegyes',0,NULL,NULL),
	(89,'Szedres csokoládé','torta',0,NULL,NULL),
	(90,'Narancsív','édes teasütemény',0,NULL,NULL),
	(91,'Gesztenyepüré','vegyes',0,NULL,NULL),
	(92,'Palermo','tejszínes sütemény',0,NULL,NULL),
	(93,'Csokis néró','édes teasütemény',0,NULL,NULL),
	(94,'Flódni','pite',0,NULL,NULL),
	(95,'Mézeskalács','torta',0,NULL,NULL),
	(96,'Olívás pogácsa','sós teasütemény',0,NULL,NULL),
	(97,'Florentin','édes teasütemény',0,NULL,NULL),
	(98,'Tiramisu','torta',0,NULL,NULL),
	(99,'Zoli kedvence (vágott édes tea)','édes teasütemény',0,NULL,NULL),
	(100,'Erdei gyümölcs kocka','tejszínes sütemény',0,NULL,NULL),
	(101,'Rákóczi-túrós','tortaszelet',0,NULL,NULL),
	(102,'Mézeskrémes','pite',0,NULL,NULL),
	(103,'Trüffel','tortaszelet',0,NULL,NULL),
	(104,'Szilvás papucs','édes teasütemény',0,NULL,NULL),
	(105,'Zalavári gesztenye','torta',1,NULL,NULL),
	(106,'Danubius','torta',0,NULL,NULL),
	(107,'Alpesi karamell','torta',0,NULL,NULL),
	(108,'Puncs','torta',0,NULL,NULL),
	(109,'Gesztenye szív','vegyes',0,NULL,NULL),
	(110,'Ez+Az (csokoládé és gesztenye)','tortaszelet',0,NULL,NULL),
	(111,'Tökmagos félhold','sós teasütemény',0,NULL,NULL),
	(112,'Burgonyás pogácsa','sós teasütemény',0,NULL,NULL),
	(113,'Somlói galuska','vegyes',0,NULL,NULL),
	(114,'Puncs','tortaszelet',0,NULL,NULL),
	(115,'Lekváros vágott','édes teasütemény',0,NULL,NULL),
	(116,'Oreo','torta',0,NULL,NULL),
	(117,'Vintage','torta',0,NULL,NULL),
	(118,'Rigó Jancsi','tejszínes sütemény',0,NULL,NULL),
	(119,'Feketeerdő','torta',0,NULL,NULL),
	(120,'Kókuszos vágott','édes teasütemény',0,NULL,NULL),
	(121,'Feketeerdő','tortaszelet',0,NULL,NULL),
	(122,'Moscauer','édes teasütemény',0,NULL,NULL),
	(123,'Diós','bejgli',0,NULL,NULL),
	(124,'Rákóczi-túrós','torta',0,NULL,NULL),
	(125,'Három kívánság','különleges torta',0,NULL,NULL),
	(126,'Gesztenyés-karamellás','bejgli',0,NULL,NULL),
	(127,'Gesztenyés szív','édes teasütemény',0,NULL,NULL),
	(128,'Ropi','sós teasütemény',0,NULL,NULL),
	(129,'Paleolit étcsokoládé','különleges torta',0,NULL,NULL),
	(130,'Túrós','pite',0,NULL,NULL),
	(131,'Ischler','vegyes',0,NULL,NULL),
	(132,'Lúdláb','tortaszelet',0,NULL,NULL),
	(133,'Csokoládémousse','tortaszelet',0,NULL,NULL),
	(134,'Dió','torta',0,NULL,NULL),
	(135,'Krémes','krémes',0,NULL,NULL),
	(136,'Mini ischler','édes teasütemény',0,NULL,NULL),
	(137,'Paleolit étcsokoládé','tortaszelet',0,NULL,NULL),
	(138,'Tejfölös túrós hajtogatott','sós teasütemény',0,NULL,NULL),
	(139,'Mákos guba','torta',0,NULL,NULL);

/*!40000 ALTER TABLE `pastries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table prices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `prices`;

CREATE TABLE `prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pastry_id` bigint unsigned NOT NULL,
  `price` int NOT NULL DEFAULT '0',
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'db',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prices_pastry_id_foreign` (`pastry_id`),
  CONSTRAINT `prices_pastry_id_foreign` FOREIGN KEY (`pastry_id`) REFERENCES `pastries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;

INSERT INTO `prices` (`id`, `pastry_id`, `price`, `unit`, `created_at`, `updated_at`)
VALUES
	(1,32,500,'db\r',NULL,NULL),
	(2,76,10900,'16 szeletes\r',NULL,NULL),
	(3,106,4300,'8 szeletes\r',NULL,NULL),
	(4,88,300,'db\r',NULL,NULL),
	(5,116,16200,'24 szeletes\r',NULL,NULL),
	(6,135,250,'db\r',NULL,NULL),
	(7,127,4400,'kg\r',NULL,NULL),
	(8,50,13400,'24 szeletes\r',NULL,NULL),
	(9,70,700,'db\r',NULL,NULL),
	(10,31,5200,'kg\r',NULL,NULL),
	(11,96,3300,'kg ​​\r',NULL,NULL),
	(12,116,5700,'8 szeletes\r',NULL,NULL),
	(13,22,9000,'16 szeletes\r',NULL,NULL),
	(14,138,4400,'kg\r',NULL,NULL),
	(15,112,2900,'kg\r',NULL,NULL),
	(16,58,3200,'kg\r',NULL,NULL),
	(17,98,10400,'16 szeletes\r',NULL,NULL),
	(18,75,2100,'rúd\r',NULL,NULL),
	(19,24,11400,'24 szeletes\r',NULL,NULL),
	(20,62,600,'db\r',NULL,NULL),
	(21,61,8400,'16 szeletes\r',NULL,NULL),
	(22,105,10900,'16 szeletes\r',NULL,NULL),
	(23,20,4700,'8 szeletes\r',NULL,NULL),
	(24,123,1800,'rúd\r',NULL,NULL),
	(25,60,8200,'16 szeletes\r',NULL,NULL),
	(26,24,3900,'8 szeletes\r',NULL,NULL),
	(27,38,4300,'8 szeletes\r',NULL,NULL),
	(28,126,2100,'rúd\r',NULL,NULL),
	(29,64,750,'db\r',NULL,NULL),
	(30,109,300,'db\r',NULL,NULL),
	(31,66,350,'db',NULL,NULL),
	(32,89,13200,'24 szeletes\r',NULL,NULL),
	(33,98,15400,'24 szeletes\r',NULL,NULL),
	(34,24,7400,'16 szeletes\r',NULL,NULL),
	(35,76,5700,'8 szeletes\r',NULL,NULL),
	(36,131,250,'db\r',NULL,NULL),
	(37,50,9200,'16 szeletes\r',NULL,NULL),
	(38,55,600,'db\r',NULL,NULL),
	(39,87,3400,'kg\r',NULL,NULL),
	(40,4,3500,'koszorú\r',NULL,NULL),
	(41,8,400,'db\r',NULL,NULL),
	(42,100,450,'db\r',NULL,NULL),
	(43,129,5300,'8 szeletes\r',NULL,NULL),
	(44,35,4700,'8 szeletes\r',NULL,NULL),
	(45,47,490,'db\r',NULL,NULL),
	(46,89,9000,'16 szeletes\r',NULL,NULL),
	(47,111,3300,'kg\r',NULL,NULL),
	(48,94,400,'db\r',NULL,NULL),
	(49,42,16200,'24 szeletes\r',NULL,NULL),
	(50,80,350,'db\r',NULL,NULL),
	(51,134,4700,'8 szeletes\r',NULL,NULL),
	(52,128,4000,'kg\r',NULL,NULL),
	(53,90,5200,'kg\r',NULL,NULL),
	(54,39,13200,'24 szeletes\r',NULL,NULL),
	(55,71,7400,'16 szeletes\r',NULL,NULL),
	(56,17,3400,'kg\r',NULL,NULL),
	(57,68,18400,'24 szeletes\r',NULL,NULL),
	(58,81,8200,'16 szeletes\r',NULL,NULL),
	(59,134,9000,'16 szeletes\r',NULL,NULL),
	(60,108,11400,'24 szeletes\r',NULL,NULL),
	(61,97,5200,'kg\r',NULL,NULL),
	(62,81,4300,'8 szeletes\r',NULL,NULL),
	(63,44,3800,'kg\r',NULL,NULL),
	(64,72,5700,'8 szeletes\r',NULL,NULL),
	(65,49,250,'db\r',NULL,NULL),
	(66,48,350,'db\r',NULL,NULL),
	(67,14,350,'db\r',NULL,NULL),
	(68,107,12200,'24 szeletes\r',NULL,NULL),
	(69,27,15400,'24 szeletes\r',NULL,NULL),
	(70,106,12100,'24 szeletes\r',NULL,NULL),
	(71,74,7400,'16 szeletes\r',NULL,NULL),
	(72,40,5700,'8 szeletes\r',NULL,NULL),
	(73,133,450,'db\r',NULL,NULL),
	(74,77,490,'db\r',NULL,NULL),
	(75,22,13200,'24 szeletes\r',NULL,NULL),
	(76,119,9000,'16 szeletes\r',NULL,NULL),
	(77,120,3400,'kg\r',NULL,NULL),
	(78,105,5700,'8 szeletes\r',NULL,NULL),
	(79,119,13200,'24 szeletes\r',NULL,NULL),
	(80,99,4600,'kg\r',NULL,NULL),
	(81,61,12200,'24 szeletes\r',NULL,NULL),
	(82,93,4200,'kg\r',NULL,NULL),
	(83,59,13200,'24 szeletes\r',NULL,NULL),
	(84,82,5700,'8 szeletes\r',NULL,NULL),
	(85,56,600,'db\r',NULL,NULL),
	(86,23,550,'db\r',NULL,NULL),
	(87,81,12100,'24 szeletes\r',NULL,NULL),
	(88,67,500,'db\r',NULL,NULL),
	(89,68,6400,'8 szeletes\r',NULL,NULL),
	(90,38,8200,'16 szeletes\r',NULL,NULL),
	(91,139,4700,'8 szeletes\r',NULL,NULL),
	(92,30,530,'db\r',NULL,NULL),
	(93,95,16200,'24 szeletes\r',NULL,NULL),
	(94,101,400,'db\r',NULL,NULL),
	(95,65,400,'db\r',NULL,NULL),
	(96,10,12100,'24 szeletes\r',NULL,NULL),
	(97,59,9000,'16 szeletes\r',NULL,NULL),
	(98,119,4700,'8 szeletes\r',NULL,NULL),
	(99,82,16200,'24 szeletes\r',NULL,NULL),
	(100,3,3300,'kg\r',NULL,NULL),
	(101,104,4200,'kg\r',NULL,NULL),
	(102,110,530,'db\r',NULL,NULL),
	(103,1,300,'db\r',NULL,NULL),
	(104,25,8200,'16 szeletes\r',NULL,NULL),
	(105,40,16200,'24 szeletes\r',NULL,NULL),
	(106,36,490,'db\r',NULL,NULL),
	(107,124,3900,'8 szeletes\r',NULL,NULL),
	(108,16,530,'db\r',NULL,NULL),
	(109,29,3500,'koszorú\r',NULL,NULL),
	(110,116,10900,'16 szeletes\r',NULL,NULL),
	(111,71,3900,'8 szeletes\r',NULL,NULL),
	(112,2,500,'db\r',NULL,NULL),
	(113,71,11400,'24 szeletes\r',NULL,NULL),
	(114,10,4300,'8 szeletes\r',NULL,NULL),
	(115,108,3900,'8 szeletes\r',NULL,NULL),
	(116,69,450,'db\r',NULL,NULL),
	(117,39,9000,'16 szeletes\r',NULL,NULL),
	(118,25,4300,'8 szeletes\r',NULL,NULL),
	(119,107,8400,'16 szeletes\r',NULL,NULL),
	(120,5,9000,'12 szeletes\r',NULL,NULL),
	(121,106,8200,'16 szeletes\r',NULL,NULL),
	(122,114,450,'db\r',NULL,NULL),
	(123,26,400,'db\r',NULL,NULL),
	(124,82,10900,'16 szeletes\r',NULL,NULL),
	(125,28,8200,'16 szeletes\r',NULL,NULL),
	(126,42,10900,'16 szeletes\r',NULL,NULL),
	(127,35,13200,'24 szeletes\r',NULL,NULL),
	(128,74,3900,'8 szeletes\r',NULL,NULL),
	(129,19,450,'db\r',NULL,NULL),
	(130,25,12100,'24 szeletes\r',NULL,NULL),
	(131,125,5700,'8 szeletes\r',NULL,NULL),
	(132,95,5700,'8 szeletes\r',NULL,NULL),
	(133,34,1700,'rúd\r',NULL,NULL),
	(134,121,530,'db\r',NULL,NULL),
	(135,76,16200,'24 szeletes\r',NULL,NULL),
	(136,13,400,'db\r',NULL,NULL),
	(137,60,12100,'24 szeletes\r',NULL,NULL),
	(138,33,350,'db\r',NULL,NULL),
	(139,132,530,'db\r',NULL,NULL),
	(140,117,9900,'16 szeletes\r',NULL,NULL),
	(141,27,10400,'16 szeletes\r',NULL,NULL),
	(142,18,490,'db\r',NULL,NULL),
	(143,124,7400,'16 szeletes\r',NULL,NULL),
	(144,122,5200,'kg\r',NULL,NULL),
	(145,59,4700,'8 szeletes\r',NULL,NULL),
	(146,124,11400,'24 szeletes\r',NULL,NULL),
	(147,134,13200,'24 szeletes\r',NULL,NULL),
	(148,45,450,'db\r',NULL,NULL),
	(149,63,350,'db\r',NULL,NULL),
	(150,6,3900,'8 szeletes\r',NULL,NULL),
	(151,28,4300,'8 szeletes\r',NULL,NULL),
	(152,37,3900,'8 szeletes\r',NULL,NULL),
	(153,52,5000,'kg\r',NULL,NULL),
	(154,61,4500,'8 szeletes\r',NULL,NULL),
	(155,86,600,'db\r',NULL,NULL),
	(156,6,7400,'16 szeletes\r',NULL,NULL),
	(157,37,7400,'16 szeletes\r',NULL,NULL),
	(158,11,490,'db\r',NULL,NULL),
	(159,108,7400,'16 szeletes\r',NULL,NULL),
	(160,35,9000,'16 szeletes\r',NULL,NULL),
	(161,107,4500,'8 szeletes\r',NULL,NULL),
	(162,6,11400,'24 szeletes\r',NULL,NULL),
	(163,79,4000,'kg\r',NULL,NULL),
	(164,60,4300,'8 szeletes\r',NULL,NULL),
	(165,21,5700,'8 szeletes\r',NULL,NULL),
	(166,28,12100,'24 szeletes\r',NULL,NULL),
	(167,15,5000,'kg\r',NULL,NULL),
	(168,21,5700,'8 szeletes\r',NULL,NULL),
	(169,37,11400,'24 szeletes\r',NULL,NULL),
	(170,74,11400,'24 szeletes\r',NULL,NULL),
	(171,103,650,'db\r',NULL,NULL),
	(172,43,4200,'kg\r',NULL,NULL),
	(173,12,3400,'kg\r',NULL,NULL),
	(174,27,5400,'8 szeletes\r',NULL,NULL),
	(175,7,490,'db\r',NULL,NULL),
	(176,84,5200,'kg\r',NULL,NULL),
	(177,115,3600,'kg\r',NULL,NULL),
	(178,51,4000,'kg\r',NULL,NULL),
	(179,118,450,'db\r',NULL,NULL),
	(180,41,530,'db\r',NULL,NULL),
	(181,135,400,'db\r',NULL,NULL),
	(182,73,5400,'8 szeletes\r',NULL,NULL),
	(183,10,8200,'16 szeletes\r',NULL,NULL),
	(184,98,5400,'8 szeletes\r',NULL,NULL),
	(185,113,850,'db\r',NULL,NULL),
	(186,130,350,'db\r',NULL,NULL),
	(187,39,4700,'8 szeletes\r',NULL,NULL),
	(188,136,3400,'kg\r',NULL,NULL),
	(189,83,650,'db\r',NULL,NULL),
	(190,91,800,'20 dkg\r',NULL,NULL),
	(191,46,5200,'kg\r',NULL,NULL),
	(192,102,330,'db\r',NULL,NULL),
	(193,95,10900,'16 szeletes\r',NULL,NULL),
	(194,54,580,'db\r',NULL,NULL),
	(195,57,530,'db\r',NULL,NULL),
	(196,22,4700,'8 szeletes\r',NULL,NULL),
	(197,92,450,'db\r',NULL,NULL),
	(198,68,12400,'16 szeletes\r',NULL,NULL),
	(199,42,5700,'8 szeletes\r',NULL,NULL),
	(200,40,10900,'16 szeletes\r',NULL,NULL),
	(201,9,450,'db\r',NULL,NULL),
	(202,78,4200,'kg\r',NULL,NULL),
	(203,85,500,'db\r',NULL,NULL),
	(204,137,600,'db\r',NULL,NULL),
	(205,50,4900,'8 szeletes\r',NULL,NULL),
	(206,38,12100,'24 szeletes\r',NULL,NULL),
	(207,53,4200,'kg\r',NULL,NULL),
	(208,89,4700,'8 szeletes\r',NULL,NULL);

/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Vivi','baksa.vivi@gmail.com','admin',NULL,'$2y$12$o53/gv4mR6ZceQNpqsuWqutVPZzjow69FBsqqk0gmce6ldfvACNEC',NULL,'2023-11-30 10:55:31','2023-11-30 12:11:11'),
	(2,'Filament User','filament.user@gmail.com','user',NULL,'$2y$12$o53/gv4mR6ZceQNpqsuWqutVPZzjow69FBsqqk0gmce6ldfvACNEC',NULL,'2023-11-30 16:34:59','2023-11-30 16:34:59'),
	(3,'Filament User 2','filament.user.2@gmail.com','user',NULL,'$2y$12$o53/gv4mR6ZceQNpqsuWqutVPZzjow69FBsqqk0gmce6ldfvACNEC',NULL,'2023-11-30 16:34:59','2023-11-30 16:34:59');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
