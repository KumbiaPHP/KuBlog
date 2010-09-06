<?php
/**
 * Description of galeria_controller.php
 * 10/05/2010 08:15:18 PM
 *
 * @author henry
 * @copyright 2010
 * @license Put project's license
 */
Load::models(array('flickr_set'));

class GaleriaController extends ApplicationController{
     /**
     * Vista Principal muestra una lista de galerias
     *
     * @param int $page
     */
    public function index($page=1){
        $obj = new FlickrSet();
        $this->galerias = $obj->getLastEntry($page);
    }

    /**
     * Muestra un galeria dado su Slug
     *
     * @param string $slug
     */
    public function ver($slug=null){
        View::template('theme');
        if($slug) {
            $obj = new FlickrSet();

            $this->galeria = $obj->getBySlug($slug);
            $this->pageTitle = $obj->titulo.' - '.$this->pageTitle;
            $this->description = $obj->descripcion_corta;
            //Verificando que existan entradas
            if($this->galeria == NULL) {
                $this->pageTitle = 'Ops! no se encontraron la galeria - '.$this->pageTitle;
                View::select('no_entry');
            }
        } else {
            Router::route_to('action: index');
        }
    }
}
?>