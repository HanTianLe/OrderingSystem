-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ordering_system
-- ------------------------------------------------------
-- Server version	8.0.16


SET NAMES utf8mb4 ;
--
-- 创表 `t_admin` 并且赋值。（1）
--
DROP TABLE IF EXISTS `t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(11) DEFAULT NULL,
  `password` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


LOCK TABLES `t_admin` WRITE;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
INSERT INTO `t_admin` VALUES (1,'admin1','123123');
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;
UNLOCK TABLES;


--
-- 创表 `t_type` 并且赋值。（2）
--
DROP TABLE IF EXISTS `t_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


LOCK TABLES `t_type` WRITE;
/*!40000 ALTER TABLE `t_type` DISABLE KEYS */;
INSERT INTO `t_type` VALUES (1,'热菜'),(2,'凉菜'),(3,'汤羹'),(4,'主食'),(5,'烘焙');
/*!40000 ALTER TABLE `t_type` ENABLE KEYS */;
UNLOCK TABLES;


--
-- 创表 `t_user` 并且赋值。（3）
--
DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(11) DEFAULT NULL,
  `password` varchar(11) DEFAULT NULL,
  `nickname` varchar(11) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `registerdate` date DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'zs','123123','张三','男','13576765678','2019-02-03','科技路'),(2,'ls','123123','李四','女','18678987676','2019-02-03','科技路'),(6,'htl','123123','韩天乐','男','18351496467','2020-03-21','淮阴市'),(7,'htx','123123','韩天喜','男','11559914875','2020-03-20','淮阴市'),(8,'htq','123123','韩天琪','男','15947864256','2020-03-19','涟水县'),(9,'dfbb','321123','东方不败 ','女','10874151571','2020-03-01','黑木崖'),(13,'lhc','123123','令狐冲','男','15646414521','2020-03-21','西岳华山'),(15,'zwj','123123','张无忌','男','15632145666','2020-03-21','武当山'),(16,'zm','123123','赵敏','女','15642664664','2020-03-21','蒙古'),(18,'ryy','123123','任盈盈','女','13365478954','2020-03-22','日月神教'),(20,'ycz','123123','袁承志','男','13332654654','2020-03-22','华山'),(21,'znc','123123','左冷禅','男','15649854595','2020-03-22','嵩山');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;


--
-- 创表 `t_menu` 并且赋值。 （4）
--
DROP TABLE IF EXISTS `t_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `flavor` varchar(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  CONSTRAINT `t_menu_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `t_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;


LOCK TABLES `t_menu` WRITE;
/*!40000 ALTER TABLE `t_menu` DISABLE KEYS */;
INSERT INTO `t_menu` VALUES (1,'香酥鸡',39,'五香',1),(2,'烧椒扣肉',46,'微辣',1),(3,'栗子三杯鸡',56,'五香',1),(4,'毛血旺',50,'麻辣',1),(5,'菠菜拌粉丝',22,'五香',2),(6,'凉拌豆腐皮',19,'微辣',2),(7,'酱牛肉',36,'麻辣',2),(8,'鱼头豆腐汤',32,'五香',3),(9,'瘦肉鸡蛋白菜汤',30,'五香',3),(10,'西葫芦虾仁蒸饺',26,'五香',4),(11,'蛋炒饭',18,'五香',4),(12,'酥粒椰蓉面包',12,'香甜',5),(29,'宫保鸡丁',30,'香甜',1),(37,'麻辣烫',15,'微辣',1),(38,'佛跳墙',200,'微辣',1),(39,'猜测1',30,'呵呵',3),(43,'测试2',50,'麻辣',4),(44,'测试3',10,'香甜',5);
/*!40000 ALTER TABLE `t_menu` ENABLE KEYS */;
UNLOCK TABLES;



--
-- 创表 `t_order` 并且赋值。（5）
--
DROP TABLE IF EXISTS `t_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`),
  KEY `aid` (`aid`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `t_menu` (`id`),
  CONSTRAINT `t_order_ibfk_3` FOREIGN KEY (`aid`) REFERENCES `t_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;


LOCK TABLES `t_order` WRITE;
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
INSERT INTO `t_order` VALUES (1,1,7,1,'2019-02-06',1),(2,1,2,1,'2019-02-06',1),(5,1,5,1,'2019-02-06',1),(6,1,9,1,'2019-02-06',1),(10,1,10,1,'2019-02-06',1),(11,1,10,NULL,'2019-02-06',0),(12,1,10,1,'2019-02-06',1),(14,1,6,1,'2019-02-06',1),(16,1,10,1,'2019-02-06',1),(19,1,7,1,'2019-02-07',1),(26,2,8,NULL,'2019-02-08',1),(27,2,12,NULL,'2019-02-08',0),(29,6,38,NULL,'2020-03-22',0),(30,6,1,NULL,'2020-03-22',0),(31,6,29,NULL,'2020-03-22',1);
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;
UNLOCK TABLES;


