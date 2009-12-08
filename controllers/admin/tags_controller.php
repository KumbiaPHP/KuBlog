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
class TagsController extends ApplicationController
{
    public $models = array('tags');
	/**
	 * The default table name
	 */
    public function index()
    {
        //$this->render(null);
    	$this->tags = $this->Tags->getAll();
    }
    /**
     * Elimina un tag
     *
     * @param string $id
     */
    public function del($postID=null)
    {
        $this->render(null, null);
        echo $this->post('name');
    }
}
