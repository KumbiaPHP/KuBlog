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
Load::models('etiqueta');
class EtiquetaController extends ApplicationController
{
	/**
	 * The default table name
	 */
    public function index()
    {
        $etiqueta = new Etiqueta();
    	$this->tags = $etiqueta->getAll();
    }
    /**
     * Elimina un tag
     *
     * @param string $id
     */
    public function del($articulo_id=null)
    {
        View::select(NULL);
        echo Input::post('name');
    }
}
