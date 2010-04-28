-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version   5.0.51a-24+lenny3


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema noticias
--

CREATE DATABASE IF NOT EXISTS noticias;
USE noticias;

--
-- Definition of table `noticias`.`articulo`
--

DROP TABLE IF EXISTS `noticias`.`articulo`;
CREATE TABLE  `noticias`.`articulo` (
  `id` int(10) NOT NULL auto_increment,
  `contenido` text,
  `titulo` varchar(255) NOT NULL,
  `slug` varchar(200) default NULL,
  `creado_at` datetime NOT NULL,
  `editado_in` datetime default NULL,
  `usuario_id` varchar(100) default NULL,
  `estado` int(11) NOT NULL default '0',
  `resumen` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `noticias`.`articulo`
--

/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
LOCK TABLES `articulo` WRITE;
INSERT INTO `noticias`.`articulo` VALUES  (2,'<p>Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos. Eu sit tincidunt incorrupte definitionem, vis mutat affert percipit cu, eirmod consectetuer signiferumque eu per. In usu latine equidem dolores. Quo no falli viris intellegam, ut fugit veritus placerat per.</p>\r\n<p>Ius id vidit volumus mandamus, vide veritus democritum te nec, ei eos debet libris consulatu. No mei ferri graeco dicunt, ad cum veri accommodare. Sed at malis omnesque delicata, usu et iusto zzril meliore. Dicunt maiorum eloquentiam cum cu, sit summo dolor essent te. Ne quodsi nusquam legendos has, ea dicit voluptua eloquentiam pro, ad sit quas qualisque. Eos vocibus deserunt quaestio ei.</p>\r\n<p>Blandit incorrupte quaerendum in quo, nibh impedit id vis, vel no nullam semper audiam. Ei populo graeci consulatu mei, has ea stet modus phaedrum. Inani oblique ne has, duo et veritus detraxit. Tota ludus oratio ea mel, offendit persequeris ei vim. Eos dicat oratio partem ut, id cum ignota senserit intellegat. Sit inani ubique graecis ad, quando graecis liberavisse et cum, dicit option eruditi at duo. Homero salutatus suscipiantur eum id, tamquam voluptaria expetendis ad sed, nobis feugiat similique usu ex.</p>\r\n<p>Eum hinc argumentum te, no sit percipit adversarium, ne qui puto feugiat persecuti. Odio omnes scripserit ad est, ut vidit lorem maiestatis his, putent mandamus gloriatur ne pro. Oratio iriure rationibus ne his, ad est corrumpit splendide. Ad duo appareat moderatius, ei falli tollit denique eos. Dicant evertitur mei in, ne his deserunt perpetua sententiae, ea sea omnes similique vituperatoribus. Ex mel errem intellegebat comprehensam, vel ad tantas antiopam delicatissimi, tota ferri affert eu nec. Legere expetenda pertinacia ne pro, et pro impetus persius assueverit.</p>','Nueva edición de la noticia','nueva_edicion_de_la_noticia','2010-04-05 23:19:34','2010-04-16 22:43:53','1',1,'<p>Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos. Eu sit tincidunt incorrupte definitionem, vis mutat affert percipit cu, eirmod consectetuer signiferumque eu per. In usu latine equidem dolores. Quo no falli viris intellegam, ut fugit veritus placerat per.</p>\r\n<p>Ius id vidit volumus mandamus, vide veritus democritum te nec, ei eos debet libris consulatu. No mei ferri graeco dicunt, ad cum veri accommodare. Sed at malis omnesque delicata, usu et iusto zzril meliore. Dicunt maiorum eloquentiam cum cu, sit summo dolor essent te. Ne quodsi nusquam legendos has, ea dicit voluptua eloquentiam pro, ad sit quas qualisque. Eos vocibus deserunt quaestio ei.</p>\r\n<p>Blandit incorrupte quaerendum in quo, nibh impedit id vis, vel no nullam semper audiam. Ei populo graeci consulatu mei, has ea stet modus phaedrum. Inani oblique ne has, duo et veritus detraxit. Tota ludus oratio ea mel, offendit persequeris ei vim. Eos dicat oratio partem ut, id cum ignota senserit intellegat. Sit inani ubique graecis ad, quando graecis liberavisse et cum, dicit option eruditi at duo. Homero salutatus suscipiantur eum id, tamquam voluptaria expetendis ad sed, nobis feugiat similique usu ex.</p>\r\n<p>Eum hinc argumentum te, no sit percipit adversarium, ne qui puto feugiat persecuti. Odio omnes scripserit ad est, ut vidit lorem maiestatis his, putent mandamus gloriatur ne pro. Oratio iriure rationibus ne his, ad est corrumpit splendide. Ad duo appareat moderatius, ei falli tollit denique eos. Dicant evertitur mei in, ne his deserunt perpetua sententiae, ea sea omnes similique vituperatoribus. Ex mel errem intellegebat comprehensam, vel ad tantas antiopam delicatissimi, tota ferri affert eu nec. Legere expetenda pertinacia ne pro, et pro impetus persius assueverit.</p>'),
 (4,'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.</p>\r\n<p>Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia.</p>\r\n<p>Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi.</p>','Nueva edición de la noticia 2','nueva_edicion_de_la_noticia_2','2010-04-16 22:58:01','1969-12-31 19:00:00','1',1,'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.</p>\r\n<p>Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia.</p>\r\n<p>Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi.</p>');
UNLOCK TABLES;
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;


--
-- Definition of table `noticias`.`articulo_etiqueta`
--

DROP TABLE IF EXISTS `noticias`.`articulo_etiqueta`;
CREATE TABLE  `noticias`.`articulo_etiqueta` (
  `id` int(11) NOT NULL auto_increment,
  `articulo_id` int(11) NOT NULL,
  `etiqueta_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `noticias`.`articulo_etiqueta`
--

/*!40000 ALTER TABLE `articulo_etiqueta` DISABLE KEYS */;
LOCK TABLES `articulo_etiqueta` WRITE;
INSERT INTO `noticias`.`articulo_etiqueta` VALUES  (3,2,4),
 (4,2,5),
 (5,2,6),
 (6,4,1),
 (7,4,4),
 (8,4,8);
UNLOCK TABLES;
/*!40000 ALTER TABLE `articulo_etiqueta` ENABLE KEYS */;


--
-- Definition of table `noticias`.`comentario`
--

DROP TABLE IF EXISTS `noticias`.`comentario`;
CREATE TABLE  `noticias`.`comentario` (
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
-- Dumping data for table `noticias`.`comentario`
--

/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
LOCK TABLES `comentario` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;


--
-- Definition of table `noticias`.`controlador`
--

DROP TABLE IF EXISTS `noticias`.`controlador`;
CREATE TABLE  `noticias`.`controlador` (
  `id` int(10) NOT NULL auto_increment,
  `menu_id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `perfil_id` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `controllers_perfiles_fk` (`perfil_id`),
  KEY `controllers_menus_fk` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `noticias`.`controlador`
--

/*!40000 ALTER TABLE `controlador` DISABLE KEYS */;
LOCK TABLES `controlador` WRITE;
INSERT INTO `noticias`.`controlador` VALUES  (16,5,'Listar',1,'A','admin/articulo'),
 (17,5,'Nueva',1,'A','admin/articulo/create'),
 (18,8,'Listar',1,'A','admin/etiqueta');
UNLOCK TABLES;
/*!40000 ALTER TABLE `controlador` ENABLE KEYS */;


--
-- Definition of table `noticias`.`etiqueta`
--

DROP TABLE IF EXISTS `noticias`.`etiqueta`;
CREATE TABLE  `noticias`.`etiqueta` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `noticias`.`etiqueta`
--

/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
LOCK TABLES `etiqueta` WRITE;
INSERT INTO `noticias`.`etiqueta` VALUES  (1,'Default','Default'),
 (2,'11','11'),
 (3,'12','12'),
 (4,'lorem','lorem'),
 (5,'texto','texto'),
 (6,'prueba','prueba'),
 (7,'noticias','noticias'),
 (8,'henry','henry');
UNLOCK TABLES;
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;


--
-- Definition of table `noticias`.`menu`
--

DROP TABLE IF EXISTS `noticias`.`menu`;
CREATE TABLE  `noticias`.`menu` (
  `id` int(10) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `noticias`.`menu`
--

/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
LOCK TABLES `menu` WRITE;
INSERT INTO `noticias`.`menu` VALUES  (1,'Controladores','administra los Controladores'),
 (2,'Usuarios','Administra Usuarios'),
 (3,'Menus','Administra Menus'),
 (4,'Perfiles','Administra Perfiles'),
 (5,'kublog','Administrar kublog'),
 (6,'Comentario','Comentario'),
 (7,'Admin','Menu Administrativo'),
 (8,'Etiqueta','Administrar Etiquetas');
UNLOCK TABLES;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


--
-- Definition of table `noticias`.`perfil`
--

DROP TABLE IF EXISTS `noticias`.`perfil`;
CREATE TABLE  `noticias`.`perfil` (
  `id` int(10) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `noticias`.`perfil`
--

/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
LOCK TABLES `perfil` WRITE;
INSERT INTO `noticias`.`perfil` VALUES  (1,'admin'),
 (2,'invitado');
UNLOCK TABLES;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;


--
-- Definition of table `noticias`.`usuario`
--

DROP TABLE IF EXISTS `noticias`.`usuario`;
CREATE TABLE  `noticias`.`usuario` (
  `id` int(10) NOT NULL auto_increment,
  `login` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `perfil_id` int(10) NOT NULL,
  `status` char(1) NOT NULL,
  `nombre` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `unique_login` (`login`),
  KEY `perfiles_usuarios_fk` (`perfil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `noticias`.`usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
LOCK TABLES `usuario` WRITE;
INSERT INTO `noticias`.`usuario` VALUES  (1,'admin','admin@admin.com','202cb962ac59075b964b07152d234b70',1,'A','admin'),
 (2,'invitado','','0c0438a2d770051789cbafdd47fe25a9d7f74587',2,'A','invitado');
UNLOCK TABLES;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
