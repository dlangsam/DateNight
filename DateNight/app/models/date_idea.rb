class DateIdea < ApplicationRecord
	def self.search(location, params)
		puts "here---------------"
		Yelp.client.search(location, params)
	end
end
