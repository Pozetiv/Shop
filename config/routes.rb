Rails.application.routes.draw do
  get 'my/index'
  resources :order_items
  get 'sessions/new'
  root "my#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get '/singup', to: 'users#new'
  post '/singup', to: 'users#create'

  get '/singin', to: 'sessions#new'
  post '/singin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :products
 resource :carts, only: [:show]
end
