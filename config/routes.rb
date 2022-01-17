Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  
  get 'rooms/index'
  root 'rooms#index'

  resources :users, only: :show
  resources :rooms, except: :show do
    resources :comments, only: [:index, :create]
  end
end
