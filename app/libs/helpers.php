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
        Load::models('etiqueta');
        $etiqueta = new Etiqueta();
        $tags = array();
        if($id_post){
            foreach ($etiqueta->getTagByPost($id_post) as $tag) {
            	$tags[] =  $tag->name;
            }
            return implode($separator, $tags);
        }
        
    }    
}
