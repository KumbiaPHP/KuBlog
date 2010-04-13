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
/**
 * Carga de Modelos
 */
Load::models('post' , 'posts_tags' , 'tags');
/**
 * Gestiona la parte administrativa de las noticias
 */
class PostController extends ApplicationController
{

    /**
     * Lista los Post/Noticia
     * @param $page
     * @return Paginate
     */
    public function index ($page = 1)
    {
        $this->pageTitle = 'Lista de Noticias';
        $posts = new Post();
        $this->listPosts = $posts->getAllPost($page);
    }
    /**
     * Edita un Post/Noticia
     * @param $id
     * @return ResultSet
     */
    public function edit ($id = NULL)
    {
        $post = new Post();
        //se verifica si se ha enviado el formulario (submit)
        if (Input::hasPost('post')) {
            if($post = Post::input('update', Input::post('post'))){
                $postsTags = new PostsTags();
                $postsTags->addTagsPost(Input::post('tags'), $post->id);
                return Router::redirect('admin/post/');
            }
        }
        if ($id != NULL) {
            //Aplicando la autocarga de objeto, para comenzar la edición
            $this->post = $post->find($id);
            $this->pageTitle = 'Editando la Noticia - ' . $this->post->title;
            $tags = new Tags();
            $this->tags = $tags->getTagByPost($this->post->id);
        }
    }
    /**
     * Elimina un Tag de un Post/Noticia
     *
     * @param int $postID
     */
    public function delTag ($postID = null)
    {
        View::select(NULL);
        $postsTags = new PostsTags();
        $postsTags->delTagByPost($postID, Input::post('name'));
        echo Input::post('name');
    }
    /**
     * Crea un nuevo Post
     *
     */
    public function create ()
    {
        if (Input::hasPost('post')) {
            if($post = Post::input('create', Input::post('post'))){
                $postsTags = new PostsTags();
                $postsTags->addTagsPost(Input::post('tags'), $post->id);
                return Router::redirect('admin/post/');
            }
        }
    }
    /**
     * Eliminar un Posts/Noticia
     *
     * @param int $id
     */
    public function del ($id = null)
    {
        View::select(NULL);
        if ($id) {
            $post = new Post();
            $post->del($id);
        }
        return Router::redirect('admin/post/');
    }
    /**
     * Corriendo filtro
     *
     */
    public function before_filter ()
    {
        if (Input::isAjax()) {
            View::response('view');
        }
    }
}
