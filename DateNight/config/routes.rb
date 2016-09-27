Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "date_ideas#home"
  get "/search", to: "date_ideas#search"
  resources :date_ideas
  resources :users do
  	resources :date_ideas
  end
  scope "/api" do
  	get "/date_ideas", to: "date_ideas_api#search"
    post "/date_ideas", to: "date_ideas_api#create"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
