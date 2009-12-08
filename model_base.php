<?php
/**
 * ActiveRecord
 *
 * Esta clase es la clase padre de todos los modelos
 * de la aplicacion
 *
 * @category Kumbia
 * @package Db
 * @subpackage ActiveRecord
 */
class ActiveRecord extends ActiveRecordBase {

    
    public function after_save()
    {
        Flash::success('Operación Exitosa!');
    }

    public function after_delete()
    {
        Flash::success('Registro Eliminado');
    }

}