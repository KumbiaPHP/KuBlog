<?php
/**
 * Todas las controladores heredan de esta clase en un nivel superior
 * por lo tanto los metodos aqui definidos estan disponibles para
 * cualquier controlador.
 *
 * @category Kumbia
 * @package Controller
 **/
// @see Controller antiguo por compatibilidad
//require_once CORE_PATH . 'kumbia/controller-deprecated.php';
//@see Controller nuevo controller
require_once CORE_PATH . 'kumbia/controller.php';

class ApplicationController extends Controller
{
    public $pageTitle = 'CaChi - Un poco de todo';
    public function initialize ()
    {
        View::template('theme');
        if (Router::get('module') == 'admin') {
            Load::lib('SdAuth');
            if (SdAuth::isLogged()) {
                View::template('admin');
            } else {
                $this->error_msj = SdAuth::getError();
                View::select(NULL, 'login2');
                return false;
            }
            
        }
    }
    
    public function logout ()
    {
        Load::lib('SdAuth');
        SdAuth::logout();
        View::select(NULL, 'login2');
        Router::redirect('');
    }
}
