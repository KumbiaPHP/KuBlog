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
/**
 * @see PostsTags
 */
include_once APP_PATH.'models/posts_tags.php';

class PostsTags extends ActiveRecord
{
    /**
     * Guarda los Tags de un posts/noticia
     *
     */
    public function addTagsPost ($tags = null, $postID = null)
    {
        //verificando que tenga tags
        if($tags){
            $tags = explode(',', $tags);
            foreach ($tags as $tag) {
                $objTag = new Tags();
                $objTag->name = $tag;
                $objTag->url = strtr($tag, ' ', '-');
                $objTag->save();

                $posTags = new PostsTags();
                $posTags->post_id = $postID;
                $posTags->tag_id = $objTag->id;
                $posTags->save();
            }
        }
        return false;
    }
    /**
     * Elimina un tag de un Post/Noticia
     *
     * @param int $postID
     * @param string $tagName
     * @return bool
     */
    public function delTagByPost($postID=null, $tagName=null)
    {
        $tag = new Tags();
        $tag = $tag->getIdByName($tagName);
        $this->find_first("conditions: post_id=$postID AND tag_id=$tag");
        return $this->delete($this->id);
    }
    /**
     * Obtiene un Conteo de los Tags Utilizados
     *
     * @param int $tagID
     */
    public function countTags($tagID=null)
    {
        return $this->count("tag_id=$tagID");
    }
    /**
     * Run CallBack
     *
     */
    public function before_save()
    {
        if($this->find_first("conditions: post_id=$this->post_id AND tag_id=$this->tag_id")){
            return 'cancel';
        }
    }
    public function after_save ()
    {}

    public function after_delete()
    {}
}
