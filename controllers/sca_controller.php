<?php
// RECORDAR CAMBIAR EL DEL BUILDER SI CAMBIAMOS ESTE
/**
 * Cargando el Modelo
 */
Load::models('menus');
class ScaController extends ApplicationController
{
    public $scaffold = 'kumbia';
    public $template = 'default';
    /**
     * Obtiene una lista para paginar los menus
     */
    public function index ($page = 1)
    {
        $menu = new Menus();
        $this->results = $menu->paginate("page: $page", 'order: id desc');
    }
    /**
     * Crea un Registro
     */
    public function create ()
    {
        if (Input::hasPost('menus')) {
            $menu = new Menus(Input::post('menus'));
            //En caso que falle la operación de guardar
            if (! $menu->save()) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->result = $menu; //->post('articulos');
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
    public function editar ($id = null)
    {
        $menu = new Menus();
        View::select('create');
        if ($id != null) {
            //Aplicando la autocarga de objeto, para comenzar la edición
            $this->result = $menu->find($id);
        }
        //se verifica si se ha enviado el formulario (submit)
        if (Input::hasPost('menus')) {
            if (! $menu->update(Input::post('menus'))) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->result = Input::post('menus');
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
    public function borrar ($id = NULL)
    {
        View::select(NULL, NULL);
        if ($id) {
            $menu = new Menus();
            if (! $menu->delete($id)) {
                Flash::error('Falló Operación');
            }
        }
        //enrutando al index para listar los articulos
        return Router::redirect("$this->controller_name/");
    }
    public function ver ($id = NULL)
    {
        if ($id) {
            $menu = new Menus();
            $this->result = $menu->find_first($id);
        }
    }
}