Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  get '/register', to: "users#new"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/admins', to: 'admins#index'
end
