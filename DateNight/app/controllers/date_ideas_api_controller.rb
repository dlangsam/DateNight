class DateIdeasApiController < ApplicationController
  def search
     parameters = { term: params[:term], limit: 16 }
     location = params[:zip]
     #call model to serach for date places
    render json: DateIdea.random_search(location, parameters)
  end
end
