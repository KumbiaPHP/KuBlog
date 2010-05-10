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
 */
Load::models('articulo');
//require_once APP_PATH.'models/articulo.php';
class ArticuloController extends ApplicationController {
    /**
     * Vista Principal muestra una lista de Noticias
     *
     * @param int $page
     */
    public function index($page=1) {
        $articulo = new Articulo();
        $this->articulos = $articulo->getLastEntry($page);
    }
    /**
     * Muestra un articulo dado su Slug
     *
     * @param string $slug
     */
    public function ver($slug=NULL) {
        if(Input::is('GET') && $slug) {
            $articulo = new Articulo();
            $this->articulo = $articulo->getEntryBySlug($slug);
            $this->pageTitle = $articulo->titulo.' - simacel.com';
            //Verificando q existan entradas
            if($this->articulo == NULL) {
                $this->pageTitle = 'Ops! no se Encontraron Noticias - simacel.com';
                View::select('no_entry');
            }

            $this->comentarios = Load::model('comentario')->getCommentByPost($this->articulo->id);
            $this->countComment = count($this->comentarios);
        } else {
            Router::route_to('action: index');
        }
    }
    /**
     * Obtiene ultimas noticias
     *
     */
    public function ultimos() {
        $articulo = new Articulo();
        $this->pageTitle = 'Últimas Noticias';
        $this->lastPost = $articulo->getLast();
    }
    /**
     * Realiza una busqueda
     *
     */
    public function busqueda() {
        Load::lib('validate');
        if(Input::hasGet('b') && Validate::isNull(Input::get('b'))) {
            $this->b = Input::get('b');
            $articulo = new Articulo();
            //Debug::getInstance()->dump($this->articulo->search($this->b), 'Resultado');
            $this->result = $articulo->search($this->b);
        }
    }
    /**
     * Genera RSS
     *
     */
    public function rss() {
        View::response('view');
        $articulo = new Articulo();
        $this->lastPost = $articulo->getLast();
    }
    /**
     * Filtra lo articulos por etiquetas
     * @param $tag
     * @return unknown_type
     */
    public function tag($tag=NULL) {

    }
    /**
     * Guarda el comentario del artículo
     * @param $tag
     * @return unknown_type
     */
    public function nuevo_comentario($articulo_slug = null) {
        $articulo = new Articulo();
        $articulo = $articulo->getEntryBySlug($articulo_slug);
        $this->articulo_id = $articulo->id;
        $this->articulo_slug = $articulo_slug;
        $this->comentarios = Load::model('comentario')->find("conditions: articulo_id={$this->articulo_id}");
        $this->countComment = count($this->comentarios);

        if(Input::hasPost('comentario')) {
            if(Load::model('comentario')->save(Input::post('comentario'))) {
                Flash::success('Comentario enviado');
                Router::redirect("articulo/$articulo_slug/");
            }
	    else {
                Flash::error('Ha ocurrido un error');
                $this->comentario = Input::post('comentario');
            }
        }
    }
}
