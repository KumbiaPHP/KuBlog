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
 * Plugin para jQuery que incluye los callbacks basicos para los Helpers
 *
 * @copyright  Copyright (c) 2005-2009 Kumbia Team (http://www.kumbiaphp.com)
 * @license    http://wiki.kumbiaphp.com/Licencia     New BSD License
 */
 

(function($) {
    /**
     * Objeto KumbiaPHP
     *
     **/
    $.KumbiaPHP = {
	plugin: [],
        /**
         * Muestra mensaje de confirmacion
         *
         * @param Object event
         **/
        cConfirm: function(event) {
            if(!confirm(this.title)) {
                event.preventDefault();
            }
        },
        /**
         * Aplica un efecto a un elemento
         *
         * @param String fx
         **/
        cFx: function(fx) {
            return function(event) {
                event.preventDefault();
                (($(this.rel))[fx])();
            }
        },
        /**
         * Carga con AJAX
         *
         * @param Object event
         **/
        cRemote: function(event) {
            event.preventDefault();
            $(this.rel).load(this.href);
        },
		/**
		 * Enviar formularios de manera asincronica
		 **/
		cFRemote: function(e){
			e.preventDefault();
			self = $(this);
			var url = self.attr('action');
			var div = self.attr('rel');
			$.post(url, self.serialize(), function(data, status){
				$('#'+div).html(data);
			});
		},
		
        /**
         * Carga con AJAX y Confirmacion
         *
         * @param Object event
         **/
        cRemoteConfirm: function(event) {
            event.preventDefault();
            if(confirm(this.title)) {
                $(this.rel).load(this.href);
            }
        },
        /**
         * Enlaza a las clases por defecto
         *
         **/
        bind : function() {
            $("a.js-confirm").live('click', this.cConfirm);
            $("a.js-remote").live('click', this.cRemote);
            $("a.js-remote-confirm").live('click', this.cRemoteConfirm);
            $("a.js-show").live('click', this.cFx('show'));
            $("a.js-hide").live('click', this.cFx('hide'));
            $("a.js-toggle").live('click', this.cFx('toggle'));
            $("a.js-fade-in").live('click', this.cFx('fadeIn'));
            $("a.js-fade-out").live('click', this.cFx('fadeOut'));
			$("form.js-remote").live('submit', this.cFRemote);
        },
		
		autoload: function(){
			var elem = $("[class*='jp-']");
			jQuery.each(elem, function(i, val){
				var self = $(this);
				var classes = self.attr('class').split(' ');
				for (i in classes){
				    if(classes[i].substr(0, 3) == 'jp-'){
					if(jQuery.inArray(classes[i].substr(3),$.KumbiaPHP.plugin) != -1)continue;
					$.KumbiaPHP.plugin.push(classes[i].substr(3))
				    }
				}
			})
		    for(i in $.KumbiaPHP.plugin){
				var plug = $.KumbiaPHP.plugin[i];
				jQuery.ajaxSetup({ cache: true});
				try{
					$('head').append('<link href="css/'+plug+'.css" type="text/css" rel="stylesheet"/>');
					var script = $('head').append('<script type="javascript"/>');
					$('head').append('<script src="jquery/jquery.'+plug+'.js" type="text/javascript"></script>');
					var call = "jQuery('.jp-"+plug+"')."+plug+'();';
					eval(call);
				}catch(e){
					alert('Ha fallado la carga del plugin "'+ plug +'". '+e);
				}
			}
		}
		
    }
     // Enlaza a las clases por defecto
    $(function(){$.KumbiaPHP.autoload(); $.KumbiaPHP.bind();  });
})(jQuery);
