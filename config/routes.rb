Rails.application.routes.draw do


  get 'orders/create'

  get 'orders/show'

  get 'orders/destroy'

  resources :sessions
  resources :resumes, only: [:index, :show]
  resources :users
  resources :carts
  resources :line_items
  resources :products
  resources :requests, except: [:index, :edit, :update]

  root 'welcome#index'

  get '/terms' => 'terms#show'
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
