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
/**
 * @see ArticuloEtiqueta
 */
//include_once APP_PATH.'models/posts_tags.php';

class ArticuloEtiqueta extends ActiveRecord {
    /**
     * Guarda las etiquetas de un articulo
     * @param $etiquetas int
     * @param $articulo_id int     
     * @return bool
     */
    public function addTagsPost ($etiquetas = null, $articulo_id = null) {
        //verificando que tenga etiquetas
        if($etiquetas) {
            $etiquetas = explode(',', $etiquetas);
            foreach ($etiquetas as $tag) {
                $etiqueta = new Etiqueta();
                $etiqueta->name = $tag;
                $etiqueta->url = strtr($tag, ' ', '-');
                $etiqueta->save();

                $articulo_etiqueta = new ArticuloEtiqueta();
                $articulo_etiqueta->articulo_id = $articulo_id;
                $articulo_etiqueta->etiqueta_id = $etiqueta->id;
                $articulo_etiqueta->save();
            }
            return true;//TODO Hacia falta retornar verdadero
        }
        return false;
    }
    /**
     * Elimina una etiqueta de un artículo
     *
     * @param int $articulo_id
     * @param string $nombre
     * @return bool
     */
    public function delTagByPost($articulo_id=null, $nombre=null) {
        $etiqueta = new Etiqueta();
        $etiqueta_id = $etiqueta->getIdByName($nombre);
        $this->find_first("conditions: articulo_id=$articulo_id AND etiqueta_id=$etiqueta_id");
        return $this->delete($this->id);
    }
    /**
     * Obtiene un conteo de las etiquetas utilizadas
     *
     * @param int $etiqueta_id
     */
    public function countTags($etiqueta_id=null) {
        return $this->count("etiqueta_id=$etiqueta_id");
    }
    /**
     * Run CallBack
     *
     */
    public function before_save() {
        if($this->find_first("conditions: articulo_id=$this->articulo_id AND etiqueta_id=$this->etiqueta_id")) {
            return 'cancel';
        }
    }
    public function after_save () {

    }

    public function after_delete() {

    }
}