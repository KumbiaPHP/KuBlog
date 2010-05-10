<?php
/**
 * KBlog - KumbiaPHP Blog
 * PHP version 5
 * LICENSE
 *
 * This source file is subject to the GNU/GPL that is bundled
 * with this package in the file docs/LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to deivinsontejeda@gmail.com so we can send you a copy immediately.
 *
 * @author Deivinson Tejeda <deivinsontejeda@gmail.com>
 * @author Henry Stivens Adarme Muñoz <henry.stivens@gmail.com>
 */
class Comentario extends ActiveRecord {
    const STATUS_PENDING=0;
    const STATUS_APPROVED=1;

    public function initizalize() {
        $this->validates_email_in('email');
    }

    /**
     * Obtiene los comentarios de un artículo
     *
     * @param int $articulo_id
     * @param int $estado
     */
    public function getCommentByPost($articulo_id, $estado=1) {
        return $this->find("articulo_id=$articulo_id and estado=$estado",'order: creado_at desc');
    }
    /**
     * Realiza un conteo de los comentarios
     *
     * @param int $articulo_id
     * @param int $estado
     * @return Resulset
     */
    public function countComment($articulo_id, $estado=1) {
        return $this->count("estado=$estado AND articulo_id=$articulo_id");
    }
    /*
     * Callback
     */
    public function before_validation_on_create(){
        $this->estado = 1;
    }

    public function before_save() {
	Load::Model("antispam");
	$Antispam = new Antispam();

	if ($Antispam->esSpam($this->autor, $this->email, $this->url, $this->comentario))
		return 'cancel';
    }
}
