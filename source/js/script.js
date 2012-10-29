$(function() {
	$.each($('header nav ul li a'), function(index, value) {
		if($(value).attr('href') === window.location.pathname) {
			$(value).addClass('active');
		}
	});

	
	var map;
	initMap();
	$('header nav ul li a').click(function(){
		$('header nav ul li a.active').removeClass('active');
		$(e.target).addClass('active');
	});
	
});




initMap = function() {
	log('maps init');
	mapOptions = {
		center: new google.maps.LatLng(41.177911,-8.595997),
		zoom: 15,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		disableDefaultUI: false,
		scrollwheel: false
	};
	log('creating map');
	map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

	addMarkersInit();



};

function addMarkersInit(){
	var markers = [
		{"name": "FEUP", "pos": new google.maps.LatLng(41.177911,-8.595997) },
		{"name": "Ja La Foste", "pos": new google.maps.LatLng(41.177255,-8.599572) },
		{"name": "Campus S. Joao", "pos": new google.maps.LatLng(41.180495,-8.604709) }
	];
	addMarkers(0, markers);
};

function addMarkers(i, markers){
	new google.maps.Marker({
		position: markers[i].pos,
		title: markers[i].name,
		map: map,
		draggable: false,
		animation: google.maps.Animation.DROP
	})
	if( i < markers.length - 1){
		setTimeout(function(){addMarkers(i+1, markers);}, 300);
	}
}

log = function(foo) {
	console.log(foo);
};
	