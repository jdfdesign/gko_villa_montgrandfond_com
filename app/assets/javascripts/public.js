//= require gko/jquery.elastidegallery
$(document).ready(function() {

	function init() {
		if($('.images:first').length > 0) {
			Gallery.init($('.images:first'));
		} 
		$("body").fadeIn(3000).css("display", "block");
	}
	
	init();
});