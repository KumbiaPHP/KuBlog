<?php
class Helpers
{
    /**
     * Retorna los tag de un post
     *
     * @param int $idPost
     * @param string $separator
     */
    public static function getTags($id_post=null, $separator=', ')
    {
        $tags = array();
        if($id_post){
            foreach (Load::model('tags')->getTagByPost($id_post) as $tag) {
            	$tags[] =  $tag->name;
            }
            return implode($separator, $tags);
        }
        
    }    
}
