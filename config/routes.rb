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


  namespace 'api', defaults: { format: :json } do
    namespace 'v1' do
      resources :orders, only: [:index]
      resources :sessions, only: [:create, :destroy]
    end
  end

end
