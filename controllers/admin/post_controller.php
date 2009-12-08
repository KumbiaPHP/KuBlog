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
    /**
     * Carga de Modelos
     * @var $models
     */
    public $models = array('post' , 'posts_tags' , 'tags');
    /**
     * Lista los Post/Noticia
     * @param $page
     * @return Paginate
     */
    public function index ($page = 1)
    {
        $this->pageTitle = 'Lista de Noticias';
        $this->listPosts = $this->Post->getAllPost($page);
    }
    /**
     * Edita un Post/Noticia
     * @param $id
     * @return ResultSet
     */
    public function edit ($id = null)
    {
        //se verifica si se ha enviado el formulario (submit)
        if ($this->has_post('post')) {
            if (! $this->Post->update_from_request('post')) {
                Flash::error('Falló Operación');
            } else {
                $this->PostsTags->addTagsPost($this->post('tags'), $this->Post->id);
            }
        }
        if ($id != null) {
            //Aplicando la autocarga de objeto, para comenzar la edición
            $this->post = $this->Post->find($id);
            $this->pageTitle = 'Editando la Noticia - ' . $this->post->title;
            $this->tags = $this->Tags->getTagByPost($this->post->id);
        }
    }
    /**
     * Elimina un Tag de un Post/Noticia
     *
     * @param int $postID
     */
    public function delTag ($postID = null)
    {
        $this->render(null, null);
        $this->PostsTags->delTagByPost($postID, $this->post('name'));
        echo $this->post('name');
    }
    /**
     * Crea un nuevo Post
     *
     */
    public function create ()
    {
        if ($this->has_post('post')) {
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
        $this->render(null);
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
        if ($this->is_ajax()) {
            $this->set_response('view');
        }
    }
}
