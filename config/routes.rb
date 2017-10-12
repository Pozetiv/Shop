Rails.application.routes.draw do
  devise_for :users

  root "homes#index"

  get "/user/", to: 'home#user'

  resource :carts, only: [:show]
  resource :homes, only: [:index]
  resource :products
  resource :order_items
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
