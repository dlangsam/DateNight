class DateIdea < ApplicationRecord
	has_many :date_idea_user
	has_many :users, through: "date_idea_user"
	geocoded_by :address
  	after_validation :geocode
	def self.search(location)
		Yelp.client.search(location, params)
	end
	def self.random_search(location, params, user)

		type = params[:type]
	
		
		yelp_params = get_search_params(type)
		puts yelp_params
		results = Yelp.client.search(location, yelp_params)
		results.businesses.shuffle!
		if user
		users_dates = user.date_ideas
		dates_found = 0
		results.businesses.select! do |b|
			the_date = DateIdea.find_by(yelp_id: b.id)
			result = the_date == nil || !users_dates.include?(the_date)
			dates_found += result ? 1: 0
			break if dates_found == 3
			result	
		end
		end



		results.businesses.slice!(3,results.businesses.length)
		results

	end

	def self.get_search_params(type)
		search_params = {}
		case type
		when "Drinks"
			search_params["category_filter"] = "bars,beergardens"
		when "Lunch"
			search_params["category_filter"] = "cafes,delis"
		when "Casual Dinner"
			search_params["category_filter"] = "restaurants"
			search_params["term"]= "casual dinner"
		when "Fancy Dinner"
			search_params["category_filter"] ="restaurants"
			search_params["term"] = "fancy dinner"
		when "Dancing"
			search_params["category_filter"] ="danceclubs,countrydancehalls,dancerestaurants"
		when "Music/Theater"
			search_params["category_filter"] = "musicvenues,pianobars,comedyclubs,dinnertheater,driveintheater,opera,musicvenues,cabaret"
		when "Dessert"
			search_params["category_filter"] = "desserts,cupcakes,creperies,icecream"
		else
			search_params[:category] = "restaurants,bars,arts"
		end
		search_params

	end




end
