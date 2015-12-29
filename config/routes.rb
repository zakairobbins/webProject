Rails.application.routes.draw do
  get 'request/get'

  get 'request/post'

  get 'request/destroy'

  resources :sessions
  resources :resumes, only: [:index, :show]
  resources :users
  resources :carts
  resources :line_items
  resources :products

  root 'welcome#index'

  get '/terms' => 'terms#show'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
