-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: simacel_kublog
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.6

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
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `contenido` text,
  `titulo` varchar(255) NOT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `creado_at` datetime NOT NULL,
  `editado_in` datetime DEFAULT NULL,
  `usuario_id` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '0',
  `resumen` text,
  `categoria_id` int(10) NOT NULL,
  `fecha_publicacion` datetime DEFAULT NULL,
  `habilitar_comentarios` tinyint(1) DEFAULT '0',
  `numero_comentarios` int(11) DEFAULT '0',
  `numero_de_lecturas` int(11) DEFAULT '0',
  `me_gusta` int(11) DEFAULT '0',
  `no_me_gusta` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,'<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla turpis  nunc, fermentum eleifend varius quis, faucibus et lacus. Integer tempor  quam sit amet felis rutrum fringilla. Maecenas viverra, nunc in varius  aliquam, est ipsum dapibus leo, in venenatis mauris augue eget erat.  Proin mi nisi, molestie sit amet mattis non, dignissim eget est.  Maecenas vel metus ac elit adipiscing vestibulum. Curabitur gravida  euismod nisi vitae consectetur. Proin in massa sapien, ac bibendum eros.  Proin ipsum ipsum, congue quis dictum eu, egestas nec tellus. Aenean  faucibus lectus non turpis rhoncus molestie. Integer cursus augue et  ante malesuada eu lacinia est lacinia. Nunc tincidunt venenatis urna in  laoreet. Nulla molestie venenatis risus id fringilla. Donec vestibulum  felis eu turpis tincidunt in scelerisque nunc euismod. Vestibulum vitae  gravida ante. Proin convallis nibh sed enim ullamcorper mattis.</p>\r\n<p>Vestibulum eget lectus in sem interdum cursus. Sed scelerisque  consectetur magna et sodales. Morbi cursus posuere eleifend. Donec eget  ultricies eros. Duis laoreet auctor est, at tempor eros luctus id.  Vestibulum ac urna turpis, ac tincidunt erat. Fusce ac venenatis quam.  Quisque porta pharetra tincidunt. Duis risus felis, lacinia sit amet  tempus vitae, eleifend ac lorem. In hac habitasse platea dictumst. Nulla  euismod lectus nec nunc cursus adipiscing. Etiam suscipit nisl a mauris  tempus scelerisque. Donec eu nunc in ligula sollicitudin egestas sit  amet auctor mi. Mauris in dui vitae magna porta hendrerit vel nec risus.  Curabitur at leo quis tortor pharetra tristique vitae in augue.</p>\r\n<p><!-- pagebreak --></p>\r\n<p>Fusce non quam felis. In ornare luctus elit, vel gravida sapien  tristique vitae. Nunc mattis ligula vitae metus fermentum a condimentum  risus semper. Proin nibh nulla, aliquet porttitor posuere molestie,  elementum a mauris. Donec commodo auctor turpis et dictum. Curabitur sed  ante quam, et placerat massa. Praesent in odio lorem, vel pharetra  eros. Mauris tristique lacus vel mauris ultricies ac lobortis dolor  porta. Vestibulum cursus eros convallis lorem condimentum condimentum.  Etiam sit amet fringilla arcu. Nullam ut lacus eu metus tempus  malesuada. Sed lobortis est risus. Praesent hendrerit felis nec nunc  elementum molestie. Phasellus luctus enim eget velit ullamcorper  pellentesque.</p>\r\n<p>Pellentesque pellentesque suscipit leo, hendrerit dignissim libero  blandit vitae. Sed sagittis lorem vel neque mollis euismod. Quisque  suscipit nulla vitae nulla dapibus vel luctus sapien ornare. Etiam ac  nisi vitae risus porttitor volutpat ac non enim. Donec pharetra  fringilla ligula, a molestie turpis pellentesque nec. Nam magna leo,  pulvinar vulputate lobortis eget, tincidunt vel enim. Nulla viverra,  mauris quis volutpat scelerisque, lorem orci viverra augue, in luctus  quam diam sit amet diam. Duis eu lacus nulla. Nam ac nunc eu dolor  auctor rhoncus in id arcu. Quisque sagittis tincidunt dapibus. Integer  in mauris est, non laoreet lacus. Suspendisse sodales odio eget urna  ornare et sollicitudin sapien tristique. Morbi id purus nisi, eu  porttitor eros.</p>\r\n<p>Donec lectus diam, vulputate ac elementum in, imperdiet vel dolor. Nulla  dapibus pellentesque leo, a vestibulum velit gravida vitae. Morbi ut  ipsum dolor, sed euismod sapien. Donec purus velit, pharetra tempor  dapibus quis, blandit vitae diam. Cras sit amet mi orci, vitae interdum  enim. Phasellus ultrices sem non nulla vehicula aliquam. Duis ut mi eget  sapien mattis posuere. Nunc vulputate justo sit amet felis fringilla  pellentesque. Maecenas mauris diam, sagittis vitae bibendum sed,  tincidunt ac dolor. Nullam sed eros quam. Integer sit amet lorem lacus,  auctor condimentum est. Maecenas eget sem nec diam adipiscing aliquam  sit amet a arcu.</p>\r\n</div>','Lorem ipsum dolor sit amet','lorem_ipsum_dolor_sit_amet','2010-09-12 19:35:09','2010-09-12 20:56:34','1',1,'<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla turpis  nunc, fermentum eleifend varius quis, faucibus et lacus. Integer tempor  quam sit amet felis rutrum fringilla. Maecenas viverra, nunc in varius  aliquam, est ipsum dapibus leo, in venenatis mauris augue eget erat.  Proin mi nisi, molestie sit amet mattis non, dignissim eget est.  Maecenas vel metus ac elit adipiscing vestibulum. Curabitur gravida  euismod nisi vitae consectetur. Proin in massa sapien, ac bibendum eros.  Proin ipsum ipsum, congue quis dictum eu, egestas nec tellus. Aenean  faucibus lectus non turpis rhoncus molestie. Integer cursus augue et  ante malesuada eu lacinia est lacinia. Nunc tincidunt venenatis urna in  laoreet. Nulla molestie venenatis risus id fringilla. Donec vestibulum  felis eu turpis tincidunt in scelerisque nunc euismod. Vestibulum vitae  gravida ante. Proin convallis nibh sed enim ullamcorper mattis.</p>\r\n<p>Vestibulum eget lectus in sem interdum cursus. Sed scelerisque  consectetur magna et sodales. Morbi cursus posuere eleifend. Donec eget  ultricies eros. Duis laoreet auctor est, at tempor eros luctus id.  Vestibulum ac urna turpis, ac tincidunt erat. Fusce ac venenatis quam.  Quisque porta pharetra tincidunt. Duis risus felis, lacinia sit amet  tempus vitae, eleifend ac lorem. In hac habitasse platea dictumst. Nulla  euismod lectus nec nunc cursus adipiscing. Etiam suscipit nisl a mauris  tempus scelerisque. Donec eu nunc in ligula sollicitudin egestas sit  amet auctor mi. Mauris in dui vitae magna porta hendrerit vel nec risus.  Curabitur at leo quis tortor pharetra tristique vitae in augue.</p>\r\n<p></p></div><a href=\"/articulo/tecnologia/lorem_ipsum_dolor_sit_amet/\" title=\"Sigue Leyendo\">Sigue leyendo...</a>',4,'2010-09-12 19:35:41',1,0,0,0,0);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulo_etiqueta`
--

DROP TABLE IF EXISTS `articulo_etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulo_etiqueta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articulo_id` int(11) NOT NULL,
  `etiqueta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo_etiqueta`
--

LOCK TABLES `articulo_etiqueta` WRITE;
/*!40000 ALTER TABLE `articulo_etiqueta` DISABLE KEYS */;
INSERT INTO `articulo_etiqueta` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `articulo_etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulo_me_gusta`
--

DROP TABLE IF EXISTS `articulo_me_gusta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulo_me_gusta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articulo_id` int(11) NOT NULL,
  `me_gusta` tinyint(1) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo_me_gusta`
--

LOCK TABLES `articulo_me_gusta` WRITE;
/*!40000 ALTER TABLE `articulo_me_gusta` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulo_me_gusta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `estado` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Música','musica',1),(2,'Cine','cine',1),(4,'Tecnología','tecnologia',1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` text NOT NULL,
  `estado` int(11) NOT NULL,
  `creado_at` datetime DEFAULT NULL,
  `autor` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `articulo_id` int(11) NOT NULL,
  `aprobado` tinyint(1) NOT NULL,
  `me_gusta` int(11) DEFAULT '0',
  `no_megusta` int(11) DEFAULT '0',
  `comentario_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`articulo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'Este es el primer comentario que dejamos por aqui,este si debe pasar.',1,'2010-09-12 20:56:34','Henry Stivens','henry.stivens@gmail.com','http://twitter.com/henrystivens',1,1,0,0,0);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario_me_gusta`
--

DROP TABLE IF EXISTS `comentario_me_gusta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario_me_gusta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario_id` int(11) NOT NULL,
  `me_gusta` tinyint(1) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario_me_gusta`
--

LOCK TABLES `comentario_me_gusta` WRITE;
/*!40000 ALTER TABLE `comentario_me_gusta` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario_me_gusta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concurso`
--

DROP TABLE IF EXISTS `concurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concurso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(250) NOT NULL,
  `apellidos` varchar(250) NOT NULL,
  `cedula` varchar(100) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `celular` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `registrado_at` datetime NOT NULL,
  `campana` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concurso`
--

LOCK TABLES `concurso` WRITE;
/*!40000 ALTER TABLE `concurso` DISABLE KEYS */;
INSERT INTO `concurso` VALUES (1,'Henry Stivens','Adarme Muñoz','14704804','Calle 74 28-61','2742174','3172210555','henry.stivens@gmail.com','1985-11-07','2010-05-02 09:38:36','root+co'),(2,'Henry Stivens','Adarme Muñoz','14704803','Calle 74 28-61','2742174','3172210555','henry.stivens@gmail.com',NULL,'2010-05-02 09:50:22','root+co');
/*!40000 ALTER TABLE `concurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlador`
--

DROP TABLE IF EXISTS `controlador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlador` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `perfil_id` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `controllers_perfiles_fk` (`perfil_id`),
  KEY `controllers_menus_fk` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlador`
--

LOCK TABLES `controlador` WRITE;
/*!40000 ALTER TABLE `controlador` DISABLE KEYS */;
INSERT INTO `controlador` VALUES (1,9,'Ver artículos',1,'A','admin/articulo'),(2,9,'Crear artículo',1,'A','admin/articulo/create'),(3,9,'Ver etiquetas',1,'A','admin/etiqueta'),(4,9,'Ver categorías',1,'A','admin/categoria'),(5,9,'Crear categoria',1,'A','admin/categoria/create'),(6,10,'Listar Flickr',1,'A','admin/flickr_set'),(7,10,'Nueva Flickr',1,'A','admin/flickr_set/create'),(8,9,'Lista de artículos',4,'A','admin/articulo/index'),(9,9,'Crear artículo',4,'A','admin/articulo/create'),(10,9,'Ver artículos',3,'A','admin/articulo/index'),(11,9,'Crear artículo',3,'A','admin/articulo/create/');
/*!40000 ALTER TABLE `controlador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiqueta`
--

DROP TABLE IF EXISTS `etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etiqueta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
INSERT INTO `etiqueta` VALUES (1,'lorem','lorem'),(2,'vulputate','vulputate');
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flickr_set`
--

DROP TABLE IF EXISTS `flickr_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flickr_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `set_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `titulo` varchar(120) CHARACTER SET latin1 NOT NULL,
  `descripcion_corta` varchar(144) CHARACTER SET latin1 NOT NULL,
  `contenido` text CHARACTER SET latin1 NOT NULL,
  `slug` varchar(120) CHARACTER SET latin1 NOT NULL,
  `creado_at` datetime NOT NULL,
  `editado_in` datetime DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flickr_set`
--

LOCK TABLES `flickr_set` WRITE;
/*!40000 ALTER TABLE `flickr_set` DISABLE KEYS */;
INSERT INTO `flickr_set` VALUES (1,'72157624027682046','Hugo Puentes - Coleccion Ecofashion 2010','Hugo Puentes - Coleccion Ecofashion 2010','<p>Hugo Puentes - Coleccion Ecofashion 2010, Los mas llamativos diseños siemore a la vanguardia.</p>','hugo-puentes-coleccion-ecofashion-2010','2010-05-10 21:16:26','2010-05-12 14:05:58',1);
/*!40000 ALTER TABLE `flickr_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Controladores','Administra los Controladores'),(2,'Usuarios','Administra Usuarios'),(3,'Menus','Administra Menus'),(4,'Perfiles','Administra Perfiles'),(5,'Kublog','Administrar KuBlog'),(6,'Comentario','Administra Comentarios'),(7,'Admin','Menu Administrativo'),(8,'Etiqueta','Administrar Etiquetas'),(9,'Articulos','Administrar Articulos'),(10,'Flickr set','Galeria flickr');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'administrador'),(2,'editor'),(3,'autor'),(4,'colaborador');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `perfil_id` int(10) NOT NULL,
  `status` char(1) NOT NULL,
  `nombre` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_login` (`login`),
  KEY `perfiles_usuarios_fk` (`perfil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','deivinsontejeda@kumbiaphp.com','7c4a8d09ca3762af61e59520943dc26494f8941b',1,'A','admin'),(2,'invitado','','0c0438a2d770051789cbafdd47fe25a9d7f74587',2,'A','invitado'),(3,'colaborador','colaborador@domain.com','7c4a8d09ca3762af61e59520943dc26494f8941b',4,'A','Henry');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-09-14  9:57:28
