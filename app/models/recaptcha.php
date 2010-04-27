<?php
// Incluye el fichero con la libreria
require_once APP_PATH. '/libs/recaptchalib.php';

class Recaptcha {

    //Llave publica y privada de tu sitio en reCAPTCHA
    //https://www.google.com/recaptcha/admin/list
    private static $_publickey  = "";
    private static $_privatekey = "";

    /**
     * Genera el html con el recaptcha
     *
     * @param error
     * @return mixed
     */
    public function generar($error=null) {  
        return recaptcha_get_html(self::$_publickey, $error);
    }

    /**
     * Comprueba si es correcto el valor introducido por el usuario,
     * de lo contrario lanza una excepción de tipo KumbiaException
     *
     * @param remote_addr
     * @param recaptcha_challenge_field
     * @param recaptcha_response_field
     *
     * @return boolean
     */
    public function comprobar($remote_addr, $recaptcha_challenge_field,
            $recaptcha_response_field) {
        // Comprobamos que se haya rellenado el reCAPTCHA
        if ($_POST["recaptcha_response_field"]) {
            // Realizamos la comprobacion
            $resp = recaptcha_check_answer (self::$_privatekey,
                    $remote_addr,
                    $recaptcha_challenge_field,
                    $recaptcha_response_field);

            if ($resp->is_valid) {
                return true;
            } else {
                // Lanzam la excepción con el mensaje de error
                throw new KumbiaException($resp->error);
            }
        }        
    }
}
?>
