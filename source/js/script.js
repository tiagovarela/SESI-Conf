$(function() {
    $('header nav ul li a').click(function(e){
    	$('header nav ul li a.active').removeClass('active');
    	$(e.target).addClass('active');
    });
});





