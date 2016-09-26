Rails.application.routes.draw do
  devise_for :users
  root to: "date_ideas#home"
  get "/search", to: "date_ideas#search"
  resources :date_ideas
  scope "/api" do
  	get "/date_ideas", to: "date_ideas_api#search"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
