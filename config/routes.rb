Rails.application.routes.draw do
  get 'mycontrol/index'
  root "mycontrol#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
