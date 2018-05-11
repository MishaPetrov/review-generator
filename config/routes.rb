Rails.application.routes.draw do

  devise_for :users
  root to: "campaigns#index"

  resources :campaigns do
    resources :reviews
  end

end
