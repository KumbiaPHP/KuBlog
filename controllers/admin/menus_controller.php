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
Load::models('menus');
class MenusController extends ApplicationController
{
    /**
     * Lista los menus...
     * @param int $page
     */
    public function index($page = 1)
    {
        $menus = new Menus();
    	$this->listMenus = $menus->paginate("page: $page");
    }

    public function create()
    {
    	if(Input::hasPost('menus')){
    	    $menu = new Menus($this->post('menus'));
    	    if(!$menu->save()){
    	        $this->menus = $Input::post('menus');
    	        Flash::error('Falló la Operación');
    	    }
    	}
    }

    public function edit($id = null)
    {
    	if($id != null){
    	    //Aplicando la autocarga de objeto, para comenzar la edición
            $this->menus = $this->Menus->find($id);
    	}
        //se verifica si se ha enviado el formulario (submit)
        if(Request::hasPost('menus')){
            $menu = new Menus($this->post('menus'));
            if(!$menu->update()){
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->menus = $this->post('menus');
            } else {
                //enrutando al index para listar los menus
                Router::redirect('admin/menus/');
            }
        }

    }

    /**
     * Eliminar un menu
     *
     * @param int $id
     */
    public function del($id = null)
    {
        if ($id) {
            //Buscando el Objeto a Borrar
            $menu = $this->Menus->find($id);
            if (!$menu->delete()) {
                Flash::error('Falló Operación');
            }
        }
        //enrutando al index para listar los menus
        Router::redirect('admin/menus/');
    }
}
