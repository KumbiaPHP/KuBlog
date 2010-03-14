<?php
Load::lib('captcha/captcha');
class TestCaptchaController extends ApplicationController
{    
    public $models = array('menus');
//    public $captcha = null;
//    public function securimage ()
//    {
//        $this->render(null, null); //a blank layout
//        $captcha = new Captcha();
//        $captcha->run();
//    }
    function index2 ()
    {
        $this->template = null;
        //$this->select = $this->Menus->db_select();
        $this->nullify('error_captcha', 'success_captcha');
        if($this->has_post('captcha')){
            if (Captcha::check($this->post('captcha')) == false) {
                //codigo incorrecto - error mensaje
                $this->error_captcha = 'Código Invalido';
                $this->success_captcha = ''; 
            } else {
                //codigo correcto - mensaje exito
                $this->error_captcha = ''; 
                $this->success_captcha = 'Código Válido'; 
            }
        }
    }
}
