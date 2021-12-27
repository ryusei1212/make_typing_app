Rails.application.routes.draw do
  root 'home_screen#home'

  get '/types', to: 'types#index'
  get '/types/start', to: 'types#start'

  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :titles
  resources :texts
  
end
