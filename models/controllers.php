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
class Controllers extends ActiveRecord
{
    public function initialize()
    {
        //Relaciones
        $this->belongs_to('perfiles');
        $this->belongs_to('menus', 'fk: menu_id');
    }
    /**
     * Obtiene el menu de acuerdo al perfil
     *
     * @param int $perfiles
     * @param int $menu
     * @param string $estado
     * @return resulset
     */
    public function getSubMenu($perfiles=null, $menu=null, $estado='A')
    {
    	return $this->find("perfiles_id = $perfiles AND status = '$estado' AND menu_id = $menu");
    }
    /**
     * Obtiene el Menu
     *
     * @param int $perfiles
     * @return resulset
     */
    public function getMenu($perfiles=1)
    {
        return $this->find("perfiles_id=$perfiles", 'group: menu_id', 'columns: menu_id');
    }
}
