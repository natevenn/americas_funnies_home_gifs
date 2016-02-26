Rails.application.routes.draw do
  resource :users, only: [:new, :create, :show]
  get '/register', to: "users#new"
end
