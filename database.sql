-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: 127.0.0.1    Database: miranda
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'FDy9wVdmR7IQGT7zMIXtGEegxPL681LR',1,'2024-08-05 19:50:54','2024-08-05 19:50:54','2024-08-05 19:50:54');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'General',0,'In deleniti suscipit molestiae deleniti laboriosam. Nihil et odio dolorum et voluptas. Accusamus consectetur omnis maxime dolor aliquam suscipit voluptatem. Vero quo labore qui rerum.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2024-08-05 19:50:44','2024-08-05 19:50:44'),(2,'Hotel',0,'Dolorem est quas tempore cupiditate. Est blanditiis ut ipsam modi suscipit. Voluptate aut accusamus mollitia culpa qui rerum enim. Amet vel accusamus id ut praesentium iure illum.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-08-05 19:50:44','2024-08-05 19:50:44'),(3,'Booking',0,'Quia et cumque est atque soluta. Sit ut alias consequatur quia consequatur architecto. Maxime ex consequatur numquam rerum quibusdam debitis rerum adipisci. Soluta voluptas quidem quis eum sed.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-08-05 19:50:44','2024-08-05 19:50:44'),(4,'Resort',0,'Id voluptatum aspernatur et. Ut adipisci voluptate laborum reiciendis soluta. Dolorem sed optio molestiae officia laboriosam ea. Praesentium deleniti est corporis non tenetur quis.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-08-05 19:50:44','2024-08-05 19:50:44'),(5,'Travel',0,'Quam nostrum dolorem et sint aut eos officiis. Dolorem non dolorum et ut. Quo qui nesciunt blanditiis dolorem ratione. Amet odit ullam rerum similique voluptatem aut. Tempora iure expedita amet.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-08-05 19:50:44','2024-08-05 19:50:44');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Duplex Restaurant','Architecto tempora aliquam quod id id libero. Dolor eveniet officia explicabo quia voluptatem nobis. Ipsum sit nobis rerum.',1,0,'galleries/01.jpg',1,'published','2024-08-05 19:50:53','2024-08-05 19:50:53'),(2,'Luxury room','Qui est odio vitae quaerat id voluptatem. Error illum et consectetur ratione a dolorem non consequatur.',1,0,'galleries/02.jpg',1,'published','2024-08-05 19:50:53','2024-08-05 19:50:53'),(3,'Pacific Room','Est explicabo id dolorem eaque aut et et. Dolor odit maxime ut sed.',1,0,'galleries/03.jpg',1,'published','2024-08-05 19:50:53','2024-08-05 19:50:53'),(4,'Family Room','Accusantium eveniet perspiciatis enim modi nesciunt. Et qui qui assumenda. Et voluptatibus architecto mollitia amet rem reprehenderit.',1,0,'galleries/04.jpg',1,'published','2024-08-05 19:50:53','2024-08-05 19:50:53'),(5,'King Bed','Sint qui sit pariatur laboriosam. Omnis provident atque autem voluptatum est. Voluptates voluptas quia sed quo et recusandae quia.',1,0,'galleries/05.jpg',1,'published','2024-08-05 19:50:53','2024-08-05 19:50:53'),(6,'Special Foods','Maxime enim et dolores vel quo est quia architecto. Sunt dolorum consequuntur nihil aut est at voluptates est. Sit autem et ea eaque unde.',1,0,'galleries/06.jpg',1,'published','2024-08-05 19:50:53','2024-08-05 19:50:53');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'\"[{\\\"img\\\":\\\"galleries\\\\\\/01.jpg\\\",\\\"description\\\":\\\"Labore quidem quas ut earum. Ipsam minima nesciunt aut. Consequatur mollitia non iste itaque dignissimos mollitia et.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/02.jpg\\\",\\\"description\\\":\\\"Aut sed corrupti veniam assumenda. Nesciunt explicabo nulla et occaecati. Rerum accusamus quia corrupti numquam consequuntur sint.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/03.jpg\\\",\\\"description\\\":\\\"Aliquam adipisci assumenda quis incidunt. Consequatur quos et totam vel sed cupiditate tempore debitis. Voluptatem vel molestiae adipisci qui.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/04.jpg\\\",\\\"description\\\":\\\"Quisquam eum quas non. Corrupti repellat unde fugit expedita enim. Quia consequuntur et ab laudantium voluptates veniam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/05.jpg\\\",\\\"description\\\":\\\"Occaecati et aut iusto. Corrupti fugit et et. Qui nihil rerum occaecati modi soluta ea aut. Recusandae ut nostrum ut ut unde voluptas.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/06.jpg\\\",\\\"description\\\":\\\"Maiores reiciendis assumenda in nostrum. Et non blanditiis voluptatibus quia aut. Consequatur tempore officia sed enim voluptas distinctio saepe id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/07.jpg\\\",\\\"description\\\":\\\"Error laboriosam soluta ut ipsam sed. Minus perspiciatis suscipit et. Quia aliquam sed in explicabo dolores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/08.jpg\\\",\\\"description\\\":\\\"Quidem voluptas enim est sed. Maiores incidunt atque ut dolorem quos.\\\"}]\"',1,'Botble\\Gallery\\Models\\Gallery','2024-08-05 19:50:53','2024-08-05 19:50:53'),(2,'\"[{\\\"img\\\":\\\"galleries\\\\\\/01.jpg\\\",\\\"description\\\":\\\"Labore quidem quas ut earum. Ipsam minima nesciunt aut. Consequatur mollitia non iste itaque dignissimos mollitia et.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/02.jpg\\\",\\\"description\\\":\\\"Aut sed corrupti veniam assumenda. Nesciunt explicabo nulla et occaecati. Rerum accusamus quia corrupti numquam consequuntur sint.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/03.jpg\\\",\\\"description\\\":\\\"Aliquam adipisci assumenda quis incidunt. Consequatur quos et totam vel sed cupiditate tempore debitis. Voluptatem vel molestiae adipisci qui.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/04.jpg\\\",\\\"description\\\":\\\"Quisquam eum quas non. Corrupti repellat unde fugit expedita enim. Quia consequuntur et ab laudantium voluptates veniam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/05.jpg\\\",\\\"description\\\":\\\"Occaecati et aut iusto. Corrupti fugit et et. Qui nihil rerum occaecati modi soluta ea aut. Recusandae ut nostrum ut ut unde voluptas.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/06.jpg\\\",\\\"description\\\":\\\"Maiores reiciendis assumenda in nostrum. Et non blanditiis voluptatibus quia aut. Consequatur tempore officia sed enim voluptas distinctio saepe id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/07.jpg\\\",\\\"description\\\":\\\"Error laboriosam soluta ut ipsam sed. Minus perspiciatis suscipit et. Quia aliquam sed in explicabo dolores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/08.jpg\\\",\\\"description\\\":\\\"Quidem voluptas enim est sed. Maiores incidunt atque ut dolorem quos.\\\"}]\"',2,'Botble\\Gallery\\Models\\Gallery','2024-08-05 19:50:53','2024-08-05 19:50:53'),(3,'\"[{\\\"img\\\":\\\"galleries\\\\\\/01.jpg\\\",\\\"description\\\":\\\"Labore quidem quas ut earum. Ipsam minima nesciunt aut. Consequatur mollitia non iste itaque dignissimos mollitia et.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/02.jpg\\\",\\\"description\\\":\\\"Aut sed corrupti veniam assumenda. Nesciunt explicabo nulla et occaecati. Rerum accusamus quia corrupti numquam consequuntur sint.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/03.jpg\\\",\\\"description\\\":\\\"Aliquam adipisci assumenda quis incidunt. Consequatur quos et totam vel sed cupiditate tempore debitis. Voluptatem vel molestiae adipisci qui.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/04.jpg\\\",\\\"description\\\":\\\"Quisquam eum quas non. Corrupti repellat unde fugit expedita enim. Quia consequuntur et ab laudantium voluptates veniam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/05.jpg\\\",\\\"description\\\":\\\"Occaecati et aut iusto. Corrupti fugit et et. Qui nihil rerum occaecati modi soluta ea aut. Recusandae ut nostrum ut ut unde voluptas.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/06.jpg\\\",\\\"description\\\":\\\"Maiores reiciendis assumenda in nostrum. Et non blanditiis voluptatibus quia aut. Consequatur tempore officia sed enim voluptas distinctio saepe id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/07.jpg\\\",\\\"description\\\":\\\"Error laboriosam soluta ut ipsam sed. Minus perspiciatis suscipit et. Quia aliquam sed in explicabo dolores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/08.jpg\\\",\\\"description\\\":\\\"Quidem voluptas enim est sed. Maiores incidunt atque ut dolorem quos.\\\"}]\"',3,'Botble\\Gallery\\Models\\Gallery','2024-08-05 19:50:53','2024-08-05 19:50:53'),(4,'\"[{\\\"img\\\":\\\"galleries\\\\\\/01.jpg\\\",\\\"description\\\":\\\"Labore quidem quas ut earum. Ipsam minima nesciunt aut. Consequatur mollitia non iste itaque dignissimos mollitia et.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/02.jpg\\\",\\\"description\\\":\\\"Aut sed corrupti veniam assumenda. Nesciunt explicabo nulla et occaecati. Rerum accusamus quia corrupti numquam consequuntur sint.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/03.jpg\\\",\\\"description\\\":\\\"Aliquam adipisci assumenda quis incidunt. Consequatur quos et totam vel sed cupiditate tempore debitis. Voluptatem vel molestiae adipisci qui.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/04.jpg\\\",\\\"description\\\":\\\"Quisquam eum quas non. Corrupti repellat unde fugit expedita enim. Quia consequuntur et ab laudantium voluptates veniam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/05.jpg\\\",\\\"description\\\":\\\"Occaecati et aut iusto. Corrupti fugit et et. Qui nihil rerum occaecati modi soluta ea aut. Recusandae ut nostrum ut ut unde voluptas.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/06.jpg\\\",\\\"description\\\":\\\"Maiores reiciendis assumenda in nostrum. Et non blanditiis voluptatibus quia aut. Consequatur tempore officia sed enim voluptas distinctio saepe id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/07.jpg\\\",\\\"description\\\":\\\"Error laboriosam soluta ut ipsam sed. Minus perspiciatis suscipit et. Quia aliquam sed in explicabo dolores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/08.jpg\\\",\\\"description\\\":\\\"Quidem voluptas enim est sed. Maiores incidunt atque ut dolorem quos.\\\"}]\"',4,'Botble\\Gallery\\Models\\Gallery','2024-08-05 19:50:53','2024-08-05 19:50:53'),(5,'\"[{\\\"img\\\":\\\"galleries\\\\\\/01.jpg\\\",\\\"description\\\":\\\"Labore quidem quas ut earum. Ipsam minima nesciunt aut. Consequatur mollitia non iste itaque dignissimos mollitia et.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/02.jpg\\\",\\\"description\\\":\\\"Aut sed corrupti veniam assumenda. Nesciunt explicabo nulla et occaecati. Rerum accusamus quia corrupti numquam consequuntur sint.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/03.jpg\\\",\\\"description\\\":\\\"Aliquam adipisci assumenda quis incidunt. Consequatur quos et totam vel sed cupiditate tempore debitis. Voluptatem vel molestiae adipisci qui.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/04.jpg\\\",\\\"description\\\":\\\"Quisquam eum quas non. Corrupti repellat unde fugit expedita enim. Quia consequuntur et ab laudantium voluptates veniam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/05.jpg\\\",\\\"description\\\":\\\"Occaecati et aut iusto. Corrupti fugit et et. Qui nihil rerum occaecati modi soluta ea aut. Recusandae ut nostrum ut ut unde voluptas.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/06.jpg\\\",\\\"description\\\":\\\"Maiores reiciendis assumenda in nostrum. Et non blanditiis voluptatibus quia aut. Consequatur tempore officia sed enim voluptas distinctio saepe id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/07.jpg\\\",\\\"description\\\":\\\"Error laboriosam soluta ut ipsam sed. Minus perspiciatis suscipit et. Quia aliquam sed in explicabo dolores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/08.jpg\\\",\\\"description\\\":\\\"Quidem voluptas enim est sed. Maiores incidunt atque ut dolorem quos.\\\"}]\"',5,'Botble\\Gallery\\Models\\Gallery','2024-08-05 19:50:53','2024-08-05 19:50:53'),(6,'\"[{\\\"img\\\":\\\"galleries\\\\\\/01.jpg\\\",\\\"description\\\":\\\"Labore quidem quas ut earum. Ipsam minima nesciunt aut. Consequatur mollitia non iste itaque dignissimos mollitia et.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/02.jpg\\\",\\\"description\\\":\\\"Aut sed corrupti veniam assumenda. Nesciunt explicabo nulla et occaecati. Rerum accusamus quia corrupti numquam consequuntur sint.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/03.jpg\\\",\\\"description\\\":\\\"Aliquam adipisci assumenda quis incidunt. Consequatur quos et totam vel sed cupiditate tempore debitis. Voluptatem vel molestiae adipisci qui.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/04.jpg\\\",\\\"description\\\":\\\"Quisquam eum quas non. Corrupti repellat unde fugit expedita enim. Quia consequuntur et ab laudantium voluptates veniam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/05.jpg\\\",\\\"description\\\":\\\"Occaecati et aut iusto. Corrupti fugit et et. Qui nihil rerum occaecati modi soluta ea aut. Recusandae ut nostrum ut ut unde voluptas.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/06.jpg\\\",\\\"description\\\":\\\"Maiores reiciendis assumenda in nostrum. Et non blanditiis voluptatibus quia aut. Consequatur tempore officia sed enim voluptas distinctio saepe id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/07.jpg\\\",\\\"description\\\":\\\"Error laboriosam soluta ut ipsam sed. Minus perspiciatis suscipit et. Quia aliquam sed in explicabo dolores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/08.jpg\\\",\\\"description\\\":\\\"Quidem voluptas enim est sed. Maiores incidunt atque ut dolorem quos.\\\"}]\"',6,'Botble\\Gallery\\Models\\Gallery','2024-08-05 19:50:53','2024-08-05 19:50:53');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_amenities`
--

DROP TABLE IF EXISTS `ht_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_amenities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_amenities`
--

LOCK TABLES `ht_amenities` WRITE;
/*!40000 ALTER TABLE `ht_amenities` DISABLE KEYS */;
INSERT INTO `ht_amenities` VALUES (1,'Air conditioner','fal fa-bath','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(2,'High speed WiFi','fal fa-wifi','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(3,'Strong Locker','fal fa-key','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(4,'Breakfast','fal fa-cut','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(5,'Kitchen','fal fa-guitar','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(6,'Smart Security','fal fa-lock','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(7,'Cleaning','fal fa-broom','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(8,'Shower','fal fa-shower','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(9,'24/7 Online Support','fal fa-headphones-alt','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(10,'Grocery','fal fa-shopping-basket','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(11,'Single bed','fal fa-bed','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(12,'Expert Team','fal fa-users','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(13,'Shop near','fal fa-shopping-cart','published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(14,'Towels','fal fa-bus','published','2024-08-05 19:50:44','2024-08-05 19:50:44');
/*!40000 ALTER TABLE `ht_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_amenities_translations`
--

DROP TABLE IF EXISTS `ht_amenities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_amenities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_amenities_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_amenities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_amenities_translations`
--

LOCK TABLES `ht_amenities_translations` WRITE;
/*!40000 ALTER TABLE `ht_amenities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_amenities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_addresses`
--

DROP TABLE IF EXISTS `ht_booking_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_addresses`
--

LOCK TABLES `ht_booking_addresses` WRITE;
/*!40000 ALTER TABLE `ht_booking_addresses` DISABLE KEYS */;
INSERT INTO `ht_booking_addresses` VALUES (1,'Nelson','Shanahan','(434) 335-8513','christopher.wisozk@example.net','Spain','Cummingsbury','New Sydnie','02671','466 Emerson Road\nNorth Brownbury, MD 56601',1,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(2,'Curt','Jerde','1-360-794-1396','mayer.aliya@example.org','Togo','Port Vedamouth','Nataliaborough','99103-9054','797 Hoeger Cape Apt. 552\nMillerfort, IN 77215',2,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(3,'Darion','Roob','+18156967198','deckow.kara@example.net','Gambia','South Domenica','Port Easter','81443-5822','8496 Blanda Canyon\nWest Casandrafort, NC 37960-8782',3,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(4,'Elijah','Bode','757-570-7093','marcelina74@example.net','Cuba','Kelsiehaven','Connburgh','64993-4861','166 Alison Trail\nErdmanshire, DC 35139-6095',4,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(5,'Aylin','Conroy','804.691.1055','lokuneva@example.net','Nicaragua','Legroschester','South Johathan','34027','391 Bahringer Ramp Apt. 371\nLangshire, AL 73498',5,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(6,'Dusty','Leannon','+1.856.415.3951','grace.lesch@example.net','Luxembourg','South Lois','West Greyson','30977-8328','84891 Sydni Hills Apt. 728\nLake Hillarymouth, LA 16208',6,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(7,'Sunny','Veum','212.404.2667','hazel01@example.com','Burundi','Lake Derick','Blandabury','96546-5509','5628 Estel Park Apt. 922\nWest Cornelius, KY 61505-3195',7,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(8,'Krystel','Buckridge','+1 (262) 567-3374','dariana.johns@example.org','Nicaragua','New Harrison','Pfefferberg','50491-6955','95082 Hoppe Gardens Apt. 545\nNew Flaviomouth, CT 31609-4903',8,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(9,'Floyd','Tillman','607-264-9119','irving14@example.net','Tokelau','Rainaview','Adamouth','40088','454 Karen Loop\nBrookmouth, TX 72996-2762',9,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(10,'Sean','Blanda','+1.678.388.5027','wyman.casimer@example.org','Canada','North Tremaineville','Adeleville','97097','237 Sandra Hill Suite 496\nRigobertomouth, PA 13769',10,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(11,'Allie','Heathcote','458.628.8287','beier.hannah@example.org','Lao People\'s Democratic Republic','Blairfort','New Nedra','63954-9025','993 Bashirian Port Apt. 125\nMeghanstad, WA 12293-6621',11,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(12,'Blake','Bradtke','(928) 449-5022','gbernhard@example.com','Bulgaria','Joshuamouth','New Mervin','54610-9040','9433 Luis Terrace Suite 820\nNew Olin, OR 03969',12,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(13,'Mona','Collier','+13218413122','nayeli51@example.org','Pitcairn Islands','North Jovanville','Priceborough','95764','3122 Dare Point Suite 774\nTyreeside, MO 51397',13,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(14,'Summer','Schaefer','(254) 582-6880','veda91@example.org','Somalia','Lake Kasandraborough','McCulloughfurt','43196-2341','24960 Powlowski Locks\nPort Roel, LA 13441-0320',14,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(15,'Wilmer','Kuhn','(573) 893-8189','xmorar@example.com','Poland','South Alenahaven','Tillmanfort','41455-7062','67154 Antwon Tunnel Suite 037\nWest Anahi, WI 36001',15,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(16,'Xavier','Metz','(346) 468-8431','madelyn.kunze@example.org','Egypt','Larsonville','Kozeymouth','98968-9306','29721 Bernier Fields\nLake Mikelton, AL 53287-8548',16,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(17,'Mohammed','Nolan','814.405.7336','loma45@example.org','Senegal','West Billietown','Fernberg','45397-3641','56739 Benny Track Suite 443\nAmiyashire, ND 13981-8597',17,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(18,'Evie','Goodwin','651.577.4449','omayert@example.org','Reunion','Hermannside','Lindsayfurt','76422-7186','41616 Mitchell Viaduct Apt. 891\nInesborough, WV 22078',18,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(19,'Krystel','Heaney','564.892.2676','haley.weston@example.com','Montserrat','Port Terrence','Port Clifford','05841-0908','3853 Lacy Locks Apt. 380\nMohrview, ID 29648-6468',19,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(20,'Nicholaus','Powlowski','+1-534-682-6551','tomas.doyle@example.com','Guinea-Bissau','Hellerberg','Jessicamouth','49731-3108','65185 Jody Villages\nAlethaville, NJ 05449',20,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(21,'Ethan','Hoppe','(469) 617-7619','gerhold.chandler@example.com','New Zealand','Lukasfort','Huelshaven','47474-7375','777 Bauch Rapid Suite 946\nEast Frankie, AK 90694-7961',21,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(22,'Timmy','Raynor','+1-906-230-7086','chaim94@example.com','Congo','Brucestad','West Aniyaland','47782','10953 Halvorson Dam\nWolfmouth, KY 98483',22,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(23,'Antonina','Bradtke','234-344-0844','lamont.kris@example.org','Anguilla','East Jimmy','Lake Hoseamouth','66202-7118','694 Josefa Crossroad Suite 840\nLake Caleb, ME 88562',23,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(24,'Roxanne','Kessler','351-968-3682','elmo.zboncak@example.com','Finland','West Lauren','Sporermouth','27816','8851 Wyman Trail Suite 059\nNew Cheyanne, IN 98551',24,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(25,'Randi','Bins','614.764.9035','oconnell.brandon@example.org','New Zealand','Vincechester','Jensenfurt','50456-9273','411 Suzanne Cove\nTianaport, IN 17948-6650',25,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(26,'Adrian','Ward','+1-585-518-2770','cletus.wyman@example.com','Turkmenistan','Swiftfort','Lyricberg','16943-5051','54859 Bailey Cliff\nLorainefurt, WV 82527-1547',26,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(27,'Travis','Lehner','+1-667-424-5607','bryana92@example.org','Iceland','Dimitristad','South Arlenetown','65854','60180 Birdie Burgs\nLake Keenan, TN 74261-8124',27,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(28,'Celia','Ratke','660-925-3534','kkerluke@example.net','Macao','Fayebury','Alfonzoburgh','34658','7506 Ankunding Forge Apt. 484\nSchneiderport, PA 63918',28,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(29,'Maud','Runolfsdottir','947.271.9521','fwhite@example.org','Morocco','Darbyland','New Willow','16521-1648','73743 Orville Spur Suite 358\nGerhardfort, ND 49893-9739',29,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(30,'Dana','Graham','+19187844358','volkman.nicole@example.net','Korea','Romaguerahaven','Bruenmouth','74251','53487 Botsford Key Apt. 804\nLake Jermeyborough, WA 29292-2623',30,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(31,'Juliana','Gerhold','+1-802-261-3883','alfred.bartoletti@example.org','Anguilla','Mckennahaven','Rodport','71278','1143 Davis Plain Apt. 799\nPort Travis, OH 97900',31,'2024-08-05 19:50:57','2024-08-05 19:50:57');
/*!40000 ALTER TABLE `ht_booking_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_rooms`
--

DROP TABLE IF EXISTS `ht_booking_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned DEFAULT NULL,
  `room_image` text COLLATE utf8mb4_unicode_ci,
  `room_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `number_of_rooms` int NOT NULL DEFAULT '1',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_rooms`
--

LOCK TABLES `ht_booking_rooms` WRITE;
/*!40000 ALTER TABLE `ht_booking_rooms` DISABLE KEYS */;
INSERT INTO `ht_booking_rooms` VALUES (1,1,6,'rooms/06.jpg','Relax Suite',169.00,NULL,2,'2024-08-01','2024-08-04','2024-08-05 19:50:56','2024-08-05 19:50:56'),(2,2,6,'rooms/06.jpg','Relax Suite',169.00,NULL,3,'2024-08-02','2024-08-04','2024-08-05 19:50:56','2024-08-05 19:50:56'),(3,3,2,'rooms/02.jpg','Pendora Fame',103.00,NULL,2,'2024-08-03','2024-08-05','2024-08-05 19:50:56','2024-08-05 19:50:56'),(4,4,5,'rooms/05.jpg','Family Suite',150.00,NULL,3,'2024-08-04','2024-08-07','2024-08-05 19:50:56','2024-08-05 19:50:56'),(5,5,2,'rooms/02.jpg','Pendora Fame',103.00,NULL,1,'2024-08-05','2024-08-07','2024-08-05 19:50:56','2024-08-05 19:50:56'),(6,6,6,'rooms/06.jpg','Relax Suite',169.00,NULL,2,'2024-08-06','2024-08-08','2024-08-05 19:50:56','2024-08-05 19:50:56'),(7,7,7,'rooms/01.jpg','Luxury Suite',179.00,NULL,3,'2024-08-07','2024-08-10','2024-08-05 19:50:56','2024-08-05 19:50:56'),(8,8,6,'rooms/06.jpg','Relax Suite',169.00,NULL,1,'2024-08-08','2024-08-10','2024-08-05 19:50:56','2024-08-05 19:50:56'),(9,9,2,'rooms/02.jpg','Pendora Fame',103.00,NULL,2,'2024-08-09','2024-08-11','2024-08-05 19:50:56','2024-08-05 19:50:56'),(10,10,8,'rooms/02.jpg','President Room',154.00,NULL,3,'2024-08-10','2024-08-11','2024-08-05 19:50:56','2024-08-05 19:50:56'),(11,11,4,'rooms/04.jpg','Junior Suite',121.00,NULL,2,'2024-08-11','2024-08-14','2024-08-05 19:50:56','2024-08-05 19:50:56'),(12,12,3,'rooms/03.jpg','Pacific Room',121.00,NULL,1,'2024-08-12','2024-08-15','2024-08-05 19:50:56','2024-08-05 19:50:56'),(13,13,4,'rooms/04.jpg','Junior Suite',121.00,NULL,1,'2024-08-13','2024-08-14','2024-08-05 19:50:56','2024-08-05 19:50:56'),(14,14,5,'rooms/05.jpg','Family Suite',150.00,NULL,2,'2024-08-14','2024-08-17','2024-08-05 19:50:56','2024-08-05 19:50:56'),(15,15,2,'rooms/02.jpg','Pendora Fame',103.00,NULL,2,'2024-08-15','2024-08-16','2024-08-05 19:50:56','2024-08-05 19:50:56'),(16,16,1,'rooms/01.jpg','Luxury Hall Of Fame',200.00,NULL,1,'2024-08-16','2024-08-17','2024-08-05 19:50:56','2024-08-05 19:50:56'),(17,17,5,'rooms/05.jpg','Family Suite',150.00,NULL,1,'2024-08-17','2024-08-19','2024-08-05 19:50:57','2024-08-05 19:50:57'),(18,18,7,'rooms/01.jpg','Luxury Suite',179.00,NULL,3,'2024-08-18','2024-08-20','2024-08-05 19:50:57','2024-08-05 19:50:57'),(19,19,3,'rooms/03.jpg','Pacific Room',121.00,NULL,1,'2024-08-19','2024-08-21','2024-08-05 19:50:57','2024-08-05 19:50:57'),(20,20,3,'rooms/03.jpg','Pacific Room',121.00,NULL,2,'2024-08-20','2024-08-21','2024-08-05 19:50:57','2024-08-05 19:50:57'),(21,21,4,'rooms/04.jpg','Junior Suite',121.00,NULL,2,'2024-08-21','2024-08-22','2024-08-05 19:50:57','2024-08-05 19:50:57'),(22,22,2,'rooms/02.jpg','Pendora Fame',103.00,NULL,3,'2024-08-22','2024-08-23','2024-08-05 19:50:57','2024-08-05 19:50:57'),(23,23,3,'rooms/03.jpg','Pacific Room',121.00,NULL,3,'2024-08-23','2024-08-24','2024-08-05 19:50:57','2024-08-05 19:50:57'),(24,24,3,'rooms/03.jpg','Pacific Room',121.00,NULL,3,'2024-08-24','2024-08-26','2024-08-05 19:50:57','2024-08-05 19:50:57'),(25,25,8,'rooms/02.jpg','President Room',154.00,NULL,2,'2024-08-25','2024-08-27','2024-08-05 19:50:57','2024-08-05 19:50:57'),(26,26,6,'rooms/06.jpg','Relax Suite',169.00,NULL,3,'2024-08-26','2024-08-29','2024-08-05 19:50:57','2024-08-05 19:50:57'),(27,27,1,'rooms/01.jpg','Luxury Hall Of Fame',200.00,NULL,2,'2024-08-27','2024-08-29','2024-08-05 19:50:57','2024-08-05 19:50:57'),(28,28,7,'rooms/01.jpg','Luxury Suite',179.00,NULL,1,'2024-08-28','2024-08-30','2024-08-05 19:50:57','2024-08-05 19:50:57'),(29,29,2,'rooms/02.jpg','Pendora Fame',103.00,NULL,3,'2024-08-29','2024-09-01','2024-08-05 19:50:57','2024-08-05 19:50:57'),(30,30,6,'rooms/06.jpg','Relax Suite',169.00,NULL,1,'2024-08-30','2024-09-02','2024-08-05 19:50:57','2024-08-05 19:50:57'),(31,31,6,'rooms/06.jpg','Relax Suite',169.00,NULL,2,'2024-08-31','2024-09-01','2024-08-05 19:50:57','2024-08-05 19:50:57');
/*!40000 ALTER TABLE `ht_booking_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_services`
--

DROP TABLE IF EXISTS `ht_booking_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_services`
--

LOCK TABLES `ht_booking_services` WRITE;
/*!40000 ALTER TABLE `ht_booking_services` DISABLE KEYS */;
INSERT INTO `ht_booking_services` VALUES (1,1,5),(2,2,4),(3,3,4),(4,4,6),(5,5,2),(6,6,2),(7,7,1),(8,8,6),(9,9,6),(10,10,6),(11,11,1),(12,12,4),(13,13,2),(14,14,1),(15,15,2),(16,16,6),(17,17,5),(18,18,1),(19,19,6),(20,20,4),(21,21,5),(22,22,2),(23,23,5),(24,24,3),(25,25,3),(26,26,4),(27,27,5),(28,28,4),(29,29,4),(30,30,5),(31,31,4);
/*!40000 ALTER TABLE `ht_booking_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_bookings`
--

DROP TABLE IF EXISTS `ht_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `coupon_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `requests` text COLLATE utf8mb4_unicode_ci,
  `arrival_time` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_guests` int DEFAULT NULL,
  `number_of_children` int NOT NULL DEFAULT '0',
  `payment_id` bigint unsigned DEFAULT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `transaction_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_bookings_booking_number_unique` (`booking_number`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_bookings`
--

LOCK TABLES `ht_bookings` WRITE;
/*!40000 ALTER TABLE `ht_bookings` DISABLE KEYS */;
INSERT INTO `ht_bookings` VALUES (1,NULL,338.00,338.00,0.00,NULL,0.00,NULL,'Ex labore corrupti rerum ipsa maiores.',NULL,4,0,1,11,'HLKM0WpSl4ejgVQW1TSd','pending','2024-08-05 19:50:56','2024-08-05 19:50:56'),(2,NULL,507.00,507.00,0.00,NULL,0.00,NULL,'Vel ea sapiente non eos iure.',NULL,6,0,2,5,'Zm9nrQAYl2zdXYnt6prg','processing','2024-08-05 19:50:56','2024-08-05 19:50:56'),(3,NULL,206.00,206.00,0.00,NULL,0.00,NULL,'Cupiditate deleniti in explicabo ut et et doloremque ipsa.',NULL,6,0,3,1,'bPXfanOtioplhUcCRRb0','pending','2024-08-05 19:50:56','2024-08-05 19:50:56'),(4,NULL,450.00,450.00,0.00,NULL,0.00,NULL,'Aut consequatur reiciendis libero numquam assumenda hic harum.',NULL,9,0,4,1,'WQwF2XrO6nLD0yjVZzAi','completed','2024-08-05 19:50:56','2024-08-05 19:50:56'),(5,NULL,103.00,103.00,0.00,NULL,0.00,NULL,'Eos tenetur explicabo quae atque odio illum quia.',NULL,3,0,5,3,'at2t6TyKX3FoZbO8bDA5','processing','2024-08-05 19:50:56','2024-08-05 19:50:56'),(6,NULL,338.00,338.00,0.00,NULL,0.00,NULL,'Sunt voluptates necessitatibus asperiores nobis iure.',NULL,2,0,6,6,'kjYQRrbxbIKzUqkNqFht','processing','2024-08-05 19:50:56','2024-08-05 19:50:56'),(7,NULL,537.00,537.00,0.00,NULL,0.00,NULL,'Aliquid alias corrupti delectus dicta eveniet quidem sed eos.',NULL,9,0,7,4,'U4DEbGpbluY30mE8m5d8','processing','2024-08-05 19:50:56','2024-08-05 19:50:56'),(8,NULL,169.00,169.00,0.00,NULL,0.00,NULL,'Voluptatem atque dolores labore aliquid distinctio placeat.',NULL,1,0,8,4,'ACTlkmCeeqaO01fGnXbr','pending','2024-08-05 19:50:56','2024-08-05 19:50:56'),(9,NULL,206.00,206.00,0.00,NULL,0.00,NULL,'Dolorum nobis quo exercitationem veritatis sunt in voluptatum neque.',NULL,2,0,9,10,'RHAtltDgU2c88Q1ujBJp','cancelled','2024-08-05 19:50:56','2024-08-05 19:50:56'),(10,NULL,462.00,462.00,0.00,NULL,0.00,NULL,'Veniam perspiciatis dicta fugit cumque ab.',NULL,6,0,10,4,'fSQzcUZpgFVJaaKbfF2c','processing','2024-08-05 19:50:56','2024-08-05 19:50:56'),(11,NULL,242.00,242.00,0.00,NULL,0.00,NULL,'Provident eveniet ullam minima maxime corrupti enim.',NULL,4,0,11,3,'LHfWAjAZLBWVpwmGnwNa','cancelled','2024-08-05 19:50:56','2024-08-05 19:50:56'),(12,NULL,121.00,121.00,0.00,NULL,0.00,NULL,'Aut minima qui excepturi laudantium a ipsa.',NULL,2,0,12,5,'CHwIAeKyyvZNq5GfYIbq','pending','2024-08-05 19:50:56','2024-08-05 19:50:56'),(13,NULL,121.00,121.00,0.00,NULL,0.00,NULL,'Explicabo eius illo sequi culpa.',NULL,1,0,13,7,'fBoG8e9xpyUptUWusDhf','completed','2024-08-05 19:50:56','2024-08-05 19:50:56'),(14,NULL,300.00,300.00,0.00,NULL,0.00,NULL,'Earum quidem ratione tempora beatae consequatur et.',NULL,4,0,14,5,'kQebLWFYhVZ7Cv7yLY5d','processing','2024-08-05 19:50:56','2024-08-05 19:50:56'),(15,NULL,206.00,206.00,0.00,NULL,0.00,NULL,'Dolores totam aliquam et velit sequi.',NULL,4,0,15,6,'UHbdidJE7PNkA6vdHYRS','cancelled','2024-08-05 19:50:56','2024-08-05 19:50:56'),(16,NULL,200.00,200.00,0.00,NULL,0.00,NULL,'A velit praesentium aliquid magnam aut eius voluptas aut.',NULL,3,0,16,1,'1PaxoSBg9lE3uryUqIBP','pending','2024-08-05 19:50:56','2024-08-05 19:50:57'),(17,NULL,150.00,150.00,0.00,NULL,0.00,NULL,'Quia ratione atque mollitia fugiat exercitationem rerum.',NULL,1,0,17,7,'YNssGj75KCemtGSQWI1V','cancelled','2024-08-05 19:50:57','2024-08-05 19:50:57'),(18,NULL,537.00,537.00,0.00,NULL,0.00,NULL,'Non modi est vel deserunt et.',NULL,6,0,18,5,'4hYplCp9EEMTXOg0bwUH','pending','2024-08-05 19:50:57','2024-08-05 19:50:57'),(19,NULL,121.00,121.00,0.00,NULL,0.00,NULL,'Molestiae debitis quos non voluptate id dignissimos.',NULL,1,0,19,5,'KZNKJI4WWUAki29lXxmW','processing','2024-08-05 19:50:57','2024-08-05 19:50:57'),(20,NULL,242.00,242.00,0.00,NULL,0.00,NULL,'Dolorum fuga non molestias voluptate eaque.',NULL,6,0,20,5,'mUDtaeKwedmMsNB9CdoP','cancelled','2024-08-05 19:50:57','2024-08-05 19:50:57'),(21,NULL,242.00,242.00,0.00,NULL,0.00,NULL,'Veniam quae doloremque doloribus quo.',NULL,6,0,21,3,'37gq21Z5CCo1JmVF5fZ3','pending','2024-08-05 19:50:57','2024-08-05 19:50:57'),(22,NULL,309.00,309.00,0.00,NULL,0.00,NULL,'Impedit sunt consequatur quasi repellendus enim illo.',NULL,9,0,22,9,'ZrTbEsECKWhae5Zygw2N','pending','2024-08-05 19:50:57','2024-08-05 19:50:57'),(23,NULL,363.00,363.00,0.00,NULL,0.00,NULL,'Praesentium sapiente quae voluptatem laborum.',NULL,9,0,23,9,'rJ1Ew49bLZj0vBOoXrNG','pending','2024-08-05 19:50:57','2024-08-05 19:50:57'),(24,NULL,363.00,363.00,0.00,NULL,0.00,NULL,'Ad optio vel culpa est quaerat.',NULL,6,0,24,11,'b30Bc2rKdtzFemK3xHES','cancelled','2024-08-05 19:50:57','2024-08-05 19:50:57'),(25,NULL,308.00,308.00,0.00,NULL,0.00,NULL,'Laboriosam debitis voluptate doloribus aut delectus.',NULL,2,0,25,2,'WlrrLQL0uoebdL3n6LeU','pending','2024-08-05 19:50:57','2024-08-05 19:50:57'),(26,NULL,507.00,507.00,0.00,NULL,0.00,NULL,'Placeat laudantium et fugiat non porro omnis.',NULL,6,0,26,5,'YDa0snYQ65fbSYbkck9y','cancelled','2024-08-05 19:50:57','2024-08-05 19:50:57'),(27,NULL,400.00,400.00,0.00,NULL,0.00,NULL,'Voluptas quod impedit ut sit nihil fugit ut.',NULL,6,0,27,1,'VOM23MohNaC0X6rQKCGK','pending','2024-08-05 19:50:57','2024-08-05 19:50:57'),(28,NULL,179.00,179.00,0.00,NULL,0.00,NULL,'Animi quo optio ipsum.',NULL,1,0,28,2,'mSo6TrD1YCkxHzDPSwLK','cancelled','2024-08-05 19:50:57','2024-08-05 19:50:57'),(29,NULL,309.00,309.00,0.00,NULL,0.00,NULL,'Eum incidunt dolore sunt earum doloribus qui.',NULL,3,0,29,10,'AtmccesExZHV7k6i4xfL','processing','2024-08-05 19:50:57','2024-08-05 19:50:57'),(30,NULL,169.00,169.00,0.00,NULL,0.00,NULL,'Architecto fugit voluptas quas iure est voluptatem.',NULL,3,0,30,11,'HU23hmfGWS9hE8lJD8RE','processing','2024-08-05 19:50:57','2024-08-05 19:50:57'),(31,NULL,338.00,338.00,0.00,NULL,0.00,NULL,'Quia dolorum qui et sed perferendis atque.',NULL,6,0,31,5,'kisAp9wY3WThqviAGxhV','processing','2024-08-05 19:50:57','2024-08-05 19:50:57');
/*!40000 ALTER TABLE `ht_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_coupons`
--

DROP TABLE IF EXISTS `ht_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_coupons`
--

LOCK TABLES `ht_coupons` WRITE;
/*!40000 ALTER TABLE `ht_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_currencies`
--

DROP TABLE IF EXISTS `ht_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_currencies`
--

LOCK TABLES `ht_currencies` WRITE;
/*!40000 ALTER TABLE `ht_currencies` DISABLE KEYS */;
INSERT INTO `ht_currencies` VALUES (1,'USD','$',1,2,0,1,1,'2024-08-05 19:50:44','2024-08-05 19:50:44'),(2,'EUR','€',0,2,1,0,0.91,'2024-08-05 19:50:44','2024-08-05 19:50:44'),(3,'VND','₫',0,0,2,0,23717.5,'2024-08-05 19:50:44','2024-08-05 19:50:44');
/*!40000 ALTER TABLE `ht_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_customer_password_resets`
--

DROP TABLE IF EXISTS `ht_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_customer_password_resets`
--

LOCK TABLES `ht_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ht_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_customers`
--

DROP TABLE IF EXISTS `ht_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_customers`
--

LOCK TABLES `ht_customers` WRITE;
/*!40000 ALTER TABLE `ht_customers` DISABLE KEYS */;
INSERT INTO `ht_customers` VALUES (1,'Jarret','Dickens','wpouros@example.com','$2y$12$uRLDoKNm8p0.yMX0SgKubOfJsnqPGr5pOlU6y9SlgdBTrpWPYNd22','customers/1.jpg',NULL,'+12677293684',NULL,NULL,NULL,NULL,NULL,'2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,NULL),(2,'Katarina','Stiedemann','fblock@example.org','$2y$12$9FpsoHArreKUDuTWhrooUehBq/k9f9/nUOrsma1nlXLo/xVW6eOC6','customers/2.jpg',NULL,'+15593947112',NULL,NULL,NULL,NULL,NULL,'2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,NULL),(3,'Breanna','Purdy','eriberto86@example.org','$2y$12$7j28l.4vvs0goypz2L1dLu5e/USq0zAFEokRJyPP8ElLEzthUf76S','customers/3.jpg',NULL,'+12724969309',NULL,NULL,NULL,NULL,NULL,'2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,NULL),(4,'Maida','Braun','ihagenes@example.net','$2y$12$xIFak.mDF1S7psY5Wq8veeWZxnP572QF6xi59tsubypkNZ3ws7MGi','customers/4.jpg',NULL,'+13217773279',NULL,NULL,NULL,NULL,NULL,'2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,NULL),(5,'Francis','Daugherty','goldner.mallie@example.com','$2y$12$00aoUXgRDSuZI26/7pfw7u..ut5Oc5jRI8L2hx64rzmaM0nrlijr2','customers/5.jpg',NULL,'+14805281352',NULL,NULL,NULL,NULL,NULL,'2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,NULL),(6,'Unique','Adams','uschinner@example.com','$2y$12$ZUNhexcmf2gbzawG0r92vOhITqFZJ3LpsZyZS7zzrzU0enmkMIMza','customers/6.jpg',NULL,'+13808233094',NULL,NULL,NULL,NULL,NULL,'2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,NULL),(7,'Delaney','Willms','quitzon.vicky@example.org','$2y$12$u4PeEjy5NpZihxY1ck7JiOpSrkPLbhMPqocmdwEXXIoufmw2MoLbC','customers/7.jpg',NULL,'+15209186745',NULL,NULL,NULL,NULL,NULL,'2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,NULL),(8,'Mittie','Berge','padberg.jerrell@example.net','$2y$12$j.RDaFtvpq.6aMTcBkXQ8upLzdD06iASclL8Mj77ZDLBzi517IAEm','customers/8.jpg',NULL,'+12695899164',NULL,NULL,NULL,NULL,NULL,'2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,NULL),(9,'Jeanie','Strosin','gkling@example.org','$2y$12$Tyr7IZ5Tm541w.zplKaCnerNFcHG01z16e7BqLtQ.0E1eWcE.YT3.','customers/9.jpg',NULL,'+12014366647',NULL,NULL,NULL,NULL,NULL,'2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,NULL),(10,'Lynn','Lebsack','ubechtelar@example.com','$2y$12$2YVzKfJGOT3prPlF5Xof8OJZx4D4iFfGDm0JOe.vz/GmIla/nGkNG','customers/10.jpg',NULL,'+12834240090',NULL,NULL,NULL,NULL,NULL,'2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,NULL),(11,'Pablo','McCullough','customer@archielite.com','$2y$12$eijNvSMDuBN4DXmCI1ulcO33xmBl7wtAoVqsfSAlX/h6iwVWLwE.S','customers/2.jpg',NULL,'+18472506775',NULL,NULL,NULL,NULL,NULL,'2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,NULL);
/*!40000 ALTER TABLE `ht_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_features`
--

DROP TABLE IF EXISTS `ht_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_features`
--

LOCK TABLES `ht_features` WRITE;
/*!40000 ALTER TABLE `ht_features` DISABLE KEYS */;
INSERT INTO `ht_features` VALUES (1,'Have High Rating','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-rating',1,'published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(2,'Quiet Hours','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-clock',1,'published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(3,'Best Locations','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-location-pin',1,'published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(4,'Free Cancellation','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-clock-1',0,'published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(5,'Payment Options','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-credit-card',0,'published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(6,'Special Offers','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-discount',0,'published','2024-08-05 19:50:47','2024-08-05 19:50:47');
/*!40000 ALTER TABLE `ht_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_features_translations`
--

DROP TABLE IF EXISTS `ht_features_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_features_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_features_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_features_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_features_translations`
--

LOCK TABLES `ht_features_translations` WRITE;
/*!40000 ALTER TABLE `ht_features_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_features_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_food_types`
--

DROP TABLE IF EXISTS `ht_food_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_food_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_food_types`
--

LOCK TABLES `ht_food_types` WRITE;
/*!40000 ALTER TABLE `ht_food_types` DISABLE KEYS */;
INSERT INTO `ht_food_types` VALUES (1,'Chicken','flaticon-boiled','published','2024-08-05 19:50:45','2024-08-05 19:50:45'),(2,'Italian','flaticon-pizza','published','2024-08-05 19:50:45','2024-08-05 19:50:45'),(3,'Coffee','flaticon-coffee','published','2024-08-05 19:50:45','2024-08-05 19:50:45'),(4,'Bake Cake','flaticon-cake','published','2024-08-05 19:50:45','2024-08-05 19:50:45'),(5,'Cookies','flaticon-cookie','published','2024-08-05 19:50:45','2024-08-05 19:50:45'),(6,'Cocktail','flaticon-cocktail','published','2024-08-05 19:50:45','2024-08-05 19:50:45');
/*!40000 ALTER TABLE `ht_food_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_food_types_translations`
--

DROP TABLE IF EXISTS `ht_food_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_food_types_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_food_types_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ht_food_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_food_types_translations`
--

LOCK TABLES `ht_food_types_translations` WRITE;
/*!40000 ALTER TABLE `ht_food_types_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_food_types_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_foods`
--

DROP TABLE IF EXISTS `ht_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_foods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,0) unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `food_type_id` bigint unsigned NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_foods`
--

LOCK TABLES `ht_foods` WRITE;
/*!40000 ALTER TABLE `ht_foods` DISABLE KEYS */;
INSERT INTO `ht_foods` VALUES (1,'Eggs &amp; Bacon','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',196,NULL,1,'foods/01.jpg','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(2,'Tea or Coffee','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',180,NULL,1,'foods/02.jpg','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(3,'Chia Oatmeal','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',150,NULL,1,'foods/03.jpg','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(4,'Juice','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',185,NULL,1,'foods/04.jpg','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(5,'Chia Oatmeal','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',146,NULL,2,'foods/05.jpg','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(6,'Fruit Parfait','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',173,NULL,2,'foods/06.jpg','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(7,'Marmalade Selection','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',120,NULL,3,'foods/07.jpg','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(8,'Cheese Platen','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',177,NULL,4,'foods/08.jpg','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(9,'Avocado Toast','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',197,NULL,5,'foods/09.jpg','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(10,'Avocado Toast','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',107,NULL,6,'foods/10.jpg','published','2024-08-05 19:50:47','2024-08-05 19:50:47');
/*!40000 ALTER TABLE `ht_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_foods_translations`
--

DROP TABLE IF EXISTS `ht_foods_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_foods_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_foods_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_foods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_foods_translations`
--

LOCK TABLES `ht_foods_translations` WRITE;
/*!40000 ALTER TABLE `ht_foods_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_foods_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_invoice_items`
--

DROP TABLE IF EXISTS `ht_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_invoice_items`
--

LOCK TABLES `ht_invoice_items` WRITE;
/*!40000 ALTER TABLE `ht_invoice_items` DISABLE KEYS */;
INSERT INTO `ht_invoice_items` VALUES (1,1,'Relax Suite','',1,169.00,0.00,0.00,169.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(2,1,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(3,2,'Relax Suite','',1,169.00,0.00,0.00,169.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(4,2,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(5,3,'Pendora Fame','',1,103.00,0.00,0.00,103.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(6,3,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(7,4,'Family Suite','',1,150.00,0.00,0.00,150.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(8,4,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(9,5,'Pendora Fame','',1,103.00,0.00,0.00,103.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(10,5,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(11,6,'Relax Suite','',1,169.00,0.00,0.00,169.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(12,6,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(13,7,'Luxury Suite','',1,179.00,0.00,0.00,179.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(14,7,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(15,8,'Relax Suite','',1,169.00,0.00,0.00,169.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(16,8,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(17,9,'Pendora Fame','',1,103.00,0.00,0.00,103.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(18,9,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(19,10,'President Room','',1,154.00,0.00,0.00,154.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(20,10,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(21,11,'Junior Suite','',1,121.00,0.00,0.00,121.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(22,11,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(23,12,'Pacific Room','',1,121.00,0.00,0.00,121.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(24,12,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(25,13,'Junior Suite','',1,121.00,0.00,0.00,121.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(26,13,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(27,14,'Family Suite','',1,150.00,0.00,0.00,150.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(28,14,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(29,15,'Pendora Fame','',1,103.00,0.00,0.00,103.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(30,15,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(31,16,'Luxury Hall Of Fame','',1,200.00,0.00,0.00,200.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(32,16,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(33,17,'Family Suite','',1,150.00,0.00,0.00,150.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(34,17,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(35,18,'Luxury Suite','',1,179.00,0.00,0.00,179.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(36,18,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(37,19,'Pacific Room','',1,121.00,0.00,0.00,121.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(38,19,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(39,20,'Pacific Room','',1,121.00,0.00,0.00,121.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(40,20,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(41,21,'Junior Suite','',1,121.00,0.00,0.00,121.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(42,21,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(43,22,'Pendora Fame','',1,103.00,0.00,0.00,103.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(44,22,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(45,23,'Pacific Room','',1,121.00,0.00,0.00,121.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(46,23,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(47,24,'Pacific Room','',1,121.00,0.00,0.00,121.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(48,24,'Best Accommodation (extra service)','',1,50.00,0.00,0.00,50.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(49,25,'President Room','',1,154.00,0.00,0.00,154.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(50,25,'Best Accommodation (extra service)','',1,50.00,0.00,0.00,50.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(51,26,'Relax Suite','',1,169.00,0.00,0.00,169.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(52,26,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(53,27,'Luxury Hall Of Fame','',1,200.00,0.00,0.00,200.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(54,27,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(55,28,'Luxury Suite','',1,179.00,0.00,0.00,179.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(56,28,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(57,29,'Pendora Fame','',1,103.00,0.00,0.00,103.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(58,29,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(59,30,'Relax Suite','',1,169.00,0.00,0.00,169.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(60,30,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(61,31,'Relax Suite','',1,169.00,0.00,0.00,169.00,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(62,31,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2024-08-05 19:50:57','2024-08-05 19:50:57');
/*!40000 ALTER TABLE `ht_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_invoices`
--

DROP TABLE IF EXISTS `ht_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_invoices_code_unique` (`code`),
  KEY `ht_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `ht_invoices_payment_id_index` (`payment_id`),
  KEY `ht_invoices_status_index` (`status`),
  KEY `ht_invoices_customer_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_invoices`
--

LOCK TABLES `ht_invoices` WRITE;
/*!40000 ALTER TABLE `ht_invoices` DISABLE KEYS */;
INSERT INTO `ht_invoices` VALUES (1,11,'NelsonShanahan','christopher.wisozk@example.net','(434) 335-8513','466 Emerson Road\nNorth Brownbury, MD 56601, New Sydnie, Cummingsbury, Spain, 02671, ','Ex labore corrupti rerum ipsa maiores.',1,'Botble\\Hotel\\Models\\Booking',1,'INV-1',338.00,0.00,0.00,338.00,'canceled',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(2,5,'CurtJerde','mayer.aliya@example.org','1-360-794-1396','797 Hoeger Cape Apt. 552\nMillerfort, IN 77215, Nataliaborough, Port Vedamouth, Togo, 99103-9054, ','Vel ea sapiente non eos iure.',2,'Botble\\Hotel\\Models\\Booking',2,'INV-2',507.00,0.00,0.00,507.00,'canceled',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(3,1,'DarionRoob','deckow.kara@example.net','+18156967198','8496 Blanda Canyon\nWest Casandrafort, NC 37960-8782, Port Easter, South Domenica, Gambia, 81443-5822, ','Cupiditate deleniti in explicabo ut et et doloremque ipsa.',3,'Botble\\Hotel\\Models\\Booking',3,'INV-3',206.00,0.00,0.00,206.00,'completed','2024-08-05 19:50:56','2024-08-05 19:50:56','2024-08-05 19:50:56'),(4,1,'ElijahBode','marcelina74@example.net','757-570-7093','166 Alison Trail\nErdmanshire, DC 35139-6095, Connburgh, Kelsiehaven, Cuba, 64993-4861, ','Aut consequatur reiciendis libero numquam assumenda hic harum.',4,'Botble\\Hotel\\Models\\Booking',4,'INV-4',450.00,0.00,0.00,450.00,'canceled',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(5,3,'AylinConroy','lokuneva@example.net','804.691.1055','391 Bahringer Ramp Apt. 371\nLangshire, AL 73498, South Johathan, Legroschester, Nicaragua, 34027, ','Eos tenetur explicabo quae atque odio illum quia.',5,'Botble\\Hotel\\Models\\Booking',5,'INV-5',103.00,0.00,0.00,103.00,'canceled',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(6,6,'DustyLeannon','grace.lesch@example.net','+1.856.415.3951','84891 Sydni Hills Apt. 728\nLake Hillarymouth, LA 16208, West Greyson, South Lois, Luxembourg, 30977-8328, ','Sunt voluptates necessitatibus asperiores nobis iure.',6,'Botble\\Hotel\\Models\\Booking',6,'INV-6',338.00,0.00,0.00,338.00,'pending',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(7,4,'SunnyVeum','hazel01@example.com','212.404.2667','5628 Estel Park Apt. 922\nWest Cornelius, KY 61505-3195, Blandabury, Lake Derick, Burundi, 96546-5509, ','Aliquid alias corrupti delectus dicta eveniet quidem sed eos.',7,'Botble\\Hotel\\Models\\Booking',7,'INV-7',537.00,0.00,0.00,537.00,'canceled',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(8,4,'KrystelBuckridge','dariana.johns@example.org','+1 (262) 567-3374','95082 Hoppe Gardens Apt. 545\nNew Flaviomouth, CT 31609-4903, Pfefferberg, New Harrison, Nicaragua, 50491-6955, ','Voluptatem atque dolores labore aliquid distinctio placeat.',8,'Botble\\Hotel\\Models\\Booking',8,'INV-8',169.00,0.00,0.00,169.00,'pending',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(9,10,'FloydTillman','irving14@example.net','607-264-9119','454 Karen Loop\nBrookmouth, TX 72996-2762, Adamouth, Rainaview, Tokelau, 40088, ','Dolorum nobis quo exercitationem veritatis sunt in voluptatum neque.',9,'Botble\\Hotel\\Models\\Booking',9,'INV-9',206.00,0.00,0.00,206.00,'canceled',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(10,4,'SeanBlanda','wyman.casimer@example.org','+1.678.388.5027','237 Sandra Hill Suite 496\nRigobertomouth, PA 13769, Adeleville, North Tremaineville, Canada, 97097, ','Veniam perspiciatis dicta fugit cumque ab.',10,'Botble\\Hotel\\Models\\Booking',10,'INV-10',462.00,0.00,0.00,462.00,'canceled',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(11,3,'AllieHeathcote','beier.hannah@example.org','458.628.8287','993 Bashirian Port Apt. 125\nMeghanstad, WA 12293-6621, New Nedra, Blairfort, Lao People\'s Democratic Republic, 63954-9025, ','Provident eveniet ullam minima maxime corrupti enim.',11,'Botble\\Hotel\\Models\\Booking',11,'INV-11',242.00,0.00,0.00,242.00,'completed','2024-08-05 19:50:56','2024-08-05 19:50:56','2024-08-05 19:50:56'),(12,5,'BlakeBradtke','gbernhard@example.com','(928) 449-5022','9433 Luis Terrace Suite 820\nNew Olin, OR 03969, New Mervin, Joshuamouth, Bulgaria, 54610-9040, ','Aut minima qui excepturi laudantium a ipsa.',12,'Botble\\Hotel\\Models\\Booking',12,'INV-12',121.00,0.00,0.00,121.00,'canceled',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(13,7,'MonaCollier','nayeli51@example.org','+13218413122','3122 Dare Point Suite 774\nTyreeside, MO 51397, Priceborough, North Jovanville, Pitcairn Islands, 95764, ','Explicabo eius illo sequi culpa.',13,'Botble\\Hotel\\Models\\Booking',13,'INV-13',121.00,0.00,0.00,121.00,'canceled',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(14,5,'SummerSchaefer','veda91@example.org','(254) 582-6880','24960 Powlowski Locks\nPort Roel, LA 13441-0320, McCulloughfurt, Lake Kasandraborough, Somalia, 43196-2341, ','Earum quidem ratione tempora beatae consequatur et.',14,'Botble\\Hotel\\Models\\Booking',14,'INV-14',300.00,0.00,0.00,300.00,'canceled',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(15,6,'WilmerKuhn','xmorar@example.com','(573) 893-8189','67154 Antwon Tunnel Suite 037\nWest Anahi, WI 36001, Tillmanfort, South Alenahaven, Poland, 41455-7062, ','Dolores totam aliquam et velit sequi.',15,'Botble\\Hotel\\Models\\Booking',15,'INV-15',206.00,0.00,0.00,206.00,'canceled',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56'),(16,1,'XavierMetz','madelyn.kunze@example.org','(346) 468-8431','29721 Bernier Fields\nLake Mikelton, AL 53287-8548, Kozeymouth, Larsonville, Egypt, 98968-9306, ','A velit praesentium aliquid magnam aut eius voluptas aut.',16,'Botble\\Hotel\\Models\\Booking',16,'INV-16',200.00,0.00,0.00,200.00,'canceled',NULL,'2024-08-05 19:50:56','2024-08-05 19:50:57'),(17,7,'MohammedNolan','loma45@example.org','814.405.7336','56739 Benny Track Suite 443\nAmiyashire, ND 13981-8597, Fernberg, West Billietown, Senegal, 45397-3641, ','Quia ratione atque mollitia fugiat exercitationem rerum.',17,'Botble\\Hotel\\Models\\Booking',17,'INV-17',150.00,0.00,0.00,150.00,'completed','2024-08-05 19:50:57','2024-08-05 19:50:57','2024-08-05 19:50:57'),(18,5,'EvieGoodwin','omayert@example.org','651.577.4449','41616 Mitchell Viaduct Apt. 891\nInesborough, WV 22078, Lindsayfurt, Hermannside, Reunion, 76422-7186, ','Non modi est vel deserunt et.',18,'Botble\\Hotel\\Models\\Booking',18,'INV-18',537.00,0.00,0.00,537.00,'canceled',NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(19,5,'KrystelHeaney','haley.weston@example.com','564.892.2676','3853 Lacy Locks Apt. 380\nMohrview, ID 29648-6468, Port Clifford, Port Terrence, Montserrat, 05841-0908, ','Molestiae debitis quos non voluptate id dignissimos.',19,'Botble\\Hotel\\Models\\Booking',19,'INV-19',121.00,0.00,0.00,121.00,'completed','2024-08-05 19:50:57','2024-08-05 19:50:57','2024-08-05 19:50:57'),(20,5,'NicholausPowlowski','tomas.doyle@example.com','+1-534-682-6551','65185 Jody Villages\nAlethaville, NJ 05449, Jessicamouth, Hellerberg, Guinea-Bissau, 49731-3108, ','Dolorum fuga non molestias voluptate eaque.',20,'Botble\\Hotel\\Models\\Booking',20,'INV-20',242.00,0.00,0.00,242.00,'canceled',NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(21,3,'EthanHoppe','gerhold.chandler@example.com','(469) 617-7619','777 Bauch Rapid Suite 946\nEast Frankie, AK 90694-7961, Huelshaven, Lukasfort, New Zealand, 47474-7375, ','Veniam quae doloremque doloribus quo.',21,'Botble\\Hotel\\Models\\Booking',21,'INV-21',242.00,0.00,0.00,242.00,'canceled',NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(22,9,'TimmyRaynor','chaim94@example.com','+1-906-230-7086','10953 Halvorson Dam\nWolfmouth, KY 98483, West Aniyaland, Brucestad, Congo, 47782, ','Impedit sunt consequatur quasi repellendus enim illo.',22,'Botble\\Hotel\\Models\\Booking',22,'INV-22',309.00,0.00,0.00,309.00,'canceled',NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(23,9,'AntoninaBradtke','lamont.kris@example.org','234-344-0844','694 Josefa Crossroad Suite 840\nLake Caleb, ME 88562, Lake Hoseamouth, East Jimmy, Anguilla, 66202-7118, ','Praesentium sapiente quae voluptatem laborum.',23,'Botble\\Hotel\\Models\\Booking',23,'INV-23',363.00,0.00,0.00,363.00,'canceled',NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(24,11,'RoxanneKessler','elmo.zboncak@example.com','351-968-3682','8851 Wyman Trail Suite 059\nNew Cheyanne, IN 98551, Sporermouth, West Lauren, Finland, 27816, ','Ad optio vel culpa est quaerat.',24,'Botble\\Hotel\\Models\\Booking',24,'INV-24',363.00,0.00,0.00,363.00,'completed','2024-08-05 19:50:57','2024-08-05 19:50:57','2024-08-05 19:50:57'),(25,2,'RandiBins','oconnell.brandon@example.org','614.764.9035','411 Suzanne Cove\nTianaport, IN 17948-6650, Jensenfurt, Vincechester, New Zealand, 50456-9273, ','Laboriosam debitis voluptate doloribus aut delectus.',25,'Botble\\Hotel\\Models\\Booking',25,'INV-25',308.00,0.00,0.00,308.00,'canceled',NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(26,5,'AdrianWard','cletus.wyman@example.com','+1-585-518-2770','54859 Bailey Cliff\nLorainefurt, WV 82527-1547, Lyricberg, Swiftfort, Turkmenistan, 16943-5051, ','Placeat laudantium et fugiat non porro omnis.',26,'Botble\\Hotel\\Models\\Booking',26,'INV-26',507.00,0.00,0.00,507.00,'canceled',NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(27,1,'TravisLehner','bryana92@example.org','+1-667-424-5607','60180 Birdie Burgs\nLake Keenan, TN 74261-8124, South Arlenetown, Dimitristad, Iceland, 65854, ','Voluptas quod impedit ut sit nihil fugit ut.',27,'Botble\\Hotel\\Models\\Booking',27,'INV-27',400.00,0.00,0.00,400.00,'canceled',NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(28,2,'CeliaRatke','kkerluke@example.net','660-925-3534','7506 Ankunding Forge Apt. 484\nSchneiderport, PA 63918, Alfonzoburgh, Fayebury, Macao, 34658, ','Animi quo optio ipsum.',28,'Botble\\Hotel\\Models\\Booking',28,'INV-28',179.00,0.00,0.00,179.00,'canceled',NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(29,10,'MaudRunolfsdottir','fwhite@example.org','947.271.9521','73743 Orville Spur Suite 358\nGerhardfort, ND 49893-9739, New Willow, Darbyland, Morocco, 16521-1648, ','Eum incidunt dolore sunt earum doloribus qui.',29,'Botble\\Hotel\\Models\\Booking',29,'INV-29',309.00,0.00,0.00,309.00,'canceled',NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57'),(30,11,'DanaGraham','volkman.nicole@example.net','+19187844358','53487 Botsford Key Apt. 804\nLake Jermeyborough, WA 29292-2623, Bruenmouth, Romaguerahaven, Korea, 74251, ','Architecto fugit voluptas quas iure est voluptatem.',30,'Botble\\Hotel\\Models\\Booking',30,'INV-30',169.00,0.00,0.00,169.00,'completed','2024-08-05 19:50:57','2024-08-05 19:50:57','2024-08-05 19:50:57'),(31,5,'JulianaGerhold','alfred.bartoletti@example.org','+1-802-261-3883','1143 Davis Plain Apt. 799\nPort Travis, OH 97900, Rodport, Mckennahaven, Anguilla, 71278, ','Quia dolorum qui et sed perferendis atque.',31,'Botble\\Hotel\\Models\\Booking',31,'INV-31',338.00,0.00,0.00,338.00,'pending',NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57');
/*!40000 ALTER TABLE `ht_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_places`
--

DROP TABLE IF EXISTS `ht_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_places` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_places`
--

LOCK TABLES `ht_places` WRITE;
/*!40000 ALTER TABLE `ht_places` DISABLE KEYS */;
INSERT INTO `ht_places` VALUES (1,'Duplex Restaurant','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/01.jpg','published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(2,'Overnight Bars','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/02.jpg','published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(3,'Beautiful Beach','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/03.jpg','published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(4,'Beautiful Spa','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/04.jpg','published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(5,'Duplex Golf','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/05.jpg','published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(6,'Luxury Restaurant','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/06.jpg','published','2024-08-05 19:50:52','2024-08-05 19:50:52');
/*!40000 ALTER TABLE `ht_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_places_translations`
--

DROP TABLE IF EXISTS `ht_places_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_places_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_places_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_places_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_places_translations`
--

LOCK TABLES `ht_places_translations` WRITE;
/*!40000 ALTER TABLE `ht_places_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_places_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_categories`
--

DROP TABLE IF EXISTS `ht_room_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_categories`
--

LOCK TABLES `ht_room_categories` WRITE;
/*!40000 ALTER TABLE `ht_room_categories` DISABLE KEYS */;
INSERT INTO `ht_room_categories` VALUES (1,'Luxury','published','2024-08-05 19:50:44','2024-08-05 19:50:44',0,1),(2,'Family','published','2024-08-05 19:50:44','2024-08-05 19:50:44',0,1),(3,'Double Bed','published','2024-08-05 19:50:44','2024-08-05 19:50:44',0,1),(4,'Relax','published','2024-08-05 19:50:44','2024-08-05 19:50:44',0,1);
/*!40000 ALTER TABLE `ht_room_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_categories_translations`
--

DROP TABLE IF EXISTS `ht_room_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_room_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ht_room_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_categories_translations`
--

LOCK TABLES `ht_room_categories_translations` WRITE;
/*!40000 ALTER TABLE `ht_room_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_room_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_dates`
--

DROP TABLE IF EXISTS `ht_room_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_dates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `value` decimal(15,2) DEFAULT NULL,
  `value_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `max_guests` tinyint DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `note_to_customer` text COLLATE utf8mb4_unicode_ci,
  `note_to_admin` text COLLATE utf8mb4_unicode_ci,
  `number_of_rooms` smallint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_dates`
--

LOCK TABLES `ht_room_dates` WRITE;
/*!40000 ALTER TABLE `ht_room_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_room_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_reviews`
--

DROP TABLE IF EXISTS `ht_room_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `room_id` int NOT NULL,
  `star` tinyint NOT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_reviews`
--

LOCK TABLES `ht_room_reviews` WRITE;
/*!40000 ALTER TABLE `ht_room_reviews` DISABLE KEYS */;
INSERT INTO `ht_room_reviews` VALUES (1,11,3,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(2,10,6,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(3,3,4,4,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(4,8,2,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(5,11,4,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(6,5,7,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(7,4,4,5,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(8,8,2,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(9,6,6,4,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(10,4,4,5,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(11,6,4,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(12,10,3,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(13,1,6,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(14,1,6,5,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(15,2,5,5,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(16,1,1,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(17,2,7,5,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(18,7,1,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(19,9,6,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(20,8,2,5,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(21,2,1,4,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(22,6,4,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(23,4,3,5,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(24,3,7,5,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(25,1,4,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(26,2,6,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(27,10,7,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(28,4,1,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(29,6,5,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(30,10,7,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(31,3,4,4,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(32,3,5,5,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(33,10,3,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(34,11,5,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(35,10,6,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(36,10,8,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(37,8,8,5,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(38,5,4,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(39,1,3,5,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(40,2,3,5,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(41,1,4,5,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(42,8,8,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(43,3,6,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(44,6,3,5,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(45,11,3,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(46,6,8,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(47,6,2,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(48,9,8,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(49,5,1,5,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51'),(50,3,7,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2024-08-05 19:50:51','2024-08-05 19:50:51');
/*!40000 ALTER TABLE `ht_room_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_rooms`
--

DROP TABLE IF EXISTS `ht_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,0) unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `number_of_rooms` int unsigned DEFAULT '0',
  `number_of_beds` int unsigned DEFAULT '0',
  `size` int unsigned DEFAULT '0',
  `max_adults` int DEFAULT '0',
  `max_children` int DEFAULT '0',
  `room_category_id` bigint unsigned DEFAULT NULL,
  `tax_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_rooms`
--

LOCK TABLES `ht_rooms` WRITE;
/*!40000 ALTER TABLE `ht_rooms` DISABLE KEYS */;
INSERT INTO `ht_rooms` VALUES (1,'Luxury Hall Of Fame','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,0,'[\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',200,NULL,3,2,187,5,3,1,1,'published','2024-08-05 19:50:45','2024-08-05 19:50:45',0),(2,'Pendora Fame','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',103,NULL,10,4,110,5,1,1,1,'published','2024-08-05 19:50:45','2024-08-05 19:50:45',0),(3,'Pacific Room','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/03.jpg\",\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',121,NULL,7,4,141,2,3,1,1,'published','2024-08-05 19:50:45','2024-08-05 19:50:45',0),(4,'Junior Suite','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,0,'[\"rooms\\/04.jpg\",\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',121,NULL,10,1,116,3,2,1,1,'published','2024-08-05 19:50:45','2024-08-05 19:50:45',0),(5,'Family Suite','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/05.jpg\"]',150,NULL,3,1,196,4,3,1,1,'published','2024-08-05 19:50:45','2024-08-05 19:50:45',0),(6,'Relax Suite','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/06.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/01.jpg\"]',169,NULL,8,1,153,6,2,3,1,'published','2024-08-05 19:50:45','2024-08-05 19:50:45',0),(7,'Luxury Suite','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',179,NULL,4,1,185,3,1,4,1,'published','2024-08-05 19:50:45','2024-08-05 19:50:45',0),(8,'President Room','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,1,'[\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',154,NULL,9,1,192,5,2,1,1,'published','2024-08-05 19:50:45','2024-08-05 19:50:45',0);
/*!40000 ALTER TABLE `ht_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_rooms_amenities`
--

DROP TABLE IF EXISTS `ht_rooms_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_rooms_amenities` (
  `amenity_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`amenity_id`,`room_id`),
  KEY `ht_rooms_amenities_amenity_id_index` (`amenity_id`),
  KEY `ht_rooms_amenities_room_id_index` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_rooms_amenities`
--

LOCK TABLES `ht_rooms_amenities` WRITE;
/*!40000 ALTER TABLE `ht_rooms_amenities` DISABLE KEYS */;
INSERT INTO `ht_rooms_amenities` VALUES (1,1,NULL,NULL),(1,2,NULL,NULL),(1,3,NULL,NULL),(1,4,NULL,NULL),(1,5,NULL,NULL),(1,6,NULL,NULL),(1,7,NULL,NULL),(1,8,NULL,NULL),(2,1,NULL,NULL),(2,2,NULL,NULL),(2,3,NULL,NULL),(2,4,NULL,NULL),(2,5,NULL,NULL),(2,6,NULL,NULL),(2,7,NULL,NULL),(2,8,NULL,NULL),(3,1,NULL,NULL),(3,2,NULL,NULL),(3,3,NULL,NULL),(3,4,NULL,NULL),(3,5,NULL,NULL),(3,6,NULL,NULL),(3,7,NULL,NULL),(3,8,NULL,NULL),(4,1,NULL,NULL),(4,2,NULL,NULL),(4,3,NULL,NULL),(4,4,NULL,NULL),(4,5,NULL,NULL),(4,6,NULL,NULL),(4,7,NULL,NULL),(4,8,NULL,NULL),(6,1,NULL,NULL),(6,2,NULL,NULL),(6,3,NULL,NULL),(6,4,NULL,NULL),(6,5,NULL,NULL),(6,6,NULL,NULL),(6,7,NULL,NULL),(6,8,NULL,NULL),(7,1,NULL,NULL),(7,2,NULL,NULL),(7,3,NULL,NULL),(7,4,NULL,NULL),(7,5,NULL,NULL),(7,6,NULL,NULL),(7,7,NULL,NULL),(7,8,NULL,NULL),(9,1,NULL,NULL),(9,2,NULL,NULL),(9,3,NULL,NULL),(9,4,NULL,NULL),(9,5,NULL,NULL),(9,6,NULL,NULL),(9,7,NULL,NULL),(9,8,NULL,NULL),(11,1,NULL,NULL),(11,2,NULL,NULL),(11,3,NULL,NULL),(11,4,NULL,NULL),(11,5,NULL,NULL),(11,6,NULL,NULL),(11,7,NULL,NULL),(11,8,NULL,NULL);
/*!40000 ALTER TABLE `ht_rooms_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_rooms_translations`
--

DROP TABLE IF EXISTS `ht_rooms_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_rooms_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_rooms_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_rooms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_rooms_translations`
--

LOCK TABLES `ht_rooms_translations` WRITE;
/*!40000 ALTER TABLE `ht_rooms_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_rooms_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_services`
--

DROP TABLE IF EXISTS `ht_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,0) unsigned DEFAULT NULL,
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'once',
  `currency_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_services`
--

LOCK TABLES `ht_services` WRITE;
/*!40000 ALTER TABLE `ht_services` DISABLE KEYS */;
INSERT INTO `ht_services` VALUES (1,'Quality Room','Indulge in the epitome of comfort and style with our Quality Room. Immerse yourself in elegant furnishings, unwind in a plush bed, and enjoy modern amenities. From the private ensuite bathroom to the high-speed Wi-Fi, every detail is designed for your relaxation. Choose between city, garden, or pool views, and experience a retreat that embodies luxury and convenience.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <br>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/general/video-background-02.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <br>\n\n        <h3>Why Choose This Service</h3>\n        <br>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <br>\n        <h3>We guarantee to deliver</h3>\n        <br>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/general/04.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n        <br>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',100,'once',NULL,'amenities/icon-1.png','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(2,'Privet Beach','Discover a world of exclusivity with our Private Beach Access service. Step onto a pristine shore reserved for our guests, where sun, sand, and waves meet ultimate tranquility. Lounge in comfortable beachside seating, enjoy dedicated service, and bask in the beauty of a secluded paradise.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <br>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/general/video-background-02.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <br>\n\n        <h3>Why Choose This Service</h3>\n        <br>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <br>\n        <h3>We guarantee to deliver</h3>\n        <br>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/general/04.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n        <br>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',30,'once',NULL,'amenities/icon-2.png','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(3,'Best Accommodation','Experience the pinnacle of luxury with our Best Accommodation service. Immerse yourself in meticulously designed spaces that combine opulence and comfort. From elegant furnishings to cutting-edge amenities, every detail is curated to exceed your expectations.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <br>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/general/video-background-02.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <br>\n\n        <h3>Why Choose This Service</h3>\n        <br>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <br>\n        <h3>We guarantee to deliver</h3>\n        <br>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/general/04.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n        <br>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',50,'once',NULL,'amenities/icon-3.png','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(4,'Wellness &amp; Spa','Embark on a journey of rejuvenation and self-care with our Wellness &amp; Spa service. Immerse yourself in a sanctuary of relaxation, where skilled therapists pamper you with a range of invigorating treatments.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <br>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/general/video-background-02.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <br>\n\n        <h3>Why Choose This Service</h3>\n        <br>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <br>\n        <h3>We guarantee to deliver</h3>\n        <br>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/general/04.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n        <br>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',10,'once',NULL,'amenities/icon-4.png','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(5,'Restaurants &amp; Bars','Savor a world of flavors at our Restaurants &amp; Bars. Indulge in culinary delights crafted by talented chefs, offering a diverse range of cuisines to tantalize your taste buds. From elegant dining to vibrant social hubs, our venues provide a gastronomic journey paired with a selection of beverages that cater to every palate. .','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <br>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/general/video-background-02.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <br>\n\n        <h3>Why Choose This Service</h3>\n        <br>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <br>\n        <h3>We guarantee to deliver</h3>\n        <br>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/general/04.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n        <br>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',10,'once',NULL,'amenities/icon-5.png','published','2024-08-05 19:50:47','2024-08-05 19:50:47'),(6,'Special Offers','Unlock unbeatable value with our Special Offers. Experience the luxury of Hotel at exceptional rates, whether you\'re planning a romantic getaway, a family vacation, or a business retreat. Our exclusive packages cater to every traveler\'s needs, providing an unforgettable stay enriched with added perks.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <br>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/general/video-background-02.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <br>\n\n        <h3>Why Choose This Service</h3>\n        <br>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <br>\n        <h3>We guarantee to deliver</h3>\n        <br>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n\n        <br>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-md-12\">\n                    <figure class=\"image\"><img src=\"https://miranda.test/storage/general/04.jpg\" alt=\"image\"></figure>\n                </div>\n            </div>\n        </div>\n        <br>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',10,'once',NULL,'amenities/icon-6.png','published','2024-08-05 19:50:47','2024-08-05 19:50:47');
/*!40000 ALTER TABLE `ht_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_services_translations`
--

DROP TABLE IF EXISTS `ht_services_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_services_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_services_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_services_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_services_translations`
--

LOCK TABLES `ht_services_translations` WRITE;
/*!40000 ALTER TABLE `ht_services_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_services_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_taxes`
--

DROP TABLE IF EXISTS `ht_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_taxes`
--

LOCK TABLES `ht_taxes` WRITE;
/*!40000 ALTER TABLE `ht_taxes` DISABLE KEYS */;
INSERT INTO `ht_taxes` VALUES (1,'VAT',10.000000,1,'published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(2,'None',0.000000,2,'published','2024-08-05 19:50:52','2024-08-05 19:50:52');
/*!40000 ALTER TABLE `ht_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','58145cbcd972bae3bc348d1cf3b10b6a',1,'Botble\\Testimonial\\Models\\Testimonial'),(2,'en_US','560d735a178cbef2e40d43de8368eefa',2,'Botble\\Testimonial\\Models\\Testimonial'),(3,'en_US','0d8d8f04dd62058157bab16e6681a9de',3,'Botble\\Testimonial\\Models\\Testimonial'),(4,'en_US','72823218c48eae0b0da32fcd54939611',1,'Botble\\Menu\\Models\\MenuLocation'),(5,'en_US','32a197f7170d5ca7285c4e6813e09fd1',1,'Botble\\Menu\\Models\\Menu'),(6,'en_US','92a448eb6c12b85af367bb5c4bc7ecb6',2,'Botble\\Menu\\Models\\MenuLocation'),(7,'en_US','2cd6da538bd5355ef295576c8a687f06',2,'Botble\\Menu\\Models\\Menu'),(8,'en_US','ee6fc850503a6299b721ad0c45b0e219',3,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'01','01',1,'image/jpeg',9425,'news/01.jpg','[]','2024-08-05 19:50:43','2024-08-05 19:50:43',NULL,'public'),(2,0,'02','02',1,'image/jpeg',9425,'news/02.jpg','[]','2024-08-05 19:50:43','2024-08-05 19:50:43',NULL,'public'),(3,0,'03','03',1,'image/jpeg',9425,'news/03.jpg','[]','2024-08-05 19:50:43','2024-08-05 19:50:43',NULL,'public'),(4,0,'04','04',1,'image/jpeg',9425,'news/04.jpg','[]','2024-08-05 19:50:43','2024-08-05 19:50:43',NULL,'public'),(5,0,'05','05',1,'image/jpeg',9425,'news/05.jpg','[]','2024-08-05 19:50:44','2024-08-05 19:50:44',NULL,'public'),(6,0,'06','06',1,'image/jpeg',9425,'news/06.jpg','[]','2024-08-05 19:50:44','2024-08-05 19:50:44',NULL,'public'),(7,0,'01','01',2,'image/jpeg',10738,'rooms/01.jpg','[]','2024-08-05 19:50:44','2024-08-05 19:50:44',NULL,'public'),(8,0,'02','02',2,'image/jpeg',10738,'rooms/02.jpg','[]','2024-08-05 19:50:44','2024-08-05 19:50:44',NULL,'public'),(9,0,'03','03',2,'image/jpeg',10738,'rooms/03.jpg','[]','2024-08-05 19:50:44','2024-08-05 19:50:44',NULL,'public'),(10,0,'04','04',2,'image/jpeg',10738,'rooms/04.jpg','[]','2024-08-05 19:50:45','2024-08-05 19:50:45',NULL,'public'),(11,0,'05','05',2,'image/jpeg',10738,'rooms/05.jpg','[]','2024-08-05 19:50:45','2024-08-05 19:50:45',NULL,'public'),(12,0,'06','06',2,'image/jpeg',10738,'rooms/06.jpg','[]','2024-08-05 19:50:45','2024-08-05 19:50:45',NULL,'public'),(13,0,'01','01',3,'image/jpeg',9803,'foods/01.jpg','[]','2024-08-05 19:50:45','2024-08-05 19:50:45',NULL,'public'),(14,0,'02','02',3,'image/jpeg',9803,'foods/02.jpg','[]','2024-08-05 19:50:45','2024-08-05 19:50:45',NULL,'public'),(15,0,'03','03',3,'image/jpeg',9803,'foods/03.jpg','[]','2024-08-05 19:50:45','2024-08-05 19:50:45',NULL,'public'),(16,0,'04','04',3,'image/jpeg',9803,'foods/04.jpg','[]','2024-08-05 19:50:46','2024-08-05 19:50:46',NULL,'public'),(17,0,'05','05',3,'image/jpeg',9803,'foods/05.jpg','[]','2024-08-05 19:50:46','2024-08-05 19:50:46',NULL,'public'),(18,0,'06','06',3,'image/jpeg',9803,'foods/06.jpg','[]','2024-08-05 19:50:46','2024-08-05 19:50:46',NULL,'public'),(19,0,'07','07',3,'image/jpeg',9803,'foods/07.jpg','[]','2024-08-05 19:50:46','2024-08-05 19:50:46',NULL,'public'),(20,0,'08','08',3,'image/jpeg',9803,'foods/08.jpg','[]','2024-08-05 19:50:46','2024-08-05 19:50:46',NULL,'public'),(21,0,'09','09',3,'image/jpeg',9803,'foods/09.jpg','[]','2024-08-05 19:50:46','2024-08-05 19:50:46',NULL,'public'),(22,0,'10','10',3,'image/jpeg',9803,'foods/10.jpg','[]','2024-08-05 19:50:46','2024-08-05 19:50:46',NULL,'public'),(23,0,'icon-1','icon-1',4,'image/png',4576,'amenities/icon-1.png','[]','2024-08-05 19:50:47','2024-08-05 19:50:47',NULL,'public'),(24,0,'icon-2','icon-2',4,'image/png',7424,'amenities/icon-2.png','[]','2024-08-05 19:50:47','2024-08-05 19:50:47',NULL,'public'),(25,0,'icon-3','icon-3',4,'image/png',3234,'amenities/icon-3.png','[]','2024-08-05 19:50:47','2024-08-05 19:50:47',NULL,'public'),(26,0,'icon-4','icon-4',4,'image/png',8444,'amenities/icon-4.png','[]','2024-08-05 19:50:47','2024-08-05 19:50:47',NULL,'public'),(27,0,'icon-5','icon-5',4,'image/png',6196,'amenities/icon-5.png','[]','2024-08-05 19:50:47','2024-08-05 19:50:47',NULL,'public'),(28,0,'icon-6','icon-6',4,'image/png',9699,'amenities/icon-6.png','[]','2024-08-05 19:50:47','2024-08-05 19:50:47',NULL,'public'),(29,0,'1','1',5,'image/jpeg',8581,'customers/1.jpg','[]','2024-08-05 19:50:47','2024-08-05 19:50:47',NULL,'public'),(30,0,'10','10',5,'image/jpeg',20004,'customers/10.jpg','[]','2024-08-05 19:50:47','2024-08-05 19:50:47',NULL,'public'),(31,0,'2','2',5,'image/jpeg',14257,'customers/2.jpg','[]','2024-08-05 19:50:48','2024-08-05 19:50:48',NULL,'public'),(32,0,'3','3',5,'image/jpeg',14702,'customers/3.jpg','[]','2024-08-05 19:50:48','2024-08-05 19:50:48',NULL,'public'),(33,0,'4','4',5,'image/jpeg',19699,'customers/4.jpg','[]','2024-08-05 19:50:48','2024-08-05 19:50:48',NULL,'public'),(34,0,'5','5',5,'image/jpeg',10260,'customers/5.jpg','[]','2024-08-05 19:50:48','2024-08-05 19:50:48',NULL,'public'),(35,0,'6','6',5,'image/jpeg',8476,'customers/6.jpg','[]','2024-08-05 19:50:48','2024-08-05 19:50:48',NULL,'public'),(36,0,'7','7',5,'image/jpeg',14388,'customers/7.jpg','[]','2024-08-05 19:50:48','2024-08-05 19:50:48',NULL,'public'),(37,0,'8','8',5,'image/jpeg',14340,'customers/8.jpg','[]','2024-08-05 19:50:48','2024-08-05 19:50:48',NULL,'public'),(38,0,'9','9',5,'image/jpeg',4396,'customers/9.jpg','[]','2024-08-05 19:50:48','2024-08-05 19:50:48',NULL,'public'),(39,0,'01','01',6,'image/jpeg',8820,'places/01.jpg','[]','2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,'public'),(40,0,'02','02',6,'image/jpeg',8820,'places/02.jpg','[]','2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,'public'),(41,0,'03','03',6,'image/jpeg',8820,'places/03.jpg','[]','2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,'public'),(42,0,'04','04',6,'image/jpeg',8820,'places/04.jpg','[]','2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,'public'),(43,0,'05','05',6,'image/jpeg',8820,'places/05.jpg','[]','2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,'public'),(44,0,'06','06',6,'image/jpeg',8820,'places/06.jpg','[]','2024-08-05 19:50:51','2024-08-05 19:50:51',NULL,'public'),(45,0,'01','01',7,'image/png',9803,'testimonials/01.png','[]','2024-08-05 19:50:52','2024-08-05 19:50:52',NULL,'public'),(46,0,'02','02',7,'image/png',9803,'testimonials/02.png','[]','2024-08-05 19:50:52','2024-08-05 19:50:52',NULL,'public'),(47,0,'03','03',7,'image/png',9803,'testimonials/03.png','[]','2024-08-05 19:50:52','2024-08-05 19:50:52',NULL,'public'),(48,0,'01','01',8,'image/jpeg',9803,'galleries/01.jpg','[]','2024-08-05 19:50:52','2024-08-05 19:50:52',NULL,'public'),(49,0,'02','02',8,'image/jpeg',9803,'galleries/02.jpg','[]','2024-08-05 19:50:52','2024-08-05 19:50:52',NULL,'public'),(50,0,'03','03',8,'image/jpeg',9803,'galleries/03.jpg','[]','2024-08-05 19:50:52','2024-08-05 19:50:52',NULL,'public'),(51,0,'04','04',8,'image/jpeg',9803,'galleries/04.jpg','[]','2024-08-05 19:50:53','2024-08-05 19:50:53',NULL,'public'),(52,0,'05','05',8,'image/jpeg',9803,'galleries/05.jpg','[]','2024-08-05 19:50:53','2024-08-05 19:50:53',NULL,'public'),(53,0,'06','06',8,'image/jpeg',9803,'galleries/06.jpg','[]','2024-08-05 19:50:53','2024-08-05 19:50:53',NULL,'public'),(54,0,'07','07',8,'image/jpeg',9803,'galleries/07.jpg','[]','2024-08-05 19:50:53','2024-08-05 19:50:53',NULL,'public'),(55,0,'08','08',8,'image/jpeg',9803,'galleries/08.jpg','[]','2024-08-05 19:50:53','2024-08-05 19:50:53',NULL,'public'),(56,0,'01','01',9,'image/jpeg',4038,'general/01.jpg','[]','2024-08-05 19:50:54','2024-08-05 19:50:54',NULL,'public'),(57,0,'02','02',9,'image/jpeg',2960,'general/02.jpg','[]','2024-08-05 19:50:54','2024-08-05 19:50:54',NULL,'public'),(58,0,'03','03',9,'image/jpeg',5120,'general/03.jpg','[]','2024-08-05 19:50:54','2024-08-05 19:50:54',NULL,'public'),(59,0,'04','04',9,'image/jpeg',15702,'general/04.jpg','[]','2024-08-05 19:50:54','2024-08-05 19:50:54',NULL,'public'),(60,0,'banner-news','banner-news',9,'image/jpeg',8643,'general/banner-news.jpg','[]','2024-08-05 19:50:54','2024-08-05 19:50:54',NULL,'public'),(61,0,'bg','bg',9,'image/jpeg',20558,'general/bg.jpg','[]','2024-08-05 19:50:55','2024-08-05 19:50:55',NULL,'public'),(62,0,'favicon','favicon',9,'image/png',897,'general/favicon.png','[]','2024-08-05 19:50:55','2024-08-05 19:50:55',NULL,'public'),(63,0,'logo-white','logo-white',9,'image/png',2372,'general/logo-white.png','[]','2024-08-05 19:50:55','2024-08-05 19:50:55',NULL,'public'),(64,0,'logo','logo',9,'image/png',2383,'general/logo.png','[]','2024-08-05 19:50:55','2024-08-05 19:50:55',NULL,'public'),(65,0,'video-background-02','video-background-02',9,'image/jpeg',20022,'general/video-background-02.jpg','[]','2024-08-05 19:50:55','2024-08-05 19:50:55',NULL,'public'),(66,0,'video-banner-01','video-banner-01',9,'image/jpeg',11520,'general/video-banner-01.jpg','[]','2024-08-05 19:50:55','2024-08-05 19:50:55',NULL,'public'),(67,0,'04','04',10,'image/jpeg',27493,'sliders/04.jpg','[]','2024-08-05 19:50:55','2024-08-05 19:50:55',NULL,'public'),(68,0,'05','05',10,'image/jpeg',27493,'sliders/05.jpg','[]','2024-08-05 19:50:56','2024-08-05 19:50:56',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'news',NULL,'news',0,'2024-08-05 19:50:43','2024-08-05 19:50:43',NULL),(2,0,'rooms',NULL,'rooms',0,'2024-08-05 19:50:44','2024-08-05 19:50:44',NULL),(3,0,'foods',NULL,'foods',0,'2024-08-05 19:50:45','2024-08-05 19:50:45',NULL),(4,0,'amenities',NULL,'amenities',0,'2024-08-05 19:50:47','2024-08-05 19:50:47',NULL),(5,0,'customers',NULL,'customers',0,'2024-08-05 19:50:47','2024-08-05 19:50:47',NULL),(6,0,'places',NULL,'places',0,'2024-08-05 19:50:51','2024-08-05 19:50:51',NULL),(7,0,'testimonials',NULL,'testimonials',0,'2024-08-05 19:50:52','2024-08-05 19:50:52',NULL),(8,0,'galleries',NULL,'galleries',0,'2024-08-05 19:50:52','2024-08-05 19:50:52',NULL),(9,0,'general',NULL,'general',0,'2024-08-05 19:50:54','2024-08-05 19:50:54',NULL),(10,0,'sliders',NULL,'sliders',0,'2024-08-05 19:50:55','2024-08-05 19:50:55',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'header-menu','2024-08-05 19:50:54','2024-08-05 19:50:54'),(2,2,'side-menu','2024-08-05 19:50:54','2024-08-05 19:50:54');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(2,1,0,NULL,NULL,'/rooms',NULL,0,'Rooms',NULL,'_self',1,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(3,1,2,NULL,NULL,'/rooms/luxury-hall-of-fame',NULL,0,'Luxury Hall Of Fame',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(4,1,2,NULL,NULL,'/rooms/pendora-fame',NULL,0,'Pendora Fame',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(5,1,0,2,'Botble\\Page\\Models\\Page','/news',NULL,0,'News',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(6,1,0,3,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(7,2,0,6,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(8,2,0,5,'Botble\\Page\\Models\\Page','/our-gallery',NULL,0,'Our Gallery',NULL,'_self',1,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(9,2,8,NULL,NULL,'/galleries/king-bed',NULL,0,'King Bed',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(10,2,8,NULL,NULL,'/galleries/duplex-restaurant',NULL,0,'Duplex Restaurant',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(11,2,0,4,'Botble\\Page\\Models\\Page','/restaurant',NULL,0,'Restaurant',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(12,2,0,7,'Botble\\Page\\Models\\Page','/places',NULL,0,'Places',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(13,2,0,8,'Botble\\Page\\Models\\Page','/our-offers',NULL,0,'Our Offers',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(14,3,0,NULL,NULL,'#',NULL,0,'Restaurant & Bar',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(15,3,0,NULL,NULL,'#',NULL,0,'Swimming Pool',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(16,3,0,NULL,NULL,'#',NULL,0,'Restaurant',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(17,3,0,NULL,NULL,'#',NULL,0,'Conference Room',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(18,3,0,NULL,NULL,'#',NULL,0,'Cocktail Party Houses',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(19,3,0,NULL,NULL,'#',NULL,0,'Gaming Zone',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(20,3,0,NULL,NULL,'#',NULL,0,'Marriage Party',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(21,3,0,NULL,NULL,'#',NULL,0,'Party Planning',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54'),(22,3,0,NULL,NULL,'#',NULL,0,'Tour Consultancy',NULL,'_self',0,'2024-08-05 19:50:54','2024-08-05 19:50:54');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Header menu','header-menu','published','2024-08-05 19:50:54','2024-08-05 19:50:54'),(2,'Our pages','our-pages','published','2024-08-05 19:50:54','2024-08-05 19:50:54'),(3,'Services.','services','published','2024-08-05 19:50:54','2024-08-05 19:50:54');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_reset_tokens_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2021_08_05_134214_fix_social_link_theme_options',1),(17,'2022_04_20_100851_add_index_to_media_table',1),(18,'2022_04_20_101046_add_index_to_menu_table',1),(19,'2022_07_10_034813_move_lang_folder_to_root',1),(20,'2022_08_04_051940_add_missing_column_expires_at',1),(21,'2022_09_01_000001_create_admin_notifications_tables',1),(22,'2022_10_14_024629_drop_column_is_featured',1),(23,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(24,'2022_12_02_093615_update_slug_index_columns',1),(25,'2023_01_30_024431_add_alt_to_media_table',1),(26,'2023_02_16_042611_drop_table_password_resets',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_08_21_090810_make_page_content_nullable',1),(30,'2023_09_14_021936_update_index_for_slugs_table',1),(31,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(32,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(33,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(34,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(35,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(36,'2024_07_12_100000_change_random_hash_for_media',1),(37,'2024_04_27_100730_improve_analytics_setting',2),(38,'2015_06_29_025744_create_audit_history',3),(39,'2023_11_14_033417_change_request_column_in_table_audit_histories',3),(40,'2015_06_18_033822_create_blog_table',4),(41,'2021_02_16_092633_remove_default_value_for_author_type',4),(42,'2021_12_03_030600_create_blog_translations',4),(43,'2022_04_19_113923_add_index_to_table_posts',4),(44,'2023_08_29_074620_make_column_author_id_nullable',4),(45,'2024_07_30_091615_fix_order_column_in_categories_table',4),(46,'2016_06_17_091537_create_contacts_table',5),(47,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',5),(48,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',5),(49,'2024_03_25_000001_update_captcha_settings_for_contact',5),(50,'2024_04_19_063914_create_custom_fields_table',5),(51,'2016_10_13_150201_create_galleries_table',6),(52,'2021_12_03_082953_create_gallery_translations',6),(53,'2022_04_30_034048_create_gallery_meta_translations_table',6),(54,'2023_08_29_075308_make_column_user_id_nullable',6),(55,'2020_09_02_033611_hotel_create_table',7),(56,'2021_06_25_084734_fix_theme_options',7),(57,'2021_08_18_011425_add_column_order_into_rooms',7),(58,'2021_08_25_153801_update_table_ht_room_categories',7),(59,'2021_08_29_031421_add_translations_tables_for_hotel',7),(60,'2023_04_09_083713_update_hotel_customers_table',7),(61,'2023_04_17_033111_add_booking_number_of_guests',7),(62,'2023_08_11_090349_add_column_password_customers_table',7),(63,'2023_08_14_090449_create_reset_password_table',7),(64,'2023_08_16_063152_update_ht_booking_room_table',7),(65,'2023_08_18_022454_add_new_field_to_ht_customers_table',7),(66,'2023_08_23_022361_create_ht_invoices_table',7),(67,'2023_08_23_041912_create_hotel_review_table',7),(68,'2023_08_23_443543_add_sub_total_to_booking_table',7),(69,'2023_08_23_904382_update_field_customer_id_to_invoice_table',7),(70,'2023_08_24_534892_add_fields_to_invoice_table',7),(71,'2023_08_24_745332_add_field_description_to_invoice_table',7),(72,'2023_08_25_061510_add_adjust_type_and_amount_column',7),(73,'2023_09_05_083354_create_ht_coupons_table',7),(74,'2023_09_06_062315_add_coupon_columns_to_booking_table',7),(75,'2023_10_18_024658_add_price_type_column_to_services_table',7),(76,'2023_10_24_014726_drop_unique_in_room_name',7),(77,'2024_06_10_000000_add_content_ht_services_translations',7),(78,'2024_07_11_052139_add_number_of_children_column_to_ht_bookings_table',7),(79,'2024_07_16_234051_add_booking_number_into_table_ht_bookings',7),(80,'2016_10_03_032336_create_languages_table',8),(81,'2023_09_14_022423_add_index_for_language_table',8),(82,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(83,'2021_12_03_075608_create_page_translations',9),(84,'2023_07_06_011444_create_slug_translations_table',9),(85,'2017_10_24_154832_create_newsletter_table',10),(86,'2024_03_25_000001_update_captcha_settings_for_newsletter',10),(87,'2017_05_18_080441_create_payment_tables',11),(88,'2021_03_27_144913_add_customer_type_into_table_payments',11),(89,'2021_05_24_034720_make_column_currency_nullable',11),(90,'2021_08_09_161302_add_metadata_column_to_payments_table',11),(91,'2021_10_19_020859_update_metadata_field',11),(92,'2022_06_28_151901_activate_paypal_stripe_plugin',11),(93,'2022_07_07_153354_update_charge_id_in_table_payments',11),(94,'2024_07_04_083133_create_payment_logs_table',11),(95,'2018_07_09_214610_create_testimonial_table',12),(96,'2021_12_03_083642_create_testimonials_translations',12),(97,'2016_10_07_193005_create_translations_table',13),(98,'2023_12_12_105220_drop_translations_table',13);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[home-banner][/home-banner]</div><div>[check-availability-form][/check-availability-form]</div><div>[hotel-about title=\"since 1994\" subtitle=\"Situated In Prime Position At The Foot Of The Slopes Of Courchevel Moriond.\" block_icon_1=\"flaticon-coffee\" block_text_1=\"Breakfast\" block_link_1=\"#\" block_icon_2=\"flaticon-air-freight\" block_text_2=\"Airport Pickup\" block_link_2=\"#\" block_icon_3=\"flaticon-marker\" block_text_3=\"City Guide\" block_link_3=\"#\" block_icon_4=\"flaticon-barbecue\" block_text_4=\"BBQ Party\" block_link_4=\"#\" block_icon_5=\"flaticon-hotel\" block_text_5=\"Luxury Room\" block_link_5=\"#\"][/hotel-about]</div><div>[room-categories title=\"Room Type\" subtitle=\"Inspired Loading\" background_image=\"general/bg.jpg\"][/room-categories]</div><div>[hotel-featured-features title=\"The Thin Escape\" subtitle=\"Miranda has everything for your trip & every single things.\" button_text=\"Take a tour\" button_url=\"/rooms\"][/hotel-featured-features]</div><div>[rooms][/rooms]</div><div>[video-introduction title=\"Take a tour\" subtitle=\"Discover Our Underground.\" content=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\" background_image=\"general/video-background-02.jpg\" video_image=\"general/video-banner-01.jpg\" video_url=\"https://www.youtube.com/watch?v=EEJFMdfraVY\" button_text=\"Book Now\" button_url=\"/rooms\"][/video-introduction]</div><div>[testimonial title=\"testimonials\" subtitle=\"Client Feedback\"][/testimonial]</div><div>[rooms-introduction title=\"Our rooms\" subtitle=\"Each of our nine lovely double guest rooms feature a private bath, wi-fi, cable television and include full breakfast.\" background_image=\"general/bg.jpg\" first_image=\"general/01.jpg\" second_image=\"general/02.jpg\" third_image=\"general/03.jpg\" button_text=\"Take a tour\" button_url=\"/rooms\"][/rooms-introduction]</div><div>[featured-news title=\"Blog\" subtitle=\"News Feeds\"][/featured-news]</div>',1,NULL,'homepage',NULL,'published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(2,'News','<p>--</p>',1,NULL,'default',NULL,'published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(3,'Contact','<div>[contact-info][/contact-info]</div><div>[google-map]19/A, Cirikon City hall Tower New York, NYC[/google-map]</div><div>[contact-form][/contact-form]</div>',1,NULL,'no-sidebar',NULL,'published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(4,'Restaurant','<div>[food-types][/food-types]</div><div>[foods title=\"Restaurant\" subtitle=\"Trending Menu\"][/foods]</div>',1,NULL,'no-sidebar',NULL,'published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(5,'Our Gallery','<div>[all-galleries title=\"Gallery\" subtitle=\"Our Rooms\"][/all-galleries]</div>',1,NULL,'no-sidebar',NULL,'published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(6,'About us','<div>[youtube-video url=\"https://www.youtube.com/watch?v=EEJFMdfraVY\" background_image=\"general/04.jpg\"][/youtube-video]</div><p>Hello. Our hotel has been present for over 20 years. We make the best or all our customers. Hello. Our hotel has been present for over 20 years. We make the best or all our customers. Hello. Our hotel has been present for over 20 years. We make the best or all our customers.</p><div>[hotel-core-features title=\"Facilities\" subtitle=\"Core Features\"][/hotel-core-features]</div><div>[featured-news title=\"Blog\" subtitle=\"News Feeds\"][/featured-news]</div>',1,NULL,'no-sidebar',NULL,'published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(7,'Places','<div>[places][/places]</div>',1,NULL,'no-sidebar',NULL,'published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(8,'Our Offers','<div>[our-offers][/our-offers]</div>',1,NULL,'no-sidebar',NULL,'published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(9,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2024-08-05 19:50:52','2024-08-05 19:50:52');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'USD',11,'bk1T6zOsnVHFgvaOIxFc','cod',NULL,338.00,1,'failed','direct',11,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(2,'USD',5,'mYbeYz3bYeSqOtCi2fvF','stripe',NULL,507.00,2,'failed','direct',5,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(3,'USD',1,'yAUdsXrrcRF12hV83jgn','sslcommerz',NULL,206.00,3,'completed','direct',1,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(4,'USD',1,'nnGapAqCpKdATlLVjAKe','paypal',NULL,450.00,4,'refunded','direct',1,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(5,'USD',3,'VCNJXGPXtvUsgTMzO0U1','cod',NULL,103.00,5,'refunded','direct',3,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(6,'USD',6,'JLAvBouQdYhIwqlCMrh1','sslcommerz',NULL,338.00,6,'pending','direct',6,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(7,'USD',4,'LCRsDKLqZRsQCuyFskzG','cod',NULL,537.00,7,'failed','direct',4,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(8,'USD',4,'5gLZpw0t80yz50OOLPGZ','sslcommerz',NULL,169.00,8,'pending','direct',4,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(9,'USD',10,'eF9C1AgWBgGdKCGhXlOf','sslcommerz',NULL,206.00,9,'fraud','direct',10,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(10,'USD',4,'q0RaMBEdTr31VTu10SLO','cod',NULL,462.00,10,'refunded','direct',4,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(11,'USD',3,'4JYLbwGcS4wlu7CGQAAI','paystack',NULL,242.00,11,'completed','direct',3,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(12,'USD',5,'YneOvXmxaTbQ2YdB81P5','bank_transfer',NULL,121.00,12,'fraud','direct',5,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(13,'USD',7,'sYk1WAslmhHuPSutXhhE','stripe',NULL,121.00,13,'fraud','direct',7,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(14,'USD',5,'2ss5UCWumVY2gw2K0XlJ','cod',NULL,300.00,14,'refunding','direct',5,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(15,'USD',6,'G1mYZcVI0Scui3BEVadM','cod',NULL,206.00,15,'refunding','direct',6,NULL,NULL,'2024-08-05 19:50:56','2024-08-05 19:50:56','Botble\\Hotel\\Models\\Customer',NULL),(16,'USD',1,'cCIUa90RSS6dhSwMNNWL','paystack',NULL,200.00,16,'refunding','direct',1,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(17,'USD',7,'LR8n4hjUxwqfFSoh3bZn','paystack',NULL,150.00,17,'completed','direct',7,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(18,'USD',5,'cP6PRibC9YsfhZBUwQFU','paypal',NULL,537.00,18,'failed','direct',5,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(19,'USD',5,'uDIhaBdLJtoSy7BNqdSY','stripe',NULL,121.00,19,'completed','direct',5,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(20,'USD',5,'hgiznniiRbsBZXAnTIIL','stripe',NULL,242.00,20,'refunding','direct',5,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(21,'USD',3,'ZM9A498jfMCr53KoZZbe','stripe',NULL,242.00,21,'refunding','direct',3,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(22,'USD',9,'yHafLfKufeE7qoNweZ7a','razorpay',NULL,309.00,22,'failed','direct',9,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(23,'USD',9,'ZSmWjFKhV6iCZjEHM8By','razorpay',NULL,363.00,23,'refunded','direct',9,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(24,'USD',11,'zimOr0Nfv9IJhLPc2WED','stripe',NULL,363.00,24,'completed','direct',11,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(25,'USD',2,'PVlj0BHOthIhEmKjM78A','paypal',NULL,308.00,25,'failed','direct',2,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(26,'USD',5,'QVpV59y7eOXbSJWMq70k','cod',NULL,507.00,26,'refunded','direct',5,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(27,'USD',1,'z4jOMenc5OTLHNHtAB4L','stripe',NULL,400.00,27,'fraud','direct',1,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(28,'USD',2,'u65ZhzHdeIMg8YvOItsZ','cod',NULL,179.00,28,'refunding','direct',2,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(29,'USD',10,'x1XCqBdibxGVf88PAqhO','stripe',NULL,309.00,29,'fraud','direct',10,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(30,'USD',11,'bBeS6xPNpcU7Zoj00cYw','sslcommerz',NULL,169.00,30,'completed','direct',11,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL),(31,'USD',5,'4QMlgxdqTkuB0yHNT9MQ','stripe',NULL,338.00,31,'pending','direct',5,NULL,NULL,'2024-08-05 19:50:57','2024-08-05 19:50:57','Botble\\Hotel\\Models\\Customer',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1),(4,1),(2,2),(4,2),(1,3),(3,3),(1,4),(3,4),(2,5),(4,5),(2,6),(3,6);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Each of our 8 double rooms has its own distinct.','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/01.jpg',1245,NULL,'2024-08-05 19:50:44','2024-08-05 19:50:44'),(2,'Essential Qualities of Highly Successful Music','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/02.jpg',621,NULL,'2024-08-05 19:50:44','2024-08-05 19:50:44'),(3,'9 Things I Love About Shaving My Head','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/03.jpg',1359,NULL,'2024-08-05 19:50:44','2024-08-05 19:50:44'),(4,'Why Teamwork Really Makes The Dream Work','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/04.jpg',2179,NULL,'2024-08-05 19:50:44','2024-08-05 19:50:44'),(5,'The World Caters to Average People','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/05.jpg',988,NULL,'2024-08-05 19:50:44','2024-08-05 19:50:44'),(6,'The litigants on the screen are not actors','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/06.jpg',1416,NULL,'2024-08-05 19:50:44','2024-08-05 19:50:44');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"room.index\":true,\"room.create\":true,\"room.edit\":true,\"room.destroy\":true,\"amenity.index\":true,\"amenity.create\":true,\"amenity.edit\":true,\"amenity.destroy\":true,\"food.index\":true,\"food.create\":true,\"food.edit\":true,\"food.destroy\":true,\"food-type.index\":true,\"food-type.create\":true,\"food-type.edit\":true,\"food-type.destroy\":true,\"booking.index\":true,\"booking.edit\":true,\"booking.destroy\":true,\"booking.reports.index\":true,\"booking.calendar.index\":true,\"booking-address.index\":true,\"booking-address.create\":true,\"booking-address.edit\":true,\"booking-address.destroy\":true,\"booking-room.index\":true,\"booking-room.create\":true,\"booking-room.edit\":true,\"booking-room.destroy\":true,\"customer.index\":true,\"customer.create\":true,\"customer.edit\":true,\"customer.destroy\":true,\"room-category.index\":true,\"room-category.create\":true,\"room-category.edit\":true,\"room-category.destroy\":true,\"feature.index\":true,\"feature.create\":true,\"feature.edit\":true,\"feature.destroy\":true,\"service.index\":true,\"service.create\":true,\"service.edit\":true,\"service.destroy\":true,\"place.index\":true,\"place.create\":true,\"place.edit\":true,\"place.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"invoice.template\":true,\"coupons.index\":true,\"coupons.create\":true,\"coupons.edit\":true,\"coupons.destroy\":true,\"hotel.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"payments.logs\":true,\"payments.logs.show\":true,\"payments.logs.destroy\":true,\"social-login.settings\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true}','Admin users role',1,1,1,'2024-08-05 19:50:54','2024-08-05 19:50:54');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2024-08-05 19:50:56'),(3,'analytics_dashboard_widgets','0','2024-08-05 19:50:42','2024-08-05 19:50:42'),(4,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"gallery\",\"hotel\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"social-login\",\"sslcommerz\",\"stripe\",\"testimonial\",\"translation\"]',NULL,'2024-08-05 19:50:56'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2024-08-05 19:50:43','2024-08-05 19:50:43'),(6,'enable_recaptcha_botble_newsletter_forms_fronts_newsletter_form','1','2024-08-05 19:50:43','2024-08-05 19:50:43'),(9,'language_hide_default','1',NULL,'2024-08-05 19:50:56'),(11,'language_display','all',NULL,'2024-08-05 19:50:56'),(12,'language_hide_languages','[]',NULL,'2024-08-05 19:50:56'),(13,'media_random_hash','9a261ff2dc3770221d1de2676fc3db84',NULL,'2024-08-05 19:50:56'),(14,'theme','miranda',NULL,'2024-08-05 19:50:56'),(15,'show_admin_bar','1',NULL,'2024-08-05 19:50:56'),(16,'language_switcher_display','dropdown',NULL,'2024-08-05 19:50:56'),(17,'admin_favicon','general/favicon.png',NULL,'2024-08-05 19:50:56'),(18,'admin_logo','general/logo-white.png',NULL,'2024-08-05 19:50:56'),(19,'permalink-botble-blog-models-post','news',NULL,'2024-08-05 19:50:56'),(20,'permalink-botble-blog-models-category','news',NULL,'2024-08-05 19:50:56'),(21,'payment_cod_status','1',NULL,'2024-08-05 19:50:56'),(22,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2024-08-05 19:50:56'),(23,'payment_bank_transfer_status','1',NULL,'2024-08-05 19:50:56'),(24,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,'2024-08-05 19:50:56'),(25,'payment_stripe_payment_type','stripe_checkout',NULL,'2024-08-05 19:50:56'),(26,'theme-miranda-site_title','Hotel Miranda',NULL,NULL),(27,'theme-miranda-seo_description','Miranda - Laravel Hotel & Resort Multilingual Booking System',NULL,NULL),(28,'theme-miranda-copyright','©%Y Miranda. All right reserved.',NULL,NULL),(29,'theme-miranda-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(30,'theme-miranda-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(31,'theme-miranda-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(32,'theme-miranda-homepage_id','1',NULL,NULL),(33,'theme-miranda-blog_page_id','2',NULL,NULL),(34,'theme-miranda-logo','general/logo.png',NULL,NULL),(35,'theme-miranda-logo_white','general/logo-white.png',NULL,NULL),(36,'theme-miranda-favicon','general/favicon.png',NULL,NULL),(37,'theme-miranda-email','info@webmail.com',NULL,NULL),(38,'theme-miranda-address','14/A, Miranda City, NYC',NULL,NULL),(39,'theme-miranda-hotline','+908 987 877 09',NULL,NULL),(40,'theme-miranda-news_banner','general/banner-news.jpg',NULL,NULL),(41,'theme-miranda-rooms_banner','general/banner-news.jpg',NULL,NULL),(42,'theme-miranda-term_of_use_url','#',NULL,NULL),(43,'theme-miranda-privacy_policy_url','#',NULL,NULL),(44,'theme-miranda-preloader_enabled','no',NULL,NULL),(45,'theme-miranda-about-us','Lorem ipsum dolor sit amet, consect etur adipisicing elit, sed doing eius mod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat ion ullamco laboris nisi.',NULL,NULL),(46,'theme-miranda-hotel_rules','<ul><li>No smoking, parties or events.</li><li>Check-in time from 2 PM, check-out by 10 AM.</li><li>Time to time car parking</li><li>Download Our minimal app</li><li>Browse regular our website</li></ul>',NULL,NULL),(47,'theme-miranda-cancellation','<p>Phasellus volutpat neque a tellus venenatis, a euismod augue facilisis. Fusce ut metus mattis, consequat metus nec, luctus lectus. Pellentesque orci quis hendrerit sed eu dolor. <strong>Cancel up</strong> to <strong>14 days</strong> to get a full refund.</p>',NULL,NULL),(48,'theme-miranda-slider-image-1','sliders/04.jpg',NULL,NULL),(49,'theme-miranda-slider-title-1','The ultimate luxury experience',NULL,NULL),(50,'theme-miranda-slider-description-1','<p>The Perfect<br>Base For You</p>',NULL,NULL),(51,'theme-miranda-slider-primary-button-text-1','Take A tour',NULL,NULL),(52,'theme-miranda-slider-primary-button-url-1','/rooms',NULL,NULL),(53,'theme-miranda-slider-secondary-button-text-1','About us',NULL,NULL),(54,'theme-miranda-slider-secondary-button-url-1','/about-us',NULL,NULL),(55,'theme-miranda-slider-image-2','sliders/05.jpg',NULL,NULL),(56,'theme-miranda-slider-title-2','The ultimate luxury experience',NULL,NULL),(57,'theme-miranda-slider-description-2','<p>The Perfect<br>Base For You</p>',NULL,NULL),(58,'theme-miranda-slider-primary-button-text-2','Take A tour',NULL,NULL),(59,'theme-miranda-slider-primary-button-url-2','/rooms',NULL,NULL),(60,'theme-miranda-slider-secondary-button-text-2','About us',NULL,NULL),(61,'theme-miranda-slider-secondary-button-url-2','/about-us',NULL,NULL),(62,'theme-miranda-primary_font','Archivo',NULL,NULL),(63,'theme-miranda-secondary_font','Old Standard TT',NULL,NULL),(64,'theme-miranda-tertiary_font','Roboto',NULL,NULL),(65,'theme-miranda-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fab fa-facebook-f\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fab fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fab fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Behance\"},{\"key\":\"social-icon\",\"value\":\"fab fa-behance\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.behance.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"fab fa-linkedin\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.linkedin.com\\/\"}]]',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'general',1,'Botble\\Blog\\Models\\Category','news','2024-08-05 19:50:44','2024-08-05 19:50:54'),(2,'hotel',2,'Botble\\Blog\\Models\\Category','news','2024-08-05 19:50:44','2024-08-05 19:50:54'),(3,'booking',3,'Botble\\Blog\\Models\\Category','news','2024-08-05 19:50:44','2024-08-05 19:50:54'),(4,'resort',4,'Botble\\Blog\\Models\\Category','news','2024-08-05 19:50:44','2024-08-05 19:50:54'),(5,'travel',5,'Botble\\Blog\\Models\\Category','news','2024-08-05 19:50:44','2024-08-05 19:50:54'),(6,'general',1,'Botble\\Blog\\Models\\Tag','tag','2024-08-05 19:50:44','2024-08-05 19:50:44'),(7,'hotel',2,'Botble\\Blog\\Models\\Tag','tag','2024-08-05 19:50:44','2024-08-05 19:50:44'),(8,'booking',3,'Botble\\Blog\\Models\\Tag','tag','2024-08-05 19:50:44','2024-08-05 19:50:44'),(9,'resort',4,'Botble\\Blog\\Models\\Tag','tag','2024-08-05 19:50:44','2024-08-05 19:50:44'),(10,'travel',5,'Botble\\Blog\\Models\\Tag','tag','2024-08-05 19:50:44','2024-08-05 19:50:44'),(11,'each-of-our-8-double-rooms-has-its-own-distinct',1,'Botble\\Blog\\Models\\Post','news','2024-08-05 19:50:44','2024-08-05 19:50:54'),(12,'essential-qualities-of-highly-successful-music',2,'Botble\\Blog\\Models\\Post','news','2024-08-05 19:50:44','2024-08-05 19:50:54'),(13,'9-things-i-love-about-shaving-my-head',3,'Botble\\Blog\\Models\\Post','news','2024-08-05 19:50:44','2024-08-05 19:50:54'),(14,'why-teamwork-really-makes-the-dream-work',4,'Botble\\Blog\\Models\\Post','news','2024-08-05 19:50:44','2024-08-05 19:50:54'),(15,'the-world-caters-to-average-people',5,'Botble\\Blog\\Models\\Post','news','2024-08-05 19:50:44','2024-08-05 19:50:54'),(16,'the-litigants-on-the-screen-are-not-actors',6,'Botble\\Blog\\Models\\Post','news','2024-08-05 19:50:44','2024-08-05 19:50:54'),(17,'luxury-hall-of-fame',1,'Botble\\Hotel\\Models\\Room','rooms','2024-08-05 19:50:45','2024-08-05 19:50:45'),(18,'pendora-fame',2,'Botble\\Hotel\\Models\\Room','rooms','2024-08-05 19:50:45','2024-08-05 19:50:45'),(19,'pacific-room',3,'Botble\\Hotel\\Models\\Room','rooms','2024-08-05 19:50:45','2024-08-05 19:50:45'),(20,'junior-suite',4,'Botble\\Hotel\\Models\\Room','rooms','2024-08-05 19:50:45','2024-08-05 19:50:45'),(21,'family-suite',5,'Botble\\Hotel\\Models\\Room','rooms','2024-08-05 19:50:45','2024-08-05 19:50:45'),(22,'relax-suite',6,'Botble\\Hotel\\Models\\Room','rooms','2024-08-05 19:50:45','2024-08-05 19:50:45'),(23,'luxury-suite',7,'Botble\\Hotel\\Models\\Room','rooms','2024-08-05 19:50:45','2024-08-05 19:50:45'),(24,'president-room',8,'Botble\\Hotel\\Models\\Room','rooms','2024-08-05 19:50:45','2024-08-05 19:50:45'),(25,'quality-room',1,'Botble\\Hotel\\Models\\Service','services','2024-08-05 19:50:47','2024-08-05 19:50:47'),(26,'privet-beach',2,'Botble\\Hotel\\Models\\Service','services','2024-08-05 19:50:47','2024-08-05 19:50:47'),(27,'best-accommodation',3,'Botble\\Hotel\\Models\\Service','services','2024-08-05 19:50:47','2024-08-05 19:50:47'),(28,'wellness-spa',4,'Botble\\Hotel\\Models\\Service','services','2024-08-05 19:50:47','2024-08-05 19:50:47'),(29,'restaurants-bars',5,'Botble\\Hotel\\Models\\Service','services','2024-08-05 19:50:47','2024-08-05 19:50:47'),(30,'special-offers',6,'Botble\\Hotel\\Models\\Service','services','2024-08-05 19:50:47','2024-08-05 19:50:47'),(31,'duplex-restaurant',1,'Botble\\Hotel\\Models\\Place','places','2024-08-05 19:50:52','2024-08-05 19:50:52'),(32,'overnight-bars',2,'Botble\\Hotel\\Models\\Place','places','2024-08-05 19:50:52','2024-08-05 19:50:52'),(33,'beautiful-beach',3,'Botble\\Hotel\\Models\\Place','places','2024-08-05 19:50:52','2024-08-05 19:50:52'),(34,'beautiful-spa',4,'Botble\\Hotel\\Models\\Place','places','2024-08-05 19:50:52','2024-08-05 19:50:52'),(35,'duplex-golf',5,'Botble\\Hotel\\Models\\Place','places','2024-08-05 19:50:52','2024-08-05 19:50:52'),(36,'luxury-restaurant',6,'Botble\\Hotel\\Models\\Place','places','2024-08-05 19:50:52','2024-08-05 19:50:52'),(37,'homepage',1,'Botble\\Page\\Models\\Page','','2024-08-05 19:50:52','2024-08-05 19:50:52'),(38,'news',2,'Botble\\Page\\Models\\Page','','2024-08-05 19:50:52','2024-08-05 19:50:52'),(39,'contact',3,'Botble\\Page\\Models\\Page','','2024-08-05 19:50:52','2024-08-05 19:50:52'),(40,'restaurant',4,'Botble\\Page\\Models\\Page','','2024-08-05 19:50:52','2024-08-05 19:50:52'),(41,'our-gallery',5,'Botble\\Page\\Models\\Page','','2024-08-05 19:50:52','2024-08-05 19:50:52'),(42,'about-us',6,'Botble\\Page\\Models\\Page','','2024-08-05 19:50:52','2024-08-05 19:50:52'),(43,'places',7,'Botble\\Page\\Models\\Page','','2024-08-05 19:50:52','2024-08-05 19:50:52'),(44,'our-offers',8,'Botble\\Page\\Models\\Page','','2024-08-05 19:50:52','2024-08-05 19:50:52'),(45,'cookie-policy',9,'Botble\\Page\\Models\\Page','','2024-08-05 19:50:52','2024-08-05 19:50:52'),(46,'duplex-restaurant',1,'Botble\\Gallery\\Models\\Gallery','galleries','2024-08-05 19:50:53','2024-08-05 19:50:53'),(47,'luxury-room',2,'Botble\\Gallery\\Models\\Gallery','galleries','2024-08-05 19:50:53','2024-08-05 19:50:53'),(48,'pacific-room',3,'Botble\\Gallery\\Models\\Gallery','galleries','2024-08-05 19:50:53','2024-08-05 19:50:53'),(49,'family-room',4,'Botble\\Gallery\\Models\\Gallery','galleries','2024-08-05 19:50:53','2024-08-05 19:50:53'),(50,'king-bed',5,'Botble\\Gallery\\Models\\Gallery','galleries','2024-08-05 19:50:53','2024-08-05 19:50:53'),(51,'special-foods',6,'Botble\\Gallery\\Models\\Gallery','galleries','2024-08-05 19:50:53','2024-08-05 19:50:53');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User',NULL,'published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(2,'Hotel',1,'Botble\\ACL\\Models\\User',NULL,'published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(3,'Booking',1,'Botble\\ACL\\Models\\User',NULL,'published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(4,'Resort',1,'Botble\\ACL\\Models\\User',NULL,'published','2024-08-05 19:50:44','2024-08-05 19:50:44'),(5,'Travel',1,'Botble\\ACL\\Models\\User',NULL,'published','2024-08-05 19:50:44','2024-08-05 19:50:44');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Adam Williams','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/01.png','CEO Of Microsoft','published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(2,'Retha Deowalim','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/02.png','CEO Of Apple','published','2024-08-05 19:50:52','2024-08-05 19:50:52'),(3,'Sam J. Wasim','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/03.png','Pio Founder','published','2024-08-05 19:50:52','2024-08-05 19:50:52');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'becker.josh@beahan.com',NULL,'$2y$12$rLdZUdIvhNEvVIXYqi4ege8Oa.S07SKWIfZdY3PbR30PUwZ8DhJmi',NULL,'2024-08-05 19:50:54','2024-08-05 19:50:54','Katlyn','Stiedemann','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'CustomMenuWidget','footer_sidebar','miranda',0,'{\"id\":\"CustomMenuWidget\",\"name\":\"Services.\",\"menu_id\":\"services\"}','2024-08-05 19:50:56','2024-08-05 19:50:56'),(2,'RecentPostsWidget','primary_sidebar','miranda',0,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent posts\",\"number_display\":5}','2024-08-05 19:50:56','2024-08-05 19:50:56'),(3,'BlogCategoriesWidget','primary_sidebar','miranda',1,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\",\"number_display\":5}','2024-08-05 19:50:56','2024-08-05 19:50:56'),(4,'BlogTagsWidget','primary_sidebar','miranda',2,'{\"id\":\"BlogTagsWidget\",\"name\":\"Popular Tags\",\"number_display\":5}','2024-08-05 19:50:56','2024-08-05 19:50:56');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-06  9:50:58
