<?php
define('SESSION_KEY', 'AxwkEzPsRY25112'); // change to your own key.
class SdAuth
{
    /**
     * Mensaje de Error
     *
     * @var String
     */
    private static $_error = null;
    /**
     * islogin
     *
     * @param void
     * @return ture/false
     */
    public static function isLogged ()
    {
        Load::lib('session');//carga la extension session
        if (Session::get(SESSION_KEY) == true) {
            return true;
        } else {
            //not yet logged in.
            // check
            if (isset($_POST['mode']) && $_POST['mode'] == 'auth_login') {
                //data was posted.
                return self::check(trim($_POST['txt_login']), trim($_POST['txt_password']));
            } else {
                //You can't enter!
                return false;
            }
        }
    }
    /**
     * check
     *
     * @param $username
     * @param $password
     * @return true/false
     */
    public static function check ($username, $password)
    {
        Load::lib('auth');
        $password = sha1($password);
        $auth = new Auth('model', 'class: usuarios', "login: $username", "password: $password", 'status: A');
        if ($auth->authenticate()) {
            Session::set(SESSION_KEY, true);
            return true;
        } else {
            self::setError('Error Login!');
            Session::set(SESSION_KEY, false);
            return false;
        }
    }
    /**
     * logout
     *
     * @param void
     * @return void
     */
    public static function logout ()
    {
        Load::lib('auth');
        Load::lib('session');
        Session::set(SESSION_KEY, false);
        Auth::destroy_identity();
    }
    /**
     * @return string
     */
    public static function getError ()
    {
        return self::$_error;
    }
    /**
     * @param string $_error
     */
    public static function setError ($error)
    {
        self::$_error = $error;
    }
}
