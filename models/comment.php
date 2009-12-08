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
class Comment extends ActiveRecord
{
    const STATUS_PENDING=0;
    const STATUS_APPROVED=1;

    public function initizalize()
    {
        $this->validates_email_in('email');
    }

    /**
     * Obtiene los comentarios de un Post
     *
     * @param int $postID
     * @param int $status
     */
    public function getCommentByPost($postID, $status=1)
    {
        return $this->find("post_id=$postID and status=$status");
    }
    /**
     * Realiza un conteo de los comentirios
     *
     * @param int $postID
     * @param int $status
     * @return Resulset
     */
    public function countComment($postID, $status=1)
    {
        return $this->count("status=$status AND post_id=$postID");
    }

    public function before_save()
    {
        Load::lib('Validations');
        if(!Validations::url($this->url)){
            return 'cancel';
        }
    }
}
