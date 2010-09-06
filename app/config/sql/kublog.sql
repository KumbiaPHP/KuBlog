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
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (2,'<p>Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos. Eu sit tincidunt incorrupte definitionem, vis mutat affert percipit cu, eirmod consectetuer signiferumque eu per. In usu latine equidem dolores. Quo no falli viris intellegam, ut fugit veritus placerat per.</p>\r\n<p><!-- pagebreak --></p>\r\n<p>Ius id vidit volumus mandamus, vide veritus democritum te nec, ei eos debet libris consulatu. No mei ferri graeco dicunt, ad cum veri accommodare. Sed at malis omnesque delicata, usu et iusto zzril meliore. Dicunt maiorum eloquentiam cum cu, sit summo dolor essent te. Ne quodsi nusquam legendos has, ea dicit voluptua eloquentiam pro, ad sit quas qualisque. Eos vocibus deserunt quaestio ei.</p>\r\n<p>Blandit incorrupte quaerendum in quo, nibh impedit id vis, vel no nullam semper audiam. Ei populo graeci consulatu mei, has ea stet modus phaedrum. Inani oblique ne has, duo et veritus detraxit. Tota ludus oratio ea mel, offendit persequeris ei vim. Eos dicat oratio partem ut, id cum ignota senserit intellegat. Sit inani ubique graecis ad, quando graecis liberavisse et cum, dicit option eruditi at duo. Homero salutatus suscipiantur eum id, tamquam voluptaria expetendis ad sed, nobis feugiat similique usu ex.</p>\r\n<p>Eum hinc argumentum te, no sit percipit adversarium, ne qui puto feugiat persecuti. Odio omnes scripserit ad est, ut vidit lorem maiestatis his, putent mandamus gloriatur ne pro. Oratio iriure rationibus ne his, ad est corrumpit splendide. Ad duo appareat moderatius, ei falli tollit denique eos. Dicant evertitur mei in, ne his deserunt perpetua sententiae, ea sea omnes similique vituperatoribus. Ex mel errem intellegebat comprehensam, vel ad tantas antiopam delicatissimi, tota ferri affert eu nec. Legere expetenda pertinacia ne pro, et pro impetus persius assueverit.</p>','Nueva edición de la noticia','nueva_edicion_de_la_noticia','2010-04-05 23:19:34','2010-09-05 12:03:24','1',1,'<p>Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos. Eu sit tincidunt incorrupte definitionem, vis mutat affert percipit cu, eirmod consectetuer signiferumque eu per. In usu latine equidem dolores. Quo no falli viris intellegam, ut fugit veritus placerat per.</p>\r\n<p></p><a href=\"/articulo/eventos/nueva_edicion_de_la_noticia/\" title=\"Sigue Leyendo\">Sigue leyendo...</a>',1),(4,'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>\r\n<p><!-- pagebreak --></p>\r\n<p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.</p>\r\n<p> </p>\r\n<p>Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia.</p>\r\n<p>Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi.</p>','Nueva edición de la noticia 2','nueva_edicion_de_la_noticia_2','2010-04-16 22:58:01','2010-09-05 12:03:16','1',1,'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>\r\n<p></p><a href=\"/articulo/concursos/nueva_edicion_de_la_noticia_2/\" title=\"Sigue Leyendo\">Sigue leyendo...</a>',2),(5,'<p>Otra entrada para probar la carga automatica de los usuarios, ahora la editamos.</p>','Otra entrada para probar','otra_entrada_para_probar','2010-04-17 10:51:25','2010-09-05 12:03:02','1',1,'<p>Otra entrada para probar la carga automatica de los usuarios, ahora la editamos.</p>',1),(6,'<p>Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan  euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur,  quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu,  legimus senserit definiebas an eos. Eu sit tincidunt incorrupte  definitionem, vis mutat affert percipit cu, eirmod consectetuer  signiferumque eu per. In usu latine equidem dolores. Quo no falli viris  intellegam, ut fugit veritus placerat per.</p>\r\n<p>Ius id vidit volumus mandamus, vide veritus democritum te nec, ei eos  debet libris consulatu. No mei ferri graeco dicunt, ad cum veri  accommodare. Sed at malis omnesque delicata, usu et iusto zzril meliore.  Dicunt maiorum eloquentiam cum cu, sit summo dolor essent te. Ne quodsi  nusquam legendos has, ea dicit voluptua eloquentiam pro, ad sit quas  qualisque. Eos vocibus deserunt quaestio ei.</p>\r\n<p>Blandit incorrupte quaerendum in quo, nibh impedit id vis, vel no  nullam semper audiam. Ei populo graeci consulatu mei, has ea stet modus  phaedrum. Inani oblique ne has, duo et veritus detraxit. Tota ludus  oratio ea mel, offendit persequeris ei vim. Eos dicat oratio partem ut,  id cum ignota senserit intellegat. Sit inani ubique graecis ad, quando  graecis liberavisse et cum, dicit option eruditi at duo. Homero  salutatus suscipiantur eum id, tamquam voluptaria expetendis ad sed,  nobis feugiat similique usu ex.</p>\r\n<p><!-- pagebreak --></p>\r\n<p>Eum hinc argumentum te, no sit percipit adversarium, ne qui feugiat  persecuti. Odio omnes scripserit ad est, ut vidit lorem maiestatis his,  putent mandamus gloriatur ne pro. Oratio iriure rationibus ne his, ad  est corrumpit splendide. Ad duo appareat moderatius, ei falli tollit  denique eos. Dicant evertitur mei in, ne his deserunt perpetua  sententiae, ea sea omnes similique vituperatoribus. Ex mel errem  intellegebat comprehensam, vel ad tantas antiopam delicatissimi, tota  ferri affert eu nec. Legere expetenda pertinacia ne pro, et pro impetus  persius assueverit.</p>\r\n<p>Ea mei nullam facete, omnis oratio offendit ius cu. Doming takimata  repudiandae usu an, mei dicant takimata id, pri eleifend inimicus  euripidis at. His vero singulis ea, quem euripidis abhorreant mei ut, et  populo iriure vix. Usu ludus affert voluptaria ei, vix ea error  definitiones, movet fastidii signiferumque in qui.</p>\r\n<p>Vis prodesset adolescens adipiscing te, usu mazim perfecto recteque  at, assum putant erroribus mea in. Vel facete imperdiet id, cum an  libris luptatum perfecto, vel fabellas inciderint ut. Veri facete  debitis ea vis, ut eos oratio erroribus. Sint facete perfecto no vel,  vim id omnium insolens. Vel dolores perfecto pertinacia ut, te mel meis  ullum dicam, eos assum facilis corpora in.</p>\r\n<p>Mea te unum viderer dolores, nostrum detracto nec in, vis no partem  definiebas constituam. Dicant utinam philosophia has cu, hendrerit  prodesset at nam, eos an bonorum dissentiet. Has ad placerat intellegam  consectetuer, no adipisci mandamus senserit pro, torquatos similique  percipitur est ex. Pro ex putant deleniti repudiare, vel an aperiam  sensibus suavitate. Ad vel epicurei convenire, ea soluta aliquid  deserunt ius, pri in errem putant feugiat.</p>\r\n<p>Sed iusto nihil populo an, ex pro novum homero cotidieque. Te utamur  civibus eleifend qui, nam ei brute doming concludaturque, modo aliquam  facilisi nec no. Vidisse maiestatis constituam eu his, esse pertinacia  intellegam ius cu. Eos ei odio veniam, eu sumo altera adipisci eam, mea  audiam prodesset persequeris ea. Ad vitae dictas vituperata sed, eum  posse labore postulant id. Te eligendi principes dignissim sit, te vel  dicant officiis repudiandae.</p>\r\n<p>Id vel sensibus honestatis omittantur, vel cu nobis commune  patrioque. In accusata definiebas qui, id tale malorum dolorem sed,  solum clita phaedrum ne his. Eos mutat ullum forensibus ex, wisi  perfecto urbanitas cu eam, no vis dicunt impetus. Assum novum in pri,  vix an suavitate moderatius, id has reformidans referrentur. Elit  inciderint omittantur duo ut, dicit democritum signiferumque eu est, ad  suscipit delectus mandamus duo. An harum equidem maiestatis nec.</p>\r\n<p>At has veri feugait placerat, in semper offendit praesent his. Omnium  impetus facilis sed at, ex viris tincidunt ius. Unum eirmod dignissim id  quo. Sit te atomorum quaerendum neglegentur, his primis tamquam et. Eu  quo quot veri alienum, ea eos nullam luptatum accusamus. Ea mel causae  phaedrum reprimique, at vidisse dolores ocurreret nam.</p>','México es Miss Universo 2010-2011','mexico_es_miss_universo_2010_2011','2010-09-05 11:52:35','2010-09-05 12:02:06','1',1,'<p>Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan  euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur,  quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu,  legimus senserit definiebas an eos. Eu sit tincidunt incorrupte  definitionem, vis mutat affert percipit cu, eirmod consectetuer  signiferumque eu per. In usu latine equidem dolores. Quo no falli viris  intellegam, ut fugit veritus placerat per.</p>\r\n<p>Ius id vidit volumus mandamus, vide veritus democritum te nec, ei eos  debet libris consulatu. No mei ferri graeco dicunt, ad cum veri  accommodare. Sed at malis omnesque delicata, usu et iusto zzril meliore.  Dicunt maiorum eloquentiam cum cu, sit summo dolor essent te. Ne quodsi  nusquam legendos has, ea dicit voluptua eloquentiam pro, ad sit quas  qualisque. Eos vocibus deserunt quaestio ei.</p>\r\n<p>Blandit incorrupte quaerendum in quo, nibh impedit id vis, vel no  nullam semper audiam. Ei populo graeci consulatu mei, has ea stet modus  phaedrum. Inani oblique ne has, duo et veritus detraxit. Tota ludus  oratio ea mel, offendit persequeris ei vim. Eos dicat oratio partem ut,  id cum ignota senserit intellegat. Sit inani ubique graecis ad, quando  graecis liberavisse et cum, dicit option eruditi at duo. Homero  salutatus suscipiantur eum id, tamquam voluptaria expetendis ad sed,  nobis feugiat similique usu ex.</p>\r\n<p></p><a href=\"/articulo/concursos/mexico_es_miss_universo_2010_2011/\" title=\"Sigue Leyendo\">Sigue leyendo...</a>',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo_etiqueta`
--

LOCK TABLES `articulo_etiqueta` WRITE;
/*!40000 ALTER TABLE `articulo_etiqueta` DISABLE KEYS */;
INSERT INTO `articulo_etiqueta` VALUES (3,2,4),(4,2,5),(5,2,6),(7,4,4),(8,4,8),(9,5,1),(10,5,9),(11,5,10),(12,6,11),(13,6,13),(14,6,14);
/*!40000 ALTER TABLE `articulo_etiqueta` ENABLE KEYS */;
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
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'eventos',NULL),(2,'concursos',NULL);
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
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`articulo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'Este el comentario',1,'2010-04-19 10:34:22','Henry','henry@gmail.com',NULL,5),(2,'Este es el texto del comentario con saltos de linea y tales.\r\n\r\nmira mira\r\n\r\nAhora si',1,'2010-04-19 10:52:49','Henry','ajsdh@lkasjd.com','www.simacel.com',5),(3,'adlskjdañlks alksjdalsk djalskdjals ñkdj asldkajsd ñlaskjd',1,'2010-04-19 10:54:32','Henry','autor@asd.com',NULL,5),(4,'Este es el comentario',1,'2010-04-24 13:19:53','Henry','asd',NULL,5);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlador`
--

LOCK TABLES `controlador` WRITE;
/*!40000 ALTER TABLE `controlador` DISABLE KEYS */;
INSERT INTO `controlador` VALUES (16,5,'Listar',1,'A','admin/articulo'),(17,5,'Nueva',1,'A','admin/articulo/create'),(18,8,'Listar',1,'A','admin/etiqueta'),(19,5,'Listar Categoria',1,'A','admin/categoria'),(20,5,'Nueva Categoria',1,'A','admin/categoria/create'),(21,5,'Listar Flickr',1,'A','admin/flickr_set'),(22,5,'Nueva Flickr',1,'A','admin/flickr_set/create');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
INSERT INTO `etiqueta` VALUES (1,'Default','Default'),(2,'11','11'),(3,'12','12'),(4,'lorem','lorem'),(5,'texto','texto'),(6,'prueba','prueba'),(7,'noticias','noticias'),(8,'henry','henry'),(9,'borrador','borrador'),(10,'usuarios','usuarios'),(11,'noticia','noticia'),(12,'novedad','novedad'),(13,'eventos','eventos'),(14,'reinas','reinas');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Controladores','administra los Controladores'),(2,'Usuarios','Administra Usuarios'),(3,'Menus','Administra Menus'),(4,'Perfiles','Administra Perfiles'),(5,'Kublog','Administrar KuBlog'),(6,'Comentario','Comentario'),(7,'Admin','Menu Administrativo'),(8,'Etiqueta','Administrar Etiquetas');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'admin'),(2,'invitado');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','deivinsontejeda@kumbiaphp.com','e10adc3949ba59abbe56e057f20f883e',1,'A','admin'),(2,'invitado','','0c0438a2d770051789cbafdd47fe25a9d7f74587',2,'A','invitado');
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

-- Dump completed on 2010-09-05 12:05:41
