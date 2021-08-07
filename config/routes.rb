Rails.application.routes.draw do
  root "static#home"

  resources :users, only: [:new, :create, :show]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :attractions
  resources :rides, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
