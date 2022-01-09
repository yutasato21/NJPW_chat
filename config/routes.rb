Rails.application.routes.draw do
  get 'rooms/index'
  root 'rooms#index'
end
