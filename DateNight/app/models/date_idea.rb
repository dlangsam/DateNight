class DateIdea < ApplicationRecord
	has_many :date_idea_user
	has_many :users, through: "date_idea_user"
	def self.search(location, params)
		Yelp.client.search(location, params)
	end
	def self.random_search(location, params, user)
		results = Yelp.client.search(location, params)
		results.businesses.shuffle!
		if user
	
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




end
