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
Load::coreLib('kumbia_active_record');
class ActiveRecord extends KumbiaActiveRecord 
{
    public function after_save()
    {
        Flash::success('Operación Exitosa!');
    }

    public function after_delete()
    {
        Flash::success('Registro Eliminado');
    }

}