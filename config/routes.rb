Rails.application.routes.draw do

  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do

  end
  get '/singup', to: 'users#new'
  post '/singup', to: 'users#create'

  get '/singin', to: 'sessions#new'
  post '/singin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :products
  resources :order_items
  resource :cart, only: [:show]
end
