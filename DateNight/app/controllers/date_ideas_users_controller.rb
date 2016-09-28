class DateIdeasUsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :create, :update]
	def index
    @current_user = current_user
    @date_ideas = current_user.date_ideas

  	end
end
