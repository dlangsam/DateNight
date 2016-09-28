Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "date_ideas#home"
  get "/search", to: "date_ideas#search"
  resources :date_ideas, only: [:show]
  resources :users, only: [] do
  	resources :date_ideas,  controller: "date_ideas_users", only: [:index]
  end
  scope "/api" do
  	get "/date_ideas", to: "date_ideas_api#search"
    post "/date_ideas", to: "date_ideas_api#create"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
