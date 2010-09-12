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
Load::models('perfil');
class Articulo extends ActiveRecord {
    const STATUS_DRAFT=0;
    const STATUS_PUBLISHED=1;
    const STATUS_ARCHIVED=2;
    const STATUS_PENDING=3;

    public $slug = '';

    public function initialize() {
        $this->belongs_to('usuario');
        $this->belongs_to('categoria');
    }

    /**
     * Obtiene los últimos artículos (paginados)
     *
     * @param $page int
     * @param $per_page int
     * @param $estado int
     * @return resulset
     */
    public function getLastEntry($page=1, $per_page=4, $estado=Articulo::STATUS_PUBLISHED) {
        return $this->paginate("page: $page",
                "estado=$estado",
                "per_page: $per_page",
                'order: creado_at desc');
    }

    /*
     * TODO Documentar esta funcion
     */

    public static function input($method, $data) {
        $obj = new Articulo($data);
        //Si el articulo es por primera vez publicado
        //se modifica la fecha de publicación        
        if (($obj->fecha_publicacion == '0000-00-00 00:00:00' ||
                $obj->fecha_publicacion == '1969-12-31 19:00:00') &&
                $obj->estado == 1) {
            $obj->fecha_publicacion = date("Y-m-d H:i:s");
        }

        $obj->$method();

        return $obj;

        /* if($obj->$method()){
          return $obj;
          }

          return false; */
        /* try {
          $obj->$method();
          //Input::delete('menus'); //TODO ¿por qué menus?
          return $obj;
          } catch (Exception $e) {
          Flash::error('Error creando/actualizando el artículo');
          }
          return false; */
    }

    /**
     * Obtiene todos los artículos paginados
     *
     * @param int $page
     * @return ResultSet
     */
    public function getAllPost($page=1, $ppage=10, $estado=null) {
        //Obtiene el usuario
        $user = Load::model('usuario')->getUserLogged();
        //Si el usuario es Administrador, lista todos los artículos
        if ($user->hasProfile(Perfil::ADMINISTRADOR) || $user->hasProfile(Perfil::EDITOR)) {
            if ($estado == null) {
                return $this->paginate("page: $page",
                        "per_page: $ppage",
                        'order: creado_at desc');
            } else {
                return $this->paginate("conditions: estado={$estado}",
                        "page: $page",
                        "per_page: $ppage",
                        'order: creado_at desc');
            }
        } else {
            if ($estado == null) {
                return $this->paginate("conditions: usuario_id={$user->id}",
                        "page: $page",
                        "per_page: $ppage",
                        'order: creado_at desc');
            } else {
                return $this->paginate("conditions: usuario_id={$user->id} ".
                        "AND estado={$estado}",
                        "page: $page",
                        "per_page: $ppage",
                        'order: creado_at desc');
            }
        }
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
    public function getLast($limit=10, $estado=Articulo::STATUS_PUBLISHED) {
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
        return $this->find_all_by_sql("SELECT * FROM articulo a where a.titulo like '%$busqueda%'
                                        OR a.contenido like '%$busqueda%' ORDER BY creado_at DESC");
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
            if (!$obj->delete()) {
                Flash::error('Falló Operación');
            } else {
                //require_once APP_PATH.'models/posts_tags.php';
                $articulo_etiqueta = new ArticuloEtiqueta();
                //se eliminan las etiquetas que tenía el artículo
                $articulo_etiqueta->delete_all("articulo_id=$obj->id");
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
        if (preg_match('/<!-- pagebreak(.*?)?-->/', $this->contenido, $matches)) {
            $matches = explode($matches[0], $this->contenido, 2);
            $this->resumen = Utils::balanceTags($matches[0]) . '<a href="' . PUBLIC_PATH . 'articulo/' . $this->getCategoria()->url . '/' . $this->slug . '/" title="Sigue Leyendo">Sigue leyendo...</a>'; //$this->resumen = Utils::balanceTags($matches[0]).'<a href="'.$url.'articulo/'.$this->slug.'/" title="Sigue Leyendo">Sigue Leyendo...</a>';
        } else {
            $this->resumen = $this->contenido;
        }
        //Si el usuario es colaborador no permite publicar, lo deja en estado
        //pendiente.
        $user = Load::model('usuario')->getUserLogged();
        if ($user->hasProfile(Perfil::COLABORADOR)) {
            $this->estado = Articulo::STATUS_PENDING;
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
        if ($this->estado == self::STATUS_PUBLISHED) {
            //Cache::remove('noticias/recientes', 'kumbia.partials');
        }
    }

}
