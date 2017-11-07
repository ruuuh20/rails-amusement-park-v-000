Rails.application.routes.draw do



  resources :attractions
  resources :users

  root 'sessions#home'


# sessions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # resources :sessions, only: [:new, :create, :destroy]

  # get '/', to: "sessions#home"

  get '/rides/new' => 'rides#new'
  post '/rides/new' => 'rides#create'


end
