Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  get '/register', to: "users#new"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  # delete '/login', to: 'sessions#new'
end
