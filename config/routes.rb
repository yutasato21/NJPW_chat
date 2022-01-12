Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  
  get 'rooms/index'
  root 'rooms#index'

  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:index, :new, :create]
end
