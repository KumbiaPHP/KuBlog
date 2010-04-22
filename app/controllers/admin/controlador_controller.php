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
Load::models('perfiles', 'menus', 'controllers');
class ControllersController extends ApplicationController
{
    /**
     * Muestra un Tree (arbol) con los perfiles.
     * @param int $page
     */
    public function index ()
    {
        $perfiles = new Perfiles();
        $this->listPerfiles = $perfiles->find();
    }
    /**
     * Crea un Controlador para el menu
     *
     */
    public function create ()
    {
        //Datos del select
        $perfiles = new Perfiles();
        $this->perfiles = $perfiles->find('order: nombre');
        $menus = new Menus();
        $this->menus = $menus->find('order: nombre');
        /**
         * Se verifica si el usuario envio el form (submit) y si ademas
         * dentro del array POST existe uno llamado "controllers"
         * el cual aplica la autocarga de objeto para guardar los
         * datos enviado por POST utilizando autocarga de objeto
         */
        if (Input::hasPost('controllers')) {
            /**
             * se le pasa al modelo por constructor los datos del form y ActiveRecord recoge esos datos
             * y los asocia al campo correspondiente siempre y cuando se utilice la convención
             * model.campo
             */
            $controller = new Controllers(Input::post('controllers'));
            //En caso que falle la operación
            if (!$controller->save()) {
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->controllers = $this->post('controllers');
                /**
                 * NOTA: para que la autocarga aplique de forma correcta, es necesario que llame a la variable de instancia
                 * igual como esta el model de la vista, en este caso el model es "controllers"
                 */
            }
        }
    }
    /**
     * Borra un controlador de los menus
     *
     * @param int $id
     */
    public function del ($id = null)
    {
        if ($id) {
            //Buscando el Objeto a Borrar
            $controller = $this->Controllers->find($id);
            if (!$controller->delete()) {
                Flash::error('Falló Operación');
            }
        }
        //enrutando al index para listar los menus
        return Router::redirect('admin/controllers/');
    }
    /**
     * Edita un registro
     *
     * @param int $id
     */
    public function edit ($id = NULL)
    {
        //Datos del select
        $perfiles = new Perfiles();
        $this->perfiles = $perfiles->find('order: nombre');
        $menus = new Menus();
        $this->menus = $menus->find('order: nombre');
        $controller = new Controllers();
        if ($id != NULL) {
            //Aplicando la autocarga de objeto, para comenzar la edición
            $id = filter_var($id, FILTER_SANITIZE_NUMBER_INT);
            var_dump($id);die;
            $this->controllers = $controller->find($id);
        }
        //se verifica si se ha enviado el formulario (submit)
        if(Input::hasPost('controllers')){
            $controller = new Controllers(Input::post('controllers'));
            if(!$controller->update()){
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->controllers = $this->post('controllers');
            } else {
                return Router::redirect('admin/controllers/');
            }
        }
    }
}
