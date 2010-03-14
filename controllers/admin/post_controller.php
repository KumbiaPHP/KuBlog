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
    public function edit ($id = null)
    {
        $post = new Post();
        //se verifica si se ha enviado el formulario (submit)
        if (Input::hasPost('post')) {
            if (! $post->update_from_request('post')) {
                Flash::error('Falló Operación');
            } else {
                $postsTags = new PostsTags();
                $postsTags->addTagsPost(Input::post('tags'), $post->id);
            }
        }
        if ($id != null) {
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
        View::select(NULL, NULL);
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
            if (! $this->Post->create($this->post('post'))) {
                $this->post = $this->post('post');
                Flash::error('Falló la Operación');
            } else {
                $this->PostsTags->addTagsPost($this->post('tags'), $this->Post->id);
            }
            return Router::redirect('admin/post/');
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
            //Buscando el Objeto a Borrar
            $post = $this->Post->find($id);
            if ($post) {
                //$post = $this->Post->find($id);
                if (! $post->delete()) {
                    Flash::error('Falló Operación');
                } else {
                    //se eliminan los tags que tenia el Posts/Noticia
                    $this->PostsTags->delete_all("post_id=$post->id");
                    Flash::success('Falló Operación');
                }
            } else {
                Flash::error('No existe la Noticia');
            }
        }
        //redireccionando al index para listar las noticias
        return Router::redirect('admin/post/');
    }
    public function publicPost($id=null)
    {
        if($id){

        }
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
