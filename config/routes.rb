Rails.application.routes.draw do
  root 'home_screen#home'

  get '/type',to: 'type#index'

  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  
end
