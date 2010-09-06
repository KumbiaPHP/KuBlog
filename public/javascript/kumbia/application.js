jQuery(document).ready(function($) { //shortcut for $(document).ready()
	
	$("a.jsShow").live('click' , function(event) {
				event.preventDefault();
				$(this.rel).show();
				});
	
	$("a.jsHide").live('click', function(event) {
				event.preventDefault();
				$(this.rel).hide();
				});
	
	$("a.jsToggle").live('click', function(event) {
				event.preventDefault();
				$(this.rel).toggle();
				});
    
	$("a.jsRemote").live('click', function(event) {
				event.preventDefault();
				$(this.rel).load(this.href)
				});
	
});
