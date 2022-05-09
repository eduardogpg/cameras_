Rails.application.routes.draw do
  get 'regions/index'
  root 'regions#index'

  resources :regions, only: [:index, :show] do
  end

  resources :places do 
    get :search, on: :collection
  end

end
