Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations'  }

  root to: 'home#index'
  get 'description', to: 'home#description'

  resources :articles
  resources :searches
  resources :demands
  get '/users/:id', to: 'authors#show', as: 'author'
  # get '/demands/:id', to: 'demands#destroy', as: 'destroy_demand'
  # get '/auth/:provider/callback', to: 'sessions#create'
end
