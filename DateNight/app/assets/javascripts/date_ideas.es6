// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("turbolinks:load", function(){
	$('.js-search').on('click', function(e){
		e.preventDefault();
		var zip = $('.js-zip').val();
		var apiUrl = "/api/date_ideas/" + "?zip=" + zip + "&term=" + "food"
		$.ajax({
			url: apiUrl,
			success: loadSearchResults,
			error: function(error){
				console.log("Error gettig data from yelp");
			}				
		});	
	});



})

function loadSearchResults(response){
	var $dateList = $('.js-date-list');
	$dateList.empty();
	var html = ""
	response.businesses.forEach(function(business){
		html += `<li>${business.name}</li>`;
	});
	$dateList.append(html);

	console.log(response);
}