Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :recipes do
  	resources :reviews, only: [:index, :create]
  end

  resources :users
end
