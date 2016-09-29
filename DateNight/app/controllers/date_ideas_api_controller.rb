class DateIdeasApiController < ApplicationController	
  def search
     parameters = { term: params[:term], type: params[:type]}
     location = params[:zip]
     #call model to serach for date places
    user = current_user != nil ? current_user : nil
    render json: DateIdea.random_search(location, parameters, user)
  

  end
  def create

		unless current_user
			render status: 400, json: {error: "No user"}
			return
		end
		date_idea = DateIdea.find_or_create_by(yelp_id: date_params[:yelp_id])
		date_idea.update(date_params); 
		if date_idea.save 
			if !current_user.date_ideas.include?date_idea
			current_user.date_ideas.push(date_idea)
			render json: date_idea
			end
		else
			render status: 400, json: {error: "Date was not added"}
		end
  end
  private
	def date_params
		params.require(:date_idea).permit(:yelp_id, :name, :city, :latitude, :longitude, :image_file)
	end

end
