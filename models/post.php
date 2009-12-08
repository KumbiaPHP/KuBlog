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
 * @see Cache
 */
Load::lib('cache');
class Post extends ActiveRecord
{
    const STATUS_DRAFT=0;
    const STATUS_PUBLISHED=1;
    const STATUS_ARCHIVED=2;

    public $url_title = '';
    /**
     * Obtiene las ultimas entradas (paginadas)
     *
     * @param $page int
     * @param $per_page int
     * @param $status int
     * @return resulset
     */
    public function getLastEntry($page=1, $per_page=2, $status=Post::STATUS_PUBLISHED)
    {
        return $this->paginate("page: $page",
        					   "status=$status",
        					   "per_page: $per_page",
        					   'order: creation_at desc');
    }

    /**
     * Obtiene las entredas paginadas
     *
     * @param int $page
     * @return ResultSet
     */
    public function getAllPost($page=1, $ppage=5)
    {
    	return $this->paginate("page: $page",
    	                       "per_page: $ppage",
    	                       'order: creation_at desc');
    }
    /**
     * Obtiene una entrada dado el slug
     *
     * @param string $slug
     */
    public function getEntryBySlug($slug)
    {
    	return $this->find_first("url_title='$slug'");
    }
    /**
     * Obtiene los ultimos post
     *
     * @param int $limit
     * @return result
     */
    public function getLast($limit=10, $status=Post::STATUS_PUBLISHED)
    {
        $today = date('Y-m-d H:i:s');
        return $this->find('order: creation_at desc',
                            "conditions: creation_at <= \"$today\" AND status=$status",
                            "limit: $limit");
    }
    /**
     * Realiza una busqueda
     *
     * @param string $search
     */
    public function search($busqueda)
    {
        $busqueda = filter_var($busqueda, FILTER_SANITIZE_STRING);
        return $this->find_all_by_sql("SELECT * FROM post a where a.title like '%$busqueda%'
                                        OR a.entry like '%$busqueda%' ORDER BY creation_at DESC");

    }
    /**
     * CallBack
     *
     */
    public function before_save()
    {
        Load::lib('Utils');
        $this->url_title = Utils::slug($this->title);
        //verifica si se ha utilizado pagebreak
        if(preg_match('/<!-- pagebreak(.*?)?-->/', $this->entry, $matches)){
            $matches = explode($matches[0], $this->entry, 2);
            $this->summary = Utils::balanceTags($matches[0]).'<a href="'.URL_PATH.'noticias/'.$this->url_title.'/" title="Sigue Leyendo">Sigue Leyendo...</a>';
        } else {
            $this->summary = $this->entry;
        }
    }
    public function after_create()
    {
        //eliminando cache de noticias recientes
        //Cache::remove('noticias/recientes', 'kumbia.partials');
    }
    public function after_update()
    {
        //Cache::clean("post.ver.$this->url_title");
    }
    public function after_delete()
    {
        parent::after_delete();
        //eliminando la cache depues que un post/noticia es borrado
        //de noticias recientes
        if($this->status == self::STATUS_PUBLISHED){
            //Cache::remove('noticias/recientes', 'kumbia.partials');
        }
    }
}
