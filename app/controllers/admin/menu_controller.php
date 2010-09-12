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
Load::models('menu');
class menuController extends ApplicationController
{
    /**
     * Lista los menu...
     * @param int $page
     */
    public function index($page = 1)
    {
        $menu = new Menu();
    	$this->listMenu = $menu->paginate("page: $page");
    }

    public function create()
    {
    	if(Input::hasPost('menu')){
    	    $menu = new menu(Input::post('menu'));
    	    if(!$menu->save()){
    	        $this->menu = new Menu(Input::post('menu'));
    	        Flash::error('Falló la Operación');
    	    }else{
                Router::redirect('admin/menu');
            }
    	}
    }

    public function edit($id = null)
    {
        $menu = new Menu();
    	if($id != null){
    	    //Aplicando la autocarga de objeto, para comenzar la edición
            $this->menu = $menu->find($id);
    	}
        //se verifica si se ha enviado el formulario (submit)
        if(Input::hasPost('menu')){
            $menu = new Menu(Input::post('menu'));
            if(!$menu->update()){
                Flash::error('Falló Operación');
                //se hacen persistente los datos en el formulario
                $this->menu = Input::post('menu');
            } else {
                //enrutando al index para listar los menu
                Router::redirect('admin/menu/');
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
        $menu = new Menu();
        if ($id) {
            //Buscando el Objeto a Borrar
            $menu = $menu->find($id);
            if (!$menu->delete()) {
                Flash::error('Falló Operación');
            }
        }
        //enrutando al index para listar los menu
        Router::redirect('admin/menu/');
    }
}
