Rails.application.routes.draw do
  resource :users, only: [:new]

  get '/login' to: "session#new"
end
