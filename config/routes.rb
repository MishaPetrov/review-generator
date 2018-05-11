Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  resources :campaigns do
    resources :reviews
  end
  
end
