Rails.application.routes.draw do
 
  root to: 'gossips#index'

  resources :gossips
  resources :cities
  resources :users
  resources :sessions, only: [:new, :create, :destroy]


end
