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
class Usuario extends ActiveRecord {

    public function initialize() {
        //relaciones
        $this->belongs_to('perfil');
        $this->validates_email_in('mail', array('message' => 'Campo mail incorrecto'));
    }

    /**
     * Obtiene una lista de Usuarios
     * paginada
     *
     * @param int $page
     * @param string $status
     */
    public function getListUsuarios($page = 1, $status = 'A') {
        return $this->paginate("conditions: status= '$status'", "page: $page");
    }

    /**
     * Cambia el pass de un usuario
     *
     * @param int $idUser
     * @param string $passOld
     * @param string $passNew
     * @return bool
     */
    public function changePass($idUser, $passOld, $passNew) {
        $user = $this->find($idUser);
        $passOld = sha1($passOld);
        if ($user->password == $passOld) {
            $user->password = sha1($passNew);
            if ($user->save()) {
                //Flash::success('El cambio de clave se efectuó con éxito');
                return true;
            } else {
                //Flash::error('Hubo un problema al intentar el cambio de clave');
                return false;
            }
        } else {
            //Flash::error('Las contraseñas no coinciden');
            return false;
        }
    }

    /**
     * verifica la existencia de un usuario
     * mediante su mail
     *
     * @param string $mail
     * @return bool
     */
    public function loginExist($mail) {
        return $this->exists("login='$mail'");
    }

    /**
     * Obtiene los datos de un Usuario dado su mail
     *
     * @param string $login
     * @param string $pass
     * @return resulset
     */
    public function updateUsuarioByMail($login, $pass) {
        $this->find_first("login='$login'");
        $this->password = hash('sha1', $pass);
        $this->update();
        return $this;
    }

    /**
     * Retorna si tiene un perfil determinado
     */
    public function hasProfile($perfil) {
        if ($this->getPerfil()->nombre == $perfil) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Retorna el usuario que ha iniciado sesion
     */
    public function getUserLogged() {
        return $this->find_first('id=' . Auth::get('id'));
    }

}