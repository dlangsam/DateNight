class DateIdea < ApplicationRecord
	def self.search(location, params)
		Yelp.client.search(location, params)
	end
	def self.random_search(location, params)
		results = Yelp.client.search(location, params)
		num_of_businesses = results.businesses.length
		results.businesses.shuffle!.slice!(0,num_of_businesses - 3)
		results

	end



end
