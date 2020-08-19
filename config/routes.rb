Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :recipes do
  	resource :favorites, only: [:index, :create, :destroy]
  	resources :reviews, only: [:index, :create]
  	resources :comments, only: [:create, :destroy]
  end

  resources :users
end
