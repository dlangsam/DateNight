class DateIdeasApiController < ApplicationController
  def search
     parameters = { term: params[:term], limit: 16 }
     location = params[:zip]
    render json: Yelp.client.search(location)
  end
end
