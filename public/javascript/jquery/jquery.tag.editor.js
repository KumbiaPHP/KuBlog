/*
@author: Karl-Johan Sjögren / http://blog.crazybeavers.se/
@url: http://blog.crazybeavers.se/wp-content/demos/jquery.tag.editor/
@license: Creative Commons License - ShareAlike http://creativecommons.org/licenses/by-sa/3.0/
@version: 1.2
@changelog
 1.2
  Fixed bug with completeOnSeparator for Firefox
  Fixed so that pressing return on an empty editor would submit the form
 1.1
  Initial public release
  Added the completeOnSeparator and completeOnBlur options
*/
(function($) {
	$.fn.extend({
		tagEditor: function(options) {
		var defaults = {
			separator: ',',
			className: 'tagEditor',
			confirmRemoval: false,
			completeOnSeparator: false,
			completeOnBlur: false,
			msjConfirm: "¿Desea Eliminar Etiqueta?",
			url: null,
			params: null
		}

		var options = $.extend(defaults, options);
		var listBase, textBase = this, hiddenText;
		var itemBase = [];

		return this.each(function() {
			var self = $(this)
			options.items = self.val() ? self.val().split(options.separator) : [];
			self.val('');
			hiddenText = $(document.createElement('input'));
			hiddenText.attr('type', 'hidden');
			textBase.after(hiddenText);
			listBase = $(document.createElement('ul'));
			listBase.attr('class', options.className);
			self.after(listBase);

			for (var i = 0; i < options.items.length; i++) {
				addTag(jQuery.trim(options.items[i]));
			}

			buildArray();
			self.keypress(handleKeys);
			self.blur(parse);

			var form = self.parents("form");
			form.submit(function() {
				parse();
				hiddenText.val(itemBase.join(options.separator));
				hiddenText.attr("id", textBase.attr("id"));
				hiddenText.attr("name", textBase.attr("name"));
				hiddenText.attr('type', 'text');
				textBase.remove();
				listBase.remove();
				/*textBase.attr("id", textBase.attr("id") + '_old');
				textBase.attr("name", textBase.attr("name") + '_old');*/
			});

			function addTag(tag) {
				tag = jQuery.trim(tag);
				//tag = tag.replace(/ /, '-');
				for (var i = 0; i < itemBase.length; i++) {
					if (itemBase[i].toLowerCase() == tag.toLowerCase())return;
				}

				var item = $(document.createElement('li'));
				var params = options.params;
				item.text(tag);
				//item.attr('title', 'Remove tag');
				item.attr('title', 'Eliminar Etiqueta');
				item.click(function() {
				if (options.confirmRemoval)
					//if (!confirm("Do you really want to remove the tag?"))return;
					if (!confirm(options.msjConfirm))return;
					if(options.url){
						item.load(options.url, {name: item.html()}, function(response){
							alert(response)
						});
					}
					item.remove();
					parse();
				});
				listBase.append(item);
			}

			function buildArray() {
				itemBase = [];
				var items = $("li", listBase);
				for (var i = 0; i < items.length; i++) {
					itemBase.push(jQuery.trim($(items[i]).text()));
				}
			}

			function parse() {
				var items = textBase.val().split(options.separator);
				for (var i = 0; i < items.length; i++) {
					var trimmedItem = jQuery.trim(items[i]);
					if (trimmedItem.length > 0)
						addTag(trimmedItem);
					}
					textBase.val("");
					buildArray();
			}

			function handleKeys(ev) {
				var keyCode = (ev.which) ? ev.which : ev.keyCode;
				if (options.completeOnSeparator) {
					if (String.fromCharCode(keyCode) == options.separator) {
						parse();
						return false;
					}
				}

				switch (keyCode) {
					case 13:
						if (jQuery.trim(textBase.val()) != '') {
							parse();
							return false;
						}
							return true;
				}
			}
		});
	}});
})(jQuery);
