Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  
  get 'rooms/index'
  root 'rooms#index'

  resources :users, only: :show do
    resources :favorites, only: [:new, :create]
  end
  
  resources :rooms do
    resources :comments, only: [:create, :destroy]
    resources :matches, only: [:new, :create, :edit, :update, :destroy]
  end
end
