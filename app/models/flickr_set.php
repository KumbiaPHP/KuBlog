<?php
/**
 * Description of flickr_set.php
 * 10/05/2010 08:12:17 PM
 *
 * @author henry
 * @copyright 2010
 * @license Put project's license
 */
class FlickrSet extends ActiveRecord{

    const STATUS_PUBLISHED=1;
    const STATUS_ARCHIVED=2;

    /**
     * Obtiene las últimos galerias de flickr (paginados)
     *
     * @param $page int
     * @param $per_page int
     * @param $estado int
     * @return resulset
     */
    public function getLastEntry($page=1, $per_page=4, $estado=FlickrSet::STATUS_PUBLISHED) {
        return $this->paginate("page: $page",
                "estado=$estado",
                "per_page: $per_page",
                'order: creado_at desc');
    }

    /*
     * TODO Documentar esta funcion
     */
    public static function input($method, $data) {
        $obj = new FlickrSet($data);
        try {
            $obj->$method();
            return $obj;
        } catch (Exception $e) {
            Flash::error('Falló Operación');
        }
        return false;
    }

    /**
     * Obtiene una galeria dado su slug
     *
     * @param string $slug
     */
    public function getBySlug($slug) {
        return $this->find_first("slug='$slug'");
    }

}
?>
