Rails.application.routes.draw do

  root "orders#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :orders
  resources :products
  resources :order_items
  resource :cart, only: [:show]
end
