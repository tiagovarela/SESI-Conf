$(function() {
	$.each($('header nav ul li a'), function(index, value) {
		if($(value).attr('href') === window.location.pathname) {
			$(value).addClass('active');
		}
	});

	
	var map, marker;
	// initMap();
	$('header nav ul li a').click(function(){
		$('header nav ul li a.active').removeClass('active');
		$(e.target).addClass('active');
	});
	
});




// initMap = function() {
// 	log('maps init');
// 	var markers = [
// 		{"name": "FEUP", "pos": new google.maps.LatLng(41.177911,-8.595997) }
// 	];
// 	mapOptions = {
// 		center: new google.maps.LatLng(41.177911,-8.595997),
// 		zoom: 15,
// 		mapTypeId: google.maps.MapTypeId.ROADMAP,
// 		disableDefaultUI: true
// 	};
// 	log('creating map');
// 	map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
// 	marker = new google.maps.Marker({
// 		position: new google.maps.LatLng(41.177911,-8.595997),
// 		title: "FEUP",
// 		map: map,
// 		draggable: false,
// 		animation: google.maps.Animation.DROP
// 	})
// 	if(marker.getAnimation() == null){
// 		marker.setAnimation(null);
// 	} else {
// 		marker.setAnimation(google.maps.Animation.DROP);
// 	}
// };

log = function(foo) {
	console.log(foo);
};
	