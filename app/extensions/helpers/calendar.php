<?php
  class Calendar{
      public static function text($field, $attrs = NULL, $value = NULL){
          static $i = false;
          $code   =   '';
          if($i == false){
                  $i = true;                  
                  $code   .=   Tag::js('jquery/ui/minified/jquery.ui.core.min');
                  $code   .=   Tag::js('jquery/ui/minified/jquery.ui.datepicker.min');
          }
          $code   .=   Form::text($field, $attrs, $value);
          $field  =   str_replace('.', '_', $field);
          
          $code   .=  "<script type=\"text/javascript\">
                      $(document).ready(function(){
                          $(\"#" . $field . "\").datepicker({
                          altFormat: 'yy-mm-dd',
                          autoSize: true,
                          dayNames: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sábado'],
                          dayNamesMin: ['Dom', 'Lu', 'Ma', 'Mi', 'Je', 'Vi', 'Sa'],
                          firstDay: 1,
                          monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
                          monthNamesShort: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
                          dateFormat: 'yy-mm-dd',
                          changeMonth: true,
                          changeYear: true,
                          minDate: new Date(1920, 1 - 1, 1)});
                      });
                      </script>";
          return $code;
      }
  }
  ?>