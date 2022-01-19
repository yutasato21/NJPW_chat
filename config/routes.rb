Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  
  get 'rooms/index'
  root 'rooms#index'

  resources :users, only: :show
  resources :rooms do
    resources :comments, only: [:create, :destroy]
  end
end
