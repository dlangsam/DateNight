// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("turbolinks:load", function(){
	$('.js-search').on('click', function(e){
		e.preventDefault();
		var zip = $('.js-zip').val();
		$.ajax({
			url: "https://api.yelp.com/v3/businesses/search" + this.zip,
			success: function(response){
				console.log(response);
			},
			error: function(error){
				console.log("Error gettig data from yelp");
			}				
		});	
	});


})