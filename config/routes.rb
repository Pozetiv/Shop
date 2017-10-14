Rails.application.routes.draw do
  get 'sessions/new'
  root "users#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get '/singup', to: 'users#new'
  post '/singup', to: 'users#create'

  get '/singin', to: 'sessions#new'
  post '/singin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
