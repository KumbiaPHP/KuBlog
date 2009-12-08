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
  `url_title` varchar(200) default NULL,
  `creation_at` datetime NOT NULL,
  `edited_in` datetime default NULL,
  `author` varchar(100) default NULL,
  `status` int(11) NOT NULL,
  `summary` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `url_title` (`url_title`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`post`
--

/*!40000 ALTER TABLE `post` DISABLE KEYS */;
LOCK TABLES `post` WRITE;
INSERT INTO `post` VALUES  (1,'<p>Los enlaces y las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> requieren de un tratamiento especial en cualquier framework para aplicaciones web. El motivo es que la definiciÃ³n de un Ãºnico punto de entrada a la aplicaciÃ³n y el uso de <em>helpers</em> en las vistas (Views), permiten separar completamente el funcionamiento y el aspecto de las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym>. Este mecanismo se conoce como \\\"enrutamiento\\\" (del inglÃ©s <em>\\\"routing\\\"</em>). El enrutamiento mas que ser una utilidad curiosa, es una herramienta muy Ãºtil para hacer las aplicaciones web mÃ¡s fÃ¡ciles de usar y mÃ¡s seguras.</p>\r\n<p><!-- pagebreak --> El enrutamiento es un mecanismo que reescribe las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> para simplificar su aspecto. Antes de poder comprender su importancia, es necesario dedicar unos minutos al estudio de las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> de las aplicaciones web.</p>\r\n<h3>Ejecutando Acciones en el Servidor mediante URL.</h3>\r\n<p>Las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> se encargan de enviar la informaciÃ³n desde el navegador hasta el servidor. Las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> tradicionales incluyen la ruta hasta del <em>script</em> del servidor y algunos parÃ¡metros necesarios para completar la peticiÃ³n, como se muestra en el siguiente:</p>\r\n<pre>http://www.dominio.com/controlador/noticia.php?id=123456<br /></pre>\r\n<p>La URL anterior revela informacion sobre la arquitectura interna de la aplicacion incluso de la BD, esto es algo que todo desarrollador de software debe evitar, veamos los detalles tecnicos:</p>\r\n<ul>\r\n<li>En la URL anterior, Â¿que pasaria si un usuario malicioso (6) cambia el valor del parametro <span style=\\\"color: #0000ff;\\\">id</span>? Â¿Supone este caso que la aplicaciÃ³n ofrece una interfaz directa a la base de datos?, lo que intento decir que con esta URL nos podemos poner muy \\\"<em>exoterico</em>\\\", volviendose casi <strong><em>imposible aplicar seguridad</em></strong>.</li>\r\n<li>Una URL como la anterior es muy dificil de leer, y estas no solo se muestran en la barra de direcciones de los browser, ademas son las que se indexan en los principales buscadores cuando los usuarios buscan informacion, por eso es mas simple ofrecer URL sencillas para que sean entendibles.</li>\r\n<li>Si se modifica una <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> (porque cambia el nombre del script u otra cosa), se deben modificar todos los enlaces a esa <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> (esto trae consecuencias <em>terrorificas</em>). De esta forma, las modificaciones en la estructura del controlador son muy pesadas y costosas, lo que contradice la filosofÃ­a del desarrollo <em>Ã¡gil de aplicaciones</em>.</li>\r\n</ul>\r\n<h3>La URL como Interfaz.<br /></h3>\r\n<p>Una de las ideas del sistema de enrutamiento es utilizar las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> como parte de la interfaz. Las aplicaciones trasladan informaciÃ³n al usuario mediante el formateo de las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> y el usuario puede utilizar las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> para acceder a los recursos de la aplicaciÃ³n.</p>\r\n<p>Esto es posible en KumbiaPHP porque la <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> no guarda necesariamente relacion con las instrucciones del servidor.  En su lugar, la <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> estÃ¡ relacionada con el recurso solicitado, y su aspecto puede configurarse libremente de manera muy facil.</p>\r\n<pre>http://cachi.temiga.org/noticias/enrutamiento_en_kumbiaphp/</pre>\r\n<p>Esta URL tiene muchas ventajas:</p>\r\n<ul>\r\n<li>Las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> tienen significado y ayudan a los usuarios a decidir si la pÃ¡gina que se cargarÃ¡ al pulsar sobre un enlace contiene lo que esperan. Un enlace puede contener detalles adicionales sobre el recurso que enlaza.</li>\r\n</ul>\r\n<p style=\\\"text-align: center;\\\"><img style=\\\"border: 0pt none;\\\" title=\\\"SEO URL Amigable de KumbiaPHP\\\" src=\\\"../../../../img/upload/url-enrutamoento-kumbiaphp.png\\\" alt=\\\"\\\" width=\\\"593\\\" height=\\\"129\\\" /></p>\r\n<ul>\r\n<li>Se puede modificar el aspecto de la <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> y el del nombre de la acciÃ³n o de los parÃ¡metros de forma independiente y con una sola modificaciÃ³n.</li>\r\n<li>Aunque se modifique la estructura interna de la aplicaciÃ³n, las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> pueden mantener su mismo aspecto hacia el exterior.</li>\r\n<li>Son mÃ¡s seguras. Cualquier <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> no reconocida se redirige a una pÃ¡gina especificada por el programador y los usuarios no pueden navegar por el directorio raÃ­z del servidor mediante la prueba de diferentes <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym>.</li>\r\n</ul>\r\n<h3>Veamos como funciona.</h3>\r\n<p>Como hemos hablado KumbiaPHP no guarda relacion con las URL externas y las <acronym title=\\\"Uniform Resource Identifier\\\">URI</acronym> utilizadas internamente (ya conocemos algunas ventajas) la corresponsabilidad entre ambas es trabajo del Sistema de Enrutamiento (Router), esto se simplifica utilizando una sintaxis para <acronym title=\\\"Uniform Resource Identifier\\\">URI</acronym> internas muy parecidas a las externas, ejemplo:</p>\r\n<pre>; URI Interna<br />/articulos/* = controller/action/*<br /><br />; NOTA controller y action respresentan quienes se encargaran de atender esa regla<br /><br />;URL externa tendra esta forma<br />; http://www.dominio.com/articulos/una_noticia_cualquiera/<br /></pre>\r\n<p>El sistema de enrutamiento utiliza un archivo de configuraciÃ³n, llamado <code>routes.ini</code>, en el que se pueden definir las reglas de enrutamiento. Si se considera la regla mostrada arriba, se define un patrÃ³n cuyo aspecto es <strong><code>articulos/*</code></strong>.</p>\r\n<p>Todas las peticiones realizadas KumbiaPHP son analizadas en primer lugar por el sistema de enrutamiento. El sistema de enrutamiento busca coincidencias entre la <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> de la peticiÃ³n y los patrones definidos en las reglas de enrutamiento estatico. Si se produce una coincidencia, las partes del patrÃ³n que tienen nombre se transforman en parÃ¡metros de la peticiÃ³n y se juntan como parametros de la accion del controller.</p>\r\n<pre>// El usuario solicita la siguiente URL externa<br />http://www.dominio.com/articulos/una_noticia_cualquiera/<br /><br />// El Router comprueba que coincide con la regla /articulos/*<br />// El sistema de enrutamiento crea los siguientes parÃ¡metros de la peticiÃ³n<br />  \\\'module\\\'  =&gt; \\\'null\\\'<br />  \\\'controller\\\'  =&gt; \\\'controller\\\'<br />  \\\'action\\\'  =&gt; \\\'action\\\'<br />  \\\'paramater\\\'    =&gt; \\\'una_noticia_cualquiera\\\'<br /></pre>\r\n<p>Luego que se descompone la URL, se pasa al controller \\\"<em>controller</em>\\\" y action \\\"<em>action</em>\\\" que recibe un parametro con el valor \\\"<em>una_noticia_cualquiera</em>\\\", que internamente hara lo necesario para obtener esa noticia solicitada.</p>\r\n<pre>class ControllerController extend ApplicationController <br />{<br />    //mÃ©todo al cual se enruta<br />    public function action  ($noticia){<br />        echo $noticia; //salida una_noticia_cualquiera    <br />   }<br />}</pre>\r\n<h3>Conclusiones.<br /></h3>\r\n<p>Â¿Que esperas para utilizar el Router de <a title=\\\"KumbiaPHP Framework\\\" href=\\\"http://www.kumbiaphp.com/\\\" target=\\\"_blank\\\">KumbiaPHP</a>?...</p>\r\n<ul>\r\n</ul>','Enrutamiento en KumbiaPHP','enrutamiento_en_kumbiaphp','2009-09-12 22:41:24','2009-09-13 19:25:04','CaChi',1,'<p>Los enlaces y las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym> requieren de un tratamiento especial en cualquier framework para aplicaciones web. El motivo es que la definiciÃ³n de un Ãºnico punto de entrada a la aplicaciÃ³n y el uso de <em>helpers</em> en las vistas (Views), permiten separar completamente el funcionamiento y el aspecto de las <acronym title=\\\"Uniform Resource Locator\\\">URL</acronym>. Este mecanismo se conoce como \\\"enrutamiento\\\" (del inglÃ©s <em>\\\"routing\\\"</em>). El enrutamiento mas que ser una utilidad curiosa, es una herramienta muy Ãºtil para hacer las aplicaciones web mÃ¡s fÃ¡ciles de usar y mÃ¡s seguras.</p>\r\n<p></p><a href=\"/noticias/enrutamiento_en_kumbiaphp/\" title=\"Sigue Leyendo\">Sigue Leyendo...</a>');
UNLOCK TABLES;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;


--
-- Definition of table `blog`.`posts_tags`
--

CREATE TABLE  `posts_tags` (
  `id` int(11) NOT NULL auto_increment,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`posts_tags`
--

/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
LOCK TABLES `posts_tags` WRITE;
INSERT INTO `posts_tags` VALUES  (1,2,1),
 (2,2,2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;


--
-- Definition of table `blog`.`tags`
--

CREATE TABLE  `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`.`tags`
--

/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
LOCK TABLES `tags` WRITE;
INSERT INTO `tags` VALUES  (1,'Default','Default'),
 (2,'kumbiaphp','kumbiaphp');
UNLOCK TABLES;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;


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
