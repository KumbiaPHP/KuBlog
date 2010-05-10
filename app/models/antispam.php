<?php
// Incluye el fichero con la libreria
require_once APP_PATH. '/libs/Akismet.php';

class Antispam {
	/**
	* Comprueba si es correcto el valor introducido por el usuario,
	* de lo contrario lanza una excepción de tipo KumbiaException
	*
	* @param author_name
	* @param author_email
	* @param author_url
	* @param content
	*
	* @return boolean
	*/
	public function esSpam($author_name, $author_email, $author_url = null, $comment) {
		$_AkismetKey  = "2e576a4ce7f9";
		$_AkismetURL  = "kublog.gmbros.net";

		$akismet = new Akismet($_AkismetURL, $_AkismetKey);
		$akismet->setCommentAuthor($author_name);
		$akismet->setCommentAuthorEmail($author_email);
		$akismet->setCommentAuthorURL($author_url);
		$akismet->setCommentContent($comment);
 
		return $akismet->isCommentSpam();
	}
}
?>
