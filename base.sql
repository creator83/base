-- MySQL dump 10.13  Distrib 5.7.18, for Win32 (AMD64)
--
-- Host: localhost    Database: workspace
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nDate` date DEFAULT NULL,
  `sureName` char(20) NOT NULL,
  `executor` char(20) NOT NULL,
  `subexecutor` char(20) NOT NULL,
  `description` char(100) NOT NULL DEFAULT '',
  `filePlace` char(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ixPerson` (`sureName`),
  KEY `ixExecutor` (`executor`),
  KEY `ixSubExecutor` (`subexecutor`),
  KEY `ixdate` (`nDate`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`sureName`) REFERENCES `person` (`sureName`),
  CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`executor`) REFERENCES `chiefs` (`sureName`),
  CONSTRAINT `answers_ibfk_3` FOREIGN KEY (`subexecutor`) REFERENCES `chiefs` (`sureName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chiefs`
--

DROP TABLE IF EXISTS `chiefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chiefs` (
  `sureName` char(20) NOT NULL,
  `firstName` char(20) NOT NULL,
  `midleName` char(20) NOT NULL,
  `position` char(100) NOT NULL,
  `workDistrict` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sureName`),
  KEY `ixworkDist` (`workDistrict`),
  CONSTRAINT `chiefs_ibfk_1` FOREIGN KEY (`workDistrict`) REFERENCES `distpos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chiefs`
--

LOCK TABLES `chiefs` WRITE;
/*!40000 ALTER TABLE `chiefs` DISABLE KEYS */;
INSERT INTO `chiefs` VALUES ('Дяченко','Игорь','Алексеевич','Глава администрации муниципального образования город Новороссийск',4),('Кошелев','Виталий','Сергеевич','Главный специалист',4),('Оганесян','Игорь','Лерникович','Начальник управления',4),('Служалый','Александр','Владимирович','Заместитель главы муниципального образования город Новороссийск',4),('Чумак','Василий','Иванович','Глава администрации Новороссийского района',4);
/*!40000 ALTER TABLE `chiefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distpos`
--

DROP TABLE IF EXISTS `distpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distpos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distpos`
--

LOCK TABLES `distpos` WRITE;
/*!40000 ALTER TABLE `distpos` DISABLE KEYS */;
INSERT INTO `distpos` VALUES (3,'Администрация Краснодарского края'),(4,'Администрация муниципального образования город Новороссийск');
/*!40000 ALTER TABLE `distpos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `name` char(20) NOT NULL,
  `prfx` enum('','г.','с.','х.','п.','ст.') NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES ('Абрау-Дюрсо','с.'),('Большие Хутора','с.'),('Борисовка','с.'),('Васильевка','с.'),('Владимировка','с.'),('Восточный район',''),('Гайдук','с.'),('Глебовское','с.'),('Камчатка','х.'),('Кирилловка','с.'),('Мысхако','с.'),('Натухаевская','ст.'),('Новороссийск','г.'),('Приморский район',''),('Раевская','ст.'),('Северная Озереевка','с.'),('Семигорский','х.'),('Убых','х.'),('Цемдолина','с.'),('Центральный район',''),('Южная Озереевка','с.'),('Южный район','');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district2`
--

DROP TABLE IF EXISTS `district2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district2` (
  `name` char(15) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district2`
--

LOCK TABLES `district2` WRITE;
/*!40000 ALTER TABLE `district2` DISABLE KEYS */;
INSERT INTO `district2` VALUES ('Восточный'),('Новороссийский'),('Приморский'),('Центральный'),('Южный');
/*!40000 ALTER TABLE `district2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letters`
--

DROP TABLE IF EXISTS `letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nDate` date DEFAULT NULL,
  `typeLetter` enum('обращение','служебная записка','инициативное письмо','для сводного ответа','поручения') NOT NULL,
  `sureNameP` char(20) NOT NULL DEFAULT '',
  `toChiefs` char(20) NOT NULL DEFAULT '',
  `executor` char(20) NOT NULL,
  `subexecutor` char(20) NOT NULL,
  `description` char(100) NOT NULL DEFAULT '',
  `filePlace` char(100) NOT NULL,
  `toStrategy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ixPerson` (`sureNameP`),
  KEY `ixChiefs` (`toChiefs`),
  KEY `ixExecutor` (`executor`),
  KEY `ixSubExecutor` (`subexecutor`),
  KEY `ixdate` (`nDate`),
  CONSTRAINT `letters_ibfk_1` FOREIGN KEY (`sureNameP`) REFERENCES `person` (`sureName`),
  CONSTRAINT `letters_ibfk_2` FOREIGN KEY (`toChiefs`) REFERENCES `chiefs` (`sureName`),
  CONSTRAINT `letters_ibfk_3` FOREIGN KEY (`executor`) REFERENCES `chiefs` (`sureName`),
  CONSTRAINT `letters_ibfk_4` FOREIGN KEY (`subexecutor`) REFERENCES `chiefs` (`sureName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letters`
--

LOCK TABLES `letters` WRITE;
/*!40000 ALTER TABLE `letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letters2`
--

DROP TABLE IF EXISTS `letters2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letters2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nDate` date DEFAULT NULL,
  `typeLetter` enum('служебная записка','инициативное письмо','для сводного ответа','поручения') NOT NULL,
  `toChiefs` char(20) NOT NULL,
  `executor` char(20) NOT NULL,
  `subexecutor` char(20) NOT NULL,
  `description` char(100) NOT NULL DEFAULT '',
  `filePlace` char(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ixChiefs` (`toChiefs`),
  KEY `ixExecutor` (`executor`),
  KEY `ixSubExecutor` (`subexecutor`),
  KEY `ixdate` (`nDate`),
  CONSTRAINT `letters2_ibfk_1` FOREIGN KEY (`toChiefs`) REFERENCES `chiefs` (`sureName`),
  CONSTRAINT `letters2_ibfk_2` FOREIGN KEY (`executor`) REFERENCES `chiefs` (`sureName`),
  CONSTRAINT `letters2_ibfk_3` FOREIGN KEY (`subexecutor`) REFERENCES `chiefs` (`sureName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letters2`
--

LOCK TABLES `letters2` WRITE;
/*!40000 ALTER TABLE `letters2` DISABLE KEYS */;
/*!40000 ALTER TABLE `letters2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `street` int(10) unsigned NOT NULL,
  `summ` double DEFAULT NULL,
  `importance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` char(100) NOT NULL,
  `done` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `district` char(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ixstreet` (`street`),
  KEY `ixDistrict` (`district`),
  CONSTRAINT `objects_ibfk_1` FOREIGN KEY (`street`) REFERENCES `street` (`id`),
  CONSTRAINT `objects_ibfk_2` FOREIGN KEY (`district`) REFERENCES `district2` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,19,NULL,0,'Устройство коллектора по ул. Чапаева, ул. Славянской',0,'Новороссийский'),(2,24,1135,0,'Устройство ливнеотведения по ул. Фабричной (от ул. Заречной до р. Старый Цемес)',0,'Новороссийский'),(3,22,660,0,'Устройство ливнеотведения по ул. Майская)',0,'Новороссийский'),(4,21,2675.47,0,'Рекострукция бетонных лотков по ул. Ленина(нечётная сторона))',0,'Новороссийский'),(5,25,NULL,0,'Устройство водоперепускной трубы на пересечении ул. Калинина, ул. Лесной',0,'Новороссийский'),(6,26,NULL,0,'Устройство водоперепускной трубы по ул. Чехова',0,'Новороссийский'),(7,27,NULL,0,'Устройство водоперепускной трубы по ул. Морстроевской',0,'Новороссийский'),(8,16,NULL,0,'Устройство ливнеотведения по ул. Школьной (от Фабричной до р. Старый Цемес)',0,'Новороссийский'),(9,28,878.965,0,'Устройство бетонных лотков по ул. Чкалова (от ул. Гоголя до ул. Заречной))',0,'Новороссийский'),(10,29,NULL,0,'Устройство участка ливнеотведения от ул. Кубанской до ул. Молодёжной )',0,'Новороссийский'),(11,30,NULL,0,'Устройство участка ливнеотведения по ул. Островского )',0,'Новороссийский'),(12,31,NULL,0,'Устройство водоперепускной трубы в районе пересечения с ул. Коммунистической)',0,'Новороссийский'),(13,23,NULL,0,'Устройство водоперепускной трубы в районе пересечения с ул. Коммунистической)',0,'Новороссийский'),(14,32,3509.34,0,'Расчистка ручья',0,'Новороссийский'),(15,33,NULL,0,'Устройство ливнеотведения по ул. Героев Моряков(материал Приморского района)',0,'Новороссийский'),(16,34,390.9,0,'Устройство участка ливнеотведения по ул. Малахитовой',0,'Новороссийский'),(17,35,NULL,0,'Устройство ливнеотведения по ул. Алмазной',0,'Новороссийский'),(18,36,326.83,0,'Устройство ливнеотведения по ул. грибоедова',0,'Новороссийский'),(19,37,972.85,0,'Устройство ливнеотведения по ул. Колхозной',0,'Новороссийский'),(20,38,689.83,0,'Устройство ливнеотведения по ул. Юбилейной',0,'Новороссийский'),(21,25,NULL,0,'Устройство водоперепускной трубы на пересечении ул. Калинина, ул. Лесной, устройство грунтовой СЛО',0,'Новороссийский');
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `sureName` char(20) NOT NULL,
  `firstName` char(20) NOT NULL,
  `midleName` char(20) NOT NULL,
  `street` int(10) unsigned DEFAULT NULL,
  `nHouse` char(10) NOT NULL,
  `nApp` char(10) DEFAULT '',
  `numPhone` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`sureName`),
  KEY `ixstreet` (`street`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`street`) REFERENCES `street` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('Балиева','Лариса','Владимировна',12,'25','','9385052589'),('Кушнарёв','Роман','Николаевич',1,'4','','9883674079');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `name` char(30) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('Амурская область'),('Архангельская область'),('Астраханская область'),('Белгородская область'),('Брянская область'),('Ивановская область'),('Калужская область'),('Краснодарский край'),('Московская область'),('Ростовская область'),('Ставропольский край');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statereg`
--

DROP TABLE IF EXISTS `statereg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statereg` (
  `name` char(20) NOT NULL,
  `region` char(30) NOT NULL,
  `prfx` enum('','г.','с.','х.','п.','ст.') NOT NULL,
  PRIMARY KEY (`name`),
  KEY `ixRegion` (`region`),
  CONSTRAINT `statereg_ibfk_1` FOREIGN KEY (`region`) REFERENCES `region` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statereg`
--

LOCK TABLES `statereg` WRITE;
/*!40000 ALTER TABLE `statereg` DISABLE KEYS */;
INSERT INTO `statereg` VALUES ('Абрау-Дюрсо','Краснодарский край','с.'),('Анапа','Краснодарский край','г.'),('Большие Хутора','Краснодарский край','с.'),('Борисовка','Краснодарский край','с.'),('Васильевка','Краснодарский край','с.'),('Верхнебаканский','Краснодарский край','п.'),('Владимировка','Краснодарский край','с.'),('Гайдук','Краснодарский край','с.'),('Глебовское','Краснодарский край','с.'),('Камчатка','Краснодарский край','х.'),('Кирилловка','Краснодарский край','с.'),('Крымск','Краснодарский край','г.'),('Мысхако','Краснодарский край','с.'),('Натухаевская','Краснодарский край','ст.'),('Новороссийск','Краснодарский край','г.'),('Раевская','Краснодарский край','ст.'),('Северная Озереевка','Краснодарский край','с.'),('Семигорский','Краснодарский край','х.'),('Убых','Краснодарский край','х.'),('Цемдолина','Краснодарский край','с.'),('Южная Озереевка','Краснодарский край','с.');
/*!40000 ALTER TABLE `statereg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `street`
--

DROP TABLE IF EXISTS `street`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `street` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL,
  `stateReg` char(50) NOT NULL,
  `prfxStreet` enum('ул.','проезд','пр-т.','пер.') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ixState` (`stateReg`),
  KEY `ixName` (`name`),
  CONSTRAINT `street_ibfk_1` FOREIGN KEY (`stateReg`) REFERENCES `statereg` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `street`
--

LOCK TABLES `street` WRITE;
/*!40000 ALTER TABLE `street` DISABLE KEYS */;
INSERT INTO `street` VALUES (1,'Зелёная','Натухаевская','ул.'),(2,'Зелёная','Мысхако','ул.'),(3,'8-я Гвардейская','Мысхако','ул.'),(4,'8-я Щель','Цемдолина','ул.'),(5,'Комарова','Крымск','ул.'),(6,'Атлетическая','Цемдолина','ул.'),(7,'Ленина','Новороссийск','пр-т.'),(8,'Мысхакское шоссе','Новороссийск','ул.'),(9,'Изумрудная','Мысхако','ул.'),(10,'Волгоградская','Новороссийск','ул.'),(11,'Видова','Новороссийск','ул.'),(12,'Шоссейная','Натухаевская','ул.'),(13,'Адмирала Угрюмова','Мысхако','ул.'),(14,'Красная','Натухаевская','ул.'),(15,'Конституции','Новороссийск','ул.'),(16,'Школьная','Цемдолина','ул.'),(17,'Новороссийское шоссе','Гайдук','ул.'),(18,'Ясеневая','Мысхако','ул.'),(19,'Чапаева','Борисовка','ул.'),(20,'Славянская','Борисовка','ул.'),(21,'Ленина','Гайдук','ул.'),(22,'Майская','Большие Хутора','ул.'),(23,'Солнечная','Семигорский','ул.'),(24,'Фабричная','Цемдолина','ул.'),(25,'Калинина','Натухаевская','ул.'),(26,'Чехова','Абрау-Дюрсо','ул.'),(27,'Морстроевская','Абрау-Дюрсо','ул.'),(28,'Чкалова','Цемдолина','ул.'),(29,'Центральная','Цемдолина','ул.'),(30,'Островского','Верхнебаканский','ул.'),(31,'Ленина','Верхнебаканский','ул.'),(32,'Центральная','Семигорский','ул.'),(33,'Героев Моряков','Борисовка','ул.'),(34,'Малахитовая','Борисовка','ул.'),(35,'Алмазная','Борисовка','ул.'),(36,'Грибоедова','Раевская','ул.'),(37,'Колхозная','Раевская','ул.'),(38,'Юбилейная','Верхнебаканский','ул.');
/*!40000 ALTER TABLE `street` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tu`
--

DROP TABLE IF EXISTS `tu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tu` (
  `nDate` date DEFAULT NULL,
  `firstName` char(20) NOT NULL,
  `midleName` char(20) NOT NULL,
  `sureName` char(20) NOT NULL,
  `numHouse` char(10) NOT NULL,
  `numAp` char(5) NOT NULL,
  `numPhone` char(10) NOT NULL,
  `reg` char(20) DEFAULT NULL,
  `address` char(50) NOT NULL DEFAULT '',
  `numKadastr` char(11) NOT NULL,
  `filePlace` char(100) DEFAULT NULL,
  `typeTu` enum('с проектом','без проекта') NOT NULL,
  `street` int(10) unsigned NOT NULL,
  KEY `ixReg` (`reg`),
  KEY `ixstreet` (`street`),
  CONSTRAINT `tu_ibfk_2` FOREIGN KEY (`reg`) REFERENCES `district` (`name`),
  CONSTRAINT `tu_ibfk_3` FOREIGN KEY (`street`) REFERENCES `street` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tu`
--

LOCK TABLES `tu` WRITE;
/*!40000 ALTER TABLE `tu` DISABLE KEYS */;
INSERT INTO `tu` VALUES ('2017-06-26','Татьяна','Дмитриевна','Гунина','39','','9183867439','Семигорский','х. Семигорский','01040071734','d:\\Технические условия\\Семигорский\\Гунина_26_6_2017.docx','с проектом',9),('2017-06-26','Кристина','Юрьевна','Мовчан','18','45','9384834754','Кирилловка','район ул. Красная','0107010709','d:\\Технические условия\\Кирилловка\\Мовчан_26_6_2017.docx','с проектом',10),('2017-06-26','Кристина','Игоревна','Байрамова','71','39','9183195405','Васильевка','','01170492210','d:\\Технические условия\\Васильевка\\Байрамова_26_6_2017.docx','без проекта',8),('2017-06-23','Елизавета','Валерьевна','Полищук','31','79','9189195405','Новороссийск','ул.Понтийская','01180552525','d:\\Технические условия\\Новороссийск\\Полищук_23_6_2017.docx','без проекта',7),('2017-06-28','Владимир','Алексеевич','Кравцов','13','','9181157944','Цемдолина','ул. Атлетическая, 10','0118056102','d:\\Технические условия\\Цемдолина\\Кравцов_28_6_2017.docx','без проекта',6),('2017-07-11','Инна','Фёдоровна','Чуприна','13','','9183680777','Цемдолина','ул. 8-я Щель, район дома №5','01100015006','d:\\Технические условия\\Цемдолина\\Чуприна_11_7_2017.docx','без проекта',5),('2017-07-12','Константин','Викторович','Гриневич','40а','','9282824992','Мысхако','ул. 8-я Гвардейская, 40а','01180181050','d:\\Технические условия\\Мысхако\\Гриневич_12_7_2017.docx','без проекта',3),('2017-07-17','Татьяна','Владимировна','Косенко','19','','9887628488','Цемдолина','','01170160024','d:\\Технические условия\\Цемдолина\\Косенко_17_7_2017.docx','с проектом',13),('2017-07-17','Армен','Юрикович','Петросян','11','','9184852020','Борисовка','','01170182824','d:\\Технические условия\\Борисовка\\Петросян_17_7_2017.docx','без проекта',15);
/*!40000 ALTER TABLE `tu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-21 17:07:14