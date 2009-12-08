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

class Tags extends ActiveRecord
{
    /**
     * Obtiene un Tag dado su name
     *
     * @param string $name
     * @return ResultSet
     */
    public function getTagByName($name=null)
    {
        $name = filter_var($name, FILTER_SANITIZE_STRING);
        return $this->find_first("conditions: name=\"$name\"");
    }
    /**
     * Obtiene los Tags de Una Noticia/Post
     *
     * @param int $postID
     * @return ResultSet
     */
    public function getTagByPost($postID=null)
    {
        return $this->find_all_by_sql("SELECT t.name, t.url FROM tags t
									   LEFT JOIN posts_tags pt ON pt.post_id = $postID
									   where t.id = pt.tag_id");
    }
    /**
     * Obtiene el ID de un tag
     *
     * @param string $tagName
     * @return int
     */
    public function getIdByName($tagName=null)
    {
        $this->find_first("name=\"$tagName\"");
        return $this->id;
    }
    /**
     * Obtiene todos los tags
     *
     */
    public function getAll()
    {
        $tags = array();
        foreach ($this->find() as $tag){
            $postTag = new PostsTags();
            $tags[] = array('name'=>$tag->name, 'url'=>$tag->url, 'count'=>$postTag->countTags($tag->id));
        }
        return $tags;
    }
    /**
     * Callback
     *
     * @return resulset
     */
    public function after_save()
    {}
    /**
     * Callback
     *
     * @return resulset
     */
    public function before_save()
    {
        if($this->find_first("name = \"$this->name\"")){
            return 'cancel';
        }
    }
}
