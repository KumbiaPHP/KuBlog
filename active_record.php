<?php
/**
 * ActiveRecord
 *
 * Esta clase es la clase padre de todos los modelos
 * de la aplicacion
 *
 * @category   KumbiaPHP
 * @package    Db
 * @subpackage ActiveRecord
 */
// Carga el active record 
Load::coreLib('active_record_base');
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