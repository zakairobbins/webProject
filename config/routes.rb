Rails.application.routes.draw do


  resources :sessions
  resources :resumes, only: [:index, :show]
  resources :users
  resources :carts
  resources :line_items
  resources :products
  resources :requests, except: [:index, :edit, :update]

  root 'welcome#index'

  get '/terms' => 'terms#show'
  post '/checkout' => 'carts#checkout'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
