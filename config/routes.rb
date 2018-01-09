Rails.application.routes.draw do
  devise_for :users

  root "products#index"
  get 'today_orders', to: 'orders#today_orders'
  get 'api_today', to: 'orders#today_json'


  patch 'status', to: 'orders#status'

  resources :products
  resources :order_items
  resources :orders
  resources :carts
  resources :users


  namespace :api, defaults: { format: :json },
            constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1 do
      resources :sessions, only: [:create, :destroy]
      get 'orders', to: 'orders#orders'
    end
  end

end
