<?php
/**
 * Description of flickr_set.php
 * 11/05/2010 08:12:17 PM
 *
 * @author julio
 * @copyright 2010
 * @license Put project's license
 */
/**
 * Carga de Modelos
 */
Load::models('flickr_set');
/**
 * Gestiona la parte administrativa de las galerias
 */
class FlickrSetController extends ApplicationController {

    /**
     * Lista los flickr_set
     * @param $page
     * @return Paginate
     */
    public function index ($page = 1) {
        $this->pageTitle = 'Lista de flickr_set';
        $flickr_set = new FlickrSet();
        $this->listPosts = $flickr_set->getLastEntry($page);
    }
    /**
     * Edita una flickr_set
     * @param $id
     * @return ResultSet
     */
    public function edit ($id = NULL) {
        $flickr_set = new FlickrSet();
        if($id != NULL){
    	    //Aplicando la autocarga de objeto, para comenzar la edición
            $this->flickr_set = $flickr_set->find($id);
    	}
        if(Input::hasPost('flickr_set')){

            if(!$flickr_set->update(Input::post('flickr_set'))){
                Flash::error('Falló Operación');
            } else {
                return Router::redirect('admin/flickr_set/');
            }
        }
    }

    /**
     * Crea una nueva flickr_set
     *
     */
    public function create () {
        if (Input::hasPost('flickr_set')) {
            if($flickr_set = FlickrSet::input('create', Input::post('flickr_set'))) {
                return Router::redirect('admin/flickr_set/');
            }
        }

        $this->usuario_id = Auth::get('id');
        //$this->autor = Auth::get('nombre');
    }
    /**
     * Eliminar una flickr_set
     *
     * @param int $id
     */
    public function del ($id = null) {
        View::select(NULL);
        if ($id) {
            $flickr_set = new FlickrSet();
            $flickr_set->del($id);
        }
        return Router::redirect('admin/flickr_set/');
    }
    /**
     * Corriendo filtro
     *
     */
    public function before_filter () {
        if (Input::isAjax()) {
            View::response('view');
        }
    }
}
