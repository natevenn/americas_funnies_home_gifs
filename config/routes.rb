Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  get '/register', to: "users#new"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/admin', to: 'admin/base#index'

  resources :categories, only: [:show, :index]

  namespace :admin do
    resources :categories
  end
end
