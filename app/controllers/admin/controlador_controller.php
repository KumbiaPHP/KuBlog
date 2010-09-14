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
Load::models('perfil', 'menu', 'controlador');
class ControladorController extends ApplicationController
{
    /**
     * Muestra un Tree (arbol) con los perfiles.
     * @param int $page
     */
    public function index ()
    {
        $perfiles = new Perfil();
        $this->listPerfiles = $perfiles->find();
    }
    /**
     * Crea un Controlador para el menu
     *
     */
    public function create ()
    {
        //Datos del select
        $perfiles = new Perfil();
        $this->perfiles = $perfiles->find('order: nombre');
        $menu = new Menu();
        $this->menu = $menu->find('order: nombre');
        /**
         * Se verifica si el usuario envio el form (submit) y si ademas
         * dentro del array POST existe uno llamado "controlador"
         * el cual aplica la autocarga de objeto para guardar los
         * datos enviado por POST utilizando autocarga de objeto
         */
        if (Input::hasPost('controlador')) {
            /**
             * se le pasa al modelo por constructor los datos del form y ActiveRecord recoge esos datos
             * y los asocia al campo correspondiente siempre y cuando se utilice la convención
             * model.campo
             */
            $controller = new Controlador(Input::post('controlador'));
            //En caso que falle la operación
            if ($controller->save()) {                
                Flash::success('Controlador creado con éxito');
                return Router::redirect('admin/controlador/');
            }else{
                Flash::error('Hubo un problema al crear el controlador');
                //se hacen persistente los datos en el formulario
                $this->controlador = new Controlador(Input::post('controlador'));
            }
        }
    }
    /**
     * Borra un controlador de los menu
     *
     * @param int $id
     */
    public function del ($id = null)
    {
        if ($id) {
            //Buscando el Objeto a Borrar
            $controller = $this->controlador->find($id);
            if (!$controller->delete()) {
                Flash::error('Falló Operación');
            }
        }
        //enrutando al index para listar los menu
        return Router::redirect('admin/controlador/');
    }
    /**
     * Edita un registro
     *
     * @param int $id
     */
    public function edit ($id = NULL)
    {
        //Datos del select
        $perfiles = new Perfil();
        $this->perfiles = $perfiles->find('order: nombre');
        $menu = new Menu();
        $this->menu = $menu->find('order: nombre');
        $controller = new Controlador();
        if ($id != NULL) {
            //Aplicando la autocarga de objeto, para comenzar la edición
            $id = filter_var($id, FILTER_SANITIZE_NUMBER_INT);
            $this->controlador = $controller->find($id);
        }
        //se verifica si se ha enviado el formulario (submit)
        if(Input::hasPost('controlador')){
            $controller = new Controlador(Input::post('controlador'));
            if(!$controller->update()){
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->controlador = new Controlador(Input::post('controlador'));
            } else {
                return Router::redirect('admin/controlador/');
            }
        }
    }
}
