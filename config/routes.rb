Rails.application.routes.draw do
  root 'home_screen#home'

  get '/terms',   to: 'home_screen#terms'
  get '/privacy', to: 'home_screen#privacy'

  get '/types', to: 'types#free'
  get '/nomal_types', to: 'types#nomal'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :edit, :create, :update]

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/guest_login', to: 'guest_login#create'

  resources :titles, except: [:show] do
    collection do
      get 'nomal'
    end
  end

  resource :contacts, only: [:new, :create]

end
