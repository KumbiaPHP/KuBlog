-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51a-24+lenny2


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

--
-- Definition of table `blog`.`comment`
--

CREATE TABLE  `comment` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`comment`
--

/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
LOCK TABLES `comment` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


--
-- Definition of table `blog`.`controllers`
--

CREATE TABLE  `controllers` (
  `id` int(10) NOT NULL auto_increment,
  `menu_id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `perfiles_id` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `controllers_perfiles_fk` (`perfiles_id`),
  KEY `controllers_menus_fk` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`controllers`
--

/*!40000 ALTER TABLE `controllers` DISABLE KEYS */;
LOCK TABLES `controllers` WRITE;
INSERT INTO `controllers` VALUES  (16,5,'Listar',1,'A','admin/post'),
 (17,5,'Nueva',1,'A','admin/post/create'),
 (18,8,'Listar',1,'A','admin/tags');
UNLOCK TABLES;
/*!40000 ALTER TABLE `controllers` ENABLE KEYS */;


--
-- Definition of table `blog`.`menus`
--

CREATE TABLE  `menus` (
  `id` int(10) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`menus`
--

/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
LOCK TABLES `menus` WRITE;
INSERT INTO `menus` VALUES  (1,'Controladores','administra los Controladores'),
 (2,'Usuarios','Administra Usuarios'),
 (3,'Menus','Administra Menus'),
 (4,'Perfiles','Administra Perfiles'),
 (5,'Noticias','Administrar Noticias'),
 (6,'Comentario','Comentario'),
 (7,'Admin','Menu Administrativo'),
 (8,'Etiqueta','Administrar Etiquetas');
UNLOCK TABLES;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;


--
-- Definition of table `blog`.`perfiles`
--

CREATE TABLE  `perfiles` (
  `id` int(10) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`perfiles`
--

/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
LOCK TABLES `perfiles` WRITE;
INSERT INTO `perfiles` VALUES  (1,'admin'),
 (2,'invitado');
UNLOCK TABLES;
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;


--
-- Definition of table `blog`.`post`
--

CREATE TABLE  `post` (
  `id` int(10) NOT NULL auto_increment,
  `entry` text,
  `title` varchar(255) NOT NULL,
  `slug` varchar(200) default NULL,
  `creation_at` datetime NOT NULL,
  `edited_in` datetime default NULL,
  `author` varchar(100) default NULL,
  `status` int(11) NOT NULL,
  `summary` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



--
-- Definition of table `blog`.`posts_tags`
--

CREATE TABLE  `posts_tags` (
  `id` int(11) NOT NULL auto_increment,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


--
-- Definition of table `blog`.`tags`
--

CREATE TABLE  `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Definition of table `blog`.`usuarios`
--

CREATE TABLE  `usuarios` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
LOCK TABLES `usuarios` WRITE;
INSERT INTO `usuarios` VALUES  (1,'admin','deivinsontejeda@kumbiaphp.com','ce67ae2fac4bac6c57a09dd34c24a71acce4f293',1,'A','admin'),
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
