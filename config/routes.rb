Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations'  }

  root to: 'home#index'
  get 'description', to: 'home#description'

  #nested resources
  resources :users do
    resources :articles
  end

  resources :articles, :journals
  resources :searches
  resources :demands
  #get '/users/:id', to: 'authors#show'
  # get '/auth/:provider/callback', to: 'sessions#create'
end
