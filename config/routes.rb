Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations'  }

  root to: "home#index"

  resources :articles
  resources :searches 
  # get '/auth/:provider/callback', to: 'sessions#create'
end
