-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: text_generator
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `novel_id` bigint unsigned NOT NULL COMMENT '所属小说ID',
  `chapter_title` varchar(128) DEFAULT NULL COMMENT '章节标题',
  `chapter_content` text NOT NULL COMMENT '章节内容',
  `chapter_number` int unsigned NOT NULL COMMENT '章节序号',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_novel_id` (`novel_id`),
  CONSTRAINT `chapters_ibfk_1` FOREIGN KEY (`novel_id`) REFERENCES `novels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说章节表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters`
--

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL COMMENT '收藏用户ID',
  `novel_id` bigint unsigned NOT NULL COMMENT '被收藏小说ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_novel` (`user_id`,`novel_id`),
  KEY `collections_ibfk_2` (`novel_id`),
  CONSTRAINT `collections_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `collections_ibfk_2` FOREIGN KEY (`novel_id`) REFERENCES `novels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL COMMENT '关联用户ID',
  `title` varchar(128) DEFAULT '' COMMENT '会话标题',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `status` tinyint unsigned DEFAULT '1' COMMENT '会话状态: 1-活跃, 2-归档, 3-删除',
  `uuid` varchar(60) NOT NULL,
  `novel_id` bigint unsigned DEFAULT NULL,
  `map_url` varchar(128) DEFAULT NULL,
  `peo_url` text,
  `photo_url` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`,`uuid`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_created_at` (`created_at`),
  KEY `conversations_ibfk_2_idx` (`novel_id`),
  KEY `idx_uuid` (`uuid`),
  CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conversations_ibfk_2` FOREIGN KEY (`novel_id`) REFERENCES `novels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户会话主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (51,11,NULL,'2025-07-23 12:13:26','2025-07-23 12:13:26',NULL,'20f249656d0340d9a74ba619bc47467c',NULL,NULL,NULL,NULL),(52,17,NULL,'2025-07-23 21:54:47','2025-07-23 21:54:47',NULL,'81a7247471b3477c8ed54c3576eb1f38',NULL,NULL,NULL,NULL),(53,17,NULL,'2025-07-23 21:54:47','2025-07-23 22:19:00',3,'b9bcc21d96bb40dc9ffa4801754fb836',NULL,'http://127.0.0.1:8000/static/output/fcb284cb-7a16-45c2-94df-ef3a6ad4a063_final.png',NULL,'https://dashscope-result-wlcb-acdr-1.oss-cn-wulanchabu-acdr-1.aliyuncs.com/1d/0e/20250723/5070f64c/0fdad9ea-492b-473e-b910-857a69c79dc11937704378.png?Expires=1753366737&OSSAccessKeyId=LTAI5tKPD3TMqf2Lna1fASuh&Signature=X7NcZKSitX%2FRZQaF%2BfqsLY53uDg%3D'),(54,17,NULL,'2025-07-24 08:36:57','2025-07-24 08:36:57',NULL,'ee3944cbe36e4d0192aa189816c005b3',NULL,NULL,NULL,NULL),(55,17,NULL,'2025-07-24 08:36:57','2025-07-24 08:36:57',NULL,'c5f2b869f96b494d968fe03bf40c9de6',NULL,NULL,NULL,NULL),(56,17,NULL,'2025-07-24 08:37:01','2025-07-24 08:37:01',NULL,'e54312ff36544ce2a693bfbaec761216',NULL,NULL,NULL,NULL),(57,17,NULL,'2025-07-24 08:37:01','2025-07-24 08:38:34',1,'7083c22652a0457795b77f9361531ae6',NULL,'http://127.0.0.1:8000/static/output/2ac92116-a1e1-42d9-9836-651c36b5ffaa_final.png',NULL,NULL),(58,17,NULL,'2025-07-24 10:54:33','2025-07-24 10:54:33',NULL,'3508669c81864bc0988bcb41d018a8d8',NULL,NULL,NULL,NULL),(59,17,NULL,'2025-07-24 10:54:33','2025-07-24 10:55:33',3,'806e79c1c52240918864ecb6124644bc',NULL,NULL,NULL,'https://dashscope-result-wlcb-acdr-1.oss-cn-wulanchabu-acdr-1.aliyuncs.com/1d/37/20250724/5070f64c/38b9718f-7fbb-4d4d-9775-d6d4f5f512923752256446.png?Expires=1753412128&OSSAccessKeyId=LTAI5tKPD3TMqf2Lna1fASuh&Signature=6UQRcGEc%2Bg4sD3mgjoJlKcvCqXk%3D'),(60,17,NULL,'2025-07-24 16:34:53','2025-07-24 16:34:53',NULL,'bf6d5db55f81423eab45206146e57f03',NULL,NULL,NULL,NULL),(61,17,NULL,'2025-07-24 16:40:55','2025-07-24 16:42:12',1,'d4eacf541de348c58bc262aeac9541dd',NULL,'http://127.0.0.1:8000/static/output/e78fba0e-f95d-44af-aca7-2735d4041b34_final.png',NULL,NULL),(62,17,NULL,'2025-07-24 16:42:35','2025-07-24 16:44:34',3,'948aae6f524f4d6cb827d84b7b021219',NULL,'http://127.0.0.1:8000/static/output/d2b6912a-8668-4238-a76f-b45a996cbf74_final.png',NULL,'https://dashscope-result-wlcb-acdr-1.oss-cn-wulanchabu-acdr-1.aliyuncs.com/1d/20/20250724/5070f64c/b12d1cbb-0a1f-4cc7-9e01-a03e11dc6c044292757400.png?Expires=1753433070&OSSAccessKeyId=LTAI5tKPD3TMqf2Lna1fASuh&Signature=v6Ie17Y8c6Tvd5LM9IDYLUUKbsk%3D'),(63,17,NULL,'2025-07-24 16:45:28','2025-07-24 16:45:28',NULL,'b494b9f317ce46deac1d5a1d2673ecaf',NULL,NULL,NULL,NULL),(64,17,NULL,'2025-07-24 16:46:03','2025-07-24 16:46:03',NULL,'89dc8a70f39f437fb201ca715040ac25',NULL,NULL,NULL,NULL),(65,17,NULL,'2025-07-24 16:46:54','2025-07-24 16:46:54',NULL,'028b4311be8c4283915c6559f64704fe',NULL,NULL,NULL,NULL),(66,17,NULL,'2025-07-24 16:51:15','2025-07-24 16:51:15',NULL,'85b388e73e62472e989ae6e9a9279712',NULL,NULL,NULL,NULL),(67,17,NULL,'2025-07-24 16:51:39','2025-07-24 16:51:39',NULL,'5c7fb4acbe014e8c9f3fb63aaa5f44cd',NULL,NULL,NULL,NULL),(68,17,NULL,'2025-07-24 16:52:10','2025-07-24 16:52:10',NULL,'f4bee6535d834bbdaee0c4743d47fec7',NULL,NULL,NULL,NULL),(69,17,NULL,'2025-07-24 16:55:05','2025-07-24 16:55:05',NULL,'9d7187d1d74c48218c1768406f051f41',NULL,NULL,NULL,NULL),(70,17,NULL,'2025-07-24 17:08:35','2025-07-24 17:08:35',NULL,'09b5acae98b34acda65e30adca457ba7',NULL,NULL,NULL,NULL),(71,17,NULL,'2025-07-24 17:15:39','2025-07-24 17:16:42',3,'731325bd8baa46b495b4b06005b06ed1',NULL,'http://127.0.0.1:8000/static/output/a5a5b06f-2531-46fa-941c-b14d93e2220e_final.png',NULL,'https://dashscope-result-wlcb-acdr-1.oss-cn-wulanchabu-acdr-1.aliyuncs.com/1d/8c/20250724/5070f64c/d341b8e6-8c3a-4a36-ba8f-1720eff2681c4271845200.png?Expires=1753434995&OSSAccessKeyId=LTAI5tKPD3TMqf2Lna1fASuh&Signature=9C%2BTj0ic%2BdE%2BgDQX1N%2BWTd%2FOpgY%3D'),(72,17,NULL,'2025-07-24 17:22:42','2025-07-24 17:22:42',NULL,'786129b3069144f19fe0de33a4859cd7',NULL,NULL,NULL,NULL),(73,17,NULL,'2025-07-24 17:31:00','2025-07-24 17:31:00',NULL,'d414b19fc504426495179f06f8edd4b9',NULL,NULL,NULL,NULL),(74,17,NULL,'2025-07-24 17:33:15','2025-07-24 17:33:15',NULL,'a4329f90493241c19d415456de54ef41',NULL,NULL,NULL,NULL),(75,17,NULL,'2025-07-24 17:35:32','2025-07-24 17:35:32',NULL,'eca453bd471b4fd9b059b2aa47ec4e2a',NULL,NULL,NULL,NULL),(76,17,NULL,'2025-07-24 18:34:42','2025-07-24 18:34:42',NULL,'f031fda2e9af4af8a7ccffc8abfdad97',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(60) NOT NULL COMMENT '所属会话ID',
  `role` enum('user','assistant','system') NOT NULL COMMENT '消息角色',
  `content` text NOT NULL COMMENT '消息内容',
  `message_id` varchar(64) DEFAULT NULL COMMENT '模型返回的消息ID',
  `tokens` int unsigned DEFAULT '0' COMMENT '消息token数',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息时间',
  `model_name` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_id` (`message_id`),
  KEY `idx_conversation_id` (`uuid`),
  KEY `idx_created_at` (`created_at`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`uuid`) REFERENCES `conversations` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会话消息记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novels`
--

DROP TABLE IF EXISTS `novels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `novels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL COMMENT '创作者用户ID',
  `title` varchar(128) NOT NULL COMMENT '小说标题',
  `introduction` text COMMENT '小说简介',
  `cover_url` varchar(255) DEFAULT NULL COMMENT '小说封面URL',
  `status` tinyint unsigned DEFAULT '1' COMMENT '小说状态，1-创作中，2-已完结',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `content` text NOT NULL,
  `tags` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `novels_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novels`
--

LOCK TABLES `novels` WRITE;
/*!40000 ALTER TABLE `novels` DISABLE KEYS */;
INSERT INTO `novels` VALUES (1,8,'西游记','唐僧师徒西天取经的故事',NULL,1,'2025-07-22 14:32:51','2025-07-22 18:45:04','从前有座山，山里有座庙','玄幻 言情'),(2,8,'《玄幻世界大冒险》','在一个充满魔法与斗气的玄幻世界，少年意外获得上古传承，从此踏上了一条逆天改命的强者之路。他将面对各种强大的敌人、神秘的遗迹和未知的挑战，不断成长，揭开世界的终极秘密。',NULL,1,'2025-07-20 10:00:00','2025-07-22 16:38:23','故事开始于一个偏远的小镇，少年林风在一次偶然的机会下，捡到了一枚神秘的古戒。当他戴上古戒的瞬间，一股庞大的信息流涌入脑海，原来这是上古强者的传承之戒。从此，林风的人生轨迹发生了彻底的改变。他开始修炼古戒中记载的绝世功法，修为一日千里。在修炼的过程中，他结识了一群志同道合的伙伴，他们一起探索古老的遗迹，寻找稀世珍宝。然而，强大的敌人也随之而来，有觊觎传承的邪恶势力，有来自其他强大宗门的天才弟子。林风凭借着自己的智慧和勇气，一次次化险为夷，不断提升自己的实力。他逐渐发现，这个世界隐藏着一个巨大的阴谋，而他的传承似乎与这个阴谋有着千丝万缕的联系。为了保护自己的亲人朋友，为了守护这个世界的和平，林风毅然决然地踏上了揭开阴谋、对抗邪恶的道路。在这条道路上，他将经历无数的艰难险阻，也将创造一个又一个的传奇故事。','玄幻 冒险'),(3,8,'《都市超级学霸》','普通高中生意外获得未来科技系统，从此学渣逆袭，成为都市中的超级学霸。他不仅在学业上碾压众人，还利用系统赋予的能力，在商业、科技等领域崭露头角，开启了一段精彩纷呈的都市生活。',NULL,1,'2025-07-21 14:30:00','2025-07-22 18:45:04','陈凡本是一名成绩平平的高中生，在一次意外中，他的手机被一道神秘的闪电击中，从此手机中多了一个未来科技系统。这个系统可以为他提供各种超前的学习资料、技能培训和科技知识。陈凡如获至宝，开始疯狂地学习。他利用系统的学习功能，快速掌握了各种高深的知识，无论是数理化还是文史哲，都达到了顶尖水平。在学校的考试中，他的成绩一路飙升，从班级倒数一跃成为年级第一，震惊了所有老师和同学。随着知识的增长，陈凡开始利用系统提供的科技知识，进行一些小发明小创造。他发明的智能垃圾分类器、高效太阳能充电器等产品，不仅获得了国家专利，还得到了众多企业的青睐。他创办了自己的科技公司，短短几年时间，就成为了都市中新晋的科技巨头。在这个过程中，他也遇到了各种各样的人和事，有真诚的朋友，有阴险的对手，有美丽的邂逅。陈凡凭借着自己的智慧和系统的帮助，一一化解危机，最终成为了都市中最耀眼的新星。','都市 言情'),(4,8,'《仙侠问道》','平凡少年为寻找失踪的父母，踏入仙门，开始了漫长的修仙之路。在这个过程中，他见识了修仙界的尔虞我诈、奇珍异兽和逆天功法，不断突破自我，探寻大道真谛，最终揭开父母失踪的真相，并成为一代仙侠巨擘。',NULL,0,'2025-07-22 09:15:00','2025-07-22 16:38:23','李逍遥生活在一个宁静的小山村，父母在他年幼时便离奇失踪，只留下他一个人孤苦伶仃地生活。为了寻找父母的下落，李逍遥听说修仙者能够翻江倒海、洞察天机，于是他毅然决定踏上修仙之路。他历经千辛万苦，终于拜入了一个二流仙门。在仙门中，他努力修炼，从最基础的引气入体开始，一步步提升自己的修为。修仙界的生活并非一帆风顺，门派之间的争斗、同门之间的竞争、妖兽的威胁无处不在。李逍遥凭借着自己的坚韧和努力，一次次在绝境中逢生，获得了许多奇遇。他得到了上古修仙者的传承，获得了强大的法宝和功法，结识了许多志同道合的伙伴。随着修为的不断提升，李逍遥逐渐发现，父母的失踪似乎与一个古老的修仙秘闻有关。为了探寻真相，他不得不离开仙门，独自踏上冒险之旅。在这个过程中，他遇到了各种各样的修仙者，有正人君子，也有邪魔歪道。他与邪恶势力展开了殊死搏斗，保护了无辜的百姓，也逐渐揭开了修仙界隐藏的惊天秘密。最终，李逍遥不仅找到了父母，还成为了一代仙侠巨擘，守护着修仙界的和平与安宁。','玄幻 男生'),(5,8,'《红楼梦》','金贵世家的起落',NULL,1,'2025-07-24 15:53:41','2025-07-24 15:53:41','贾宝玉本身天上珠玉......','言情'),(6,1,'星河旅人','在银河系中穿梭的孤独旅者，寻找失落的文明。','https://example.com/covers/1.jpg',1,'2025-07-24 15:56:01','2025-07-24 15:56:01','故事发生在公元3089年……','科幻,冒险'),(7,2,'末日余生','世界毁灭后，幸存者的挣扎与重建之路。',NULL,0,'2025-07-24 15:56:01','2025-07-24 15:56:01','灰烬中，他缓缓睁开了眼睛……','末日,生存'),(8,3,'桃花源秘境','一位少女在深山中发现了隐藏的古代文明。','https://example.com/covers/3.png',1,'2025-07-24 15:56:01','2025-07-24 15:56:01','她沿着溪流走入了一个未知的世界……','玄幻,历史');
/*!40000 ALTER TABLE `novels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password_hash` varchar(128) NOT NULL COMMENT '密码哈希值',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(64) DEFAULT '' COMMENT '昵称',
  `avatar_url` varchar(255) DEFAULT '' COMMENT '头像URL',
  `status` tinyint unsigned DEFAULT '2' COMMENT '用户状态',
  `role` tinyint unsigned DEFAULT '0' COMMENT '用户角色',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `last_login_at` datetime DEFAULT NULL COMMENT '最后登录时间',
  `phone_verified` tinyint(1) DEFAULT '0' COMMENT '手机号验证状态',
  `remark` varchar(255) DEFAULT '' COMMENT '备注信息',
  `birthday` date DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `mailbox` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`),
  KEY `idx_username` (`username`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'12','$2b$12$2wKZk5/c/MLEqce8dQ2ROeLkmHPDMftah1Tuv19ZC4O.PnYNFwcK6',NULL,'','',1,1,'2025-07-18 23:09:34','2025-07-24 16:26:04','2025-07-24 08:26:05',0,'',NULL,NULL,NULL),(2,'123','$2b$12$FonavjCNIFN/0BD3u6IHhOCH176KXFXQRQEdct7HZGOlZs7WU2q.G',NULL,'','',2,0,'2025-07-18 23:10:57','2025-07-18 23:10:57',NULL,0,'',NULL,NULL,NULL),(3,'4','$2b$12$NNEK7wEtgdiaPeOgsJpY2.I/KGHtJG3r5V0rODjCEbY5hWgSakV5i',NULL,'','',2,0,'2025-07-18 23:11:18','2025-07-18 23:11:18',NULL,0,'',NULL,NULL,NULL),(4,'5','$2b$12$eZ5KzAMHgK4Zs/yby2K7OOvN2byQ2gN6bhjOvsRWd5AT90bFEe3Im','string','','',1,0,'2025-07-19 10:54:09','2025-07-19 10:54:31','2025-07-19 02:54:32',0,'',NULL,NULL,NULL),(5,'121','$2b$12$h/oQOkyzLJ08fQzCa2DMs.KqUGgeVTAztl8VtgvuvnxFfvR0z2HBu',NULL,'','',1,0,'2025-07-19 10:56:40','2025-07-19 11:06:50','2025-07-19 03:06:51',0,'',NULL,NULL,NULL),(6,'1234','$2b$12$Nn1YYoF9XNBjVMaZIJBMs.27I/0wfSPzgz5RtKcz28niB4xL5NvKq',NULL,'','',0,0,'2025-07-19 11:06:59','2025-07-19 11:06:59',NULL,0,'',NULL,NULL,NULL),(7,'12345','$2b$12$dqpctZiIrcgWjUB7PJ6Bou/8ZmsV38RJlyQ70FYqjIwRq61fO2RAi',NULL,'','',1,0,'2025-07-19 11:07:33','2025-07-19 11:07:38','2025-07-19 03:07:39',0,'',NULL,NULL,NULL),(8,'123456','$2b$12$lX7aRTwsI.wdRYrXHtAy0O.5m.7vy3ohAWqTCx3KNAIvU7wvgBf9y',NULL,'','',1,0,'2025-07-19 11:13:06','2025-07-19 11:15:17','2025-07-19 03:15:17',0,'',NULL,NULL,NULL),(9,'6','$2b$12$.BtF2U8.hELLh3ha/wy46ORM5Mjm8A9R0CH4Af7tJSi1Ady1aplTe','1','','',0,0,'2025-07-21 18:53:54','2025-07-21 18:53:54',NULL,0,'',NULL,'male',''),(10,'7','$2b$12$OBeDMze1qHiA9w6FnXBe0OeJugJBqzvh.gN0nfgj8LWqquE33Oe7q',NULL,'','',0,0,'2025-07-21 18:54:10','2025-07-21 18:54:10',NULL,0,'',NULL,'male',''),(11,'8','$2b$12$ez1PFSOiqC/5r9AKBzyut.ifsUcT0GzqBq76fbrTA.r7ILzlLnWPO','123456789',NULL,'/img/userProfile.c9350d7d.jpg',1,0,'2025-07-21 19:02:37','2025-07-23 19:58:44','2025-07-23 11:58:44',0,NULL,'2005-01-29','female','1234@qq.com'),(12,'9','$2b$12$8223BJorU8ZpUqABDXEuTuUDDB56GonggUSP2QcoDORtGQolEK1pu',NULL,'','',0,0,'2025-07-21 21:33:12','2025-07-21 21:33:12',NULL,0,'',NULL,'male',''),(13,'0','$2b$12$GcZauVgzDGbA7JNnfFbQ7OHITuboljlx/5Stnz9nrrrybsKnl0QT.',NULL,'','',1,0,'2025-07-21 21:34:22','2025-07-21 21:36:54','2025-07-21 13:36:55',0,'',NULL,'male',''),(16,'4399','$2b$12$NeA2vu3h.fSO4fvX8umd4Orsj0qtzwrNhHUlDnFNfxQhxKKRQ/dvq','18812345678','','',0,0,'2025-07-22 23:09:05','2025-07-22 23:09:05',NULL,0,'',NULL,'male',''),(17,'1234567','$2b$12$gU5qq2Rz4E7r8nOqVOkcbeZlHxRUQ9R41eVQpd.G/PzjSWoq5cO.a','19708246637','','http://localhost:8000/static/avatars/avatar_dac2a83d-6899-4af0-b9a2-2a61f241d06f.png',1,0,'2025-07-23 13:24:22','2025-07-24 18:50:55','2025-07-24 10:50:55',0,'','2004-12-16','female','1234@qq.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-24 22:59:55
