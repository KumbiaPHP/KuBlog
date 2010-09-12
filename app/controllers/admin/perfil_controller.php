<?php
/**
 * KBlog - KumbiaPHP Blog
 * PHP version 5
 * LICENSE
 *
 * This source fil is subject to the GNU/GPL that is bundled
 * with this package in the fil docs/LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to deivinsontejeda@gmail.com so we can send you a copy immediately.
 *
 * @author Deivinson Tejeda <deivinsontejeda@gmail.com>
 */
Load::models('perfil');
class PerfilController extends ApplicationController
{
    /**
     * Lista los perfil
     *
     * @param int $page
     */
    final function index ($page = 1)
    {
        $perfil = new Perfil();
        $this->listPerfiles = $perfil->paginate("page: $page");
    }
    /**
     * Crea un perfil
     *
     */
    final function create ()
    {
        if (Input::hasPost('perfil')) {
            $perfil = new Perfil(Input::post('perfil'));
            if (! $perfil->save()) {
                Flash::error('Fallo Operación');
                $this->perfil = Input::post('perfil');
            }else{
                Router::redirect('admin/perfil');
            }
        }
    }
    final function edit ()
    {}
    /**
     * Borra un perfil
     *
     * @param int $id
     */
    final function del ($id = null)
    {
        if ($id) {
            $perfil = new Perfil();
            //Buscando el Objeto a Borrar
            $perfil = $perfil->find($id);
            if (! $perfil->delete()) {
                Flash::error('Falló Operación');
            }
        }
        //enrutando al index para listar los menus
        Router::redirect('perfil/');
    }
}
