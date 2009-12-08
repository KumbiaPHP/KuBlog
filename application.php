<?php
/**
 * Todas las controladores heredan de esta clase en un nivel superior
 * por lo tanto los metodos aqui definidos estan disponibles para
 * cualquier controlador.
 *
 * @category Kumbia
 * @package Controller
 **/
class ApplicationController extends Controller
{
    public $pageTitle = 'CaChi - Un poco de todo';
    public $template = 'theme';
    public function initialize ()
    {
        if (Router::get('module') == 'admin') {
            Load::lib('SdAuth');
            if (SdAuth::isLogged()) {
                $this->template = 'admin';
            } else {
                $this->error_msj = SdAuth::getError();
                $this->render(null, 'login2');
                return false;
            }
            
        }
    }
    
    public function logout ()
    {
        Load::lib('SdAuth');
        SdAuth::logout();
        $this->render(null, 'login2');
        $this->redirect('');
    }
}
