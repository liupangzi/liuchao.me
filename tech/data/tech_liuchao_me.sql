-- MySQL dump 10.13  Distrib 5.6.19, for Linux (x86_64)
--
-- Host: localhost    Database: tech_liuchao_me
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for table `techcommentmeta`
--

DROP TABLE IF EXISTS `techcommentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techcommentmeta` (
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
-- Dumping data for table `techcommentmeta`
--

LOCK TABLES `techcommentmeta` WRITE;
/*!40000 ALTER TABLE `techcommentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `techcommentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techcomments`
--

DROP TABLE IF EXISTS `techcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techcomments` (
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
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techcomments`
--

LOCK TABLES `techcomments` WRITE;
/*!40000 ALTER TABLE `techcomments` DISABLE KEYS */;
INSERT INTO `techcomments` VALUES (1,1,'WordPress先生','','https://wordpress.org/','','2014-06-29 09:54:54','2014-06-29 09:54:54','您好，这是一条评论。\n要删除评论，请先登录，然后再查看这篇文章的评论。登录后您可以看到编辑或者删除评论的选项。',0,'1','','',0,0);
/*!40000 ALTER TABLE `techcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techlinks`
--

DROP TABLE IF EXISTS `techlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techlinks` (
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
-- Dumping data for table `techlinks`
--

LOCK TABLES `techlinks` WRITE;
/*!40000 ALTER TABLE `techlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `techlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techoptions`
--

DROP TABLE IF EXISTS `techoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techoptions` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techoptions`
--

LOCK TABLES `techoptions` WRITE;
/*!40000 ALTER TABLE `techoptions` DISABLE KEYS */;
INSERT INTO `techoptions` VALUES (1,'siteurl','http://tech.liuchao.me','yes'),(2,'blogname','H4ck3r 2 !','yes'),(3,'blogdescription','Just for Fun','yes'),(4,'users_can_register','0','yes'),(5,'admin_email','thesedays@126.com','yes'),(6,'start_of_week','1','yes'),(7,'use_balanceTags','0','yes'),(8,'use_smilies','1','yes'),(9,'require_name_email','1','yes'),(10,'comments_notify','1','yes'),(11,'posts_per_rss','10','yes'),(12,'rss_use_excerpt','0','yes'),(13,'mailserver_url','mail.example.com','yes'),(14,'mailserver_login','login@example.com','yes'),(15,'mailserver_pass','password','yes'),(16,'mailserver_port','110','yes'),(17,'default_category','1','yes'),(18,'default_comment_status','open','yes'),(19,'default_ping_status','open','yes'),(20,'default_pingback_flag','1','yes'),(21,'posts_per_page','10','yes'),(22,'date_format','Y/m/d','yes'),(23,'time_format','H:i','yes'),(24,'links_updated_date_format','Y年n月j日ag:i','yes'),(25,'comment_moderation','0','yes'),(26,'moderation_notify','1','yes'),(27,'permalink_structure','/%year%/%monthnum%/%postname%/','yes'),(28,'gzipcompression','0','yes'),(29,'hack_file','0','yes'),(30,'blog_charset','UTF-8','yes'),(31,'moderation_keys','','no'),(32,'active_plugins','a:9:{i:0;s:19:\"akismet/akismet.php\";i:1;s:36:\"google-sitemap-generator/sitemap.php\";i:2;s:25:\"jiathis/jiathis-share.php\";i:3;s:39:\"syntaxhighlighter/syntaxhighlighter.php\";i:4;s:33:\"w3-total-cache/w3-total-cache.php\";i:5;s:27:\"wp-optimize/wp-optimize.php\";i:6;s:27:\"wp-slimstat/wp-slimstat.php\";i:7;s:35:\"wp-utf8-excerpt/wp-utf8-excerpt.php\";i:8;s:30:\"wpjam-qiniu/wpjam-qiniutek.php\";}','yes'),(33,'home','http://tech.liuchao.me','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'advanced_edit','0','yes'),(37,'comment_max_links','2','yes'),(38,'gmt_offset','','yes'),(39,'default_email_category','1','yes'),(40,'recently_edited','','no'),(41,'template','decode','yes'),(42,'stylesheet','decode','yes'),(43,'comment_whitelist','1','yes'),(44,'blacklist_keys','','no'),(45,'comment_registration','0','yes'),(46,'html_type','text/html','yes'),(47,'use_trackback','0','yes'),(48,'default_role','subscriber','yes'),(49,'db_version','27916','yes'),(50,'uploads_use_yearmonth_folders','1','yes'),(51,'upload_path','','yes'),(52,'blog_public','1','yes'),(53,'default_link_category','2','yes'),(54,'show_on_front','posts','yes'),(55,'tag_base','','yes'),(56,'show_avatars','1','yes'),(57,'avatar_rating','G','yes'),(58,'upload_url_path','','yes'),(59,'thumbnail_size_w','150','yes'),(60,'thumbnail_size_h','150','yes'),(61,'thumbnail_crop','1','yes'),(62,'medium_size_w','300','yes'),(63,'medium_size_h','300','yes'),(64,'avatar_default','mystery','yes'),(65,'large_size_w','1024','yes'),(66,'large_size_h','1024','yes'),(67,'image_default_link_type','file','yes'),(68,'image_default_size','','yes'),(69,'image_default_align','','yes'),(70,'close_comments_for_old_posts','0','yes'),(71,'close_comments_days_old','14','yes'),(72,'thread_comments','1','yes'),(73,'thread_comments_depth','5','yes'),(74,'page_comments','0','yes'),(75,'comments_per_page','50','yes'),(76,'default_comments_page','newest','yes'),(77,'comment_order','asc','yes'),(78,'sticky_posts','a:0:{}','yes'),(79,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_text','a:0:{}','yes'),(81,'widget_rss','a:0:{}','yes'),(82,'uninstall_plugins','a:0:{}','no'),(83,'timezone_string','Asia/Shanghai','yes'),(84,'page_for_posts','0','yes'),(85,'page_on_front','0','yes'),(86,'default_post_format','0','yes'),(87,'link_manager_enabled','0','yes'),(88,'initial_db_version','27916','yes'),(89,'techuser_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(90,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(91,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(92,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(93,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(94,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(95,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(96,'cron','a:7:{i:1404039487;a:1:{s:13:\"sm_ping_daily\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1404039593;a:3:{s:18:\"w3_pgcache_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:18:\"w3_pgcache_cleanup\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:22:\"w3_objectcache_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:22:\"w3_objectcache_cleanup\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:18:\"w3_dbcache_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:18:\"w3_dbcache_cleanup\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1404040860;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1404078897;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1404093600;a:1:{s:17:\"wp_slimstat_purge\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1404122106;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(97,'can_compress_scripts','0','yes'),(98,'theme_mods_twentyfourteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1404035775;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}','yes'),(99,'current_theme','Decode','yes'),(100,'theme_mods_decode','a:1:{i:0;b:0;}','yes'),(101,'theme_switched','','yes'),(102,'recently_activated','a:0:{}','yes'),(103,'akismet_available_servers','a:4:{s:12:\"192.0.80.246\";b:1;s:12:\"66.135.58.62\";b:1;s:12:\"192.0.80.244\";b:1;s:12:\"66.135.58.61\";b:1;}','yes'),(104,'akismet_connectivity_time','1404035864','yes'),(105,'sm_rewrite_done','$Id: sitemap-loader.php 937300 2014-06-23 18:04:11Z arnee $','yes'),(106,'jiathis_code','<!-- JiaThis Button BEGIN -->\r\n<div id=\"jiathis_style_32x32\">\r\n	<a class=\"jiathis_button_qzone\"></a>\r\n	<a class=\"jiathis_button_tsina\"></a>\r\n	<a class=\"jiathis_button_tqq\"></a>\r\n	<a class=\"jiathis_button_renren\"></a>\r\n	<a class=\"jiathis_button_kaixin001\"></a>\r\n	<a href=\"http://www.jiathis.com/share/\" class=\"jiathis jiathis_txt jtico jtico_jiathis\" target=\"_blank\"></a>\r\n	<a class=\"jiathis_counter_style\"></a>\r\n</div>\r\n<script type=\"text/javascript\" src=\"http://v2.jiathis.com/code/jia.js\" charset=\"utf-8\"></script>\r\n<!-- JiaThis Button END -->','yes'),(107,'jiathis_pos','down','yes'),(108,'jiathis_dir','left','yes'),(109,'jiathis_feed','yes','yes'),(110,'wp-optimize-schedule','false','no'),(111,'wp-optimize-last-optimized','Never','no'),(112,'wp-optimize-schedule-type','wpo_weekly','no'),(113,'wp-optimize-retention-enabled','false','no'),(114,'wp-optimize-retention-period','2','no'),(115,'wp-optimize-enable-admin-menu','false','no'),(116,'wp-optimize-total-cleaned','0','no'),(117,'wp-optimize-auto','a:8:{s:9:\"revisions\";s:4:\"true\";s:6:\"drafts\";s:4:\"true\";s:5:\"spams\";s:4:\"true\";s:10:\"unapproved\";s:5:\"false\";s:9:\"transient\";s:5:\"false\";s:8:\"postmeta\";s:5:\"false\";s:4:\"tags\";s:5:\"false\";s:8:\"optimize\";s:4:\"true\";}','yes'),(118,'slimstat_options','a:48:{s:7:\"version\";s:5:\"3.6.4\";s:6:\"secret\";s:32:\"a8a19a582525ea769feac2a979f6728b\";s:17:\"show_admin_notice\";i:0;s:11:\"is_tracking\";s:3:\"yes\";s:17:\"track_admin_pages\";s:2:\"no\";s:17:\"enable_javascript\";s:3:\"yes\";s:15:\"javascript_mode\";s:3:\"yes\";s:16:\"add_posts_column\";s:2:\"no\";s:17:\"use_separate_menu\";s:3:\"yes\";s:10:\"auto_purge\";s:3:\"120\";s:20:\"convert_ip_addresses\";s:2:\"no\";s:23:\"use_european_separators\";s:3:\"yes\";s:17:\"show_display_name\";s:2:\"no\";s:32:\"show_complete_user_agent_tooltip\";s:2:\"no\";s:31:\"convert_resource_urls_to_titles\";s:3:\"yes\";s:10:\"async_load\";s:2:\"no\";s:14:\"use_slimscroll\";s:3:\"yes\";s:14:\"expand_details\";s:2:\"no\";s:12:\"rows_to_show\";s:2:\"20\";s:16:\"refresh_interval\";s:2:\"60\";s:23:\"number_results_raw_data\";s:2:\"50\";s:32:\"include_outbound_links_right_now\";s:3:\"yes\";s:11:\"track_users\";s:3:\"yes\";s:12:\"ignore_users\";s:0:\"\";s:9:\"ignore_ip\";s:0:\"\";s:19:\"ignore_capabilities\";s:0:\"\";s:15:\"ignore_spammers\";s:3:\"yes\";s:16:\"ignore_resources\";s:0:\"\";s:16:\"ignore_countries\";s:0:\"\";s:15:\"ignore_browsers\";s:0:\"\";s:15:\"ignore_referers\";s:0:\"\";s:12:\"anonymize_ip\";s:2:\"no\";s:15:\"ignore_prefetch\";s:3:\"yes\";s:21:\"restrict_authors_view\";s:3:\"yes\";s:19:\"capability_can_view\";s:16:\"activate_plugins\";s:8:\"can_view\";s:0:\"\";s:20:\"capability_can_admin\";s:16:\"activate_plugins\";s:9:\"can_admin\";s:0:\"\";s:16:\"detect_smoothing\";s:3:\"yes\";s:24:\"enable_outbound_tracking\";s:3:\"yes\";s:16:\"session_duration\";i:1800;s:14:\"extend_session\";s:2:\"no\";s:10:\"enable_cdn\";s:3:\"yes\";s:19:\"extensions_to_track\";s:15:\"pdf,doc,xls,zip\";s:14:\"show_sql_debug\";s:2:\"no\";s:17:\"ip_lookup_service\";s:38:\"http://www.infosniper.net/?ip_address=\";s:10:\"custom_css\";s:0:\"\";s:14:\"locked_options\";s:0:\"\";}','no'),(119,'slimstat_visit_id','8','yes'),(120,'w3tc_request_data','','no'),(121,'akismet_strictness','0','yes'),(122,'akismet_show_user_comments_approved','0','yes'),(123,'wordpress_api_key','be182fa90de7','yes'),(124,'rewrite_rules','a:75:{s:34:\"sitemap(-+([a-zA-Z0-9_-]+))?\\.xml$\";s:40:\"index.php?xml_sitemap=params=$matches[2]\";s:38:\"sitemap(-+([a-zA-Z0-9_-]+))?\\.xml\\.gz$\";s:49:\"index.php?xml_sitemap=params=$matches[2];zip=true\";s:35:\"sitemap(-+([a-zA-Z0-9_-]+))?\\.html$\";s:50:\"index.php?xml_sitemap=params=$matches[2];html=true\";s:38:\"sitemap(-+([a-zA-Z0-9_-]+))?\\.html.gz$\";s:59:\"index.php?xml_sitemap=params=$matches[2];html=true;zip=true\";s:33:\"qiniu/([^/]+)/image/([^/]+).jpg?$\";s:47:\"index.php?p=$matches[1]&qiniu_image=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:44:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:69:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&tb=1\";s:64:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&feed=$matches[4]\";s:59:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&feed=$matches[4]\";s:52:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&paged=$matches[4]\";s:59:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&cpage=$matches[4]\";s:44:\"([0-9]{4})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&page=$matches[4]\";s:36:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(125,'zh_cn_l10n_icp_num','','yes'),(126,'syntaxhighlighter_settings','a:15:{s:9:\"shversion\";i:3;s:5:\"theme\";s:5:\"rdark\";s:6:\"gutter\";i:1;s:9:\"smarttabs\";i:1;s:9:\"wraplines\";i:1;s:9:\"classname\";s:0:\"\";s:9:\"firstline\";s:1:\"1\";s:14:\"padlinenumbers\";s:5:\"false\";s:7:\"tabsize\";s:1:\"4\";s:5:\"title\";s:0:\"\";s:14:\"loadallbrushes\";i:0;s:9:\"autolinks\";i:0;s:8:\"collapse\";i:0;s:5:\"light\";i:0;s:7:\"toolbar\";i:0;}','yes'),(127,'sm_options','a:51:{s:18:\"sm_b_prio_provider\";s:41:\"GoogleSitemapGeneratorPrioByCountProvider\";s:9:\"sm_b_ping\";b:1;s:10:\"sm_b_stats\";b:0;s:12:\"sm_b_pingmsn\";b:1;s:12:\"sm_b_autozip\";b:1;s:11:\"sm_b_memory\";s:0:\"\";s:9:\"sm_b_time\";i:-1;s:18:\"sm_b_style_default\";b:1;s:10:\"sm_b_style\";s:0:\"\";s:12:\"sm_b_baseurl\";s:0:\"\";s:11:\"sm_b_robots\";b:1;s:9:\"sm_b_html\";b:1;s:12:\"sm_b_exclude\";a:0:{}s:17:\"sm_b_exclude_cats\";a:0:{}s:10:\"sm_in_home\";b:1;s:11:\"sm_in_posts\";b:1;s:15:\"sm_in_posts_sub\";b:0;s:11:\"sm_in_pages\";b:1;s:10:\"sm_in_cats\";b:0;s:10:\"sm_in_arch\";b:0;s:10:\"sm_in_auth\";b:0;s:10:\"sm_in_tags\";b:0;s:9:\"sm_in_tax\";a:0:{}s:17:\"sm_in_customtypes\";a:0:{}s:13:\"sm_in_lastmod\";b:1;s:10:\"sm_cf_home\";s:5:\"daily\";s:11:\"sm_cf_posts\";s:7:\"monthly\";s:11:\"sm_cf_pages\";s:6:\"weekly\";s:10:\"sm_cf_cats\";s:6:\"weekly\";s:10:\"sm_cf_auth\";s:6:\"weekly\";s:15:\"sm_cf_arch_curr\";s:5:\"daily\";s:14:\"sm_cf_arch_old\";s:6:\"yearly\";s:10:\"sm_cf_tags\";s:6:\"weekly\";s:10:\"sm_pr_home\";d:1;s:11:\"sm_pr_posts\";d:0.59999999999999998;s:15:\"sm_pr_posts_min\";d:0.20000000000000001;s:11:\"sm_pr_pages\";d:0.59999999999999998;s:10:\"sm_pr_cats\";d:0.29999999999999999;s:10:\"sm_pr_arch\";d:0.29999999999999999;s:10:\"sm_pr_auth\";d:0.29999999999999999;s:10:\"sm_pr_tags\";d:0.29999999999999999;s:12:\"sm_i_donated\";b:0;s:17:\"sm_i_hide_donated\";b:0;s:17:\"sm_i_install_date\";i:1404038502;s:14:\"sm_i_hide_note\";b:0;s:15:\"sm_i_hide_works\";b:0;s:16:\"sm_i_hide_donors\";b:0;s:9:\"sm_i_hash\";s:20:\"7597d90adfbfbe57e6ea\";s:13:\"sm_i_lastping\";i:1404038503;s:16:\"sm_i_supportfeed\";b:1;s:22:\"sm_i_supportfeed_cache\";i:0;}','yes'),(128,'sm_status','O:28:\"GoogleSitemapGeneratorStatus\":4:{s:39:\"\0GoogleSitemapGeneratorStatus\0startTime\";d:1404038502.2779529;s:37:\"\0GoogleSitemapGeneratorStatus\0endTime\";d:1404038503.142179;s:41:\"\0GoogleSitemapGeneratorStatus\0pingResults\";a:2:{s:6:\"google\";a:5:{s:9:\"startTime\";d:1404038502.3147681;s:7:\"endTime\";d:1404038502.767715;s:7:\"success\";b:1;s:3:\"url\";s:97:\"http://www.google.com/webmasters/sitemaps/ping?sitemap=http%3A%2F%2Ftech.liuchao.me%2Fsitemap.xml\";s:4:\"name\";s:6:\"Google\";}s:4:\"bing\";a:5:{s:9:\"startTime\";d:1404038502.7795;s:7:\"endTime\";d:1404038503.127584;s:7:\"success\";b:1;s:3:\"url\";s:90:\"http://www.bing.com/webmaster/ping.aspx?siteMap=http%3A%2F%2Ftech.liuchao.me%2Fsitemap.xml\";s:4:\"name\";s:4:\"Bing\";}}s:38:\"\0GoogleSitemapGeneratorStatus\0autoSave\";b:1;}','no');
/*!40000 ALTER TABLE `techoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techpostmeta`
--

DROP TABLE IF EXISTS `techpostmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techpostmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techpostmeta`
--

LOCK TABLES `techpostmeta` WRITE;
/*!40000 ALTER TABLE `techpostmeta` DISABLE KEYS */;
INSERT INTO `techpostmeta` VALUES (1,2,'_wp_page_template','default'),(2,1,'_edit_lock','1404038392:1'),(3,1,'_edit_last','1'),(6,1,'_syntaxhighlighter_encoded','1');
/*!40000 ALTER TABLE `techpostmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techposts`
--

DROP TABLE IF EXISTS `techposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techposts` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techposts`
--

LOCK TABLES `techposts` WRITE;
/*!40000 ALTER TABLE `techposts` DISABLE KEYS */;
INSERT INTO `techposts` VALUES (1,1,'2014-06-29 09:54:54','2014-06-29 09:54:54','欢迎使用WordPress。这是系统自动生成的演示文章。编辑或者删除它，然后开始您的博客！\r\n\r\n\r\n[php]\r\n\r\n&lt;?php\r\n\r\necho phpinfo();\r\n\r\n?&gt;\r\n\r\n[/php]\r\n','世界，你好！','','publish','open','open','','hello-world','','','2014-06-29 18:41:36','2014-06-29 10:41:36','',0,'http://tech.liuchao.me/?p=1',0,'post','',1),(2,1,'2014-06-29 09:54:54','2014-06-29 09:54:54','这是示范页面。页面和博客文章不同，它的位置是固定的，通常会在站点导航栏显示。很多用户都创建一个“关于”页面，向访客介绍自己。例如，个人博客通常有类似这样的介绍：\n\n<blockquote>欢迎！我白天是个邮递员，晚上就是个有抱负的演员。这是我的博客。我住在天朝的帝都，有条叫做杰克的狗。</blockquote>\n\n……公司博客可以这样写：\n\n<blockquote>XYZ Doohickey公司成立于1971年，自从建立以来，我们一直向社会贡献着优秀doohicky。我们的公司总部位于天朝魔都，有着超过两千名员工，对魔都政府税收有着巨大贡献。</blockquote>\n\n您可以访问<a href=\"http://tech.liuchao.me/wp-admin/\">仪表盘</a>，删除本页面，然后添加您自己的内容。祝您使用愉快！','示例页面','','publish','open','open','','sample-page','','','2014-06-29 09:54:54','2014-06-29 09:54:54','',0,'http://tech.liuchao.me/?page_id=2',0,'page','',0),(3,1,'2014-06-29 17:55:08','0000-00-00 00:00:00','','自动草稿','','auto-draft','open','open','','','','','2014-06-29 17:55:08','0000-00-00 00:00:00','',0,'http://tech.liuchao.me/?p=3',0,'post','',0),(4,1,'2014-06-29 18:34:51','2014-06-29 10:34:51','&lt;?php\n\necho \'hello world!\';\n\n?&gt;','世界，你好！','','inherit','open','open','','1-autosave-v1','','','2014-06-29 18:34:51','2014-06-29 10:34:51','',1,'http://tech.liuchao.me/2014/06/1-autosave-v1/',0,'revision','',0),(5,1,'2014-06-29 18:41:36','2014-06-29 10:41:36','欢迎使用WordPress。这是系统自动生成的演示文章。编辑或者删除它，然后开始您的博客！\r\n\r\n\r\n[php]\r\n\r\n&lt;?php\r\n\r\necho phpinfo();\r\n\r\n?&gt;\r\n\r\n[/php]\r\n','世界，你好！','','inherit','open','open','','1-revision-v1','','','2014-06-29 18:41:36','2014-06-29 10:41:36','',1,'http://tech.liuchao.me/2014/06/1-revision-v1/',0,'revision','',0);
/*!40000 ALTER TABLE `techposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techslim_browsers`
--

DROP TABLE IF EXISTS `techslim_browsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techslim_browsers` (
  `browser_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `browser` varchar(40) DEFAULT '',
  `version` varchar(15) DEFAULT '',
  `platform` varchar(15) DEFAULT '',
  `css_version` varchar(5) DEFAULT '',
  `type` tinyint(3) unsigned DEFAULT '0',
  `user_agent` varchar(2048) DEFAULT '',
  PRIMARY KEY (`browser_id`),
  UNIQUE KEY `uk_techbrowsers` (`browser`,`version`,`platform`,`css_version`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techslim_browsers`
--

LOCK TABLES `techslim_browsers` WRITE;
/*!40000 ALTER TABLE `techslim_browsers` DISABLE KEYS */;
INSERT INTO `techslim_browsers` VALUES (1,'Chrome','34','win7','3',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36 Android'),(2,'Chrome','35','win7','1',0,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36');
/*!40000 ALTER TABLE `techslim_browsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techslim_content_info`
--

DROP TABLE IF EXISTS `techslim_content_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techslim_content_info` (
  `content_info_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(64) DEFAULT '',
  `category` varchar(256) DEFAULT '',
  `author` varchar(64) DEFAULT '',
  `content_id` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`content_info_id`),
  UNIQUE KEY `uk_techcontent_info` (`content_type`(20),`category`(20),`author`(20),`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techslim_content_info`
--

LOCK TABLES `techslim_content_info` WRITE;
/*!40000 ALTER TABLE `techslim_content_info` DISABLE KEYS */;
INSERT INTO `techslim_content_info` VALUES (1,'login','','',0),(2,'home','','',0),(3,'post','1','admin',1);
/*!40000 ALTER TABLE `techslim_content_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techslim_outbound`
--

DROP TABLE IF EXISTS `techslim_outbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techslim_outbound` (
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
  CONSTRAINT `fk_techid` FOREIGN KEY (`id`) REFERENCES `techslim_stats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techslim_outbound`
--

LOCK TABLES `techslim_outbound` WRITE;
/*!40000 ALTER TABLE `techslim_outbound` DISABLE KEYS */;
/*!40000 ALTER TABLE `techslim_outbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techslim_screenres`
--

DROP TABLE IF EXISTS `techslim_screenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techslim_screenres` (
  `screenres_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resolution` varchar(12) DEFAULT '',
  `colordepth` varchar(5) DEFAULT '',
  `antialias` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`screenres_id`),
  UNIQUE KEY `uk_techscreenres` (`resolution`,`colordepth`,`antialias`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techslim_screenres`
--

LOCK TABLES `techslim_screenres` WRITE;
/*!40000 ALTER TABLE `techslim_screenres` DISABLE KEYS */;
INSERT INTO `techslim_screenres` VALUES (1,'1024x768','24',1),(2,'1600x900','24',1);
/*!40000 ALTER TABLE `techslim_screenres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techslim_stats`
--

DROP TABLE IF EXISTS `techslim_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techslim_stats` (
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
  CONSTRAINT `fk_techbrowser_id` FOREIGN KEY (`browser_id`) REFERENCES `techslim_browsers` (`browser_id`),
  CONSTRAINT `fk_techcontent_info_id` FOREIGN KEY (`content_info_id`) REFERENCES `techslim_content_info` (`content_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techslim_stats`
--

LOCK TABLES `techslim_stats` WRITE;
/*!40000 ALTER TABLE `techslim_stats` DISABLE KEYS */;
INSERT INTO `techslim_stats` VALUES (1,3029955262,0,'','en','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/options-general.php&reauth=1','',1,1,1,'','',1,1404064725),(2,3029955262,0,'','en','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/plugins.php?action=activate&plugin=akismet/akismet.php&plugin_status=all&paged=1&s&_wpnonce=52241897f5&reauth=1','',1,1,1,'','',2,1404064739),(3,2008813605,0,'','en','cn','','','/wp-login.php','',1,1,1,'','',3,1404064817),(4,3029955262,0,'','en','cn','','','/wp-login.php','',1,1,1,'','',4,1404064841),(5,3074269395,0,'','en','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/plugins.php?action=activate&plugin=w3-total-cache/w3-total-cache.php&plugin_status=all&paged=1&s&_wpnonce=368423a784&reauth=1','',1,1,1,'','',5,1404065023),(6,2093661992,0,'admin','zh-cn','cn','','','/','',2,2,2,'flash','user:1;',8,1404065156),(7,1806878723,0,'','en','us','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/options-general.php&reauth=1','',1,1,1,'','',6,1404066556),(8,3071310594,0,'','en-us','cn','','','/wp-login.php?redirect_to=http://tech.liuchao.me/wp-admin/options-general.php&reauth=1','',1,1,1,'','',7,1404066595),(9,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/options-general.php?settings-updated=true','/','',2,2,2,'flash','user:1;',8,1404066755),(10,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/','/','',2,2,2,'flash','user:1;',8,1404066822),(11,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit&message=1','/2014/06/hello-world/','',2,2,3,'flash','user:1;',8,1404067304),(12,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit&message=1','/2014/06/hello-world/','',2,2,3,'flash','user:1;',8,1404067319),(13,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit&message=1','/','',2,2,2,'flash','user:1;',8,1404067338),(14,2093661992,0,'admin','zh-cn','cn','tech.liuchao.me','http://tech.liuchao.me/wp-admin/post.php?post=1&action=edit&message=1','/','',2,2,2,'flash','user:1;',8,1404067344);
/*!40000 ALTER TABLE `techslim_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techterm_relationships`
--

DROP TABLE IF EXISTS `techterm_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techterm_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techterm_relationships`
--

LOCK TABLES `techterm_relationships` WRITE;
/*!40000 ALTER TABLE `techterm_relationships` DISABLE KEYS */;
INSERT INTO `techterm_relationships` VALUES (1,1,0);
/*!40000 ALTER TABLE `techterm_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techterm_taxonomy`
--

DROP TABLE IF EXISTS `techterm_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techterm_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techterm_taxonomy`
--

LOCK TABLES `techterm_taxonomy` WRITE;
/*!40000 ALTER TABLE `techterm_taxonomy` DISABLE KEYS */;
INSERT INTO `techterm_taxonomy` VALUES (1,1,'category','',0,1);
/*!40000 ALTER TABLE `techterm_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techtermmeta`
--

DROP TABLE IF EXISTS `techtermmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techtermmeta` (
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
-- Dumping data for table `techtermmeta`
--

LOCK TABLES `techtermmeta` WRITE;
/*!40000 ALTER TABLE `techtermmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `techtermmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techterms`
--

DROP TABLE IF EXISTS `techterms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techterms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techterms`
--

LOCK TABLES `techterms` WRITE;
/*!40000 ALTER TABLE `techterms` DISABLE KEYS */;
INSERT INTO `techterms` VALUES (1,'未分类','uncategorized',0);
/*!40000 ALTER TABLE `techterms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techusermeta`
--

DROP TABLE IF EXISTS `techusermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techusermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techusermeta`
--

LOCK TABLES `techusermeta` WRITE;
/*!40000 ALTER TABLE `techusermeta` DISABLE KEYS */;
INSERT INTO `techusermeta` VALUES (1,1,'first_name',''),(2,1,'last_name',''),(3,1,'nickname','admin'),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'techcapabilities','a:1:{s:13:\"administrator\";b:1;}'),(11,1,'techuser_level','10'),(12,1,'dismissed_wp_pointers','wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),(13,1,'show_welcome_panel','1'),(14,1,'techdashboard_quick_press_last_post_id','3');
/*!40000 ALTER TABLE `techusermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techusers`
--

DROP TABLE IF EXISTS `techusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techusers` (
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
-- Dumping data for table `techusers`
--

LOCK TABLES `techusers` WRITE;
/*!40000 ALTER TABLE `techusers` DISABLE KEYS */;
INSERT INTO `techusers` VALUES (1,'admin','$P$BZPUas8NGFIjctZ4zsrHa5.n/mC.TP0','admin','thesedays@126.com','','2014-06-29 09:54:54','',0,'admin');
/*!40000 ALTER TABLE `techusers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-29  6:43:30
