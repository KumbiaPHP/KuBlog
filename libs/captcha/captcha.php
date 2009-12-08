<?php
/**
 * KumbiaPHP web & app Framework
 *
 * LICENSE
 *
 * This source file is subject to the new BSD license that is bundled
 * with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://wiki.kumbiaphp.com/Licencia
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@kumbiaphp.com so we can send you a copy immediately.
 *
 * Captcha
 * 
 * @copyright  Copyright (c) 2005-2009 Kumbia Team (http://www.kumbiaphp.com)
 * @license    http://wiki.kumbiaphp.com/Licencia     New BSD License
 */
define('CAPTCHA_VENDOR_DIR', APP_PATH . 'libs/captcha/');
class Captcha
{
    /**
     * @var integer Ancho para la generación CAPTCHA imagen. Por Defecto 120.
     */
    public $width = 120;
    /**
     * @var integer Alto para la generación del CAPTCHA imagen. Por Defecto 50.
     */
    public $height = 50;
    /**
     * @var integer Separación del texto. Por Defecto 2.
     */
    public $padding = 2;
    /**
     * @var integer Color de Fondo. Por Ejemplo, 0x55FF00.
     * Por Defecto 0xFFFFFF (blanco)
     */
    public $backColor = 0xFFFFFF;
    /**
     * @var integer Color de la fuentes. Por Ejemplo, 0x55FF00. Por Defecto 0x2040A0 (blue color).
     */
    public $foreColor = 0x2040A0;
    
    /**
     * @var integer Máximo para generación aleatoria de palabras. Defaults to 6.
     */
    public $minLength = 6;
    /**
     * @var integer Máximo para generación aleatoria de palabras. Por Defecto 7.
     */
    public $maxLength = 7;
    /**
     * @var string TrueType. Por defecto Duality.ttf
     */
    public $fontFile;
    /**
     * Runs the action.
     */
    public function run ()
    {
        if (session_id() == '') { // no session has been started yet, which is needed for validation
            session_start();
        }
        $this->renderImage($this->generateCode());
    }
    /**
     * Salva el código generado
     * 
     * @param string código
     */
    private function _saveCode ($code)
    {
        $_SESSION[APP]['securimage'] = $code;
    }
    /**
     * Valida que el valor ingresado haga match con el código de verificación
     * 
     * @param string input
     * @param boolean sensitivo a mayus/minus
     * @return bool
     */
    public static function check ($input, $caseSensitive = false)
    {
        $code = $_SESSION[APP]['securimage'];
        if ($caseSensitive) {
            if ($input === $code) {
                $_SESSION[APP]['securimage'] = '';
                return true;
            }
        } else {
            if (! strcasecmp($input, $code)) {
                $_SESSION[APP]['securimage'] = '';
                return true;
            }
        }
        return false;
    }
    /**
     * Genera un Código de verificación
     * @return string El codigo generado
     */
    protected function generateCode ()
    {
        if ($this->minLength < 3)
            $this->minLength = 3;
        if ($this->maxLength > 20)
            $this->maxLength = 20;
        if ($this->minLength > $this->maxLength)
            $this->maxLength = $this->minLength;
        $length = rand($this->minLength, $this->maxLength);
        $letters = 'bcdfghjklmnpqrstvwxyz';
        $vowels = 'aeiou';
        $code = '';
        for ($i = 0; $i < $length; ++ $i) {
            if ($i % 2 && rand(0, 10) > 2 || ! ($i % 2) && rand(0, 10) > 9)
                $code .= $vowels[rand(0, 4)]; else
                $code .= $letters[rand(0, 20)];
        }
        $this->_saveCode($code);
        return $code;
    }
    /**
     * muestra la imagen CAPTCHA basada en el codigo.
     * @param string el código de verificación
     * @return string contenido imagen
     */
    protected function renderImage ($code)
    {
        $image = imagecreatetruecolor($this->width, $this->height);
        $backColor = imagecolorallocate($image, (int) ($this->backColor % 0x1000000 / 0x10000), (int) ($this->backColor % 0x10000 / 0x100), $this->backColor % 0x100);
        imagefilledrectangle($image, 0, 0, $this->width, $this->height, $backColor);
        imagecolordeallocate($image, $backColor);
        $foreColor = imagecolorallocate($image, (int) ($this->foreColor % 0x1000000 / 0x10000), (int) ($this->foreColor % 0x10000 / 0x100), $this->foreColor % 0x100);
        if ($this->fontFile === null) {
            $this->fontFile = CAPTCHA_VENDOR_DIR . 'Duality.ttf';
        }
        $offset = 2;
        $length = strlen($code);
        $box = imagettfbbox(30, 0, $this->fontFile, $code);
        $w = $box[4] - $box[0] - $offset * ($length - 1);
        $h = $box[1] - $box[5];
        $scale = min(($this->width - $this->padding * 2) / $w, ($this->height - $this->padding * 2) / $h);
        $x = 10;
        $y = round($this->height * 27 / 40);
        for ($i = 0; $i < $length; ++ $i) {
            $fontSize = (int) (rand(26, 32) * $scale * 0.8);
            $angle = rand(- 10, 10);
            $letter = $code[$i];
            $box = imagettftext($image, $fontSize, $angle, $x, $y, $foreColor, $this->fontFile, $letter);
            $x = $box[2] - $offset;
        }
        imagecolordeallocate($image, $foreColor);
        header('Pragma: public');
        header('Expires: 0');
        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        header('Content-Transfer-Encoding: binary');
        header("Content-type: image/png");
        imagepng($image);
        imagedestroy($image);
    }
}
