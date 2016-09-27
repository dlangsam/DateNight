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
			error: logError
		});	
	});
	$('.js-date-spots').on('click', '.js-add-date-to-user', function(e){
		e.preventDefault();
		var loginButton = $('.js-login');
		if(loginButton.text() == " Sign In"){
			$('.js-login-modal').modal("show");
		}
		var button =  e.currentTarget;
		var yelpId =  $(button).data("id");
		var name =  $(button).data("name");
		var city =  $(button).data("city");
		
		var lat =  $(button).data("lat");
		var long =  $(button).data("long");
		var image =  $(button).data("image");
		console.log(image);
		$(button).addClass("clicked");
		$.ajax({
		 	method: "post",  
		 	url: "/api/date_ideas",
		 	data: {date_idea: {yelp_id: yelpId, name: name,
		 	 city: city, latitude: lat, longitude: long, image_file: image}}, 
		 	 //latitude: lat, longitude: long, image_file: image} },
		 	success: function(response){
		 		updateSavedPlaces(response);
		 	},
		 	failure: logError
		 });

	})



})
function logError(response){
	console.log(response);
}
function updateSavedPlaces(response){
	console.log(response);
	var button = $(".btn.js-add-date-to-user.clicked")	

	var savedButton = `<button class = "btn js-add-date-to-user" data-id="${response.yelp_id}" data-name ="${response.name}">Saved! </button>`
	button.parent().append(savedButton);
	button.remove();
}

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
                        <div class="thumbnail" >
                        	<a href = ${dateSpot.url} target="_blank">
                            <img src=${dateSpot.image_url} alt="">
                            <div class="caption">
                                <h4><a href="#">${dateSpot.name}</a>
                                </h4>
                                <p class = "review-snippet">${dateSpot.snippet_text}</p>
                            </div>
                            <div class="ratings">
                                
                                <p>
                                    <img src = ${dateSpot.rating_img_url_large} alt = "${dateSpot.rating} stars">
                                    <br>
                               		<span class="pull-right">${dateSpot.review_count} reviews</span>
                                </p>
                                
                            </div>
                            </a>
                            <button class = "btn js-add-date-to-user" data-id="${dateSpot.id}" data-name ="${dateSpot.name}"
							data-city="${dateSpot.location.city}" data-lat ="${dateSpot.location.coordinate.latitude}"
							data-long ="${dateSpot.location.coordinate.longitude}"" data-image = "${dateSpot.image_url}"
                            >Save Date </button>
                        </div>
                    </div>`;
   
    dateHolder.append(dateHtml)                

}


