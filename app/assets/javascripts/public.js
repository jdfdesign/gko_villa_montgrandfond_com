//= require gko/jquery.elastidegallery
$(document).ready(function() {

	
	function resizeContent() {
		var bodyHeight = $("#wrapper-wide-body").height(),
				winHeight = $(window).height(),
				h = Math.max(bodyHeight, winHeight);
				
		$("#main-column, #header").css({'min-height': h});
	}
	
	function init() {
		resizeContent();
		if($('.images:first').length > 0) {
			Gallery.init($('.images:first'));
		} 
		$("body").fadeIn(3000).css("display", "block");
		$(window).bind('resize', resizeContent);
	}
	
	init();
});