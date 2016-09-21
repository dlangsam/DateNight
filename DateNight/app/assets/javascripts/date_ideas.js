// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("turbolinks:load", function(){
	$('.js-search').on('click', function(e){
		e.preventDefault();
		console.log("Button clicked");
	});


})