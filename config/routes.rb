Rails.application.routes.draw do
  root "static#home"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create', as: 'users'
  get '/users/:id', to: 'users#show'

  resources :attractions
  # resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
