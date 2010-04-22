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
Load::model('articulo_etiqueta');//TODO o es mejor un include_once?
class Etiqueta extends ActiveRecord {
    /**
     * Obtiene una etiqueta dado su name
     *
     * @param string $name
     * @return ResultSet
     */
    public function getTagByName($name=null) {
        $name = filter_var($name, FILTER_SANITIZE_STRING);
        return $this->find_first("conditions: name=\"$name\"");
    }
    /**
     * Obtiene las etiquetas de un artículo
     *
     * @param int $articulo_id
     * @return ResultSet
     */
    public function getTagByPost($articulo_id=null) {
        return $this->find_all_by_sql("SELECT e.name, e.url FROM etiqueta e
                LEFT JOIN articulo_etiqueta ae ON ae.articulo_id = $articulo_id
                where e.id = ae.etiqueta_id");
    }
    /**
     * Obtiene el id de una etiqueta
     *
     * @param string $tagName
     * @return int
     */
    public function getIdByName($name=null) {
        $this->find_first("name=\"$name\"");
        return $this->id;
    }
    /**
     * Obtiene todas las etiquetas
     */
    public function getAll() {
        $etiquetas = array();
        foreach ($this->find() as $tag) {
            $articulo_etiqueta = new ArticuloEtiqueta();
            $etiquetas[] = array('name'=>$tag->name, 'url'=>$tag->url, 'count'=>$articulo_etiqueta->countTags($tag->id));
        }
        return $etiquetas;
    }
    /**
     * Callback
     *
     * @return resulset
     */
    public function after_save() {

    }
    /**
     * Callback
     *
     * @return resulset
     */
    public function before_save() {
        if($this->find_first("name = \"$this->name\"")) {
            return 'cancel';
        }
    }
}
