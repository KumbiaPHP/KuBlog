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
Load::models(array('articulo','recaptcha','categoria','etiqueta'));
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
    public function ver($categoria_nombre=NULL, $slug=NULL) {
        if($slug) {
            Load::lib('Utils');
            $articulo = new Articulo();
            $recaptcha = new Recaptcha();
            
            $this->articulo = $articulo->getEntryBySlug($slug);
            $this->pageTitle = $articulo->titulo.' - '.$this->pageTitle;
            $this->description = Utils::truncateWord($articulo->resumen,15,'...');
            //Verificando que existan entradas
            if($this->articulo == NULL) {
                $this->pageTitle = 'Ops! no se Encontraron Noticias - '.$this->pageTitle;                
                View::select('no_entry');
            }

            $this->comentarios = Load::model('comentario')->getCommentByPost($this->articulo->id);
            $this->countComment = count($this->comentarios);
            $this->captcha = $recaptcha->generar();
        } else if($categoria_nombre){
            Router::route_to('action: index');
        }else{
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
        //var_dump(Input::get('b'));
        //die;
        Load::lib('validate');
        if(Input::hasGet('b') && !Validate::isNull(Input::get('b'))) {
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
     * @param $name
     * @return unknown_type
     */
    public function tag($name=NULL,$page=1) {
        $etiqueta = new Etiqueta();
        $articulo_etiqueta = new ArticuloEtiqueta();

        $this->pageTitle = "Últimas Noticias sobre $name";
        $this->articulos = null;

        $tag = $etiqueta->find_first("name='$name'");

        if($tag != null){

            $this->articulos = $articulo_etiqueta->getPostByTag($page,10,$tag->id);
        }              
    }
    /**
     * Guarda el comentario del artículo
     * @param $tag
     * @return unknown_type
     */
    public function nuevo_comentario($articulo_slug=null) {
        $articulo = new Articulo();
        $recaptcha = new Recaptcha();

        $articulo = $articulo->getEntryBySlug($articulo_slug);
        $this->articulo_id = $articulo->id;
        $this->articulo_slug = $articulo_slug;
        $this->comentarios = Load::model('comentario')->getCommentByPost($this->articulo_id);
        $this->countComment = count($this->comentarios);
        $this->captcha = $recaptcha->generar();

        if(Input::hasPost('comentario')) {

            try {
                //Comprueba el reCAPTCHA
                if($recaptcha->comprobar(($_SERVER["REMOTE_ADDR"]),
                $_POST['recaptcha_challenge_field'],
                $_POST['recaptcha_response_field'])) {

                    if(Load::model('comentario')->save(Input::post('comentario'))) {
                        Flash::success('Comentario enviado');
                        Router::redirect("articulo/$articulo_slug/");
                    }else {
                        Flash::error('Ha ocurrido un error');
                        $this->comentario = Input::post('comentario');
                    }
                }
            }catch(KumbiaException $kex) {
                Flash::error('Ingresa correctamente las palabras del captcha');
                $this->captcha = $recaptcha->generar($kex->getMessage());                
                $this->comentario = Input::post('comentario');
            }
        }
    }
}
