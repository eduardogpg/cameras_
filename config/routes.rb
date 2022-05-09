Rails.application.routes.draw do
  get 'regions/index'
  root 'regions#index'

  resources :regions, only: [:index, :show]
  resources :places
end
