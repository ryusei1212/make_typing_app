Rails.application.routes.draw do
  root 'home_screen#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/type',to: 'type#index'
end
