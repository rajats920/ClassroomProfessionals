-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: classroomprofessionals
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES (1,1,'UPTU Topper'),(2,2,'Rajasthan Board Topper'),(3,3,'IIT Qualifier'),(4,4,'Texas Selection'),(5,5,'Microsoft 40Lacks');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,1,'The Four Stages of Life','2017-11-06 10:17:00','The phases of life that we all travel through and how they define who we are.'),(1,2,'How to Quit Your Day Job and Travel the World','2017-11-06 10:17:55','How to leverage your terror of going broke to achieving greater success and autonomy.'),(1,3,'No, You Can’t Have it All ','2017-11-06 10:18:32','A realistic look at the necessity of choosing what to give up in our lives.'),(2,4,'Love is Not Enough','2017-11-06 10:19:11','hy we idealize love, make it something more than it is, and how that ruins many of our relationships.'),(3,5,'In the Future, Your Attention Will Be Sold','2017-11-06 10:19:56','My take on new technologies and how they’re not necessarily ruining society, just our attention spans.'),(2,6,'Maybe You Don’t Know What Love Is','2017-11-06 10:20:23','A sober look at what love often is and what it should be.'),(5,7,'A Dust Over India ','2017-11-06 10:21:16','A raw look at some of the more jarring experiences I had on my trip to India.'),(5,8,'The American Dream Is Killing Us ','2017-11-06 10:21:16','Some commentary on why I think the American Dream isn’t just dead, it’s actually being used against us.');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
INSERT INTO `certifications` VALUES (5,8,'Inter IIT Tech Meet',NULL),(5,9,'Dance Participation',NULL),(5,10,'Essay Writing',NULL),(1,11,'Badminton',NULL),(1,12,'Inter IIT Tech Meet',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (111,'Microsoft Corporation','mscontact@outlook.com','IT',' Redmond, Washington, United States',4.5,127104,100,'It develops, manufactures, licenses, supports and sells computer software and services.','2017-11-06 10:41:53','Microsoft is the world\'s sixth-largest information technology company by revenue','img/ms.jpg','img/MsBanner.png'),(112,'Samsung Group','samsung@sam.com','Electronics','Samsung Town, Seoul',4.2,489000,62,'Samsung Group is a South Korean multinational conglomerate.','2017-11-06 10:52:18',' It comprises numerous affiliated businesses, most of them united under the Samsung brand, and is the largest South Korean chaebol.','img/Samsang.jpg','img/samLogo.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (5,3,22,'2017-11-06 10:54:54'),(5,4,23,'2017-11-06 10:54:54'),(1,2,24,'2017-11-06 10:54:54'),(1,4,25,'2017-11-06 10:54:54'),(1,3,26,'2017-11-06 10:54:54'),(5,1,27,'2017-11-06 10:54:54'),(5,2,28,'2017-11-06 10:55:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (5,7,'Comupter Netwroks'),(5,8,'DBMS'),(5,9,'Data Structure'),(1,10,'DBMS'),(1,11,'Computer Networks'),(1,12,'Data Structures');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (5,3,2012,'10th','Asha Modern',10),(5,4,2014,'12th','Asha Modern',10),(5,5,2018,'B.Tech','IIT Roorkee',8),(1,6,2012,'10th','Jawahar Navodaya',10),(1,7,2014,'12th','Gyankalash',10),(1,8,2018,'B.Tech','IIT Roorkee',8);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (5,111,1,'2017-11-06 11:05:34'),(5,112,2,'2017-11-06 11:05:34'),(1,111,3,'2017-11-06 11:05:34'),(1,112,4,'2017-11-06 11:05:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `honorsandawards`
--

LOCK TABLES `honorsandawards` WRITE;
/*!40000 ALTER TABLE `honorsandawards` DISABLE KEYS */;
INSERT INTO `honorsandawards` VALUES (5,6,'EY Hackathon','To conceive and shape an innovative technical solution for everyday business problems.'),(5,7,'Database Tech','TO BUILD NEW TECHNOLOGY THAT CAN BE USED IN FUTURE'),(5,8,'Code-Off Hackathon','Hacking is building things that you always wanted to have but no one has built it yet.'),(1,9,'Happiness Decoded','A session related to happiness in work life and in general as well.'),(1,10,'DCB Innovation','To promote the development of financial technology for DCB Bank help of Fintech.');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internshipexperience`
--

LOCK TABLES `internshipexperience` WRITE;
/*!40000 ALTER TABLE `internshipexperience` DISABLE KEYS */;
INSERT INTO `internshipexperience` VALUES (5,2,'Microsoft','Developer','2 Months','To give some innovative solutions of real life problems'),(1,3,'SRIB','Developer','2 Months','To check maximum data rate in 5G netwrok');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_application`
--

LOCK TABLES `job_application` WRITE;
/*!40000 ALTER TABLE `job_application` DISABLE KEYS */;
INSERT INTO `job_application` VALUES (2,5,2),(3,5,1),(4,1,1),(5,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (111,1,'Back hand developer',NULL,'ASAP','Bengalore',NULL,'creates the logical back-end and core computational logic of a website','micrpsoft@outlook.com',12345),(112,2,'Back hand developer',NULL,'Asap','Bengalore',NULL,'creates the logical back-end and core computational logic of a information system','samsung@sam.com',123456);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobskills`
--

LOCK TABLES `jobskills` WRITE;
/*!40000 ALTER TABLE `jobskills` DISABLE KEYS */;
INSERT INTO `jobskills` VALUES (1,1,'Back Hand Developer'),(2,2,'Back Hand Developer');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (5,1,'C++'),(5,2,'Python'),(5,3,'Java'),(5,4,'HTML'),(5,5,'JS'),(5,6,'C'),(1,7,'C++'),(1,8,'Pyhton');
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
INSERT INTO `message` VALUES (1,5,11,'2017-11-06 11:56:54'),(5,2,12,'2017-11-06 11:56:54'),(5,3,14,'2017-11-06 11:56:54'),(5,1,15,'2017-11-06 11:56:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (111,1,1),(112,2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (5,7,1,'2017-11-06 11:58:26'),(5,8,2,'2017-11-06 11:58:26'),(1,2,3,'2017-11-06 11:58:26'),(1,3,4,'2017-11-06 11:58:27'),(1,1,5,'2017-11-06 11:58:27');
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
INSERT INTO `professionals` VALUES (1,'Akash','akash@gmail.com',12345,'12345','Software Developer','1997-12-11','Bengalore',5,'IT','Bangalore','India','img/ak.png','I am Developer.'),(2,'Ravi','ravichandora@gmail.com',12345,'12345','Front Hand Developer','1997-10-23','Pune',1,'IT','Pune','India','img/ravi.jpeg','I am a front hand Developer.'),(3,'Rashmin','rashmin@gmail.com',36789,'12345','Financial Manager','1881-01-05','Lahore',2,'Finance','Lahore','Pakistan','img/1.jpeg','I am Banker.'),(4,'Atul','atul@gmail.com',45678,'12345','Product Manager','1884-10-12','Las Vegas',3,'Marketing','Las Vegas','USA','img/2.jpg','I am product Manager'),(5,'Rajat','rajats920@gmail.com',12345,'12345','Politician','1965-11-11','Bihar',15,'Politics','Muzzafarpur','India','img/5.jpg','Looking forward for the Curruption free India'),(7,'Kunal','kunal@gmail.com',12345,'12345','Peon','1995-12-01','Maldives',1,'Public Services','Maldivs','India','img/10.jpeg','Looking for driver job.'),(9,'Shubham','shubham@gmail.com',12345,'12345','Gatekeeper','1991-01-12','Seria',5,'IT','Brunei','Seria','img/3.jpg','Its my job to stop people.'),(11,'miracle','miracle@gmail.com',1234,'12345','Software Developer','1997-12-10','Pune',1,'Finance','Pune','India','img/4.jpg','I am Developer.'),(12,'matu','matu@gmail.com',12345,'12345','Front Hand Developer','1995-05-10','Gaya',2,'IT','Gaya','India','img/5.jpg','I am goot at my work.'),(13,'gh','gh@gmail.com',12345,'12345','Financial Manager','1991-12-10','Delhi',3,'Gaming','Delhi','India','img/6.jpg','I love my JOb'),(16,'kuroky','kuroky@gmail.com',12345,'12345','Product Manager','1997-11-11','Rajkot',4,'E-Commerce','Rajkot','India','img/7.jpg','Hard working guy'),(18,'mota','mota@mota.com',99999,'12345','Gatekeeper','1997-12-12','Surat',1,'Education','Surat','India','img/8.jpg','Looking forward for gardner job');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectexperience`
--

LOCK TABLES `projectexperience` WRITE;
/*!40000 ALTER TABLE `projectexperience` DISABLE KEYS */;
INSERT INTO `projectexperience` VALUES (5,1,'Microsoft','Web App','2 months','Develope a web App'),(5,2,'Samsung','5G network','4 months','Maximise the 5G netwrok data speed');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (5,8,1,5,NULL),(1,1,2,4,NULL),(1,2,3,9,NULL),(1,3,4,10,NULL),(5,7,5,4,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (111,1,'Personal Cumputers'),(112,2,'Electronic Appliances');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (5,1,'Back Hand'),(5,2,'Front Hand'),(5,3,'AI'),(1,4,'ML'),(1,5,'Mobile App');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialmedialinks`
--

LOCK TABLES `socialmedialinks` WRITE;
/*!40000 ALTER TABLE `socialmedialinks` DISABLE KEYS */;
INSERT INTO `socialmedialinks` VALUES (111,1,'https://www.facebook.com/MicrosoftIndia'),(111,2,'https://twitter.com/microsoftindia'),(111,3,'https://www.youtube.com/user/IndiaMicrosoftVideos'),(112,4,'https://www.facebook.com/samsungarmenia'),(112,5,'https://twitter.com/samsunguk'),(112,6,'https://www.instagram.com/samsungbrasil/'),(112,7,'https://www.youtube.com/user/SamsungMobile');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES (5,1,1,'2017-11-06 12:11:53'),(5,2,2,'2017-11-06 12:11:53'),(5,3,3,'2017-11-06 12:11:53'),(5,4,4,'2017-11-06 12:11:53');
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

-- Dump completed on 2017-11-06 17:49:07
