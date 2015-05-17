-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tech_liuchao_me
-- ------------------------------------------------------
-- Server version	5.6.21-70.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_commentmeta`
--

DROP TABLE IF EXISTS `t_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_commentmeta`
--

LOCK TABLES `t_commentmeta` WRITE;
/*!40000 ALTER TABLE `t_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_comments`
--

DROP TABLE IF EXISTS `t_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comments`
--

LOCK TABLES `t_comments` WRITE;
/*!40000 ALTER TABLE `t_comments` DISABLE KEYS */;
INSERT INTO `t_comments` VALUES (1,1,'xxoo','thesedays@126.com','http://liuchao.me','60.28.18.193','2015-05-16 13:52:45','2015-05-16 05:52:45','哈哈哈哈哈',0,'1','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:40.0) Gecko/20100101 Firefox/40.0','',0,0);
/*!40000 ALTER TABLE `t_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_links`
--

DROP TABLE IF EXISTS `t_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_links`
--

LOCK TABLES `t_links` WRITE;
/*!40000 ALTER TABLE `t_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_options`
--

DROP TABLE IF EXISTS `t_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_options`
--

LOCK TABLES `t_options` WRITE;
/*!40000 ALTER TABLE `t_options` DISABLE KEYS */;
INSERT INTO `t_options` VALUES (1,'siteurl','http://tech.liuchao.me','yes'),(2,'blogname','Tools Matter','yes'),(3,'blogdescription','Just for Fun','yes'),(4,'users_can_register','0','yes'),(5,'admin_email','thesedays@126.com','yes'),(6,'start_of_week','1','yes'),(7,'use_balanceTags','0','yes'),(8,'use_smilies','1','yes'),(9,'require_name_email','1','yes'),(10,'comments_notify','1','yes'),(11,'posts_per_rss','10','yes'),(12,'rss_use_excerpt','0','yes'),(13,'mailserver_url','mail.example.com','yes'),(14,'mailserver_login','login@example.com','yes'),(15,'mailserver_pass','password','yes'),(16,'mailserver_port','110','yes'),(17,'default_category','1','yes'),(18,'default_comment_status','open','yes'),(19,'default_ping_status','open','yes'),(20,'default_pingback_flag','1','yes'),(21,'posts_per_page','10','yes'),(22,'date_format','Y/m/d','yes'),(23,'time_format','H:i','yes'),(24,'links_updated_date_format','Y年n月j日ag:i','yes'),(25,'comment_moderation','0','yes'),(26,'moderation_notify','1','yes'),(27,'permalink_structure','/%year%/%monthnum%/%postname%/','yes'),(28,'gzipcompression','0','yes'),(29,'hack_file','0','yes'),(30,'blog_charset','UTF-8','yes'),(31,'moderation_keys','','no'),(32,'active_plugins','a:10:{i:0;s:19:\"akismet/akismet.php\";i:1;s:36:\"google-sitemap-generator/sitemap.php\";i:2;s:25:\"jiathis/jiathis-share.php\";i:3;s:39:\"si-captcha-for-wordpress/si-captcha.php\";i:4;s:39:\"syntaxhighlighter/syntaxhighlighter.php\";i:5;s:33:\"w3-total-cache/w3-total-cache.php\";i:6;s:27:\"wp-optimize/wp-optimize.php\";i:7;s:27:\"wp-slimstat/wp-slimstat.php\";i:8;s:35:\"wp-utf8-excerpt/wp-utf8-excerpt.php\";i:9;s:30:\"wpjam-qiniu/wpjam-qiniutek.php\";}','yes'),(33,'home','http://tech.liuchao.me','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'advanced_edit','0','yes'),(37,'comment_max_links','2','yes'),(38,'gmt_offset','','yes'),(39,'default_email_category','1','yes'),(40,'recently_edited','','no'),(41,'template','decode','yes'),(42,'stylesheet','decode','yes'),(43,'comment_whitelist','1','yes'),(44,'blacklist_keys','','no'),(45,'comment_registration','0','yes'),(46,'html_type','text/html','yes'),(47,'use_trackback','0','yes'),(48,'default_role','subscriber','yes'),(49,'db_version','31535','yes'),(50,'uploads_use_yearmonth_folders','1','yes'),(51,'upload_path','','yes'),(52,'blog_public','1','yes'),(53,'default_link_category','2','yes'),(54,'show_on_front','posts','yes'),(55,'tag_base','','yes'),(56,'show_avatars','1','yes'),(57,'avatar_rating','G','yes'),(58,'upload_url_path','','yes'),(59,'thumbnail_size_w','150','yes'),(60,'thumbnail_size_h','150','yes'),(61,'thumbnail_crop','1','yes'),(62,'medium_size_w','300','yes'),(63,'medium_size_h','300','yes'),(64,'avatar_default','mystery','yes'),(65,'large_size_w','1024','yes'),(66,'large_size_h','1024','yes'),(67,'image_default_link_type','file','yes'),(68,'image_default_size','','yes'),(69,'image_default_align','','yes'),(70,'close_comments_for_old_posts','0','yes'),(71,'close_comments_days_old','14','yes'),(72,'thread_comments','1','yes'),(73,'thread_comments_depth','5','yes'),(74,'page_comments','0','yes'),(75,'comments_per_page','50','yes'),(76,'default_comments_page','newest','yes'),(77,'comment_order','asc','yes'),(78,'sticky_posts','a:0:{}','yes'),(79,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_text','a:0:{}','yes'),(81,'widget_rss','a:0:{}','yes'),(82,'uninstall_plugins','a:1:{s:39:\"si-captcha-for-wordpress/si-captcha.php\";s:24:\"si_captcha_unset_options\";}','no'),(83,'timezone_string','Asia/Shanghai','yes'),(84,'page_for_posts','0','yes'),(85,'page_on_front','0','yes'),(86,'default_post_format','0','yes'),(87,'link_manager_enabled','0','yes'),(88,'initial_db_version','27916','yes'),(89,'t_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(90,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(91,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(92,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(93,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(94,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(95,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(96,'cron','a:8:{i:1431856497;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1431856506;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1431856793;a:3:{s:18:\"w3_pgcache_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:18:\"w3_pgcache_cleanup\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:22:\"w3_objectcache_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:22:\"w3_objectcache_cleanup\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:18:\"w3_dbcache_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:18:\"w3_dbcache_cleanup\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1431860287;a:1:{s:13:\"sm_ping_daily\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1431861660;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1431889643;a:1:{s:24:\"akismet_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1431914400;a:1:{s:17:\"wp_slimstat_purge\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(98,'theme_mods_twentyfourteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1404035775;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}','yes'),(99,'current_theme','Decode','yes'),(100,'theme_mods_decode','a:1:{i:0;b:0;}','yes'),(101,'theme_switched','','yes'),(102,'recently_activated','a:0:{}','yes'),(103,'akismet_available_servers','a:4:{s:12:\"192.0.80.246\";b:1;s:12:\"66.135.58.62\";b:1;s:12:\"192.0.80.244\";b:1;s:12:\"66.135.58.61\";b:1;}','yes'),(104,'akismet_connectivity_time','1404035864','yes'),(105,'sm_rewrite_done','$Id: sitemap-loader.php 937300 2014-06-23 18:04:11Z arnee $','yes'),(106,'jiathis_code','<!-- JiaThis Button BEGIN -->\r\n<div id=\"jiathis_style_32x32\">\r\n	<a class=\"jiathis_button_qzone\"></a>\r\n	<a class=\"jiathis_button_tsina\"></a>\r\n	<a class=\"jiathis_button_tqq\"></a>\r\n	<a class=\"jiathis_button_renren\"></a>\r\n	<a class=\"jiathis_button_kaixin001\"></a>\r\n	<a href=\"http://www.jiathis.com/share/\" class=\"jiathis jiathis_txt jtico jtico_jiathis\" target=\"_blank\"></a>\r\n	<a class=\"jiathis_counter_style\"></a>\r\n</div>\r\n<script type=\"text/javascript\" src=\"http://v2.jiathis.com/code/jia.js\" charset=\"utf-8\"></script>\r\n<!-- JiaThis Button END -->','yes'),(107,'jiathis_pos','down','yes'),(108,'jiathis_dir','left','yes'),(109,'jiathis_feed','yes','yes'),(110,'wp-optimize-schedule','false','no'),(111,'wp-optimize-last-optimized','Never','no'),(112,'wp-optimize-schedule-type','wpo_weekly','no'),(113,'wp-optimize-retention-enabled','false','no'),(114,'wp-optimize-retention-period','2','no'),(115,'wp-optimize-enable-admin-menu','false','no'),(116,'wp-optimize-total-cleaned','0','no'),(117,'wp-optimize-auto','a:8:{s:9:\"revisions\";s:4:\"true\";s:6:\"drafts\";s:4:\"true\";s:5:\"spams\";s:4:\"true\";s:10:\"unapproved\";s:5:\"false\";s:9:\"transient\";s:5:\"false\";s:8:\"postmeta\";s:5:\"false\";s:4:\"tags\";s:5:\"false\";s:8:\"optimize\";s:4:\"true\";}','yes'),(118,'slimstat_options','a:71:{s:7:\"version\";s:5:\"4.0.2\";s:6:\"secret\";s:32:\"d822fd10b5c8e32aa787b1fb3018c298\";s:17:\"show_admin_notice\";i:0;s:11:\"is_tracking\";s:3:\"yes\";s:17:\"track_admin_pages\";s:2:\"no\";s:17:\"enable_javascript\";s:3:\"yes\";s:15:\"javascript_mode\";s:3:\"yes\";s:16:\"add_posts_column\";s:2:\"no\";s:21:\"add_dashboard_widgets\";s:3:\"yes\";s:25:\"posts_column_day_interval\";i:30;s:22:\"posts_column_pageviews\";s:3:\"yes\";s:17:\"use_separate_menu\";s:3:\"yes\";s:17:\"auto_purge_delete\";s:3:\"yes\";s:10:\"auto_purge\";s:3:\"120\";s:23:\"use_european_separators\";s:3:\"yes\";s:11:\"date_format\";s:5:\"m-d-y\";s:11:\"time_format\";s:5:\"h:i a\";s:17:\"show_display_name\";s:2:\"no\";s:31:\"convert_resource_urls_to_titles\";s:3:\"yes\";s:20:\"convert_ip_addresses\";s:2:\"no\";s:10:\"async_load\";s:2:\"no\";s:14:\"use_slimscroll\";s:3:\"yes\";s:14:\"expand_details\";s:2:\"no\";s:12:\"rows_to_show\";s:2:\"20\";s:16:\"refresh_interval\";s:2:\"60\";s:23:\"number_results_raw_data\";s:2:\"50\";s:32:\"show_complete_user_agent_tooltip\";s:2:\"no\";s:18:\"no_maxmind_warning\";s:2:\"no\";s:10:\"enable_sov\";s:2:\"no\";s:11:\"track_users\";s:3:\"yes\";s:12:\"ignore_users\";s:0:\"\";s:9:\"ignore_ip\";s:0:\"\";s:19:\"ignore_capabilities\";s:0:\"\";s:15:\"ignore_spammers\";s:3:\"yes\";s:11:\"ignore_bots\";s:2:\"no\";s:16:\"ignore_resources\";s:0:\"\";s:16:\"ignore_countries\";s:0:\"\";s:15:\"ignore_browsers\";s:0:\"\";s:15:\"ignore_referers\";s:0:\"\";s:24:\"enable_outbound_tracking\";s:3:\"yes\";s:20:\"track_internal_links\";s:2:\"no\";s:32:\"ignore_outbound_classes_rel_href\";s:18:\"noslimstat,ab-item\";s:38:\"do_not_track_outbound_classes_rel_href\";s:18:\"noslimstat,ab-item\";s:12:\"anonymize_ip\";s:2:\"no\";s:15:\"ignore_prefetch\";s:3:\"yes\";s:21:\"restrict_authors_view\";s:3:\"yes\";s:19:\"capability_can_view\";s:16:\"activate_plugins\";s:8:\"can_view\";s:0:\"\";s:20:\"capability_can_admin\";s:16:\"activate_plugins\";s:9:\"can_admin\";s:0:\"\";s:16:\"detect_smoothing\";s:3:\"yes\";s:16:\"session_duration\";i:1800;s:14:\"extend_session\";s:2:\"no\";s:10:\"enable_cdn\";s:3:\"yes\";s:19:\"extensions_to_track\";s:15:\"pdf,doc,xls,zip\";s:16:\"external_domains\";s:0:\"\";s:14:\"show_sql_debug\";s:2:\"no\";s:17:\"ip_lookup_service\";s:38:\"http://www.infosniper.net/?ip_address=\";s:10:\"custom_css\";s:0:\"\";s:18:\"enable_ads_network\";s:2:\"no\";s:18:\"last_tracker_error\";a:3:{i:0;i:211;i:1;s:15:\"Bot not tracked\";i:2;s:10:\"1431348935\";}s:14:\"locked_options\";s:0:\"\";s:32:\"include_outbound_links_right_now\";s:3:\"yes\";s:23:\"ignore_outbound_classes\";s:18:\"noslimstat,ab-item\";s:19:\"ignore_outbound_rel\";s:0:\"\";s:20:\"ignore_outbound_href\";s:0:\"\";s:29:\"do_not_track_outbound_classes\";s:18:\"noslimstat,ab-item\";s:25:\"do_not_track_outbound_rel\";s:0:\"\";s:26:\"do_not_track_outbound_href\";s:0:\"\";s:14:\"reset_timezone\";s:3:\"yes\";s:16:\"date_time_format\";s:11:\"m-d-y h:i a\";}','no'),(119,'slimstat_visit_id','142','yes'),(120,'w3tc_request_data','','no'),(121,'akismet_strictness','0','yes'),(122,'akismet_show_user_comments_approved','0','yes'),(123,'wordpress_api_key','be182fa90de7','yes'),(125,'zh_cn_l10n_icp_num','','yes'),(126,'syntaxhighlighter_settings','a:15:{s:9:\"shversion\";i:3;s:5:\"theme\";s:5:\"rdark\";s:6:\"gutter\";i:1;s:9:\"smarttabs\";i:1;s:9:\"wraplines\";i:1;s:9:\"classname\";s:0:\"\";s:9:\"firstline\";s:1:\"1\";s:14:\"padlinenumbers\";s:5:\"false\";s:7:\"tabsize\";s:1:\"4\";s:5:\"title\";s:0:\"\";s:14:\"loadallbrushes\";i:0;s:9:\"autolinks\";i:0;s:8:\"collapse\";i:0;s:5:\"light\";i:0;s:7:\"toolbar\";i:0;}','yes'),(127,'sm_options','a:51:{s:18:\"sm_b_prio_provider\";s:41:\"GoogleSitemapGeneratorPrioByCountProvider\";s:9:\"sm_b_ping\";b:1;s:10:\"sm_b_stats\";b:0;s:12:\"sm_b_pingmsn\";b:1;s:12:\"sm_b_autozip\";b:1;s:11:\"sm_b_memory\";s:0:\"\";s:9:\"sm_b_time\";i:-1;s:18:\"sm_b_style_default\";b:1;s:10:\"sm_b_style\";s:0:\"\";s:12:\"sm_b_baseurl\";s:0:\"\";s:11:\"sm_b_robots\";b:1;s:9:\"sm_b_html\";b:1;s:12:\"sm_b_exclude\";a:0:{}s:17:\"sm_b_exclude_cats\";a:0:{}s:10:\"sm_in_home\";b:1;s:11:\"sm_in_posts\";b:1;s:15:\"sm_in_posts_sub\";b:0;s:11:\"sm_in_pages\";b:1;s:10:\"sm_in_cats\";b:0;s:10:\"sm_in_arch\";b:0;s:10:\"sm_in_auth\";b:0;s:10:\"sm_in_tags\";b:0;s:9:\"sm_in_tax\";a:0:{}s:17:\"sm_in_customtypes\";a:0:{}s:13:\"sm_in_lastmod\";b:1;s:10:\"sm_cf_home\";s:5:\"daily\";s:11:\"sm_cf_posts\";s:7:\"monthly\";s:11:\"sm_cf_pages\";s:6:\"weekly\";s:10:\"sm_cf_cats\";s:6:\"weekly\";s:10:\"sm_cf_auth\";s:6:\"weekly\";s:15:\"sm_cf_arch_curr\";s:5:\"daily\";s:14:\"sm_cf_arch_old\";s:6:\"yearly\";s:10:\"sm_cf_tags\";s:6:\"weekly\";s:10:\"sm_pr_home\";d:1;s:11:\"sm_pr_posts\";d:0.59999999999999998;s:15:\"sm_pr_posts_min\";d:0.20000000000000001;s:11:\"sm_pr_pages\";d:0.59999999999999998;s:10:\"sm_pr_cats\";d:0.29999999999999999;s:10:\"sm_pr_arch\";d:0.29999999999999999;s:10:\"sm_pr_auth\";d:0.29999999999999999;s:10:\"sm_pr_tags\";d:0.29999999999999999;s:12:\"sm_i_donated\";b:0;s:17:\"sm_i_hide_donated\";b:0;s:17:\"sm_i_install_date\";i:1404038502;s:14:\"sm_i_hide_note\";b:1;s:15:\"sm_i_hide_works\";b:0;s:16:\"sm_i_hide_donors\";b:0;s:9:\"sm_i_hash\";s:20:\"7597d90adfbfbe57e6ea\";s:13:\"sm_i_lastping\";i:1409671829;s:16:\"sm_i_supportfeed\";b:1;s:22:\"sm_i_supportfeed_cache\";i:1431343159;}','yes'),(128,'sm_status','O:28:\"GoogleSitemapGeneratorStatus\":4:{s:39:\"\0GoogleSitemapGeneratorStatus\0startTime\";d:1409671828.2859421;s:37:\"\0GoogleSitemapGeneratorStatus\0endTime\";d:1409671828.985707;s:41:\"\0GoogleSitemapGeneratorStatus\0pingResults\";a:2:{s:6:\"google\";a:5:{s:9:\"startTime\";d:1409671828.2959609;s:7:\"endTime\";d:1409671828.753206;s:7:\"success\";b:1;s:3:\"url\";s:97:\"http://www.google.com/webmasters/sitemaps/ping?sitemap=http%3A%2F%2Ftech.liuchao.me%2Fsitemap.xml\";s:4:\"name\";s:6:\"Google\";}s:4:\"bing\";a:5:{s:9:\"startTime\";d:1409671828.756182;s:7:\"endTime\";d:1409671828.976959;s:7:\"success\";b:1;s:3:\"url\";s:90:\"http://www.bing.com/webmaster/ping.aspx?siteMap=http%3A%2F%2Ftech.liuchao.me%2Fsitemap.xml\";s:4:\"name\";s:4:\"Bing\";}}s:38:\"\0GoogleSitemapGeneratorStatus\0autoSave\";b:1;}','no'),(132,'wp-optimize-settings','a:5:{s:14:\"user-revisions\";b:1;s:11:\"user-drafts\";b:1;s:10:\"user-spams\";b:1;s:15:\"user-unapproved\";b:1;s:13:\"user-optimize\";b:1;}','yes'),(145,'category_children','a:0:{}','yes'),(146,'swiftype_api_key','y9-RwJDgzjZqYPfPTwb5','yes'),(147,'swiftype_api_authorized','1','yes'),(148,'swiftype_create_engine','blog','yes'),(155,'WPLANG','zh_CN','yes'),(156,'db_upgraded','','yes'),(171,'dbprefix_old_dbprefix','tech','yes'),(172,'dbprefix_new','t_','yes'),(190,'akismet_spam_count','11','yes'),(295,'rewrite_rules','a:75:{s:34:\"sitemap(-+([a-zA-Z0-9_-]+))?\\.xml$\";s:40:\"index.php?xml_sitemap=params=$matches[2]\";s:38:\"sitemap(-+([a-zA-Z0-9_-]+))?\\.xml\\.gz$\";s:49:\"index.php?xml_sitemap=params=$matches[2];zip=true\";s:35:\"sitemap(-+([a-zA-Z0-9_-]+))?\\.html$\";s:50:\"index.php?xml_sitemap=params=$matches[2];html=true\";s:38:\"sitemap(-+([a-zA-Z0-9_-]+))?\\.html.gz$\";s:59:\"index.php?xml_sitemap=params=$matches[2];html=true;zip=true\";s:38:\"qiniu/([^/]+)/image/([^/]+)\\.([^/]+)?$\";s:76:\"index.php?p=$matches[1]&qiniu_image=$matches[2]&qiniu_image_type=$matches[3]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:44:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:69:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&tb=1\";s:64:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&feed=$matches[4]\";s:59:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&feed=$matches[4]\";s:52:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&paged=$matches[4]\";s:59:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&cpage=$matches[4]\";s:44:\"([0-9]{4})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&page=$matches[4]\";s:36:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(296,'can_compress_scripts','0','yes'),(297,'wp-optimize-email','true','no'),(298,'si_captcha','a:33:{s:18:\"si_captcha_donated\";s:5:\"false\";s:15:\"si_captcha_perm\";s:4:\"true\";s:21:\"si_captcha_perm_level\";s:4:\"read\";s:18:\"si_captcha_comment\";s:4:\"true\";s:33:\"si_captcha_comment_label_position\";s:20:\"input-label-required\";s:16:\"si_captcha_login\";s:5:\"false\";s:19:\"si_captcha_register\";s:4:\"true\";s:18:\"si_captcha_lostpwd\";s:4:\"true\";s:20:\"si_captcha_rearrange\";s:4:\"true\";s:25:\"si_captcha_enable_session\";s:5:\"false\";s:24:\"si_captcha_captcha_small\";s:5:\"false\";s:26:\"si_captcha_honeypot_enable\";s:5:\"false\";s:24:\"si_captcha_aria_required\";s:5:\"false\";s:25:\"si_captcha_external_style\";s:5:\"false\";s:28:\"si_captcha_captcha_div_style\";s:14:\"display:block;\";s:31:\"si_captcha_captcha_div_style_sm\";s:43:\"width:175px; height:45px; padding-top:10px;\";s:30:\"si_captcha_captcha_div_style_m\";s:43:\"width:250px; height:60px; padding-top:10px;\";s:30:\"si_captcha_captcha_image_style\";s:59:\"border-style:none; margin:0; padding-right:5px; float:left;\";s:30:\"si_captcha_refresh_image_style\";s:51:\"border-style:none; margin:0; vertical-align:bottom;\";s:34:\"si_captcha_captcha_input_div_style\";s:52:\"display:block; padding-top:15px; padding-bottom:5px;\";s:30:\"si_captcha_comment_label_style\";s:9:\"margin:0;\";s:30:\"si_captcha_comment_field_style\";s:11:\"width:65px;\";s:24:\"si_captcha_label_captcha\";s:0:\"\";s:24:\"si_captcha_error_spambot\";s:0:\"\";s:26:\"si_captcha_error_incorrect\";s:0:\"\";s:22:\"si_captcha_error_empty\";s:0:\"\";s:22:\"si_captcha_error_token\";s:0:\"\";s:27:\"si_captcha_error_unreadable\";s:0:\"\";s:23:\"si_captcha_error_cookie\";s:0:\"\";s:22:\"si_captcha_error_error\";s:0:\"\";s:29:\"si_captcha_required_indicator\";s:2:\" *\";s:26:\"si_captcha_tooltip_captcha\";s:0:\"\";s:26:\"si_captcha_tooltip_refresh\";s:0:\"\";}','yes'),(319,'dismissed_update_core','a:1:{s:11:\"4.2.2|zh_CN\";b:1;}','yes'),(323,'wp-optimize-current-cleaned','0','yes');
/*!40000 ALTER TABLE `t_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_postmeta`
--

DROP TABLE IF EXISTS `t_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_postmeta`
--

LOCK TABLES `t_postmeta` WRITE;
/*!40000 ALTER TABLE `t_postmeta` DISABLE KEYS */;
INSERT INTO `t_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,1,'_edit_lock','1409671793:1'),(3,1,'_edit_last','1'),(6,1,'_syntaxhighlighter_encoded','1'),(9,1,'_wp_old_slug','hello-world'),(12,1,'_wp_old_slug','query-rewrite-andproxy-pass-in-fiddler');
/*!40000 ALTER TABLE `t_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_posts`
--

DROP TABLE IF EXISTS `t_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_name` (`post_name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_posts`
--

LOCK TABLES `t_posts` WRITE;
/*!40000 ALTER TABLE `t_posts` DISABLE KEYS */;
INSERT INTO `t_posts` VALUES (1,1,'2014-06-29 09:54:54','2014-06-29 09:54:54','<ul>\r\n	<li>项目部署</li>\r\n</ul>\r\n项目中部署了两个服务，分别用于提供前端页面展示（Tomcat-A）和后端数据 API（Tomcat-B），nginx 上的 rewrite 规则如下：\r\n\r\n[php]\r\nserver {\r\n\r\n    ...\r\n\r\n    location /data {\r\n        proxy_pass tomcat_b;\r\n        break;\r\n    }\r\n\r\n    location / {\r\n        proxy_pass tomcat_a;\r\n        break;\r\n    }\r\n\r\n    ...\r\n}\r\n[/php]\r\n\r\n因为浏览器出于安全考虑，前端页面展示想要获取远程数据，目前有几种方法：\r\n\r\n（1）Tomcat-A 和 Tomcat-B 在同一域名下；\r\n\r\n（2）Tomcat-B的必须显示指明 HTTP 头：Access-Control-Allow-Origin: http://client.example.com；\r\n\r\n（3）JSONP；\r\n\r\n我们这里采用的是方案（1）\r\n<ul>\r\n	<li>繁琐的本地调试</li>\r\n</ul>\r\n本地 eclipse 调试两个项目，开启了两个端口：Tomcat-A 占用8080，Tomcat-B 占用8081。这时就会出现问题：前端页面在调用后端 API 的时候，因为端口不同，无法使用相对路径；而又因为在不同域名下，不显式指明 Access-Control-Allow-Origin 头，AJAX 也无法请求。\r\n<ul>\r\n	<li><a title=\"Fiddler\" href=\"http://www.telerik.com/fiddler\" target=\"_blank\">Fiddler</a> 出场</li>\r\n</ul>\r\n\r\n[js]\r\nif (oSession.uriContains(&quot;/data/&quot;)){\r\n    oSession.host = &quot;localhost:8081&quot;;\r\n}\r\n[/js]\r\n\r\n参考资料：\r\n\r\n1. <a title=\"Fiddler Web Debugger - Script Samples\" href=\"http://fiddlerbook.com/Fiddler/dev/ScriptSamples.asp\" target=\"_blank\">Fiddler Web Debugger - Script Samples</a>','Fiddler 中的 rewrite 和 proxy_pass','','publish','open','open','','query-rewrite-and-proxy-pass-in-fiddler','','','2014-09-02 23:30:19','2014-09-02 15:30:19','',0,'http://tech.liuchao.me/?p=1',0,'post','',1),(2,1,'2014-06-29 09:54:54','2014-06-29 09:54:54','这是示范页面。页面和博客文章不同，它的位置是固定的，通常会在站点导航栏显示。很多用户都创建一个“关于”页面，向访客介绍自己。例如，个人博客通常有类似这样的介绍：\n\n<blockquote>欢迎！我白天是个邮递员，晚上就是个有抱负的演员。这是我的博客。我住在天朝的帝都，有条叫做杰克的狗。</blockquote>\n\n……公司博客可以这样写：\n\n<blockquote>XYZ Doohickey公司成立于1971年，自从建立以来，我们一直向社会贡献着优秀doohicky。我们的公司总部位于天朝魔都，有着超过两千名员工，对魔都政府税收有着巨大贡献。</blockquote>\n\n您可以访问<a href=\"http://tech.liuchao.me/wp-admin/\">仪表盘</a>，删除本页面，然后添加您自己的内容。祝您使用愉快！','示例页面','','publish','open','open','','sample-page','','','2014-06-29 09:54:54','2014-06-29 09:54:54','',0,'http://tech.liuchao.me/?page_id=2',0,'page','',0),(4,1,'2015-05-17 17:24:35','0000-00-00 00:00:00','','自动草稿','','auto-draft','open','open','','','','','2015-05-17 17:24:35','0000-00-00 00:00:00','',0,'http://tech.liuchao.me/?p=4',0,'post','',0);
/*!40000 ALTER TABLE `t_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slim_browsers`
--

DROP TABLE IF EXISTS `t_slim_browsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slim_browsers` (
  `browser_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `browser` varchar(40) DEFAULT '',
  `version` varchar(15) DEFAULT '',
  `platform` varchar(15) DEFAULT '',
  `css_version` varchar(5) DEFAULT '',
  `type` tinyint(3) unsigned DEFAULT '0',
  `user_agent` varchar(2048) DEFAULT '',
  PRIMARY KEY (`browser_id`),
  UNIQUE KEY `uk_techbrowsers` (`browser`,`version`,`platform`,`css_version`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_browsers`
--

LOCK TABLES `t_slim_browsers` WRITE;
/*!40000 ALTER TABLE `t_slim_browsers` DISABLE KEYS */;
INSERT INTO `t_slim_browsers` VALUES (1,'Chrome','34','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36 Android'),(2,'Chrome','35','win7','1',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36'),(3,'Chrome','0','android','3',2,'Mozilla/5.0 (Linux; Android 4.1.1; MI 2 Build/JRO03L) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.141 Mobile Safari/537.36'),(4,'Firefox','30','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0'),(5,'IE','9','win7','3',0,'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)'),(6,'Chrome','36','win7','1',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36'),(7,'Chrome','36','android','false',2,'Mozilla/5.0 (Linux; Android 4.1.1; MI 2 Build/JRO03L) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.128 Mobile Safari/537.36'),(8,'Chrome','36','win7','false',0,'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36'),(9,'Google Bot','2','unknown','true',0,'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),(10,'Chrome','36','win7','3',0,'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36'),(11,'Chrome','37','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.94 Safari/537.36'),(12,'Chrome','35','win8.1','3',0,'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Iron/35.0.1900.0 Chrome/35.0.1900.0 Safari/537.36'),(13,'IE','7','winxp','2',0,'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)'),(14,'Qt','4','linux','3',0,'Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Qt/4.7.1 Safari/533.3'),(15,'Chrome','31','winxp','3',0,'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36'),(16,'Chrome','38','win7','1',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36'),(17,'Chrome','39','macosx','1',0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36'),(18,'Chrome','39','win7','1',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36'),(19,'Chrome','38','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36'),(20,'Chrome','37','win8.1','3',0,'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36'),(21,'Chrome','35','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36 SE 2.X MetaSr 1.0'),(22,'Chrome','33','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36'),(23,'Safari','7','macosx','3',0,'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53 BingPreview/1.0b'),(24,'Chrome','39','macosx','3',0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'),(25,'Facebook App','0','ios','3',2,'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B436 [FBAN/MessengerForiOS;FBAV/18.0.0.21.22;FBBV/6018227;FBDV/iPhone7,2;FBMD/iPhone;FBSN/iPhone OS;FBSV/8.1.1;FBSS/2; FBCR/AT&T;FBID/phone;FBLC/en_US;FBOP/5]'),(26,'Firefox','34','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0'),(27,'Chrome','39','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36'),(28,'Chrome','40','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36'),(29,'Chrome','40','macosx','3',0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36'),(30,'Chrome','31','win8','3',0,'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36'),(31,'Safari','8','macosx','3',0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/600.4.10 (KHTML, like Gecko) Version/8.0.4 Safari/600.4.10'),(32,'Chrome','41','win8.1','3',0,'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36'),(33,'Chrome','41','macosx','3',0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36');
/*!40000 ALTER TABLE `t_slim_browsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slim_content_info`
--

DROP TABLE IF EXISTS `t_slim_content_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slim_content_info` (
  `content_info_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(64) DEFAULT '',
  `category` varchar(256) DEFAULT '',
  `author` varchar(64) DEFAULT '',
  `content_id` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`content_info_id`),
  UNIQUE KEY `uk_techcontent_info` (`content_type`(20),`category`(20),`author`(20),`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_content_info`
--

LOCK TABLES `t_slim_content_info` WRITE;
/*!40000 ALTER TABLE `t_slim_content_info` DISABLE KEYS */;
INSERT INTO `t_slim_content_info` VALUES (1,'login','','',0),(2,'home','','',0),(3,'post','1','admin',1),(4,'date','','',0),(5,'page','','admin',2),(6,'author','','',0),(7,'category','1','',0),(8,'post','3,5,4','admin',1),(9,'post','3,5','admin',1),(10,'category','3','',0);
/*!40000 ALTER TABLE `t_slim_content_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slim_events`
--

DROP TABLE IF EXISTS `t_slim_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slim_events` (
  `event_id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned DEFAULT '0',
  `event_description` varchar(64) DEFAULT NULL,
  `notes` varchar(256) DEFAULT NULL,
  `position` varchar(32) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `dt` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`event_id`),
  KEY `idx_t_slim_events` (`dt`),
  KEY `fk_t_id` (`id`),
  CONSTRAINT `fk_t_id` FOREIGN KEY (`id`) REFERENCES `t_slim_stats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_events`
--

LOCK TABLES `t_slim_events` WRITE;
/*!40000 ALTER TABLE `t_slim_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_slim_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slim_outbound`
--

DROP TABLE IF EXISTS `t_slim_outbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slim_outbound` (
  `outbound_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `outbound_domain` varchar(255) DEFAULT '',
  `outbound_resource` varchar(2048) DEFAULT '',
  `type` tinyint(3) unsigned DEFAULT '0',
  `notes` varchar(512) DEFAULT '',
  `position` varchar(32) DEFAULT '',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `dt` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`outbound_id`),
  KEY `idx_techslim_outbound` (`dt`),
  KEY `fk_techid` (`id`),
  CONSTRAINT `fk_techid` FOREIGN KEY (`id`) REFERENCES `t_slim_stats_3` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_outbound`
--

LOCK TABLES `t_slim_outbound` WRITE;
/*!40000 ALTER TABLE `t_slim_outbound` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_slim_outbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slim_screenres`
--

DROP TABLE IF EXISTS `t_slim_screenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slim_screenres` (
  `screenres_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resolution` varchar(12) DEFAULT '',
  `colordepth` varchar(5) DEFAULT '',
  `antialias` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`screenres_id`),
  UNIQUE KEY `uk_techscreenres` (`resolution`,`colordepth`,`antialias`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_screenres`
--

LOCK TABLES `t_slim_screenres` WRITE;
/*!40000 ALTER TABLE `t_slim_screenres` DISABLE KEYS */;
INSERT INTO `t_slim_screenres` VALUES (3,'1024x1024','24',1),(1,'1024x768','24',1),(8,'1024x768','32',0),(5,'1280x720','24',1),(16,'1280x800','24',1),(18,'1360x768','24',1),(6,'1366x768','24',1),(21,'1366x768','32',1),(17,'1440x900','24',1),(12,'1440x900','32',0),(15,'1536x864','24',1),(2,'1600x900','24',1),(11,'1680x1050','24',1),(13,'1920x1080','24',0),(7,'1920x1080','24',1),(14,'1920x1200','24',1),(9,'320x480','24',1),(19,'320x568','24',1),(4,'360x640','32',1),(20,'375x667','32',1),(10,'800x600','32',1);
/*!40000 ALTER TABLE `t_slim_screenres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slim_stats`
--

DROP TABLE IF EXISTS `t_slim_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slim_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` int(10) unsigned DEFAULT '0',
  `other_ip` int(10) unsigned DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `country` varchar(16) DEFAULT NULL,
  `referer` varchar(2048) DEFAULT NULL,
  `resource` varchar(2048) DEFAULT NULL,
  `searchterms` varchar(2048) DEFAULT NULL,
  `plugins` varchar(255) DEFAULT NULL,
  `notes` varchar(2048) DEFAULT NULL,
  `visit_id` int(10) unsigned NOT NULL DEFAULT '0',
  `server_latency` int(10) unsigned DEFAULT '0',
  `page_performance` int(10) unsigned DEFAULT '0',
  `browser` varchar(40) DEFAULT NULL,
  `browser_version` varchar(15) DEFAULT NULL,
  `browser_type` tinyint(3) unsigned DEFAULT '0',
  `platform` varchar(15) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `user_agent` varchar(2048) DEFAULT NULL,
  `resolution` varchar(12) DEFAULT NULL,
  `screen_width` smallint(5) unsigned DEFAULT '0',
  `screen_height` smallint(5) unsigned DEFAULT '0',
  `content_type` varchar(64) DEFAULT NULL,
  `category` varchar(256) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `content_id` bigint(20) unsigned DEFAULT '0',
  `outbound_resource` varchar(2048) DEFAULT NULL,
  `dt` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_t_slim_stats_dt` (`dt`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_stats`
--

LOCK TABLES `t_slim_stats` WRITE;
/*!40000 ALTER TABLE `t_slim_stats` DISABLE KEYS */;
INSERT INTO `t_slim_stats` VALUES (210,2616644901,0,NULL,'us','http://liuchao.me/','/',NULL,'flash',NULL,128,262,919,'Chrome','39',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1421632973),(211,2616644901,0,NULL,'us','http://tech.liuchao.me/','/',NULL,'flash',NULL,128,4,50,'Chrome','39',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1421632982),(212,2616644901,0,NULL,'us','http://tech.liuchao.me/','/sample-page/',NULL,'flash',NULL,128,505,5663,'Chrome','39',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36',NULL,9812,9812,'page',NULL,'admin',2,NULL,1421632994),(213,2616644901,0,NULL,'us','http://tech.liuchao.me/sample-page/','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/&reauth=1',NULL,'flash',NULL,128,358,823,'Chrome','39',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36',NULL,9812,9812,'login',NULL,NULL,0,NULL,1421633006),(214,1032310723,0,NULL,'cn',NULL,'/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/index.php&reauth=1',NULL,'flash',NULL,129,257,1338,'Chrome','39',0,'win7','zh-cn','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36',NULL,9812,9812,'login',NULL,NULL,0,NULL,1421679945),(215,1032310723,0,'admin','cn','http://tech.liuchao.me/wp-admin/index.php','/',NULL,'flash','user:1;',129,1368,2608,'Chrome','39',0,'win7','zh-cn','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1421680140),(216,1032310723,0,'admin','cn','http://tech.liuchao.me/wp-admin/index.php','/',NULL,'flash','user:1;',129,918,1634,'Chrome','39',0,'win7','zh-cn','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1421680268),(217,1032310723,0,'admin','cn','http://tech.liuchao.me/wp-admin/edit.php','/',NULL,'flash','user:1;',129,710,157,'Chrome','39',0,'win7','zh-cn','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1421680336),(218,1032310723,0,'admin','cn','http://tech.liuchao.me/wp-admin/edit.php','/',NULL,'flash','user:1;',129,569,1215,'Chrome','39',0,'win7','zh-cn','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1421680390),(219,2791896359,0,NULL,'kr','http://liuchao.me/','/',NULL,'flash',NULL,130,103,684,'Chrome','39',0,'win7','zh-cn','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1421835809),(220,1875509301,0,'admin','cn',NULL,'/',NULL,'flash','user:1;',131,1411,1268,'Chrome','40',0,'win7','zh-cn','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1422780734),(221,1008472782,0,NULL,'cn',NULL,'/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/index.php&reauth=1',NULL,'flash',NULL,132,326,816,'Chrome','40',0,'win7','zh-cn','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'login',NULL,NULL,0,NULL,1423402853),(222,1246220762,0,NULL,'us','http://liuchao.me/','/',NULL,'acrobat,flash,quicktime,silverlight',NULL,133,299,1000,'Chrome','39',0,'win7','en-us','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1424065958),(223,846466448,0,NULL,'us','http://www.liuchao.me/','/',NULL,'acrobat,flash',NULL,134,3505,1945,'Chrome','40',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1425116576),(224,846466448,0,NULL,'us','http://tech.liuchao.me/','/',NULL,'acrobat,flash',NULL,134,3,104,'Chrome','40',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1425116601),(225,1195920956,0,NULL,'us','http://liuchao.me/','/',NULL,'acrobat,flash',NULL,135,431,907,'Chrome','40',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1425355696),(226,1195920956,0,NULL,'us','http://tech.liuchao.me/','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/',NULL,'acrobat,flash',NULL,135,820,1346,'Chrome','40',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'post','3,5','admin',1,NULL,1425355708),(227,1195920956,0,NULL,'us','http://tech.liuchao.me/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','/',NULL,'acrobat,flash',NULL,135,2,64,'Chrome','40',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1425355708),(228,1195920956,0,NULL,'us','http://tech.liuchao.me/','/sample-page/',NULL,'acrobat,flash',NULL,135,385,516,'Chrome','40',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'page',NULL,'admin',2,NULL,1425355710),(229,1195920956,0,NULL,'us','http://tech.liuchao.me/sample-page/','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/&reauth=1',NULL,'acrobat,flash',NULL,135,484,816,'Chrome','40',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'login',NULL,NULL,0,NULL,1425355738),(230,1195920956,0,NULL,'us','http://tech.liuchao.me/','/sample-page/',NULL,'acrobat,flash',NULL,135,2,109,'Chrome','40',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'page',NULL,'admin',2,NULL,1425355739),(231,1195920956,0,NULL,'us','http://tech.liuchao.me/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','/',NULL,'acrobat,flash',NULL,135,2,99,'Chrome','40',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1425355740),(232,1195920956,0,NULL,'us','http://tech.liuchao.me/','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/',NULL,'acrobat,flash',NULL,135,3,176,'Chrome','40',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'post','3,5','admin',1,NULL,1425355741),(233,1195920956,0,NULL,'us','http://liuchao.me/','/',NULL,'acrobat,flash',NULL,135,3,101,'Chrome','40',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1425355742),(234,1885005629,0,NULL,'cn','http://liuchao.me/','/',NULL,'flash,mediaplayer,silverlight',NULL,136,123,1333,'Chrome','31',0,'win8','zh-cn','Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1425971551),(235,2026323058,0,NULL,'cn','http://www.baidu.com/link?url=OKzuhjSevMSDwXCnRAr-dSdol3yrOzbF0LTrI4jZt33W0OzXLy4hzMx2vwcEhTAo&wd=toolsmatter&issp=1&f=8&ie=utf-8&tn=baiduhome_pg&inputT=5584','/','toolsmatter','flash,quicktime',NULL,137,117,2975,'Safari','8',0,'macosx','en-us','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/600.4.10 (KHTML, like Gecko) Version/8.0.4 Safari/600.4.10',NULL,9812,9812,'home',NULL,NULL,0,NULL,1427111923),(236,989167000,0,NULL,'cn','http://liuchao.me/','/',NULL,'flash',NULL,138,241,952,'Chrome','40',0,'win7','zh-cn','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1427722405),(237,1109738123,0,NULL,'us','http://liuchao.me/','/',NULL,'flash',NULL,139,251,888,'Chrome','41',0,'win8.1','en-us','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1427952343),(238,3722365984,0,NULL,'cn','http://liuchao.me/','/',NULL,'flash',NULL,140,174,2728,'Chrome','41',0,'macosx','zh-cn','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1427978196),(239,1928819566,0,NULL,'cn','http://liuchao.me/','/',NULL,'flash',NULL,141,135,1187,'Chrome','41',0,'win8.1','zh-cn','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1429713451),(240,1928819566,0,NULL,'cn','http://tech.liuchao.me/','/sample-page/',NULL,'flash',NULL,141,259,863,'Chrome','41',0,'win8.1','zh-cn','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36',NULL,9812,9812,'page',NULL,'admin',2,NULL,1429713468),(241,1928819566,0,NULL,'cn','http://tech.liuchao.me/sample-page/','/',NULL,'flash',NULL,141,14,174,'Chrome','41',0,'win8.1','zh-cn','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1429713500),(242,1928819566,0,NULL,'cn','http://tech.liuchao.me/','/sample-page/',NULL,'flash',NULL,141,165,598,'Chrome','41',0,'win8.1','zh-cn','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36',NULL,9812,9812,'page',NULL,'admin',2,NULL,1429713503),(243,1928819566,0,NULL,'cn','http://tech.liuchao.me/sample-page/','/',NULL,'flash',NULL,141,6,158,'Chrome','41',0,'win8.1','zh-cn','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1429713504),(244,1928819566,0,NULL,'cn','http://tech.liuchao.me/','/sample-page/',NULL,'flash',NULL,141,21,676,'Chrome','41',0,'win8.1','zh-cn','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36',NULL,9812,9812,'page',NULL,'admin',2,NULL,1429713509),(245,1928819566,0,NULL,'cn','http://tech.liuchao.me/sample-page/','/',NULL,'flash',NULL,141,9,151,'Chrome','41',0,'win8.1','zh-cn','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1429713509),(246,1928819566,0,NULL,'cn','http://tech.liuchao.me/','/sample-page/',NULL,'flash',NULL,141,7,654,'Chrome','41',0,'win8.1','zh-cn','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36',NULL,9812,9812,'page',NULL,'admin',2,NULL,1429713511),(247,1928819566,0,NULL,'cn','http://liuchao.me/','/',NULL,'flash',NULL,141,8,160,'Chrome','41',0,'win8.1','zh-cn','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1429713511),(248,1928819566,0,NULL,'cn','http://liuchao.me/','/',NULL,'flash',NULL,141,7,167,'Chrome','41',0,'win8.1','zh-cn','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1429713527),(249,1032310723,0,NULL,'cn','http://liuchao.me/','/',NULL,'flash,silverlight',NULL,142,197,21292,'Chrome','40',0,'win7','zh-cn','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36',NULL,9812,9812,'home',NULL,NULL,0,NULL,1429867810);
/*!40000 ALTER TABLE `t_slim_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slim_stats_3`
--

DROP TABLE IF EXISTS `t_slim_stats_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slim_stats_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` int(10) unsigned DEFAULT '0',
  `other_ip` int(10) unsigned DEFAULT '0',
  `user` varchar(255) DEFAULT '',
  `language` varchar(5) DEFAULT '',
  `country` varchar(16) DEFAULT '',
  `domain` varchar(255) DEFAULT '',
  `referer` varchar(2048) DEFAULT '',
  `resource` varchar(2048) DEFAULT '',
  `searchterms` varchar(2048) DEFAULT '',
  `browser_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `screenres_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_info_id` int(10) unsigned NOT NULL DEFAULT '1',
  `plugins` varchar(255) DEFAULT '',
  `notes` varchar(2048) DEFAULT '',
  `visit_id` int(10) unsigned NOT NULL DEFAULT '0',
  `server_latency` int(10) unsigned DEFAULT '0',
  `page_performance` int(10) unsigned DEFAULT '0',
  `dt` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_techslim_stats_dt` (`dt`),
  KEY `fk_techbrowser_id` (`browser_id`),
  KEY `fk_techcontent_info_id` (`content_info_id`),
  CONSTRAINT `fk_techbrowser_id` FOREIGN KEY (`browser_id`) REFERENCES `t_slim_browsers` (`browser_id`),
  CONSTRAINT `fk_techcontent_info_id` FOREIGN KEY (`content_info_id`) REFERENCES `t_slim_content_info` (`content_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_stats_3`
--

LOCK TABLES `t_slim_stats_3` WRITE;
/*!40000 ALTER TABLE `t_slim_stats_3` DISABLE KEYS */;
INSERT INTO `t_slim_stats_3` VALUES (210,2616644901,0,'','en-us','us','liuchao.me','http://liuchao.me/','/','',24,17,2,'flash','',128,262,919,1421632973),(211,2616644901,0,'','en-us','us','tech.liuchao.me','http://tech.liuchao.me/','/','',24,17,2,'flash','',128,4,50,1421632982),(212,2616644901,0,'','en-us','us','tech.liuchao.me','http://tech.liuchao.me/','/sample-page/','',24,17,5,'flash','',128,505,5663,1421632994),(213,2616644901,0,'','en-us','us','tech.liuchao.me','http://tech.liuchao.me/sample-page/','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/&reauth=1','',24,17,1,'flash','',128,358,823,1421633006),(214,1032310723,0,'','zh-cn','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/index.php&reauth=1','',27,7,1,'flash','',129,257,1338,1421679945),(215,1032310723,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/index.php','/','',27,7,2,'flash','user:1;',129,1368,2608,1421680140),(216,1032310723,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/index.php','/','',27,7,2,'flash','user:1;',129,918,1634,1421680268),(217,1032310723,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/edit.php','/','',27,7,2,'flash','user:1;',129,710,157,1421680336),(218,1032310723,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/edit.php','/','',27,7,2,'flash','user:1;',129,569,1215,1421680390),(219,2791896359,0,'','zh-cn','kr','liuchao.me','http://liuchao.me/','/','',27,7,2,'flash','',130,103,684,1421835809),(220,1875509301,0,'admin','zh-cn','cn','','','/','',28,2,2,'flash','user:1;',131,1411,1268,1422780734),(221,1008472782,0,'','zh-cn','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/index.php&reauth=1','',28,2,1,'flash','',132,326,816,1423402853),(222,1246220762,0,'','en-us','us','liuchao.me','http://liuchao.me/','/','',27,7,2,'acrobat,flash,quicktime,silverlight','',133,299,1000,1424065958),(223,846466448,0,'','en-us','us','www.liuchao.me','http://www.liuchao.me/','/','',29,17,2,'acrobat,flash','',134,3505,1945,1425116576),(224,846466448,0,'','en-us','us','tech.liuchao.me','http://tech.liuchao.me/','/','',29,17,2,'acrobat,flash','',134,3,104,1425116601),(225,1195920956,0,'','en-us','us','liuchao.me','http://liuchao.me/','/','',29,17,2,'acrobat,flash','',135,431,907,1425355696),(226,1195920956,0,'','en-us','us','tech.liuchao.me','http://tech.liuchao.me/','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',29,17,9,'acrobat,flash','',135,820,1346,1425355708),(227,1195920956,0,'','en-us','us','tech.liuchao.me','http://tech.liuchao.me/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','/','',29,17,2,'acrobat,flash','',135,2,64,1425355708),(228,1195920956,0,'','en-us','us','tech.liuchao.me','http://tech.liuchao.me/','/sample-page/','',29,17,5,'acrobat,flash','',135,385,516,1425355710),(229,1195920956,0,'','en-us','us','tech.liuchao.me','http://tech.liuchao.me/sample-page/','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/&reauth=1','',29,17,1,'acrobat,flash','',135,484,816,1425355738),(230,1195920956,0,'','en-us','us','tech.liuchao.me','http://tech.liuchao.me/','/sample-page/','',29,17,5,'acrobat,flash','',135,2,109,1425355739),(231,1195920956,0,'','en-us','us','tech.liuchao.me','http://tech.liuchao.me/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','/','',29,17,2,'acrobat,flash','',135,2,99,1425355740),(232,1195920956,0,'','en-us','us','tech.liuchao.me','http://tech.liuchao.me/','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',29,17,9,'acrobat,flash','',135,3,176,1425355741),(233,1195920956,0,'','en-us','us','liuchao.me','http://liuchao.me/','/','',29,17,2,'acrobat,flash','',135,3,101,1425355742),(234,1885005629,0,'','zh-cn','cn','liuchao.me','http://liuchao.me/','/','',30,21,2,'flash,mediaplayer,silverlight','',136,123,1333,1425971551),(235,2026323058,0,'','en-us','cn','www.baidu.com','http://www.baidu.com/link?url=OKzuhjSevMSDwXCnRAr-dSdol3yrOzbF0LTrI4jZt33W0OzXLy4hzMx2vwcEhTAo&wd=toolsmatter&issp=1&f=8&ie=utf-8&tn=baiduhome_pg&inputT=5584','/','toolsmatter',31,16,2,'flash,quicktime','',137,117,2975,1427111923),(236,989167000,0,'','zh-cn','cn','liuchao.me','http://liuchao.me/','/','',28,14,2,'flash','',138,241,952,1427722405),(237,1109738123,0,'','en-us','us','liuchao.me','http://liuchao.me/','/','',32,7,2,'flash','',139,251,888,1427952343),(238,3722365984,0,'','zh-cn','cn','liuchao.me','http://liuchao.me/','/','',33,16,2,'flash','',140,174,2728,1427978196),(239,1928819566,0,'','zh-cn','cn','liuchao.me','http://liuchao.me/','/','',32,7,2,'flash','',141,135,1187,1429713451),(240,1928819566,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/sample-page/','',32,7,5,'flash','',141,259,863,1429713468),(241,1928819566,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/sample-page/','/','',32,7,2,'flash','',141,14,174,1429713500),(242,1928819566,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/sample-page/','',32,7,5,'flash','',141,165,598,1429713503),(243,1928819566,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/sample-page/','/','',32,7,2,'flash','',141,6,158,1429713504),(244,1928819566,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/sample-page/','',32,7,5,'flash','',141,21,676,1429713509),(245,1928819566,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/sample-page/','/','',32,7,2,'flash','',141,9,151,1429713509),(246,1928819566,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/sample-page/','',32,7,5,'flash','',141,7,654,1429713511),(247,1928819566,0,'','zh-cn','cn','liuchao.me','http://liuchao.me/','/','',32,7,2,'flash','',141,8,160,1429713511),(248,1928819566,0,'','zh-cn','cn','liuchao.me','http://liuchao.me/','/','',32,7,2,'flash','',141,7,167,1429713527),(249,1032310723,0,'','zh-cn','cn','liuchao.me','http://liuchao.me/','/','',28,6,2,'flash,silverlight','',142,197,21292,1429867810);
/*!40000 ALTER TABLE `t_slim_stats_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slim_stats_archive`
--

DROP TABLE IF EXISTS `t_slim_stats_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slim_stats_archive` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` int(10) unsigned DEFAULT '0',
  `other_ip` int(10) unsigned DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `country` varchar(16) DEFAULT NULL,
  `referer` varchar(2048) DEFAULT NULL,
  `resource` varchar(2048) DEFAULT NULL,
  `searchterms` varchar(2048) DEFAULT NULL,
  `plugins` varchar(255) DEFAULT NULL,
  `notes` varchar(2048) DEFAULT NULL,
  `visit_id` int(10) unsigned NOT NULL DEFAULT '0',
  `server_latency` int(10) unsigned DEFAULT '0',
  `page_performance` int(10) unsigned DEFAULT '0',
  `browser` varchar(40) DEFAULT NULL,
  `browser_version` varchar(15) DEFAULT NULL,
  `browser_type` tinyint(3) unsigned DEFAULT '0',
  `platform` varchar(15) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `user_agent` varchar(2048) DEFAULT NULL,
  `resolution` varchar(12) DEFAULT NULL,
  `screen_width` smallint(5) unsigned DEFAULT '0',
  `screen_height` smallint(5) unsigned DEFAULT '0',
  `content_type` varchar(64) DEFAULT NULL,
  `category` varchar(256) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `content_id` bigint(20) unsigned DEFAULT '0',
  `outbound_resource` varchar(2048) DEFAULT NULL,
  `dt` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_t_slim_stats_dt` (`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_stats_archive`
--

LOCK TABLES `t_slim_stats_archive` WRITE;
/*!40000 ALTER TABLE `t_slim_stats_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_slim_stats_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slim_stats_archive_3`
--

DROP TABLE IF EXISTS `t_slim_stats_archive_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slim_stats_archive_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` int(10) unsigned DEFAULT '0',
  `other_ip` int(10) unsigned DEFAULT '0',
  `user` varchar(255) DEFAULT '',
  `language` varchar(5) DEFAULT '',
  `country` varchar(16) DEFAULT '',
  `domain` varchar(255) DEFAULT '',
  `referer` varchar(2048) DEFAULT '',
  `resource` varchar(2048) DEFAULT '',
  `searchterms` varchar(2048) DEFAULT '',
  `browser_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `screenres_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_info_id` int(10) unsigned NOT NULL DEFAULT '1',
  `plugins` varchar(255) DEFAULT '',
  `notes` varchar(2048) DEFAULT '',
  `visit_id` int(10) unsigned NOT NULL DEFAULT '0',
  `server_latency` int(10) unsigned DEFAULT '0',
  `page_performance` int(10) unsigned DEFAULT '0',
  `dt` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_techslim_stats_dt` (`dt`),
  KEY `fk_techbrowser_id` (`browser_id`),
  KEY `fk_techcontent_info_id` (`content_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_stats_archive_3`
--

LOCK TABLES `t_slim_stats_archive_3` WRITE;
/*!40000 ALTER TABLE `t_slim_stats_archive_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_slim_stats_archive_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_term_relationships`
--

DROP TABLE IF EXISTS `t_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_term_relationships`
--

LOCK TABLES `t_term_relationships` WRITE;
/*!40000 ALTER TABLE `t_term_relationships` DISABLE KEYS */;
INSERT INTO `t_term_relationships` VALUES (1,3,0),(1,5,0);
/*!40000 ALTER TABLE `t_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_term_taxonomy`
--

DROP TABLE IF EXISTS `t_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_term_taxonomy`
--

LOCK TABLES `t_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `t_term_taxonomy` DISABLE KEYS */;
INSERT INTO `t_term_taxonomy` VALUES (1,1,'category','',0,0),(2,2,'category','',0,0),(3,3,'category','',0,1),(4,4,'post_format','',0,0),(5,5,'post_tag','',0,1);
/*!40000 ALTER TABLE `t_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_termmeta`
--

DROP TABLE IF EXISTS `t_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_termmeta`
--

LOCK TABLES `t_termmeta` WRITE;
/*!40000 ALTER TABLE `t_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_terms`
--

DROP TABLE IF EXISTS `t_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_terms`
--

LOCK TABLES `t_terms` WRITE;
/*!40000 ALTER TABLE `t_terms` DISABLE KEYS */;
INSERT INTO `t_terms` VALUES (1,'未分类','uncategorized',0),(2,'HTTP','http',0),(3,'Tools','tools',0),(4,'post-format-aside','post-format-aside',0),(5,'fiddler','fiddler',0);
/*!40000 ALTER TABLE `t_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usermeta`
--

DROP TABLE IF EXISTS `t_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usermeta`
--

LOCK TABLES `t_usermeta` WRITE;
/*!40000 ALTER TABLE `t_usermeta` DISABLE KEYS */;
INSERT INTO `t_usermeta` VALUES (1,1,'first_name',''),(2,1,'last_name',''),(3,1,'nickname','admin'),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'t_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(11,1,'t_user_level','10'),(12,1,'dismissed_wp_pointers','wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),(13,1,'show_welcome_panel','0'),(14,1,'t_dashboard_quick_press_last_post_id','4'),(15,1,'t_user-settings','editor=tinymce&dfw_width=662'),(16,1,'t_user-settings-time','1409671816'),(17,1,'session_tokens','a:2:{s:64:\"39bb9175a4f5a04694a74874de3f84ded010dd802154a049de9f0666f56f66a9\";a:4:{s:10:\"expiration\";i:1432472252;s:2:\"ip\";s:13:\"111.206.20.31\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36\";s:5:\"login\";i:1431262652;}s:64:\"83eb8f09dd4597afc933108ae9fdb69791d580efebd67a5bb30a033235589005\";a:4:{s:10:\"expiration\";i:1432475796;s:2:\"ip\";s:13:\"111.206.20.31\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36\";s:5:\"login\";i:1431266196;}}'),(18,1,'meta-box-order_dashboard','a:4:{s:6:\"normal\";s:181:\"dashboard_right_now,dashboard_activity,slim_p1_03,slim_p1_04,slim_p1_08,slim_p1_10,slim_p1_11,slim_p1_12,slim_p1_13,slim_p2_02,slim_p2_07,slim_p2_21,slim_p3_06,slim_p4_07,slim_p4_18\";s:4:\"side\";s:39:\"dashboard_quick_press,dashboard_primary\";s:7:\"column3\";s:10:\"slim_p1_01\";s:7:\"column4\";s:0:\"\";}');
/*!40000 ALTER TABLE `t_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_users`
--

DROP TABLE IF EXISTS `t_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_users`
--

LOCK TABLES `t_users` WRITE;
/*!40000 ALTER TABLE `t_users` DISABLE KEYS */;
INSERT INTO `t_users` VALUES (1,'admin','$P$BZPUas8NGFIjctZ4zsrHa5.n/mC.TP0','admin','thesedays@126.com','','2014-06-29 09:54:54','',0,'admin');
/*!40000 ALTER TABLE `t_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-17 17:24:37
