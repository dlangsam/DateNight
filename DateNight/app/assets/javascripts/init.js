if (window.DateNightApp === undefined){
	window.DateNightApp = {};
}
DateNightApp.init = function(){
	console.log("DateNightApp ONLINE");
};

$(document).on("turbolinks:load", function(){

	if("geolocation" in navigator){
		console.log("Broswer has geolocation");
		var options = {timeout: 10000000};
		navigator.geolocation.getCurrentPosition(function(position){}, handleError, options);
	}else{
		var html = `
		<h2>Update your browser. </h2>
		`;
		$("body").append(html);
		console.log("Browser doesn't have geolation");
	}
	DateNightApp.init();
	

	function handleError(error){
		console.log("There is an error.");
		console.log(error);
	}

	window.onresize = function() {
    if (window.innerHeight >= 820) { /* ... */ }
    if (window.innerWidth <= 1130) {  
    	// $('.navbar-collapse').removeClass("collapse");
    	// $('.navbar-collapse').addClass("collapsed");
    /* ... */ }
}
});