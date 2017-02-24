-- MySQL dump 10.13  Distrib 5.7.10, for osx10.11 (x86_64)
--
-- Host: localhost    Database: imooc_xiaohu
-- ------------------------------------------------------
-- Server version	5.7.10

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

create database imooc_xiaohu;

--
-- Table structure for table `answer_user`
--

DROP TABLE IF EXISTS `answer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `answer_id` int(10) unsigned NOT NULL,
  `vote` smallint(5) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `answer_user_user_id_answer_id_vote_unique` (`user_id`,`answer_id`,`vote`),
  KEY `answer_user_answer_id_foreign` (`answer_id`),
  CONSTRAINT `answer_user_answer_id_foreign` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`),
  CONSTRAINT `answer_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_user`
--

LOCK TABLES `answer_user` WRITE;
/*!40000 ALTER TABLE `answer_user` DISABLE KEYS */;
INSERT INTO `answer_user` VALUES (9,8,2,1,'2016-06-24 00:14:53','2016-06-24 00:14:53'),(153,5,2,2,'2016-07-07 22:00:58','2016-07-07 22:00:58'),(154,5,1,1,'2016-07-07 22:01:02','2016-07-07 22:01:02'),(158,6,6,2,'2016-07-07 23:44:03','2016-07-07 23:44:03'),(160,6,2,2,'2016-07-11 05:21:38','2016-07-11 05:21:38'),(161,5,7,1,'2016-07-16 06:17:48','2016-07-16 06:17:48'),(162,6,9,1,'2016-07-16 06:26:24','2016-07-16 06:26:24');
/*!40000 ALTER TABLE `answer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_user_id_foreign` (`user_id`),
  KEY `answers_question_id_foreign` (`question_id`),
  CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'不问是不是，直接问为什么的都是耍流氓。:) :)',5,1,'2016-05-24 02:58:03','2016-07-07 23:34:10'),(2,'泻药，实名反对排名第一的答案。',4,1,'2016-05-24 05:03:38','2016-05-24 05:03:38'),(6,'地球明明是三角的~',6,1,'2016-07-07 23:42:24','2016-07-07 23:42:42'),(7,'嗯，谢邀。\n作为一个在校学生，其实关于提升学习效率我曾经试过很多很多种方法，其中包括“坚决不带智能机法”、“自我犒劳奖励法”、“强行自我逼迫法”等等，但是最终都无一例外都失败了。\n因为有的时候真的忍不住要点手机，而且容易被别的事情分散注意力。',6,27,'2016-07-16 06:15:31','2016-07-16 06:16:37'),(8,'以十五分钟为单位\n1个时间单位:一段睡眠 1个list单词 一课历史 一个政治专题知识点 一道导数 一道圆锥曲线 一道地理答题 一课政治默写 背一篇古文\n2个时间单位:一套数学选填 一套文综选择 四道数学傻逼大题 五三一个专题 \n3个时间单位:一套压缩数学大卷(只做选择填空最后两道 导数圆曲) \n4个时间单位:一套压缩文综大卷(正常做选择 大题简写零散关键字)',5,27,'2016-07-16 06:17:44','2016-07-16 06:17:44'),(9,'耍流氓。',5,28,'2016-07-16 06:25:59','2016-07-16 06:25:59');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned DEFAULT NULL,
  `answer_id` int(10) unsigned DEFAULT NULL,
  `reply_to` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_question_id_foreign` (`question_id`),
  KEY `comments_answer_id_foreign` (`answer_id`),
  KEY `comments_reply_to_foreign` (`reply_to`),
  CONSTRAINT `comments_answer_id_foreign` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`),
  CONSTRAINT `comments_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `comments_reply_to_foreign` FOREIGN KEY (`reply_to`) REFERENCES `comments` (`id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (2,'答主你好，答主再见',6,NULL,2,NULL,'2016-05-24 22:47:20','2016-05-24 22:47:20'),(3,'答主你好，答主再见',6,1,NULL,NULL,'2016-05-24 22:47:43','2016-05-24 22:47:43'),(7,'asdf',6,NULL,1,NULL,'2016-07-08 02:37:56','2016-07-08 02:37:56'),(8,'test1',6,NULL,1,NULL,'2016-07-08 02:38:56','2016-07-08 02:38:56'),(9,'test2',6,NULL,1,NULL,'2016-07-08 02:38:59','2016-07-08 02:38:59'),(10,'test3',6,NULL,1,NULL,'2016-07-08 02:39:02','2016-07-08 02:39:02'),(11,'asdf',6,NULL,6,NULL,'2016-07-08 02:56:10','2016-07-08 02:56:10'),(12,'test1',6,NULL,6,NULL,'2016-07-08 02:57:44','2016-07-08 02:57:44'),(13,'test2',6,NULL,6,NULL,'2016-07-08 02:57:47','2016-07-08 02:57:47'),(14,'那好吧',6,NULL,2,NULL,'2016-07-08 02:57:59','2016-07-08 02:57:59'),(15,'撒地方',6,NULL,1,NULL,'2016-07-08 02:58:29','2016-07-08 02:58:29'),(16,'asdfasdf',6,NULL,1,NULL,'2016-07-08 02:59:07','2016-07-08 02:59:07'),(17,'abc',6,NULL,6,NULL,'2016-07-11 04:05:42','2016-07-11 04:05:42'),(18,'efg',6,NULL,6,NULL,'2016-07-11 04:05:54','2016-07-11 04:05:54'),(19,'abc',5,NULL,9,NULL,'2016-07-16 06:27:33','2016-07-16 06:27:33');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2016_05_20_073505_create_table_users',1),('2016_05_22_050317_create_table_questions',2),('2016_05_24_104425_create_table_answers',3),('2016_05_25_062654_create_table_comments',4),('2016_05_26_112836_create_table_answer_user',5),('2016_05_27_095150_create_table_answer_user',6),('2016_06_06_090620_add_field_phone_captcha',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `desc` text COLLATE utf8_unicode_ci COMMENT 'description',
  `user_id` int(10) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ok',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_user_id_foreign` (`user_id`),
  CONSTRAINT `questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'为什么地球是方的？','abcabc',4,'ok','2016-05-21 22:07:31','2016-05-22 06:01:40'),(4,'test？','test',4,'ok','2016-05-22 21:31:39','2016-05-22 21:31:39'),(5,'test？','test',4,'ok','2016-05-22 21:31:40','2016-05-22 21:31:40'),(6,'test？','test',4,'ok','2016-05-22 21:31:40','2016-05-22 21:31:40'),(7,'test？','test',4,'ok','2016-05-22 21:31:41','2016-05-22 21:31:41'),(8,'test？','test',4,'ok','2016-05-22 21:31:41','2016-05-22 21:31:41'),(9,'test？','test',4,'ok','2016-05-22 21:31:41','2016-05-22 21:31:41'),(10,'test？','test',4,'ok','2016-05-22 21:31:41','2016-05-22 21:31:41'),(11,'test？','test',4,'ok','2016-05-22 21:31:41','2016-05-22 21:31:41'),(12,'test？','test',4,'ok','2016-05-22 21:31:42','2016-05-22 21:31:42'),(13,'test？','test',4,'ok','2016-05-22 21:31:42','2016-05-22 21:31:42'),(14,'test？','test',4,'ok','2016-05-22 21:31:42','2016-05-22 21:31:42'),(15,'test？','test',4,'ok','2016-05-22 21:31:42','2016-05-22 21:31:42'),(16,'test？','test',4,'ok','2016-05-22 21:31:42','2016-05-22 21:31:42'),(17,'test？','test',4,'ok','2016-05-22 21:31:43','2016-05-22 21:31:43'),(18,'test？','test',4,'ok','2016-05-22 21:31:43','2016-05-22 21:31:43'),(19,'test？','test',4,'ok','2016-05-22 21:32:06','2016-05-22 21:32:06'),(20,'sadfsd','sadfasdf',8,'ok','2016-06-14 21:44:52','2016-06-14 21:44:52'),(21,'testtest','sadfasdf',8,'ok','2016-06-14 21:45:19','2016-06-14 21:45:19'),(22,'地球为什么是方的？','如题。',8,'ok','2016-06-14 21:47:18','2016-06-14 21:47:18'),(23,'test-1','test test',5,'ok','2016-07-06 01:27:34','2016-07-06 01:27:34'),(24,'你们做过最记忆犹新或者最奇怪的梦是什么？','uiui dfdks sa ssdfdf',6,'ok','2016-07-11 03:31:08','2016-07-16 06:12:27'),(25,'各行业的精英穿越回封建社会能脱颖而出吗？',NULL,6,'ok','2016-07-16 06:13:14','2016-07-16 06:13:14'),(26,'有哪些其他多数人都不喜欢，但你就是喜欢，即使别人觉得你品位有问题，可你还是喜欢的东西？',NULL,6,'ok','2016-07-16 06:14:13','2016-07-16 06:14:13'),(27,'有没有一种让人欲罢不能的学习方法？',NULL,6,'ok','2016-07-16 06:14:57','2016-07-16 06:14:57'),(28,'天为什么是绿的？','test test.',5,'ok','2016-07-16 06:25:33','2016-07-16 06:25:33');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_url` text COLLATE utf8_unicode_ci,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone_captcha` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'韩梅梅',NULL,NULL,'1234','$2y$10$610ImTn/EnN/KJbRc9pLOu.JPC/Wcj7JIl6IqClVhyzdjamdCbGBG',NULL,NULL,'2016-06-06 01:53:00','2180'),(2,'liming',NULL,NULL,NULL,'$2y$10$/tBXaGO0aucAlGGVt4NHyOwwPHtLvzVOQMNLEaSMAtpXLtGgum2Z.',NULL,'2016-05-20 00:45:01','2016-05-20 00:45:01',''),(3,'王大聪',NULL,NULL,NULL,'$2y$10$UhznnPOqocpMIxbG5FCJdOJMBTlK/sMdVdhLsK0if1qIyRT8eZIZO',NULL,'2016-05-20 00:46:52','2016-05-20 00:46:52',''),(4,'test1',NULL,NULL,NULL,'$2y$10$CzOZzDCjn6MKMG0Okh50qOEV2HvUfEqDWak4Nxubc.n.H1QJmie7G',NULL,'2016-05-21 01:00:01','2016-05-29 04:38:46',''),(5,'test2',NULL,NULL,NULL,'$2y$10$3o6f0ShDyPkCNDwO0k3SAOwlygyo27gnHdbYbxVQPI0ibMm5w8k4i',NULL,'2016-05-24 02:15:04','2016-05-24 02:15:04',''),(6,'test3',NULL,NULL,NULL,'$2y$10$yXxAYXGts3fkVzdSbGFKG.lSHtGW2QInZcwHb66TBGMXIFHjMiXuO',NULL,'2016-05-24 21:24:56','2016-05-24 21:24:56',''),(7,'asdf',NULL,NULL,NULL,'$2y$10$89sZsZrM5nvLq.keTDzQZOjgPm7FZPWGdIgRgzRnxxnRIKWM69v2q',NULL,'2016-06-14 20:35:57','2016-06-14 20:35:57',''),(8,'test4',NULL,NULL,NULL,'$2y$10$UkAKI9wJRq5vn8.KXRZYLOJFl.jUDp9yWXk.SvHOUElVbp4LQiN0q',NULL,'2016-06-14 20:37:51','2016-06-14 20:37:51','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-12  0:28:26
