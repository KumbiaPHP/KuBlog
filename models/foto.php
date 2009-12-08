<?php
/**
 * Carga la libreria upload
 **/
Load::lib('upload');
/**
 * Carga la libreria wideimage
 **/
//Load::lib('wideimage');
/**
 * Modelo para manipular las fotos de las personas
 * 
 **/
class Foto
{
    /**
     * Guarda la foto de una persona
     *
     * @param string $id id de la foto al guardar
     * @param string $file nombre de la foto
     * @return boolean
     **/
    public function save ($id, $file)
    {
        if ($_FILES[$file]['error'] > 0) {
            Flash::error('Error: No se ha logrado subir el archivo');
            return false;
        }
        if (! in_array($_FILES[$file]['type'], array('image/jpeg' , 'image/pjpeg' , 'image/gif' , 'image/png'))) {
            Flash::error('Error: Solo se admiten imagenes JPEG, PNG y GIF');
            return false;
        }
        if ($_FILES[$file]['size'] > 600 * 1024) {
            Flash::error('Error: No se admiten imagenes superiores a 600KB');
            return false;
        }
        if (Upload::image($file, "$id.jpg")) {
            $file_path = APP_PATH . "public/img/upload/$id.jpg";
            // con marca de agua
            // $watermark = wiImage::load(APP_PATH . "public/img/logo.png");
            // wiImage::load($file_path)->resize(160, 213, 'fill')->merge($watermark, 40, 175)->saveToFile($file_path);
            wiImage::load($file_path)->resize(160, 213, 'fill')->saveToFile($file_path);
            chmod($file_path, 0777);
            return true;
        }
        return false;
    }
    /**
     * Busca la foto y en caso de que exista retorna la ruta relativa respecto al directorio de imagenes
     *
     * @return string $id
     * @return string
     **/
    public function get ($id)
    {
        if (is_file(APP_PATH . "public/img/upload/$id.jpg")) {
            return "upload/$id.jpg";
        }
        return null;
    }
    /**
     * ELimina la foto del usuario
     *
     * @return string $id
     * @return string
     **/
    public function delete ($id)
    {
        $filepath = APP_PATH . "public/img/upload/$id.jpg";
        if (is_file($filepath)) {
            return unlink($filepath);
        }
        return false;
    }
}