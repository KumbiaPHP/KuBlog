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
class PostController extends ApplicationController
{
    public $models = array('post', 'comment');
    /**
     * Vista Principal muestra una lista de Noticias
     *
     * @param int $page
     */
    public function index($page=1)
    {
        $this->entries = $this->Post->getLastEntry($page);
    }
    /**
     * Muestra un Post dado su Slug
     *
     * @param string $url_title
     */
    public function ver($url_title=NULL)
    {
    	if($url_title){
    	    $this->post = $this->Post->getEntryBySlug($url_title);
    	    $this->pageTitle = $this->post->title.' - Blog de CaChi';
    	    //Verificando q existan entradas
    	    if($this->post==NULL){
    	        $this->pageTitle = 'Ops! no se Encontraron Noticias - Blog de CaChi';
                $this->render('no_entry');
    	    } else {
    	        $this->countComment = $this->Comment->countComment($this->post->id);//Conteo de los comentarios
    	        $this->comments = $this->Comment->getCommentByPost($this->post->id);//Comentarios del Post
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
        $this->pageTitle = 'Últimas Noticias';
        $this->lastPost = $this->Post->getLast();
    }
    /**
     * Realiza una busqueda
     *
     */
    public function busqueda()
    {
        Load::lib('validate');
        if($this->has_get('b') && Validate::isNull($this->get('b'))){
            $this->b = $this->get('b');
            //Debug::getInstance()->dump($this->Post->search($this->b), 'Resultado');
            $this->result = $this->Post->search($this->b);
        }
    }
    /**
     * Genera RSS
     *
     */
    public function rss()
    {
        $this->set_response('view');
        $this->lastPost = $this->Post->getLast();
        header('Content-type: application/rss+xml');
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
