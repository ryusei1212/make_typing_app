Rails.application.routes.draw do
  root 'home_screen#home'

  get '/types', to: 'types#index'

  resources :users

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :edit, :create, :update]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :titles
  
  
end
