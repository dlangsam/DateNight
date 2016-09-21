Rails.application.routes.draw do
  root to: "date_ideas#index"
  get "/search", to: "date_ideas#search"
  resources :date_ideas

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
