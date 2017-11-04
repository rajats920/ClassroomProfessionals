-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: classroomprofessionals
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievements` (
  `pid` int(10) NOT NULL,
  `achID` int(10) NOT NULL AUTO_INCREMENT,
  `descriptions` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`achID`),
  KEY `pid` (`pid`),
  CONSTRAINT `achievements_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `pid` int(10) NOT NULL,
  `a_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`a_id`),
  KEY `pid` (`pid`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifications`
--

DROP TABLE IF EXISTS `certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certifications` (
  `pid` int(10) NOT NULL,
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `timestamp` date DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `pid` (`pid`),
  CONSTRAINT `certifications_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `no_employee` int(100) DEFAULT NULL,
  `followers` int(100) DEFAULT NULL,
  `about` varchar(100) DEFAULT NULL,
  `openingHours` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `addInfo` varchar(500) DEFAULT NULL,
  `ImageUrl` varchar(500) DEFAULT NULL,
  `bannerImageUrl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connections` (
  `p1_id` int(10) NOT NULL,
  `p2_id` int(10) NOT NULL,
  `connection_id` int(10) NOT NULL AUTO_INCREMENT,
  `connection_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`connection_id`),
  KEY `p1_id` (`p1_id`),
  KEY `p2_id` (`p2_id`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`p1_id`) REFERENCES `professionals` (`pid`),
  CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`p2_id`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `pid` int(10) NOT NULL,
  `courseid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`courseid`),
  KEY `pid` (`pid`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `pid` int(10) NOT NULL,
  `educationid` int(10) NOT NULL AUTO_INCREMENT,
  `year` int(4) NOT NULL,
  `degree` varchar(20) DEFAULT NULL,
  `Institution` varchar(20) DEFAULT NULL,
  `CGPA` float DEFAULT NULL,
  PRIMARY KEY (`educationid`),
  KEY `pid` (`pid`),
  CONSTRAINT `education_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follows` (
  `pid` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `follows_id` int(10) NOT NULL AUTO_INCREMENT,
  `follow_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`follows_id`),
  KEY `pid` (`pid`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`),
  CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `honorsandawards`
--

DROP TABLE IF EXISTS `honorsandawards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `honorsandawards` (
  `pid` int(10) NOT NULL,
  `hid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`hid`),
  KEY `pid` (`pid`),
  CONSTRAINT `honorsandawards_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `honorsandawards`
--

LOCK TABLES `honorsandawards` WRITE;
/*!40000 ALTER TABLE `honorsandawards` DISABLE KEYS */;
/*!40000 ALTER TABLE `honorsandawards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internshipexperience`
--

DROP TABLE IF EXISTS `internshipexperience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internshipexperience` (
  `pid` int(10) NOT NULL,
  `internid` int(10) NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`internid`),
  KEY `pid` (`pid`),
  CONSTRAINT `internshipexperience_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internshipexperience`
--

LOCK TABLES `internshipexperience` WRITE;
/*!40000 ALTER TABLE `internshipexperience` DISABLE KEYS */;
/*!40000 ALTER TABLE `internshipexperience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_application`
--

DROP TABLE IF EXISTS `job_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_application` (
  `apply_id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `job_id` int(10) NOT NULL,
  PRIMARY KEY (`apply_id`),
  KEY `pid` (`pid`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `job_application_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`),
  CONSTRAINT `job_application_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_application`
--

LOCK TABLES `job_application` WRITE;
/*!40000 ALTER TABLE `job_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `company_id` int(10) NOT NULL,
  `job_id` int(100) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `postedOn` date DEFAULT NULL,
  `urgencyLevel` varchar(10) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `mail_id` varchar(50) DEFAULT NULL,
  `contact` int(10) DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobskills`
--

DROP TABLE IF EXISTS `jobskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobskills` (
  `job_id` int(10) NOT NULL,
  `skill_id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`skill_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `jobskills_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobskills`
--

LOCK TABLES `jobskills` WRITE;
/*!40000 ALTER TABLE `jobskills` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `pid` int(10) NOT NULL,
  `lid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`lid`),
  KEY `pid` (`pid`),
  CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `p1_id` int(10) NOT NULL,
  `p2_id` int(10) NOT NULL,
  `m_id` int(10) NOT NULL,
  `msg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`m_id`),
  KEY `p1_id` (`p1_id`),
  KEY `p2_id` (`p2_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`p1_id`) REFERENCES `professionals` (`pid`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`p2_id`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `company_id` int(10) NOT NULL,
  `job_id` int(10) NOT NULL,
  `offer_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`offer_id`),
  KEY `company_id` (`company_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `offers_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `pid` int(10) NOT NULL,
  `a_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL AUTO_INCREMENT,
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`),
  KEY `pid` (`pid`),
  KEY `a_id` (`a_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `articles` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professionals`
--

DROP TABLE IF EXISTS `professionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professionals` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  `phone` int(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `headline` varchar(40) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `experience` int(3) DEFAULT NULL,
  `industry` varchar(20) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `profilepicture` varchar(100) DEFAULT NULL,
  `summary` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professionals`
--

LOCK TABLES `professionals` WRITE;
/*!40000 ALTER TABLE `professionals` DISABLE KEYS */;
INSERT INTO `professionals` VALUES (1,'rajat','rajats920@gmail.com',123456,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'name ','name@name.com',123456,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'ravi','ravichandora@gmail.com',23456789,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'rashmin','rashmin@gmail.com',36789,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'atul','atul@gmail.com',45678,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'rajat','rajats920@gmail.com',12345,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'rajat','rajats920@gmail.com',12345,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'hello','hello@gmail.com',12345,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'hello','hello@gmail.com',52,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'qwert','qwert@gmail.com',12345,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'akash','akash@gmail.com',345678,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'miracle','miracle@gmail.com',1234,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'matu','matu@gmail.com',12345,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'gh','gh@gmail.com',12345,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'gh','gh@gmail.com',12345,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'gh','gh@gmail.com',12345,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'kuroky','kuroky@gmail.com',12345,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'mc','mc@gmail.com',12345,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `professionals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectexperience`
--

DROP TABLE IF EXISTS `projectexperience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectexperience` (
  `pid` int(10) NOT NULL,
  `projectid` int(10) NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`projectid`),
  KEY `pid` (`pid`),
  CONSTRAINT `projectexperience_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectexperience`
--

LOCK TABLES `projectexperience` WRITE;
/*!40000 ALTER TABLE `projectexperience` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectexperience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `pid` int(10) NOT NULL,
  `a_id` int(10) NOT NULL,
  `reviewid` int(10) NOT NULL AUTO_INCREMENT,
  `reviewtype` int(1) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reviewid`),
  KEY `pid` (`pid`),
  KEY `a_id` (`a_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `articles` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `company_id` int(10) NOT NULL,
  `service_id` int(100) NOT NULL AUTO_INCREMENT,
  `service_type` varchar(100) NOT NULL,
  PRIMARY KEY (`service_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `pid` int(10) NOT NULL,
  `skillid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`skillid`),
  KEY `pid` (`pid`),
  CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialmedialinks`
--

DROP TABLE IF EXISTS `socialmedialinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialmedialinks` (
  `company_id` int(10) NOT NULL,
  `link_id` int(100) NOT NULL AUTO_INCREMENT,
  `link` varchar(100) NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `socialmedialinks_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialmedialinks`
--

LOCK TABLES `socialmedialinks` WRITE;
/*!40000 ALTER TABLE `socialmedialinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialmedialinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views` (
  `p1_id` int(10) NOT NULL,
  `p2_id` int(10) NOT NULL,
  `view_id` int(10) NOT NULL AUTO_INCREMENT,
  `view_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`view_id`),
  KEY `p1_id` (`p1_id`),
  KEY `p2_id` (`p2_id`),
  CONSTRAINT `views_ibfk_1` FOREIGN KEY (`p1_id`) REFERENCES `professionals` (`pid`),
  CONSTRAINT `views_ibfk_2` FOREIGN KEY (`p2_id`) REFERENCES `professionals` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-04 20:47:53
