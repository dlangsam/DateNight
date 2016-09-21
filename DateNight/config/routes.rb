Rails.application.routes.draw do
  root to: "date_ideas#index"
  resources :date_ideas

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
