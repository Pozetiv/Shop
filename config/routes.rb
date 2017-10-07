Rails.application.routes.draw do
  get 'mycontroller/index'
   root "mycontroller#index"
  resources :mycontroller
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get '/singup', to: 'users#new'
  post '/singup', to: 'users#new'
end
