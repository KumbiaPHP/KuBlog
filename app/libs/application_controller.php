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

class ApplicationController extends Controller {
    public $pageTitle = 'KuBlog';
    public $keyWords = '';
    public $description = '';
    public function initialize () {
        View::template('theme');
        $this->categorias = Load::model('categoria')->find('conditions: estado="'.Categoria::STATUS_ACTIVE.'"');
        if (Router::get('module') == 'admin') {
            Load::lib('SdAuth');
            if (SdAuth::isLogged()) {
                View::template('admin');
            } else {
                $this->error_msj = SdAuth::getError();
                View::template('login');
                return FALSE;
            }

        }
    }

    public function logout () {
        Load::lib('SdAuth');
        SdAuth::logout();
        View::template('login2');
        Router::redirect('');
    }

    public function contact() {
        Load::model('correo');
        if(Input::hasPost('contacto')) {
            $data = Input::post('contacto');
            $correo = new Correo();
            try {
                if($correo->sendContact($data['correo'], $data['nombre'], $data['cuerpo'])) {
                    Flash::success('Correo enviado');
                }else {
                    Flash::error('Correo no enviado');
                }
            }catch (phpmailerException $ex) {
                Flash::error('Exception: '.$ex->getMessage());
            }
            Router::redirect('contacto/');
        }
    }
}
