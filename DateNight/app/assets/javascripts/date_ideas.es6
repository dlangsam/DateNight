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
	var $dateHolder = $('.js-date-spots');
	$dateHolder.empty();
	response.businesses.forEach(function(business){
		addDate($dateHolder, business);
		html += `<li>${business.name}</li>`;
	});
	$dateList.append(html);

	console.log(response);
}
function addDate(dateHolder, dateSpot){

	var dateHtml =
	`<div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src=${dateSpot.image_url} alt="">
                            <div class="caption">
                                <h4><a href="#">${dateSpot.name}</a>
                                </h4>
                                <p>See more snippets like this online store item at <a target="_blank" href="http://www.bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">15 reviews</p>
                                <p>
                                    
                                </p>
                            </div>
                        </div>
                    </div>`;
    dateHolder.append(dateHtml)                

}