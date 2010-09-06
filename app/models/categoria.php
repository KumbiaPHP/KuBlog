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
    const STATUS_DRAFT=0;
    const STATUS_PUBLISHED=1;
    const STATUS_ARCHIVED=2;

    public $slug = '';
    
    public function initialize () {
        $this->belongs_to('usuario');
    }
    /**
     * Obtiene los últimos artículos (paginados)
     *
     * @param $page int
     * @param $per_page int
     * @param $estado int
     * @return resulset
     */
    public function getLastEntry($page=1, $per_page=4, $estado=Categoria::STATUS_PUBLISHED) {
        return $this->paginate("page: $page",
                "estado=$estado",
                "per_page: $per_page",
                'order: creado_at desc');
    }

    /*
     * TODO Documentar esta funcion
     */
    public static function input($method, $data) {
        $obj = new Categoria($data);
        try {
            $obj->$method();
            //Input::delete('menus'); //TODO ¿por qué menus?
            return $obj;
        } catch (Exception $e) {
            Flash::error('Falló Operación');
        }
        return false;
    }

    /**
     * Obtiene todos los artículos paginados
     *
     * @param int $page
     * @return ResultSet
     */
    public function getAllPost($page=1, $ppage=5) {
        return $this->paginate("page: $page",
                "per_page: $ppage",
                'order: id ');
    }
    /**
     * Obtiene un artículo dado el slug
     *
     * @param string $slug
     */
    public function getEntryBySlug($slug) {
        return $this->find_first("slug='$slug'");
    }
    /**
     * Obtiene los ultimos artículos
     *
     * @param int $limit
     * @return result
     */
    public function getLast($limit=10, $estado=Categoria::STATUS_PUBLISHED) {
        $today = date('Y-m-d H:i:s');
        return $this->find('order: creado_at desc',
                "conditions: creado_at <= \"$today\" AND estado=$estado",
                "limit: $limit");
    }
    /**
     * Realiza una busqueda usando los campos título y contenido
     *
     * @param string $search
     */
    public function search($busqueda) {
        $busqueda = filter_var($busqueda, FILTER_SANITIZE_STRING);
        return $this->find_all_by_sql("SELECT * FROM categoria where nombre like '%$busqueda%' ORDER BY nombre DESC");

    }
    /**
     * Elimina el artículo
     * @param int $id
     */
    public function del($id) {
        $id = filter_var($id, FILTER_SANITIZE_NUMBER_INT);
        //Buscando el Objeto a Borrar
        $obj = $this->find($id);
        if ($obj) {
            if (! $obj->delete()) {
                Flash::error('Falló Operación');
            } else {
                //require_once APP_PATH.'models/posts_tags.php';
                $categoria_etiqueta = new CategoriaEtiqueta();
                //se eliminan las etiquetas que tenía el artículo
                $categoria_etiqueta->delete_all("categoria_id=$obj->id");
                Flash::success('Operación exitosa');
            }
        } else {
            Flash::error('No existe el artículo');
        }
    }
    /**
     * CallBack
     */
    public function before_save() {
        Load::lib('Utils');
        $this->slug = Utils::slug($this->titulo);
        //verifica si se ha utilizado pagebreak
        if(preg_match('/<!-- pagebreak(.*?)?-->/', $this->contenido, $matches)) {
            $matches = explode($matches[0], $this->contenido, 2);
            $this->resumen = Utils::balanceTags($matches[0]).'<a href="'.PUBLIC_PATH.'categoria/'.$this->slug.'/" title="Sigue Leyendo">Sigue leyendo...</a>';//$this->resumen = Utils::balanceTags($matches[0]).'<a href="'.$url.'categoria/'.$this->slug.'/" title="Sigue Leyendo">Sigue Leyendo...</a>';
        } else {
            $this->resumen = $this->contenido;
        }
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
