Rails.application.routes.draw do
  devise_for :users
  get 'rooms/index'
  root 'rooms#index'
end
