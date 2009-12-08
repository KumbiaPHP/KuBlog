<?php
// RECORDAR CAMBIAR EL DEL BUILDER SI CAMBIAMOS ESTE


class ScaController extends ApplicationController {
	
	public $scaffold = 'kumbia';
	public $template = 'default';
	public $models = 'menus';
	
	/**
     * Obtiene una lista para paginar los menus
     */
    public function index($page=1) 
    {
        $this->results = $this->Menus->paginate("page: $page", 'order: id desc');
    }
 
    /**
     * Crea un Registro
     */
    public function create ()
    {
   
        if($this->has_post('menus')){
           
            $obj = new Menus($this->post('menus'));
            //En caso que falle la operación de guardar
            if(!$obj->save()){
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->result = $obj;//->post('articulos');
                return;
				
            }
			return Router::redirect("$this->controller_name/");
        }
		// Solo es necesario para el autoForm
		$this->result = new Menus();
    }
 
    /**
     * Edita un Registro
     */
    public function editar($id = null)
    {
		$this->render('create');
    	if($id != null){
    	    //Aplicando la autocarga de objeto, para comenzar la edición
            $this->result = $this->Menus->find($id);
    	}
        //se verifica si se ha enviado el formulario (submit)
        if($this->has_post('menus')){
 
            if(!$this->Menus->update($this->post('menus'))){
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->result = $this->post('menus');
            } else {
               return Router::redirect("$this->controller_name/");
            }
        }
    }
 
    /**
     * Eliminar un menu
     * 
     * @param int $id
     */
    public function borrar($id = null)
    {
        if ($id) {
            if (!$this->Menus->delete($id)) {
                Flash::error('Falló Operación');
            }
        }
        //enrutando al index para listar los articulos
		Router::redirect("$this->controller_name/");
		$this->render(null,null);
    }
	public function ver($id = null) {
       if($id){
		$this->result = $this->Menus->find_first($id);
       } 
	}
}