class DateIdeasUsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :create, :update]
	def index
    	@current_user = current_user
    	@date_ideas = current_user.date_ideas
  	end
  	def destroy
  		date_idea = DateIdea.find(params[:id])
  		current_user.date_ideas.delete(date_idea)	
    
   		 respond_to do |format|
      		format.html { redirect_to user_date_ideas_url(current_user), notice: 'Date idea was successfully destroyed.' }
      		format.json { head :no_content }
    	end
    def show
    	@date_idea = DateIdea.find(id: params[:id])
    end
  end
end
