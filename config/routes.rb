Rails.application.routes.draw do
  devise_for :users

  root "products#index"

  resources :products
  resources :order_items
  resources :orders
  resources :carts
  resources :users

  get 'today_orders', to: 'orders#today_orders'

  patch 'status', to: 'orders#status'

end
