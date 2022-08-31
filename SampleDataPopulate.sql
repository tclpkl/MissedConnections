-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: uscmissed
-- ------------------------------------------------------
-- Server version	8.0.28


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,2,1,'I love CS 1'),(2,2,1,'I love CS 2'),(3,1,1,'I love commenting'),(4,3,1,'I love sleep too bro'),(5,4,1,'I am hardstuck'),(6,5,1,'so true anonymous harry potter girl'),(7,6,1,'Wait is this the same person as the other Harry Potter fan??'),(8,7,1,'pulvinar elementum integer enim neque volutpat ac tincidunt vitae semper quis lectus nulla at volutpat diam ut venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam non nisi est sit amet facilisis magna etiam tempor orci eu lobortis elementum nibh tellus molestie nunc non blandit massa enim nec dui nunc mattis enim ut tellus elementum sagittis vitae et leo duis ut diam quam nulla porttitor massa id neque aliquam vestibulum morbi blandit cursus risus at ultrices mi tempus imperdiet nulla malesuada pellentesque'),(9,7,5,'harry potter <3'),(10,3,5,'harry potter <3'),(11,1,5,'harry potter <3'),(12,7,6,'This was me guys'),(13,7,6,'I love CS'),(14,3,6,'Ayo wake up'),(15,3,5,'Dreaming of Harry Potter'),(16,2,2,'Thats me, I am backend'),(17,2,3,'I agree'),(18,1,4,'Chocolate Strawberry\'s \"outfit\" is insane');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Suggestions','echeng68@usc.edu','Night Mode would be awesome!');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,6,2),(2,1,2),(3,2,2),(4,3,2),(5,4,2),(6,5,2),(7,5,1),(8,3,1),(9,6,1),(10,6,7),(11,5,7),(12,3,7),(13,1,1),(14,1,4),(15,2,4),(16,2,1);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,4,'Chocolate strawberry hot','2022-04-20 15:57:30'),(2,1,'I love backend #CS #computer #love','2022-04-20 15:57:58'),(3,2,'I love sleep bro so much #notwoke bed is so comfy man and the quick brown fox jumped over the lazy river','2022-04-20 15:58:31'),(4,3,'League and basketball #baker','2022-04-20 15:58:57'),(5,5,'Harry Potter is my life #obssessed','2022-04-20 15:59:09'),(6,5,'I\'d die for hermonie','2022-04-20 15:59:26'),(7,6,'pulvinar elementum integer enim neque volutpat ac tincidunt vitae semper quis lectus nulla at volutpat diam ut venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam non nisi est sit amet facilisis magna etiam tempor orci eu lobortis elementum nibh tellus molestie nunc non blandit massa enim nec dui nunc mattis enim ut tellus elementum sagittis vitae et leo duis ut diam quam nulla porttitor massa id neque aliquam vestibulum morbi blandit cursus risus at ultrices mi tempus imperdiet nulla malesuada pellentesque','2022-04-20 16:01:02');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `toBeApproved`
--

LOCK TABLES `toBeApproved` WRITE;
/*!40000 ALTER TABLE `toBeApproved` DISABLE KEYS */;
INSERT INTO `toBeApproved` VALUES (1,4,'I love Jungkook so much bro.'),(2,3,'That Eric guy working on backend has me acting up'),(3,1,'I love pizza'),(4,2,'Bro kiss me'),(5,6,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae magna tristique, luctus nunc eu, finibus libero. Curabitur sed nisi in lorem accumsan mattis fermentum ut est. Nulla facilisi ligula.');
/*!40000 ALTER TABLE `toBeApproved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Eric Cheng','echeng68@usc.edu','admin'),(2,'Raymond Kuan','rkuan@usc.edu','admin'),(3,'Timothy Lin','ttlin@usc.edu','admin'),(4,'Cate Jungkook','cyjung@usc.edu','user'),(5,'Melanie Toh','melaniex@usc.edu','user'),(6,'Ronak Pai','ronakpai@usc.edu','user');
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

-- Dump completed on 2022-04-20 16:18:55
