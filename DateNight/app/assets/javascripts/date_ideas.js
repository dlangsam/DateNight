// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("turbolinks:load", function(){
	$('.js-search').on('click', function(e){
		e.preventDefault();
		var zip = $('.js-zip').val();
		var apiUrl = "/api/date_ideas/" + "?zip=" + zip
		$.ajax({
			url: apiUrl,
			success: function(response){
				console.log(response);
			},
			error: function(error){
				console.log("Error gettig data from yelp");
			}				
		});	
	});


})