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
 * @see Cache
 */
Load::lib('cache');
class Categoria extends ActiveRecord {
    const STATUS_INACTIVE=0;
    const STATUS_ACTIVE=1;    
    
    public function initialize () {
        $this->belongs_to('usuario');
    }
    
    /*
     * TODO Documentar esta funcion
     */
    public static function input($method, $data) {
        $obj = new Categoria($data);
        $obj->$method();
        return $obj;
        /*try {
            $obj->$method();
            //Input::delete('menus'); //TODO ¿por qué menus?
            return $obj;
        } catch (Exception $e) {
            Flash::error('Falló Operación');
        }
        return false;*/
    }
    
    /**
     * CallBack
     */
    public function before_save() {
        
    }
    public function after_create() {
        //eliminando cache de noticias recientes
        //Cache::remove('noticias/recientes', 'kumbia.partials');
    }
    public function after_update() {
        //Cache::clean("post.ver.$this->slug");
    }
    public function after_delete() {
        parent::after_delete();
        //eliminando la cache depues que un post/noticia es borrado
        //de noticias recientes
        if($this->estado == self::STATUS_PUBLISHED) {
            //Cache::remove('noticias/recientes', 'kumbia.partials');
        }
    }
}
