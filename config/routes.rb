Rails.application.routes.draw do
  resources :items
  root "items#index"

  resources :order_items


  get 'Cart', to: "carts#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
