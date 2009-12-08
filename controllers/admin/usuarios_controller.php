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
class UsuariosController extends ApplicationController
{
    public $models = array('usuarios', 'perfiles');
    /**
     * Lista los Usuarios
     *
     * @param int $page
     */
    public function index ($page = 1)
    {
        $this->listUsuarios = $this->Usuarios->getListUsuarios($page);
    }
    /**
     * Crea un Usuario
     *
     */
    public function create ()
    {
        //datos del select
        $this->perfiles = $this->Perfiles->find();
        /**
         * Se verifica si el usuario envio el form (submit) y si ademas
         * dentro del array POST existe uno llamado "usuarios"
         * el cual aplica la autocarga de objeto para guardar los
         * datos enviado por POST utilizando autocarga de objeto
         */
        if ($this->has_post('usuarios')) {
            $usuarios = $this->post('usuarios');
            //verifica que las claves sean iguales
            if ($usuarios['password'] === $usuarios['password2']) {
                $usuarios['password'] = sha1($usuarios['password']);
                $user = new Usuarios($usuarios);
                if (!$user->save()) {
                    Flash::error('Falló Operación');
                    //se hacen persistente los datos en el formulario
                    $this->usuarios = $usuarios;
                }
            } else {
                Flash::error('Las claves no son iguales');
                //se limpian del array las claves ingresadas
                unset($usuarios['password']);
                //se hacen persistente los datos en el formulario
                $this->usuarios = $usuarios;
            }
        }
    }
    /**
     * Borra un Usuario del Sistema de forma logica
     *
     * @param int $id
     */
    public function del ($id = null)
    {
        if ($id) {
            //Buscando el Objeto a Borrar
            $usuario = $this->Usuarios->find($id);
            //Cambiando el status del usuario
            $usuario->status = 'D';
            if (!$usuario->update()) {
                Flash::error('Falló Operación');
            }
        }
        //enrutando al index para listar los usuarios
        Router::route_to('action: index', 'id: 1');
    }
    /**
     * Muestra el form para cambiar pass al usuario
     */
    public function cambiar_clave()
    {
        if($this->has_post('usuario')){
            $user = $this->post('usuario');
            //cargo la extension auth para obtener el id del usuario en session
            Load::lib('auth');
            if(!$this->Usuarios->changePass(Auth::get('id'), $user['passold'], $user['passnew'])){
                Flash::error('Cambio de Clave Falló');
            }
        }
    }

    public function recuperar_clave()
    {
        $this->template = 'mailer';
        if($this->has_post('login') && $this->Usuarios->loginExist($this->post('login'))){
            Load::library('mail');
            $this->passNew = Mail::generarClave(6);
            $this->usuario = $this->Usuarios->updateUsuarioByMail($this->post('login'), $this->passNew);
            $this->render('mailer');
        }
    }
}
