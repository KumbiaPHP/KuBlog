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
Load::models('post');
//require_once APP_PATH.'models/post.php';
class PostController extends ApplicationController
{
    /**
     * Vista Principal muestra una lista de Noticias
     *
     * @param int $page
     */
    public function index($page=1)
    {
        $post = new Post();
        $this->entries = $post->getLastEntry($page);
    }
    /**
     * Muestra un Post dado su Slug
     *
     * @param string $slug
     */
    public function ver($slug=NULL)
    {
    	if(Input::is('GET') && $slug){
    	    $post = new Post();
    	    $this->post = $post->getEntryBySlug($slug);
    	    $this->pageTitle = $post->title.' - Blog de CaChi';
    	    //Verificando q existan entradas
    	    if($this->post == NULL){
    	        $this->pageTitle = 'Ops! no se Encontraron Noticias - Blog de CaChi';
                View::select('no_entry');
    	    }
    	} else {
    	    Router::route_to('action: index');
    	}
    }
    /**
     * Obtiene ultimas noticias
     *
     */
    public function ultimos()
    {
        $post = new Post();
        $this->pageTitle = 'Últimas Noticias';
        $this->lastPost = $post->getLast();
    }
    /**
     * Realiza una busqueda
     *
     */
    public function busqueda()
    {
        Load::lib('validate');
        if(Input::hasGet('b') && Validate::isNull(Input::get('b'))){
            $this->b = Input::get('b');
            $post = new Post();
            //Debug::getInstance()->dump($this->Post->search($this->b), 'Resultado');
            $this->result = $post->search($this->b);
        }
    }
    /**
     * Genera RSS
     *
     */
    public function rss()
    {
        View::response('view');
        $post = new Post();
        $this->lastPost = $post->getLast();
    }
    /**
     * Filtra lo post/noticias por tag
     * @param $tag
     * @return unknown_type
     */
    public function tag($tag=NULL)
    {

    }
}
