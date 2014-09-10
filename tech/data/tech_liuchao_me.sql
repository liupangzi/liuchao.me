-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: tech_liuchao_me
-- ------------------------------------------------------
-- Server version	5.6.20-68.0

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
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comments`
--

LOCK TABLES `t_comments` WRITE;
/*!40000 ALTER TABLE `t_comments` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_options`
--

LOCK TABLES `t_options` WRITE;
/*!40000 ALTER TABLE `t_options` DISABLE KEYS */;
INSERT INTO `t_options` VALUES (1,'siteurl','http://tech.liuchao.me','yes'),(2,'blogname','Tools Matter','yes'),(3,'blogdescription','Just for Fun','yes'),(4,'users_can_register','0','yes'),(5,'admin_email','thesedays@126.com','yes'),(6,'start_of_week','1','yes'),(7,'use_balanceTags','0','yes'),(8,'use_smilies','1','yes'),(9,'require_name_email','1','yes'),(10,'comments_notify','1','yes'),(11,'posts_per_rss','10','yes'),(12,'rss_use_excerpt','0','yes'),(13,'mailserver_url','mail.example.com','yes'),(14,'mailserver_login','login@example.com','yes'),(15,'mailserver_pass','password','yes'),(16,'mailserver_port','110','yes'),(17,'default_category','1','yes'),(18,'default_comment_status','open','yes'),(19,'default_ping_status','open','yes'),(20,'default_pingback_flag','1','yes'),(21,'posts_per_page','10','yes'),(22,'date_format','Y/m/d','yes'),(23,'time_format','H:i','yes'),(24,'links_updated_date_format','Y年n月j日ag:i','yes'),(25,'comment_moderation','0','yes'),(26,'moderation_notify','1','yes'),(27,'permalink_structure','/%year%/%monthnum%/%postname%/','yes'),(28,'gzipcompression','0','yes'),(29,'hack_file','0','yes'),(30,'blog_charset','UTF-8','yes'),(31,'moderation_keys','','no'),(32,'active_plugins','a:9:{i:0;s:19:\"akismet/akismet.php\";i:2;s:36:\"google-sitemap-generator/sitemap.php\";i:3;s:25:\"jiathis/jiathis-share.php\";i:4;s:39:\"syntaxhighlighter/syntaxhighlighter.php\";i:5;s:33:\"w3-total-cache/w3-total-cache.php\";i:6;s:27:\"wp-optimize/wp-optimize.php\";i:7;s:27:\"wp-slimstat/wp-slimstat.php\";i:8;s:35:\"wp-utf8-excerpt/wp-utf8-excerpt.php\";i:9;s:30:\"wpjam-qiniu/wpjam-qiniutek.php\";}','yes'),(33,'home','http://tech.liuchao.me','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'advanced_edit','0','yes'),(37,'comment_max_links','2','yes'),(38,'gmt_offset','','yes'),(39,'default_email_category','1','yes'),(40,'recently_edited','','no'),(41,'template','decode','yes'),(42,'stylesheet','decode','yes'),(43,'comment_whitelist','1','yes'),(44,'blacklist_keys','','no'),(45,'comment_registration','0','yes'),(46,'html_type','text/html','yes'),(47,'use_trackback','0','yes'),(48,'default_role','subscriber','yes'),(49,'db_version','29630','yes'),(50,'uploads_use_yearmonth_folders','1','yes'),(51,'upload_path','','yes'),(52,'blog_public','1','yes'),(53,'default_link_category','2','yes'),(54,'show_on_front','posts','yes'),(55,'tag_base','','yes'),(56,'show_avatars','1','yes'),(57,'avatar_rating','G','yes'),(58,'upload_url_path','','yes'),(59,'thumbnail_size_w','150','yes'),(60,'thumbnail_size_h','150','yes'),(61,'thumbnail_crop','1','yes'),(62,'medium_size_w','300','yes'),(63,'medium_size_h','300','yes'),(64,'avatar_default','mystery','yes'),(65,'large_size_w','1024','yes'),(66,'large_size_h','1024','yes'),(67,'image_default_link_type','file','yes'),(68,'image_default_size','','yes'),(69,'image_default_align','','yes'),(70,'close_comments_for_old_posts','0','yes'),(71,'close_comments_days_old','14','yes'),(72,'thread_comments','1','yes'),(73,'thread_comments_depth','5','yes'),(74,'page_comments','0','yes'),(75,'comments_per_page','50','yes'),(76,'default_comments_page','newest','yes'),(77,'comment_order','asc','yes'),(78,'sticky_posts','a:0:{}','yes'),(79,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_text','a:0:{}','yes'),(81,'widget_rss','a:0:{}','yes'),(82,'uninstall_plugins','a:0:{}','no'),(83,'timezone_string','Asia/Shanghai','yes'),(84,'page_for_posts','0','yes'),(85,'page_on_front','0','yes'),(86,'default_post_format','0','yes'),(87,'link_manager_enabled','0','yes'),(88,'initial_db_version','27916','yes'),(89,'t_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(90,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(91,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(92,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(93,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(94,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(95,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(96,'cron','a:7:{i:1410328793;a:3:{s:18:\"w3_pgcache_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:18:\"w3_pgcache_cleanup\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:22:\"w3_objectcache_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:22:\"w3_objectcache_cleanup\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:18:\"w3_dbcache_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:18:\"w3_dbcache_cleanup\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1410342897;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1410342906;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1410346687;a:1:{s:13:\"sm_ping_daily\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1410348060;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1410400800;a:1:{s:17:\"wp_slimstat_purge\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(98,'theme_mods_twentyfourteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1404035775;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}','yes'),(99,'current_theme','Decode','yes'),(100,'theme_mods_decode','a:1:{i:0;b:0;}','yes'),(101,'theme_switched','','yes'),(102,'recently_activated','a:2:{s:30:\"db-prefix-change/db_prefix.php\";i:1410326532;s:28:\"swiftype-search/swiftype.php\";i:1409757260;}','yes'),(103,'akismet_available_servers','a:4:{s:12:\"192.0.80.246\";b:1;s:12:\"66.135.58.62\";b:1;s:12:\"192.0.80.244\";b:1;s:12:\"66.135.58.61\";b:1;}','yes'),(104,'akismet_connectivity_time','1404035864','yes'),(105,'sm_rewrite_done','$Id: sitemap-loader.php 937300 2014-06-23 18:04:11Z arnee $','yes'),(106,'jiathis_code','<!-- JiaThis Button BEGIN -->\r\n<div id=\"jiathis_style_32x32\">\r\n	<a class=\"jiathis_button_qzone\"></a>\r\n	<a class=\"jiathis_button_tsina\"></a>\r\n	<a class=\"jiathis_button_tqq\"></a>\r\n	<a class=\"jiathis_button_renren\"></a>\r\n	<a class=\"jiathis_button_kaixin001\"></a>\r\n	<a href=\"http://www.jiathis.com/share/\" class=\"jiathis jiathis_txt jtico jtico_jiathis\" target=\"_blank\"></a>\r\n	<a class=\"jiathis_counter_style\"></a>\r\n</div>\r\n<script type=\"text/javascript\" src=\"http://v2.jiathis.com/code/jia.js\" charset=\"utf-8\"></script>\r\n<!-- JiaThis Button END -->','yes'),(107,'jiathis_pos','down','yes'),(108,'jiathis_dir','left','yes'),(109,'jiathis_feed','yes','yes'),(110,'wp-optimize-schedule','false','no'),(111,'wp-optimize-last-optimized','Never','no'),(112,'wp-optimize-schedule-type','wpo_weekly','no'),(113,'wp-optimize-retention-enabled','false','no'),(114,'wp-optimize-retention-period','2','no'),(115,'wp-optimize-enable-admin-menu','false','no'),(116,'wp-optimize-total-cleaned','0','no'),(117,'wp-optimize-auto','a:8:{s:9:\"revisions\";s:4:\"true\";s:6:\"drafts\";s:4:\"true\";s:5:\"spams\";s:4:\"true\";s:10:\"unapproved\";s:5:\"false\";s:9:\"transient\";s:5:\"false\";s:8:\"postmeta\";s:5:\"false\";s:4:\"tags\";s:5:\"false\";s:8:\"optimize\";s:4:\"true\";}','yes'),(118,'slimstat_options','a:50:{s:7:\"version\";s:3:\"3.7\";s:6:\"secret\";s:32:\"a8a19a582525ea769feac2a979f6728b\";s:17:\"show_admin_notice\";i:0;s:11:\"is_tracking\";s:3:\"yes\";s:17:\"track_admin_pages\";s:2:\"no\";s:17:\"enable_javascript\";s:3:\"yes\";s:15:\"javascript_mode\";s:3:\"yes\";s:16:\"add_posts_column\";s:2:\"no\";s:17:\"use_separate_menu\";s:3:\"yes\";s:10:\"auto_purge\";s:3:\"120\";s:20:\"convert_ip_addresses\";s:2:\"no\";s:23:\"use_european_separators\";s:3:\"yes\";s:10:\"enable_sov\";s:2:\"no\";s:17:\"show_display_name\";s:2:\"no\";s:32:\"show_complete_user_agent_tooltip\";s:2:\"no\";s:31:\"convert_resource_urls_to_titles\";s:3:\"yes\";s:10:\"async_load\";s:2:\"no\";s:14:\"use_slimscroll\";s:3:\"yes\";s:14:\"expand_details\";s:2:\"no\";s:12:\"rows_to_show\";s:2:\"20\";s:16:\"refresh_interval\";s:2:\"60\";s:23:\"number_results_raw_data\";s:2:\"50\";s:32:\"include_outbound_links_right_now\";s:3:\"yes\";s:11:\"track_users\";s:3:\"yes\";s:12:\"ignore_users\";s:0:\"\";s:9:\"ignore_ip\";s:0:\"\";s:19:\"ignore_capabilities\";s:0:\"\";s:15:\"ignore_spammers\";s:3:\"yes\";s:16:\"ignore_resources\";s:0:\"\";s:16:\"ignore_countries\";s:0:\"\";s:15:\"ignore_browsers\";s:0:\"\";s:15:\"ignore_referers\";s:0:\"\";s:12:\"anonymize_ip\";s:2:\"no\";s:15:\"ignore_prefetch\";s:3:\"yes\";s:21:\"restrict_authors_view\";s:3:\"yes\";s:19:\"capability_can_view\";s:16:\"activate_plugins\";s:8:\"can_view\";s:0:\"\";s:20:\"capability_can_admin\";s:16:\"activate_plugins\";s:9:\"can_admin\";s:0:\"\";s:16:\"detect_smoothing\";s:3:\"yes\";s:24:\"enable_outbound_tracking\";s:3:\"yes\";s:16:\"session_duration\";i:1800;s:14:\"extend_session\";s:2:\"no\";s:10:\"enable_cdn\";s:3:\"yes\";s:19:\"extensions_to_track\";s:15:\"pdf,doc,xls,zip\";s:14:\"show_sql_debug\";s:2:\"no\";s:17:\"ip_lookup_service\";s:38:\"http://www.infosniper.net/?ip_address=\";s:10:\"custom_css\";s:0:\"\";s:18:\"enable_ads_network\";s:2:\"no\";s:14:\"locked_options\";s:0:\"\";}','no'),(119,'slimstat_visit_id','89','yes'),(120,'w3tc_request_data','','no'),(121,'akismet_strictness','0','yes'),(122,'akismet_show_user_comments_approved','0','yes'),(123,'wordpress_api_key','be182fa90de7','yes'),(125,'zh_cn_l10n_icp_num','','yes'),(126,'syntaxhighlighter_settings','a:15:{s:9:\"shversion\";i:3;s:5:\"theme\";s:5:\"rdark\";s:6:\"gutter\";i:1;s:9:\"smarttabs\";i:1;s:9:\"wraplines\";i:1;s:9:\"classname\";s:0:\"\";s:9:\"firstline\";s:1:\"1\";s:14:\"padlinenumbers\";s:5:\"false\";s:7:\"tabsize\";s:1:\"4\";s:5:\"title\";s:0:\"\";s:14:\"loadallbrushes\";i:0;s:9:\"autolinks\";i:0;s:8:\"collapse\";i:0;s:5:\"light\";i:0;s:7:\"toolbar\";i:0;}','yes'),(127,'sm_options','a:51:{s:18:\"sm_b_prio_provider\";s:41:\"GoogleSitemapGeneratorPrioByCountProvider\";s:9:\"sm_b_ping\";b:1;s:10:\"sm_b_stats\";b:0;s:12:\"sm_b_pingmsn\";b:1;s:12:\"sm_b_autozip\";b:1;s:11:\"sm_b_memory\";s:0:\"\";s:9:\"sm_b_time\";i:-1;s:18:\"sm_b_style_default\";b:1;s:10:\"sm_b_style\";s:0:\"\";s:12:\"sm_b_baseurl\";s:0:\"\";s:11:\"sm_b_robots\";b:1;s:9:\"sm_b_html\";b:1;s:12:\"sm_b_exclude\";a:0:{}s:17:\"sm_b_exclude_cats\";a:0:{}s:10:\"sm_in_home\";b:1;s:11:\"sm_in_posts\";b:1;s:15:\"sm_in_posts_sub\";b:0;s:11:\"sm_in_pages\";b:1;s:10:\"sm_in_cats\";b:0;s:10:\"sm_in_arch\";b:0;s:10:\"sm_in_auth\";b:0;s:10:\"sm_in_tags\";b:0;s:9:\"sm_in_tax\";a:0:{}s:17:\"sm_in_customtypes\";a:0:{}s:13:\"sm_in_lastmod\";b:1;s:10:\"sm_cf_home\";s:5:\"daily\";s:11:\"sm_cf_posts\";s:7:\"monthly\";s:11:\"sm_cf_pages\";s:6:\"weekly\";s:10:\"sm_cf_cats\";s:6:\"weekly\";s:10:\"sm_cf_auth\";s:6:\"weekly\";s:15:\"sm_cf_arch_curr\";s:5:\"daily\";s:14:\"sm_cf_arch_old\";s:6:\"yearly\";s:10:\"sm_cf_tags\";s:6:\"weekly\";s:10:\"sm_pr_home\";d:1;s:11:\"sm_pr_posts\";d:0.59999999999999998;s:15:\"sm_pr_posts_min\";d:0.20000000000000001;s:11:\"sm_pr_pages\";d:0.59999999999999998;s:10:\"sm_pr_cats\";d:0.29999999999999999;s:10:\"sm_pr_arch\";d:0.29999999999999999;s:10:\"sm_pr_auth\";d:0.29999999999999999;s:10:\"sm_pr_tags\";d:0.29999999999999999;s:12:\"sm_i_donated\";b:0;s:17:\"sm_i_hide_donated\";b:0;s:17:\"sm_i_install_date\";i:1404038502;s:14:\"sm_i_hide_note\";b:1;s:15:\"sm_i_hide_works\";b:0;s:16:\"sm_i_hide_donors\";b:0;s:9:\"sm_i_hash\";s:20:\"7597d90adfbfbe57e6ea\";s:13:\"sm_i_lastping\";i:1409671829;s:16:\"sm_i_supportfeed\";b:1;s:22:\"sm_i_supportfeed_cache\";i:1409924922;}','yes'),(128,'sm_status','O:28:\"GoogleSitemapGeneratorStatus\":4:{s:39:\"\0GoogleSitemapGeneratorStatus\0startTime\";d:1409671828.2859421;s:37:\"\0GoogleSitemapGeneratorStatus\0endTime\";d:1409671828.985707;s:41:\"\0GoogleSitemapGeneratorStatus\0pingResults\";a:2:{s:6:\"google\";a:5:{s:9:\"startTime\";d:1409671828.2959609;s:7:\"endTime\";d:1409671828.753206;s:7:\"success\";b:1;s:3:\"url\";s:97:\"http://www.google.com/webmasters/sitemaps/ping?sitemap=http%3A%2F%2Ftech.liuchao.me%2Fsitemap.xml\";s:4:\"name\";s:6:\"Google\";}s:4:\"bing\";a:5:{s:9:\"startTime\";d:1409671828.756182;s:7:\"endTime\";d:1409671828.976959;s:7:\"success\";b:1;s:3:\"url\";s:90:\"http://www.bing.com/webmaster/ping.aspx?siteMap=http%3A%2F%2Ftech.liuchao.me%2Fsitemap.xml\";s:4:\"name\";s:4:\"Bing\";}}s:38:\"\0GoogleSitemapGeneratorStatus\0autoSave\";b:1;}','no'),(132,'wp-optimize-settings','a:5:{s:14:\"user-revisions\";b:1;s:11:\"user-drafts\";b:1;s:10:\"user-spams\";b:1;s:15:\"user-unapproved\";b:1;s:13:\"user-optimize\";b:1;}','yes'),(145,'category_children','a:0:{}','yes'),(146,'swiftype_api_key','y9-RwJDgzjZqYPfPTwb5','yes'),(147,'swiftype_api_authorized','1','yes'),(148,'swiftype_create_engine','blog','yes'),(155,'WPLANG','zh_CN','yes'),(156,'db_upgraded','','yes'),(157,'rewrite_rules','a:75:{s:34:\"sitemap(-+([a-zA-Z0-9_-]+))?\\.xml$\";s:40:\"index.php?xml_sitemap=params=$matches[2]\";s:38:\"sitemap(-+([a-zA-Z0-9_-]+))?\\.xml\\.gz$\";s:49:\"index.php?xml_sitemap=params=$matches[2];zip=true\";s:35:\"sitemap(-+([a-zA-Z0-9_-]+))?\\.html$\";s:50:\"index.php?xml_sitemap=params=$matches[2];html=true\";s:38:\"sitemap(-+([a-zA-Z0-9_-]+))?\\.html.gz$\";s:59:\"index.php?xml_sitemap=params=$matches[2];html=true;zip=true\";s:38:\"qiniu/([^/]+)/image/([^/]+)\\.([^/]+)?$\";s:76:\"index.php?p=$matches[1]&qiniu_image=$matches[2]&qiniu_image_type=$matches[3]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:44:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:69:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&tb=1\";s:64:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&feed=$matches[4]\";s:59:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&feed=$matches[4]\";s:52:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&paged=$matches[4]\";s:59:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&cpage=$matches[4]\";s:44:\"([0-9]{4})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&page=$matches[4]\";s:36:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(158,'can_compress_scripts','0','yes'),(171,'dbprefix_old_dbprefix','tech','yes'),(172,'dbprefix_new','t_','yes');
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
  KEY `meta_key` (`meta_key`)
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
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_posts`
--

LOCK TABLES `t_posts` WRITE;
/*!40000 ALTER TABLE `t_posts` DISABLE KEYS */;
INSERT INTO `t_posts` VALUES (1,1,'2014-06-29 09:54:54','2014-06-29 09:54:54','<ul>\r\n	<li>项目部署</li>\r\n</ul>\r\n项目中部署了两个服务，分别用于提供前端页面展示（Tomcat-A）和后端数据 API（Tomcat-B），nginx 上的 rewrite 规则如下：\r\n\r\n[php]\r\nserver {\r\n\r\n    ...\r\n\r\n    location /data {\r\n        proxy_pass tomcat_b;\r\n        break;\r\n    }\r\n\r\n    location / {\r\n        proxy_pass tomcat_a;\r\n        break;\r\n    }\r\n\r\n    ...\r\n}\r\n[/php]\r\n\r\n因为浏览器出于安全考虑，前端页面展示想要获取远程数据，目前有几种方法：\r\n\r\n（1）Tomcat-A 和 Tomcat-B 在同一域名下；\r\n\r\n（2）Tomcat-B的必须显示指明 HTTP 头：Access-Control-Allow-Origin: http://client.example.com；\r\n\r\n（3）JSONP；\r\n\r\n我们这里采用的是方案（1）\r\n<ul>\r\n	<li>繁琐的本地调试</li>\r\n</ul>\r\n本地 eclipse 调试两个项目，开启了两个端口：Tomcat-A 占用8080，Tomcat-B 占用8081。这时就会出现问题：前端页面在调用后端 API 的时候，因为端口不同，无法使用相对路径；而又因为在不同域名下，不显式指明 Access-Control-Allow-Origin 头，AJAX 也无法请求。\r\n<ul>\r\n	<li><a title=\"Fiddler\" href=\"http://www.telerik.com/fiddler\" target=\"_blank\">Fiddler</a> 出场</li>\r\n</ul>\r\n\r\n[js]\r\nif (oSession.uriContains(&quot;/data/&quot;)){\r\n    oSession.host = &quot;localhost:8081&quot;;\r\n}\r\n[/js]\r\n\r\n参考资料：\r\n\r\n1. <a title=\"Fiddler Web Debugger - Script Samples\" href=\"http://fiddlerbook.com/Fiddler/dev/ScriptSamples.asp\" target=\"_blank\">Fiddler Web Debugger - Script Samples</a>','Fiddler 中的 rewrite 和 proxy_pass','','publish','open','open','','query-rewrite-and-proxy-pass-in-fiddler','','','2014-09-02 23:30:19','2014-09-02 15:30:19','',0,'http://tech.liuchao.me/?p=1',0,'post','',0),(2,1,'2014-06-29 09:54:54','2014-06-29 09:54:54','这是示范页面。页面和博客文章不同，它的位置是固定的，通常会在站点导航栏显示。很多用户都创建一个“关于”页面，向访客介绍自己。例如，个人博客通常有类似这样的介绍：\n\n<blockquote>欢迎！我白天是个邮递员，晚上就是个有抱负的演员。这是我的博客。我住在天朝的帝都，有条叫做杰克的狗。</blockquote>\n\n……公司博客可以这样写：\n\n<blockquote>XYZ Doohickey公司成立于1971年，自从建立以来，我们一直向社会贡献着优秀doohicky。我们的公司总部位于天朝魔都，有着超过两千名员工，对魔都政府税收有着巨大贡献。</blockquote>\n\n您可以访问<a href=\"http://tech.liuchao.me/wp-admin/\">仪表盘</a>，删除本页面，然后添加您自己的内容。祝您使用愉快！','示例页面','','publish','open','open','','sample-page','','','2014-06-29 09:54:54','2014-06-29 09:54:54','',0,'http://tech.liuchao.me/?page_id=2',0,'page','',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_browsers`
--

LOCK TABLES `t_slim_browsers` WRITE;
/*!40000 ALTER TABLE `t_slim_browsers` DISABLE KEYS */;
INSERT INTO `t_slim_browsers` VALUES (1,'Chrome','34','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36 Android'),(2,'Chrome','35','win7','1',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36'),(3,'Chrome','0','android','3',2,'Mozilla/5.0 (Linux; Android 4.1.1; MI 2 Build/JRO03L) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.141 Mobile Safari/537.36'),(4,'Firefox','30','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0'),(5,'IE','9','win7','3',0,'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)'),(6,'Chrome','36','win7','1',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36'),(7,'Chrome','36','android','false',2,'Mozilla/5.0 (Linux; Android 4.1.1; MI 2 Build/JRO03L) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.128 Mobile Safari/537.36'),(8,'Chrome','36','win7','false',0,'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36'),(9,'Google Bot','2','unknown','true',0,'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'),(10,'Chrome','36','win7','3',0,'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36'),(11,'Chrome','37','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.94 Safari/537.36'),(12,'Chrome','35','win8.1','3',0,'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Iron/35.0.1900.0 Chrome/35.0.1900.0 Safari/537.36');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_content_info`
--

LOCK TABLES `t_slim_content_info` WRITE;
/*!40000 ALTER TABLE `t_slim_content_info` DISABLE KEYS */;
INSERT INTO `t_slim_content_info` VALUES (1,'login','','',0),(2,'home','','',0),(3,'post','1','admin',1),(4,'date','','',0),(5,'page','','admin',2),(6,'author','','',0),(7,'category','1','',0),(8,'post','3,5,4','admin',1),(9,'post','3,5','admin',1);
/*!40000 ALTER TABLE `t_slim_content_info` ENABLE KEYS */;
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
  CONSTRAINT `fk_techid` FOREIGN KEY (`id`) REFERENCES `t_slim_stats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_outbound`
--

LOCK TABLES `t_slim_outbound` WRITE;
/*!40000 ALTER TABLE `t_slim_outbound` DISABLE KEYS */;
INSERT INTO `t_slim_outbound` VALUES (1,'wordpress.org','https://wordpress.org/',0,'Event:click, A:11','99,251',55,1406648644),(2,'fiddlerbook.com','http://fiddlerbook.com/Fiddler/dev/ScriptSamples.asp',0,'Title:Fiddler Web Debugger - Script Samples, Event:click, A:5','540,1498',111,1409700578);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_screenres`
--

LOCK TABLES `t_slim_screenres` WRITE;
/*!40000 ALTER TABLE `t_slim_screenres` DISABLE KEYS */;
INSERT INTO `t_slim_screenres` VALUES (3,'1024x1024','24',1),(1,'1024x768','24',1),(5,'1280x720','24',1),(6,'1366x768','24',1),(2,'1600x900','24',1),(7,'1920x1080','24',1),(4,'360x640','32',1);
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
  `dt` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_techslim_stats_dt` (`dt`),
  KEY `fk_techbrowser_id` (`browser_id`),
  KEY `fk_techcontent_info_id` (`content_info_id`),
  CONSTRAINT `fk_techbrowser_id` FOREIGN KEY (`browser_id`) REFERENCES `t_slim_browsers` (`browser_id`),
  CONSTRAINT `fk_techcontent_info_id` FOREIGN KEY (`content_info_id`) REFERENCES `t_slim_content_info` (`content_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slim_stats`
--

LOCK TABLES `t_slim_stats` WRITE;
/*!40000 ALTER TABLE `t_slim_stats` DISABLE KEYS */;
INSERT INTO `t_slim_stats` VALUES (1,3029955262,0,'','en','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/options-general.php&reauth=1','',1,1,1,'','',1,1404064725),(2,3029955262,0,'','en','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/plugins.php?action=activate&plugin=akismet/akismet.php&plugin_status=all&paged=1&s&_wpnonce=52241897f5&reauth=1','',1,1,1,'','',2,1404064739),(3,2008813605,0,'','en','cn','','','/wp-login.php','',1,1,1,'','',3,1404064817),(4,3029955262,0,'','en','cn','','','/wp-login.php','',1,1,1,'','',4,1404064841),(5,3074269395,0,'','en','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/plugins.php?action=activate&plugin=w3-total-cache/w3-total-cache.php&plugin_status=all&paged=1&s&_wpnonce=368423a784&reauth=1','',1,1,1,'','',5,1404065023),(6,2093661992,0,'admin','zh-cn','cn','','','/','',2,2,2,'flash','user:1;',8,1404065156),(7,1806878723,0,'','en','us','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/options-general.php&reauth=1','',1,1,1,'','',6,1404066556),(8,3071310594,0,'','en-us','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/options-general.php&reauth=1','',1,1,1,'','',7,1404066595),(9,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/options-general.php?settings-updated=true','/','',2,2,2,'flash','user:1;',8,1404066755),(10,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/','/','',2,2,2,'flash','user:1;',8,1404066822),(11,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit&message=1','/2014/06/hello-world/','',2,2,3,'flash','user:1;',8,1404067304),(12,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit&message=1','/2014/06/hello-world/','',2,2,3,'flash','user:1;',8,1404067319),(13,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit&message=1','/','',2,2,2,'flash','user:1;',8,1404067338),(14,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit&message=1','/','',2,2,2,'flash','user:1;',8,1404067344),(15,2059411543,0,'','en','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/plugins.php?action=activate&plugin=syntaxhighlighter/syntaxhighlighter.php&_wpnonce=8ef9bae664&reauth=1','',1,1,1,'','',9,1404067535),(16,2093661992,0,'admin','zh-cn','cn','','','/','',2,2,2,'flash','user:1;',10,1404082133),(17,1123635382,2093661992,'','zh-cn','au','','','/','',3,4,2,'','',11,1404088147),(18,2093661992,0,'admin','zh-cn','cn','','','/','',2,2,2,'flash','user:1;',12,1404117978),(19,3715790622,0,'admin','zh-cn','cn','','','/','',2,2,2,'flash','user:1;',13,1404122707),(20,3715790622,0,'admin','zh-cn','cn','','','/','',2,2,2,'flash','user:1;',14,1404140934),(21,2093661992,0,'admin','zh-cn','cn','','','/','',2,2,2,'flash','user:1;',15,1404168210),(22,2093661992,0,'admin','zh-cn','cn','','','/','',2,2,2,'flash','user:1;',16,1404174527),(23,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/','/','',2,2,2,'flash','user:1;',17,1404247659),(24,3715790622,0,'admin','zh-cn','cn','','','/','',2,2,2,'flash','user:1;',18,1404293759),(25,3715790622,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/2014/06/hello-world/','',2,2,3,'flash','user:1;',18,1404293768),(26,2073503120,0,'','en','cn','','','/2014/06/hello-world','',1,1,3,'','',19,1404294141),(27,2093661992,0,'admin','zh-cn','cn','','','/','',2,2,2,'flash','user:1;',20,1404344371),(28,2093661992,0,'','zh-cn','cn','','','/','',4,5,2,'','',21,1404421880),(29,3715790622,0,'','zh-cn','cn','','','/','',2,2,2,'flash','',22,1404479771),(30,3715790622,0,'','zh-cn','cn','','','/','',2,2,2,'flash','',23,1404822335),(31,3715790622,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/wp-login.php','',2,2,1,'flash','',23,1404822355),(32,2008813607,0,'','en','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/update-core.php&reauth=1','',1,1,1,'','',24,1404822697),(33,3029955262,0,'','en','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/update-core.php&reauth=1','',1,1,1,'','',25,1404822740),(34,3029980557,0,'','en','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/index.php&reauth=1','',1,1,1,'flash','',26,1404822941),(35,2006124002,0,'','en','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/index.php&reauth=1','',1,1,1,'','',27,1404822994),(36,2093661990,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/','/','',2,2,2,'flash','user:1;',28,1404858108),(37,3715790622,0,'admin','zh-cn','cn','','','/','',2,2,2,'flash','user:1;',29,1404911266),(38,2093661990,0,'','zh-cn','cn','','','/','',2,6,2,'flash','',30,1405176981),(39,2093661990,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/wp-login.php','',2,6,1,'flash','',30,1405176987),(40,2093661990,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/update-core.php','/','',2,6,2,'flash','user:1;',30,1405177010),(41,2093811831,0,'admin','zh-cn','cn','','','/','',2,6,2,'flash','user:1;',31,1405552892),(42,2093811831,0,'admin','zh-cn','cn','','','/','',2,6,2,'flash','user:1;',31,1405553132),(43,1032305456,0,'','en','cn','','','/','',5,1,2,'','',32,1405553439),(44,2093811831,0,'admin','zh-cn','cn','','','/','',2,6,2,'flash','user:1;',33,1405715881),(45,2093811831,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/','/','',2,6,2,'flash','user:1;',33,1405715971),(46,1875509297,0,'','zh-cn','cn','','','/','',6,2,2,'flash','',34,1406152734),(47,3715790622,0,'','zh-cn','cn','','','/','',6,2,2,'flash','',35,1406208830),(48,1991966450,0,'','zh-cn','cn','','','/','',6,2,2,'flash','',36,1406231355),(49,1780813465,0,'','zh-cn','cn','','','/','',6,2,2,'flash','',37,1406285996),(50,1780813465,0,'','zh-cn','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/&reauth=1','',6,2,1,'flash','',38,1406286007),(51,1123635277,1872842182,'','zh-cn','au','','','/','',7,4,2,'','',39,1406411817),(52,1872842182,0,'','zh-cn','cn','','','/','',8,6,2,'flash','',40,1406411832),(53,1123637295,1872842182,'','zh-cn','us','','','/','',7,4,2,'','',41,1406470332),(54,3715790622,0,'admin','zh-cn','cn','','','/','',8,2,2,'flash','user:1;',42,1406577213),(55,3715790622,0,'','zh-cn','cn','','','/','',8,2,2,'flash','',43,1406648640),(56,3715790622,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/2014/06/hello-world/','',8,2,3,'flash','',43,1406648648),(57,3715790622,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/2014/06/hello-world/','/2014/06/','',8,2,4,'flash','',43,1406648656),(58,1123633693,0,'','xx','us','','','/','',9,3,2,'flash','',44,1406679951),(59,1123633693,0,'','xx','us','','','/','',9,3,2,'flash','',45,1406716876),(60,3715790622,0,'','zh-cn','cn','','','/','',8,2,2,'flash','',46,1406915308),(61,3715790622,0,'','zh-cn','cn','','','/','',8,2,2,'flash','',47,1407508102),(62,3715790622,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/wp-login.php','',8,2,1,'flash','',47,1407508111),(63,3715790622,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-login.php','/wp-login.php','',8,2,1,'flash','',47,1407508115),(64,3715790622,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/update.php?action=upgrade-plugin&plugin=wp-slimstat%2Fwp-slimstat.php&_wpnonce=51e49c1da1','/','',8,2,2,'flash','user:1;',47,1407508284),(65,1123634451,0,'','xx','us','','','/','',9,3,2,'flash','',48,1407585652),(66,1007313264,0,'','zh-cn','cn','','','/','',8,6,2,'flash','',49,1407588551),(67,1007313264,0,'','zh-cn','cn','','','/','',8,6,2,'flash','',49,1407588568),(68,1007313264,0,'','zh-cn','cn','','','/','',8,6,2,'flash','',49,1407588709),(69,1007313264,0,'','zh-cn','cn','','','/','',8,6,2,'flash','',49,1407588809),(70,1007313264,0,'','zh-cn','cn','','','/','',8,6,2,'flash','',49,1407589160),(71,1123634551,0,'','xx','us','','','/','',9,3,2,'flash','',50,1407592835),(72,1123632753,0,'','xx','us','','','/','',9,3,2,'flash','',51,1407620748),(73,2093811825,0,'','zh-cn','cn','','','/','',8,2,2,'flash','',52,1407965107),(74,1123631153,0,'','xx','us','','','/sample-page/','',9,3,5,'flash','',53,1408019199),(75,1123631153,0,'','xx','us','','','/author/admin/','',9,3,6,'flash','',54,1408020533),(76,1123631148,0,'','xx','us','','','/2014/06/','',9,3,4,'flash','',55,1408020973),(77,1123631158,0,'','xx','us','','','/2014/06/hello-world/','',9,3,3,'flash','',56,1408021372),(78,1123631158,0,'','xx','us','','','/','',9,3,2,'flash','',57,1408033978),(79,1123631158,0,'','xx','us','','','/2014/06/','',9,3,4,'flash','',58,1408040227),(80,1123631158,0,'','xx','us','','','/category/uncategorized/','',9,3,7,'flash','',59,1408041401),(81,1123631158,0,'','xx','us','','','/sample-page/','',9,3,5,'flash','',60,1408041995),(82,1123631158,0,'','xx','us','','','/2014/06/hello-world/','',9,3,3,'flash','',61,1408043170),(83,1123631153,0,'','xx','us','','','/','',9,3,2,'flash','',62,1408043891),(84,1123631153,0,'','xx','us','','','/author/admin/','',9,3,6,'flash','',63,1408046551),(85,1872842191,0,'','zh-cn','cn','','','/','',8,6,2,'flash','',64,1408665081),(86,1872842191,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/sample-page/','',8,6,5,'flash','',64,1408665086),(87,1872842191,0,'','zh-cn','cn','','','/','',8,6,2,'flash','',64,1408665096),(88,1872842191,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/wp-login.php','',8,6,1,'flash','',64,1408665103),(89,1872842180,0,'admin','zh-cn','cn','','','/','',10,6,2,'flash','user:1;',65,1408746063),(90,1007313265,0,'admin','zh-cn','cn','','','/','',10,6,2,'flash','user:1;',66,1409009282),(91,3715790622,0,'','zh-cn','cn','','','/','',10,2,2,'flash','',67,1409064021),(92,3715790622,0,'','zh-cn','cn','','','/','',10,2,2,'flash','',68,1409075134),(93,1872842190,0,'admin','zh-cn','cn','','','/','',10,6,2,'flash','user:1;',69,1409095288),(94,3715790622,0,'','zh-cn','cn','','','/','',11,5,2,'flash','',70,1409142144),(95,3715790622,0,'','zh-cn','cn','','','/','',11,5,2,'flash','',71,1409162881),(96,2093811837,0,'admin','zh-cn','cn','','','/','',10,6,2,'flash','user:1;',72,1409214960),(97,2093811837,0,'admin','zh-cn','cn','','','/','',10,6,2,'flash','user:1;',73,1409267537),(98,3715790622,0,'','zh-cn','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/&reauth=1','',11,5,1,'flash','',74,1409325855),(99,1780811800,0,'admin','zh-cn','cn','','','/','',11,5,2,'flash','user:1;',75,1409513283),(100,1875509296,0,'admin','zh-cn','cn','','','/','',11,5,2,'flash','user:1;',76,1409697289),(101,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit&message=1','/2014/06/query-rewrite-andproxy-pass-in-fiddler/','',11,5,8,'flash','user:1;',76,1409697473),(102,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit&message=1','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',11,5,8,'flash','user:1;',76,1409697528),(103,1875509296,0,'admin','zh-cn','cn','','','/','',11,5,2,'flash','user:1;',76,1409698405),(104,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/','',11,5,2,'flash','user:1;',76,1409698426),(105,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',11,5,8,'flash','user:1;',76,1409698442),(106,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',11,5,8,'flash','user:1;',76,1409698468),(107,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/themes.php','/','',11,5,2,'flash','user:1;',76,1409698528),(108,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/themes.php','/','',11,5,2,'flash','user:1;',76,1409698542),(109,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',11,5,8,'flash','user:1;',76,1409698549),(110,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit&message=1','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',11,5,9,'flash','user:1;',77,1409699198),(111,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',11,5,9,'flash','user:1;',77,1409700525),(112,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit&message=1','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',11,5,9,'flash','user:1;',77,1409700628),(113,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/edit.php','/','',11,5,2,'flash','user:1;',77,1409700778),(114,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/sample-page/','',11,5,5,'flash','user:1;',77,1409700786),(115,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/sample-page/','/','',11,5,2,'flash','user:1;',77,1409700794),(116,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/sample-page/','/','',11,5,2,'flash','user:1;',77,1409700814),(117,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',11,5,9,'flash','user:1;',77,1409700822),(118,3715790622,0,'admin','zh-cn','cn','','','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',11,5,9,'flash','user:1;',78,1409761938),(119,1875509296,0,'admin','zh-cn','cn','','','/','',11,5,2,'flash','user:1;',79,1409778024),(120,1875509296,0,'admin','zh-cn','cn','','','/','',11,5,2,'flash','user:1;',79,1409778068),(121,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/update-core.php?action=do-plugin-upgrade','/','',11,5,2,'flash','user:1;',79,1409778096),(122,1875509296,0,'admin','zh-cn','cn','','','/','',11,5,2,'flash','user:1;',80,1409782882),(123,1875509296,0,'admin','zh-cn','cn','','','/','',11,5,2,'flash','user:1;',81,1409785695),(124,1875509296,0,'admin','zh-cn','cn','','','/','',11,6,2,'flash','user:1;',82,1409863245),(125,1875509296,0,'admin','zh-cn','cn','','','/','',11,6,2,'flash','user:1;',82,1409863256),(126,1875509296,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',11,6,9,'flash','user:1;',82,1409863268),(127,1875509296,0,'admin','zh-cn','cn','www.liuchao.me','http://www.liuchao.me/','/','',11,6,2,'flash','user:1;',83,1409867850),(128,3715790622,0,'admin','zh-cn','cn','','','/','',11,5,2,'flash','user:1;',84,1409921026),(129,3715790622,0,'admin','zh-cn','cn','','','/','',11,2,2,'flash','user:1;',85,1409932072),(130,3715790622,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/options-general.php?settings-updated=true','/','',11,2,2,'flash','user:1;',85,1409932113),(131,3698394506,0,'','zh-cn','cn','','','/','',11,2,2,'flash','',86,1409952975),(132,3698394506,0,'','zh-cn','cn','','','/','',11,2,2,'flash','',86,1409953718),(133,3698394506,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/wp-login.php','',11,2,1,'flash','',86,1409953781),(134,3698394506,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/update-core.php?action=do-core-upgrade','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/about.php?updated&reauth=1','',11,2,1,'flash','',86,1409953817),(135,3698394506,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/index.php','/','',11,2,2,'flash','user:1;',86,1409953857),(136,2093811824,0,'','zh-cn','cn','','','/','',11,6,2,'flash','',87,1410185258),(137,2093811824,0,'','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/wp-login.php','',11,6,1,'flash','',87,1410185268),(138,2093811824,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/update-core.php?action=do-plugin-upgrade','/','',11,6,2,'flash','user:1;',87,1410185342),(139,2018773859,0,'','en-us','cn','liuchao.me','http://liuchao.me/','/','',12,7,2,'flash','',88,1410292016),(140,2018773859,0,'','en-us','cn','liuchao.me','http://liuchao.me/','/','',12,7,2,'flash','',88,1410292044),(141,2018773859,0,'','en-us','cn','liuchao.me','http://liuchao.me/','/','',12,7,2,'flash','',88,1410292045),(142,3715790622,0,'admin','zh-cn','cn','','','/','',11,2,2,'flash','user:1;',89,1410355079),(143,3715790622,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin//index.php','/','',11,2,2,'flash','user:1;',89,1410355307),(144,3715790622,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/','/2014/06/query-rewrite-and-proxy-pass-in-fiddler/','',11,2,9,'flash','user:1;',89,1410355313),(145,3715790622,0,'admin','zh-cn','cn','','','/','',11,2,2,'flash','user:1;',89,1410356105);
/*!40000 ALTER TABLE `t_slim_stats` ENABLE KEYS */;
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
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
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
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usermeta`
--

LOCK TABLES `t_usermeta` WRITE;
/*!40000 ALTER TABLE `t_usermeta` DISABLE KEYS */;
INSERT INTO `t_usermeta` VALUES (1,1,'first_name',''),(2,1,'last_name',''),(3,1,'nickname','admin'),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'t_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(11,1,'t_user_level','10'),(12,1,'dismissed_wp_pointers','wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),(13,1,'show_welcome_panel','0'),(14,1,'t_dashboard_quick_press_last_post_id','3'),(15,1,'t_user-settings','editor=tinymce&dfw_width=662'),(16,1,'t_user-settings-time','1409671816'),(17,1,'session_tokens','a:2:{s:64:\"7da6347297e3972c6b926ad845fe5950e3d57f4055640fee57b472fb9411af0e\";i:1411134622;s:64:\"3698deb00c2b433f49a03fedeaa81509e206b4ca9d91b014703dd8700c53e135\";i:1411366084;}');
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

-- Dump completed on 2014-09-10  1:35:59
