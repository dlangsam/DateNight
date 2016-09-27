class DateIdeaUser < ApplicationRecord
	belongs_to :date_idea
	belongs_to :user
end
