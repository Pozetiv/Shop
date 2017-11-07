Rails.application.routes.draw do

  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  patch 'status', to: 'orders#status'

  resources :products
  resources :order_items
  resources :orders
end
