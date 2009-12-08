-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51a-24


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema blog
--

CREATE DATABASE IF NOT EXISTS blog;
USE blog;

--
-- Definition of table `blog`.`comment`
--

DROP TABLE IF EXISTS `blog`.`comment`;
CREATE TABLE  `blog`.`comment` (
  `id` int(11) NOT NULL auto_increment,
  `content` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime default NULL,
  `author` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `url` varchar(128) default NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_comment_post` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`comment`
--

/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
LOCK TABLES `comment` WRITE;
INSERT INTO `blog`.`comment` VALUES  (13,'Un comentario',1,'2009-08-30 18:19:21','Ash','a','http://abweb.com.ve',3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


--
-- Definition of table `blog`.`controllers`
--

DROP TABLE IF EXISTS `blog`.`controllers`;
CREATE TABLE  `blog`.`controllers` (
  `id` int(10) NOT NULL auto_increment,
  `menu_id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `perfiles_id` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `controllers_perfiles_fk` (`perfiles_id`),
  KEY `controllers_menus_fk` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`controllers`
--

/*!40000 ALTER TABLE `controllers` DISABLE KEYS */;
LOCK TABLES `controllers` WRITE;
INSERT INTO `blog`.`controllers` VALUES  (16,5,'Listar',1,'A','admin/post'),
 (17,5,'Nueva',1,'A','admin/post/create');
UNLOCK TABLES;
/*!40000 ALTER TABLE `controllers` ENABLE KEYS */;


--
-- Definition of table `blog`.`menus`
--

DROP TABLE IF EXISTS `blog`.`menus`;
CREATE TABLE  `blog`.`menus` (
  `id` int(10) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`menus`
--

/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
LOCK TABLES `menus` WRITE;
INSERT INTO `blog`.`menus` VALUES  (1,'Controladores','administra los Controladores'),
 (2,'Usuarios','Administra Usuarios'),
 (3,'Menus','Administra Menus'),
 (4,'Perfiles','Administra Perfiles'),
 (5,'Noticias','Administrar Noticias'),
 (6,'Comentario','Comentario'),
 (7,'Admin','Menu Administrativo');
UNLOCK TABLES;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;


--
-- Definition of table `blog`.`perfiles`
--

DROP TABLE IF EXISTS `blog`.`perfiles`;
CREATE TABLE  `blog`.`perfiles` (
  `id` int(10) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`perfiles`
--

/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
LOCK TABLES `perfiles` WRITE;
INSERT INTO `blog`.`perfiles` VALUES  (1,'admin'),
 (2,'invitado');
UNLOCK TABLES;
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;


--
-- Definition of table `blog`.`post`
--

DROP TABLE IF EXISTS `blog`.`post`;
CREATE TABLE  `blog`.`post` (
  `id` int(10) NOT NULL auto_increment,
  `entry` text,
  `title` varchar(255) NOT NULL,
  `url_title` varchar(200) default NULL,
  `creation_at` datetime NOT NULL,
  `edited_in` datetime default NULL,
  `author` varchar(100) default NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `url_title` (`url_title`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


--
-- Definition of table `blog`.`usuarios`
--

DROP TABLE IF EXISTS `blog`.`usuarios`;
CREATE TABLE  `blog`.`usuarios` (
  `id` int(10) NOT NULL auto_increment,
  `login` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `perfiles_id` int(10) NOT NULL,
  `status` char(1) NOT NULL,
  `nombre` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `unique_login` (`login`),
  KEY `perfiles_usuarios_fk` (`perfiles_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
LOCK TABLES `usuarios` WRITE;
INSERT INTO `blog`.`usuarios` VALUES  (1,'admin','deivinsontejeda@kumbiaphp.com','d033e22ae348aeb5660fc2140aec35850c4da997',1,'A','admin'),
 (2,'invitado','','0c0438a2d770051789cbafdd47fe25a9d7f74587',2,'A','invitado');
UNLOCK TABLES;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
