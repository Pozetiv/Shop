Rails.application.routes.draw do

  devise_for :users
  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'today_orders', to: 'orders#today_orders'
  get 'api_today', to: 'orders#today_json'


  patch 'status', to: 'orders#status'

  resources :products
  resources :order_items
  resources :orders
  resources :carts
  resources :users


end
