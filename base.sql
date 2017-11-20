-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: workbase
-- ------------------------------------------------------
-- Server version	5.7.19

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
  `filePlace` char(100) NOT NULL,
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
  `workDistrict` int(10) unsigned NOT NULL,
  `position` char(100) DEFAULT NULL,
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
INSERT INTO `chiefs` VALUES ('Алексеенко','Андрей','Анатольевич',3,'Заместитель главы (губернатора) Краснодарского края'),('Дяченко','Игорь','Алексеевич',4,'Глава администрации муниципального образования город Новороссийск'),('Колпакиди','Иван','Георгиевич',4,'Заместитель начальника МКУ \"Управление гидротехнических сооружений и систем ливнеотведения\"'),('Котляр','Ольга','Игоревна',4,'Начальник отдела по делам молодёжи'),('Кошелев','Виталий','Сергеевич',4,'Главный специалист МКУ \"Управление гидротехнических сооружений и систем ливнеотведения'),('Оганесян','Игорь','Лерникович',4,'Начальник управления МКУ \"Управление гидротехнических сооружений и систем ливнеотведения\"'),('Панченко','Ирина','Владимировна',4,'Начальник отдела экологической безопасности'),('Пужанский','Олег','Валерьевич',4,'Главный специалист МКУ \"Управление гидротехнических сооружений и систем ливнеотведения\"'),('Служалый','Александр','Владимирович',4,'Заместитель главы муниципального образования город Новороссийск'),('Чумак','Василий','Иванович',4,'Глава администрации Новороссийского района');
/*!40000 ALTER TABLE `chiefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractor`
--

DROP TABLE IF EXISTS `contractor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contragent` int(10) unsigned NOT NULL,
  `contract` int(10) unsigned NOT NULL,
  `district` char(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ixDistrict` (`district`),
  KEY `ixContragent` (`contragent`),
  CONSTRAINT `contractor_ibfk_1` FOREIGN KEY (`district`) REFERENCES `district2` (`name`),
  CONSTRAINT `contractor_ibfk_2` FOREIGN KEY (`contragent`) REFERENCES `contragent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractor`
--

LOCK TABLES `contractor` WRITE;
/*!40000 ALTER TABLE `contractor` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contragent`
--

DROP TABLE IF EXISTS `contragent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contragent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(100) CHARACTER SET utf8 NOT NULL,
  `sureName` char(20) CHARACTER SET utf8 NOT NULL,
  `firstName` char(20) CHARACTER SET utf8 NOT NULL,
  `midleName` char(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contragent`
--

LOCK TABLES `contragent` WRITE;
/*!40000 ALTER TABLE `contragent` DISABLE KEYS */;
INSERT INTO `contragent` VALUES (1,'ООО \"Аверс\"','Носик','Виктор','Алексеевич'),(2,'ООО \"Астон-М\"','Лиш','Андрей','Николаевич');
/*!40000 ALTER TABLE `contragent` ENABLE KEYS */;
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
-- Table structure for table `groupanswers`
--

DROP TABLE IF EXISTS `groupanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupanswers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nDate` date DEFAULT NULL,
  `sureName` char(20) NOT NULL,
  `fromChief` char(20) NOT NULL,
  `toChief` char(20) NOT NULL,
  `description` char(100) NOT NULL DEFAULT '',
  `filePlace` char(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ixPerson` (`sureName`),
  KEY `ixFromChief` (`fromChief`),
  KEY `ixToChief` (`toChief`),
  KEY `ixdate` (`nDate`),
  CONSTRAINT `groupanswers_ibfk_1` FOREIGN KEY (`sureName`) REFERENCES `person` (`sureName`),
  CONSTRAINT `groupanswers_ibfk_2` FOREIGN KEY (`fromChief`) REFERENCES `chiefs` (`sureName`),
  CONSTRAINT `groupanswers_ibfk_3` FOREIGN KEY (`toChief`) REFERENCES `chiefs` (`sureName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupanswers`
--

LOCK TABLES `groupanswers` WRITE;
/*!40000 ALTER TABLE `groupanswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(150) NOT NULL,
  `rascenka` char(20) NOT NULL,
  `mesure` char(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ixMesure` (`mesure`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`mesure`) REFERENCES `mesure` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (15,'Очистка камер: от мокрого ила и грязи без труб и арматуры','ТЕРр66-10-6','1м3'),(16,'Погрузочные работы при автомобильных перевозках: мусора строительного с погрузкой экскаваторами ёмкостью ковша до 0,5 м3','ТССЦпг01-01-01-043','1т'),(17,'Перевозка грузов автомобилями-самосвалами грузоподъёмностью 10т, работающих вне карьера, на расстояние: до 14 км I класс грунтов','ТССЦпг03-21-01-014','1т'),(18,'Промывка спецмашинами \"Скания\" и \"SISU\" канализационных трубопроводов диаметром: 300мм','ТЕРр66-43-2','100м'),(19,'Промывка спецмашинами \"Скания\" и \"SISU\" канализационных трубопроводов диаметром: 400мм','ТЕРр66-43-3','100м'),(20,'Промывка спецмашинами \"Скания\" и \"SISU\" канализационных трубопроводов диаметром: 500мм','ТЕРр66-43-4','100м'),(21,'Установка металлических решёток приямков','ТЕР08-02-007-03','1т');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
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
-- Table structure for table `mesure`
--

DROP TABLE IF EXISTS `mesure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesure` (
  `name` char(10) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesure`
--

LOCK TABLES `mesure` WRITE;
/*!40000 ALTER TABLE `mesure` DISABLE KEYS */;
INSERT INTO `mesure` VALUES ('100м'),('1м3'),('1т');
/*!40000 ALTER TABLE `mesure` ENABLE KEYS */;
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
  `dateStart` date DEFAULT NULL,
  `dateFinish` date DEFAULT NULL,
  `strategy` year(4) DEFAULT NULL,
  `defect` char(100) DEFAULT NULL,
  `smeta` char(100) DEFAULT NULL,
  `scheme` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ixstreet` (`street`),
  KEY `ixDistrict` (`district`),
  CONSTRAINT `objects_ibfk_1` FOREIGN KEY (`street`) REFERENCES `street` (`id`),
  CONSTRAINT `objects_ibfk_2` FOREIGN KEY (`district`) REFERENCES `district2` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,19,NULL,0,'Устройство коллектора по ул. Чапаева, ул. Славянской',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(2,24,1135,0,'Устройство ливнеотведения по ул. Фабричной (от ул. Заречной до р. Старый Цемес)',0,'Приморский',NULL,NULL,2018,NULL,NULL,NULL),(3,22,660,0,'Устройство ливнеотведения по ул. Майская)',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(4,21,2675.47,0,'Рекострукция бетонных лотков по ул. Ленина(нечётная сторона))',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(5,25,NULL,0,'Устройство водоперепускной трубы на пересечении ул. Калинина, ул. Лесной',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(6,26,NULL,0,'Устройство водоперепускной трубы по ул. Чехова',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(7,27,NULL,0,'Устройство водоперепускной трубы по ул. Морстроевской',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(8,16,NULL,0,'Устройство ливнеотведения по ул. Школьной (от Фабричной до р. Старый Цемес)',0,'Приморский',NULL,NULL,NULL,NULL,NULL,NULL),(9,28,878.965,0,'Устройство бетонных лотков по ул. Чкалова (от ул. Гоголя до ул. Заречной))',0,'Приморский',NULL,NULL,NULL,NULL,NULL,NULL),(10,29,NULL,0,'Устройство участка ливнеотведения от ул. Кубанской до ул. Молодёжной )',0,'Приморский',NULL,NULL,NULL,NULL,NULL,NULL),(11,30,NULL,0,'Устройство участка ливнеотведения по ул. Островского )',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(12,31,NULL,0,'Устройство водоперепускной трубы в районе пересечения с ул. Коммунистической)',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(13,23,NULL,0,'Устройство водоперепускной трубы в районе пересечения с ул. Коммунистической)',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(14,32,3509.34,0,'Расчистка ручья',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(15,33,NULL,0,'Устройство ливнеотведения по ул. Героев Моряков(материал Приморского района)',0,'Приморский',NULL,NULL,NULL,NULL,NULL,NULL),(16,34,390.9,0,'Устройство участка ливнеотведения по ул. Малахитовой',0,'Приморский',NULL,NULL,NULL,NULL,NULL,NULL),(17,35,NULL,0,'Устройство ливнеотведения по ул. Алмазной',0,'Приморский',NULL,NULL,NULL,NULL,NULL,NULL),(18,36,326.83,0,'Устройство ливнеотведения по ул. грибоедова',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(19,37,972.85,0,'Устройство ливнеотведения по ул. Колхозной',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(20,38,689.83,0,'Устройство ливнеотведения по ул. Юбилейной',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(21,25,NULL,0,'Устройство водоперепускной трубы на пересечении ул. Калинина, ул. Лесной, устройство грунтовой СЛО',0,'Новороссийский',NULL,NULL,NULL,NULL,NULL,NULL),(22,49,1410.024,0,'Реконструкция переездов на пересечении ул. Фабричной/ул. Красина',0,'Приморский',NULL,NULL,2018,NULL,NULL,NULL),(23,24,650,0,'Реконструкция переезда в районе пересечении ул. Фабричной/ул. Гагарина',0,'Приморский',NULL,NULL,2018,NULL,NULL,NULL);
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
INSERT INTO `person` VALUES ('Балиева','Лариса','Владимировна',12,'25','','9385052589'),('Жигайлов','Виктор','Тимофеевич',43,'26','','9054778998'),('Кушнарёв','Роман','Николаевич',1,'4','','9883674079');
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
INSERT INTO `region` VALUES ('Алтайский край'),('Амурская область'),('Архангельская область'),('Астраханская область'),('Белгородская область'),('Брянская область'),('Вологодская область'),('Ивановская область'),('Калужская область'),('Краснодарский край'),('Московская область'),('Приморский край'),('Республика Саха'),('Ростовская область'),('Ставропольский край'),('Тамбовская область');
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
  `prfx` enum('г.','с.','х.','п.','ст.','д.') NOT NULL,
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
INSERT INTO `statereg` VALUES ('Абрау-Дюрсо','Краснодарский край','с.'),('Анапа','Краснодарский край','г.'),('Большие Хутора','Краснодарский край','с.'),('Борисовка','Краснодарский край','с.'),('Васильевка','Краснодарский край','с.'),('Верхнебаканский','Краснодарский край','п.'),('Владимировка','Краснодарский край','с.'),('Гайдук','Краснодарский край','с.'),('Глебовское','Краснодарский край','с.'),('Ильинка','Астраханская область','п.'),('Камчатка','Краснодарский край','х.'),('Кирилловка','Краснодарский край','с.'),('Крымск','Краснодарский край','г.'),('Мысхако','Краснодарский край','с.'),('Натухаевская','Краснодарский край','ст.'),('Новороссийск','Краснодарский край','г.'),('Раевская','Краснодарский край','ст.'),('Ростов-на-Дону','Ростовская область','г.'),('Северная Озереевка','Краснодарский край','с.'),('Семигорский','Краснодарский край','х.'),('Сочи','Краснодарский край','г.'),('Тамбов','Тамбовская область','г.'),('Убых','Краснодарский край','х.'),('Федотовка','Краснодарский край','с.'),('Цемдолина','Краснодарский край','с.'),('Чепелево','Московская область','д.'),('Череповец','Вологодская область','г.'),('Южная Озереевка','Краснодарский край','с.'),('Якутск','Республика Саха','г.');
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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `street`
--

LOCK TABLES `street` WRITE;
/*!40000 ALTER TABLE `street` DISABLE KEYS */;
INSERT INTO `street` VALUES (1,'Зелёная','Натухаевская','ул.'),(2,'Зелёная','Мысхако','ул.'),(3,'8-я Гвардейская','Мысхако','ул.'),(4,'8-я Щель','Цемдолина','ул.'),(5,'Комарова','Крымск','ул.'),(6,'Атлетическая','Цемдолина','ул.'),(7,'Ленина','Новороссийск','пр-т.'),(8,'Мысхакское шоссе','Новороссийск','ул.'),(9,'Изумрудная','Мысхако','ул.'),(10,'Волгоградская','Новороссийск','ул.'),(11,'Видова','Новороссийск','ул.'),(12,'Шоссейная','Натухаевская','ул.'),(13,'Адмирала Угрюмова','Мысхако','ул.'),(14,'Красная','Натухаевская','ул.'),(15,'Конституции','Новороссийск','ул.'),(16,'Школьная','Цемдолина','ул.'),(17,'Новороссийское шоссе','Гайдук','ул.'),(18,'Ясеневая','Мысхако','ул.'),(19,'Чапаева','Борисовка','ул.'),(20,'Славянская','Борисовка','ул.'),(21,'Ленина','Гайдук','ул.'),(22,'Майская','Большие Хутора','ул.'),(23,'Солнечная','Семигорский','ул.'),(24,'Фабричная','Цемдолина','ул.'),(25,'Калинина','Натухаевская','ул.'),(26,'Чехова','Абрау-Дюрсо','ул.'),(27,'Морстроевская','Абрау-Дюрсо','ул.'),(28,'Чкалова','Цемдолина','ул.'),(29,'Центральная','Цемдолина','ул.'),(30,'Островского','Верхнебаканский','ул.'),(31,'Ленина','Верхнебаканский','ул.'),(32,'Центральная','Семигорский','ул.'),(33,'Героев Моряков','Борисовка','ул.'),(34,'Малахитовая','Борисовка','ул.'),(35,'Алмазная','Борисовка','ул.'),(36,'Грибоедова','Раевская','ул.'),(37,'Колхозная','Раевская','ул.'),(38,'Юбилейная','Верхнебаканский','ул.'),(39,'Аркада','Борисовка','ул.'),(40,'с/т Юг','Федотовка','ул.'),(41,'Интернациональная','Гайдук','ул.'),(42,'Ленина','Цемдолина','ул.'),(43,'Шоссейная','Мысхако','ул.'),(44,'Взводная','Цемдолина','ул.'),(45,'Золотая Рыбка','Цемдолина','ул.'),(46,'Синёва','Крымск','ул.'),(47,'Дзержинского','Новороссийск','ул.'),(48,'Толстого','Новороссийск','ул.'),(49,'Красина','Цемдолина','ул.'),(50,'Анапское шоссе','Новороссийск','ул.'),(51,'Энгельса','Новороссийск','ул.'),(52,'Комсомольская','Цемдолина','ул.'),(53,'Рылеева','Тамбов','ул.'),(54,'Буровая','Ростов-на-Дону','ул.'),(55,'Школьная','Чепелево','ул.'),(56,'Батюшкова','Череповец','ул.'),(57,'Дружный','Мысхако','пер.'),(58,'Хворостянского','Новороссийск','ул.'),(59,'Парковая','Цемдолина','ул.'),(60,'Красная','Кирилловка','ул.'),(61,'Полевая','Ильинка','ул.'),(62,'мкр. 202','Якутск','ул.'),(63,'Заречная','Глебовское','ул.'),(64,'Заречная','Мысхако','ул.'),(65,'Батумское','Сочи','ул.'),(66,'Пионерская','Новороссийск','ул.'),(67,'Братский','Глебовское','пер.');
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
INSERT INTO `tu` VALUES ('2017-06-26','Татьяна','Дмитриевна','Гунина','39','','9183867439','Семигорский','х. Семигорский','01040071734','d:\\Технические условия\\Семигорский\\Гунина_26_6_2017.docx','с проектом',9),('2017-06-26','Кристина','Юрьевна','Мовчан','18','45','9384834754','Кирилловка','район ул. Красная','0107010709','d:\\Технические условия\\Кирилловка\\Мовчан_26_6_2017.docx','с проектом',10),('2017-06-26','Кристина','Игоревна','Байрамова','71','39','9183195405','Васильевка','','01170492210','d:\\Технические условия\\Васильевка\\Байрамова_26_6_2017.docx','без проекта',8),('2017-06-23','Елизавета','Валерьевна','Полищук','31','79','9189195405','Новороссийск','ул.Понтийская','01180552525','d:\\Технические условия\\Новороссийск\\Полищук_23_6_2017.docx','без проекта',7),('2017-06-28','Владимир','Алексеевич','Кравцов','13','','9181157944','Цемдолина','ул. Атлетическая, 10','0118056102','d:\\Технические условия\\Цемдолина\\Кравцов_28_6_2017.docx','без проекта',6),('2017-07-11','Инна','Фёдоровна','Чуприна','13','','9183680777','Цемдолина','ул. 8-я Щель, район дома №5','01100015006','d:\\Технические условия\\Цемдолина\\Чуприна_11_7_2017.docx','без проекта',5),('2017-07-12','Константин','Викторович','Гриневич','40а','','9282824992','Мысхако','ул. 8-я Гвардейская, 40а','01180181050','d:\\Технические условия\\Мысхако\\Гриневич_12_7_2017.docx','без проекта',3),('2017-07-17','Татьяна','Владимировна','Косенко','19','','9887628488','Цемдолина','','01170160024','d:\\Технические условия\\Цемдолина\\Косенко_17_7_2017.docx','с проектом',13),('2017-07-17','Армен','Юрикович','Петросян','11','','9184852020','Борисовка','','01170182824','d:\\Технические условия\\Борисовка\\Петросян_17_7_2017.docx','без проекта',15),('2017-07-31','Пётр','Робердович','Саядян','63','','9186484555','Борисовка','с. Борисовка, с/т Аркада','0117029137','d:\\Технические условия\\Борисовка\\Саядян_31_7_2017.docx','без проекта',39),('2017-08-03','Дмитрий','Владимирович','Михеев','','','9884867984','Васильевка','г. Новороссийск','01170183126','d:\\Технические условия\\Васильевка\\Михеев_3_8_2017.docx','без проекта',40),('2017-08-03','Дмитрий','Владимирович','Михеев','','','9884867984','Васильевка','','01170183121','d:\\Технические условия\\Васильевка\\Михеев_3_8_2017.docx','без проекта',40),('2017-08-03','Дмитрий','Владимирович','Михеев','','','9884867984','Васильевка','','01170183121','d:\\Технические условия\\Васильевка\\Михеев_3_8_2017.docx','без проекта',40),('2017-08-03','Дмитрий','Владимировка','Михеев','','','9884867984','Васильевка','','01170183127','d:\\Технические условия\\Васильевка\\Михеев_3_8_2017.docx','без проекта',40),('2017-08-07','Людмила','Леонидовна','Агапова','35','','9883221122','Гайдук','ул. Береговая, 11','0119055159','d:\\Технические условия\\Гайдук\\Агапова_7_8_2017.docx','без проекта',41),('2017-08-07','Кярам','Дагарович','Шабоев','212а','','9184842111','Цемдолина','Фабричная, 53','0117030363','d:\\Технические условия\\Цемдолина\\Шабоев_7_8_2017.docx','без проекта',42),('2017-08-09','Виолета','Вячеславовна','Исматова','6','','9615128538','Цемдолина','ул. Взводная, 6','01080010278','d:\\Технические условия\\Цемдолина\\Исматова_9_8_2017.docx','без проекта',44),('2017-08-09','Александр','Васильевич','Мякиш','8','','9186470007','Цемдолина','ул. Взводная, 8','0108001197','d:\\Технические условия\\Цемдолина\\Мякиш_9_8_2017.docx','без проекта',44),('2017-08-09','Валентина','Михайловна','Задорожняя','5','','9181513331','Цемдолина','ул. Взводная, 5','01080011989','d:\\Технические условия\\Цемдолина\\Задорожняя_9_8_2017.docx','без проекта',44),('2017-08-09','Ирина','Васильевна','Аниченко','16','','9183944133','Цемдолина','ул. Взводная, 5а','01080011990','d:\\Технические условия\\Цемдолина\\Аниченко_9_8_2017.docx','без проекта',46),('2017-08-09','Андрей','Владимирович','Михалёв','4а','','9892401260','Цемдолина','ул. Взводная, 4а','01080012404','d:\\Технические условия\\Цемдолина\\Михалёв_9_8_2017.docx','без проекта',44),('2017-08-09','Пётр','Александрович','Бубенец','34','','9182138562','Цемдолина','ул. Взводная, 4','01080012403','d:\\Технические условия\\Цемдолина\\Бубенец_9_8_2017.docx','без проекта',47),('2017-08-09','Сергей','Николаевич','Юрченко','3а','','9897614420','Цемдолина','ул. Взводная, 3а','01080011879','d:\\Технические условия\\Цемдолина\\Юрченко_9_8_2017.docx','без проекта',44),('2017-08-09','Ирина','Васильевна','Макаренко','3','','9184906932','Цемдолина','ул. Взводная, 3','01080011880','d:\\Технические условия\\Цемдолина\\Макаренко_9_8_2017.docx','без проекта',44),('2017-08-09','Павел','Сергеевич','Загидулин','17','11','9887709712','Цемдолина','ул. Взводная, 2','0108001255','d:\\Технические условия\\Цемдолина\\Загидулин_9_8_2017.docx','без проекта',48),('2017-08-11','Марк','Андреевич','Овчинников','41и','136','9086833677','Раевская','ПКФ \"Стройкомплекс\"','01030351142','d:\\Технические условия\\Раевская\\Овчинников_11_8_2017.docx','без проекта',50),('2017-08-14','Наталья','Николаевна','Муртазаева','55','22','9184826460','Борисовка','с/т \"Аркада\", пер. Дорожный, 9','011702776','d:\\Технические условия\\Борисовка\\Муртазаева_14_8_2017.docx','без проекта',51),('2017-08-14','Николай','Иванович','Кузнецов','7','','9884647774','Гайдук','район ул. Энгельса','01190551919','d:\\Технические условия\\Гайдук\\Кузнецов_14_8_2017.docx','без проекта',52),('2017-08-14','Николай','Иванович','Кузнецов','7','','9884647774','Гайдук','пер. Казачий, 3','0119055722','d:\\Технические условия\\Гайдук\\Кузнецов_14_8_2017.docx','без проекта',52),('2017-08-14','Вячеслав','Николаевич','Дементьев','59а','46','9649346123','Борисовка','СТ Приморское','01170182893','d:\\Технические условия\\Борисовка\\Дементьев_14_8_2017.docx','без проекта',53),('2017-08-14','Эдуард','Саркисович','Сианисян','40а','','9282600203','Борисовка','','01170183279','d:\\Технические условия\\Борисовка\\Сианисян_14_8_2017.docx','без проекта',54),('2017-08-14','Наталья','Николаевна','Цель','36','','9282600203','Борисовка','с. Борисовка','01170183319','d:\\Технические условия\\Борисовка\\Цель_14_8_2017.docx','без проекта',55),('2017-08-14','Наталья','Николаевна','Цель','36','','9282600203','Борисовка','','01170183321','d:\\Технические условия\\Борисовка\\Цель_14_8_2017.docx','без проекта',55),('2017-08-14','Елена','Валентиновна','Якунова','4','78','9282600203','Борисовка','','01170183313','d:\\Технические условия\\Борисовка\\Якунова_14_8_2017.docx','без проекта',56),('2017-08-22','Юрий','Дмитриевич','Деременжи','9','','9180532474','Мысхако','','01180556029','d:\\Технические условия\\Мысхако\\Деременжи_22_8_2017.docx','с проектом',57),('2017-08-23','Александр','Григорьевич','Поездник','13б','6','9615881952','Мысхако','','011801582','d:\\Технические условия\\Мысхако\\Поездник_23_8_2017.docx','с проектом',58),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170182564','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183307','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183312','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183311','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183315','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183316','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183318','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183306','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183320','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183317','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183314','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183310','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183309','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183322','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170182664','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183280','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183283','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183282','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183284','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183286','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183287','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183289','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183290','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183292','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183293','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183295','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183297','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183278','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183296','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183294','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183291','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183288','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183285','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183281','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-24','Александр','Юрьевич','Шуст','24а','','9282600203','Борисовка','','01170183298','d:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx','с проектом',59),('2017-08-28','Владимир','Николаевич','Тищенко','75а','','9184358169','Борисовка','','01170182648','d:\\Технические условия\\Борисовка\\Тищенко_28_8_2017.docx','без проекта',60),('2017-08-28','Алексей','Александрович','Макарьев','9','','9183607831','Натухаевская','ул. Златоустовская, 46','01010011060','d:\\Технические условия\\Натухаевская\\Макарьев_28_8_2017.docx','без проекта',61),('2017-08-29','Айталина','Анатольевна','Тюляхова','18','22','9282600203','Глебовское','','0117043159','d:\\Технические условия\\Глебовское\\Тюляхова_29_8_2017.docx','без проекта',62),('2017-08-29','Тамара','Анатольевна','Нода','3а','','9183218806','Глебовское','ул. Спутника, 19а','0117040177','d:\\Технические условия\\Глебовское\\Нода_29_8_2017.docx','без проекта',63),('2017-08-30','Юрий','Гасанович','Герман-Шахлы','26','','9180648353','Мысхако','ул. Центральная, 16','01180350021','d:\\Технические условия\\Мысхако\\Герман-Шахлы_30_8_2017.docx','с проектом',64),('2017-08-30','Борис','Георгиевич','Каменный','51','9','9886670480','Мысхако','ул. Центральная','0118035512','d:\\Технические условия\\Мысхако\\Каменный_30_8_2017.docx','с проектом',51),('2017-09-01','Игорь','Васильевич','Зубков','77','В','9184495478','Семигорский','','01040071827','d:\\Технические условия\\Семигорский\\Зубков_1_9_2017.docx','с проектом',65),('2017-09-01','Ирина','Аркадьевна','Иванова','43','24','9183607831','Мысхако','','01180185776','d:\\Технические условия\\Мысхако\\Иванова_1_9_2017.docx','с проектом',66),('2017-09-01','Александр','Николаевич','Кириллов','10','','9897640156','Глебовское','','01170172939','d:\\Технические условия\\Глебовское\\Кириллов_1_9_2017.docx','без проекта',67);
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

-- Dump completed on 2017-11-20 22:31:48
