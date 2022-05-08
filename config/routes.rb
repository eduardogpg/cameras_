Rails.application.routes.draw do
  get 'institutions/index'
  root 'institutions#index'

  resources :institutions, only: [:index, :show]
  resources :places
end
