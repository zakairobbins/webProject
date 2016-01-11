Rails.application.routes.draw do
  get 'contact/new' => 'contact#new'
  post 'contact/create' => 'contact#create'
  get 'orders/create'
  get 'orders/show'
  get 'orders/destroy'

  resources :sessions
  resources :resumes, only: [:index, :show]
  resources :users
  resources :carts
  resources :line_items
  resources :products, only: [:update]
  resources :requests, except: [:index]
  resources :experiences, only: [:destroy]
  resources :educations, only: [:destroy]
  resources :volunteers, only: [:destroy]
  resources :skills, only: [:destroy]

  root 'welcome#index'

  get  '/terms'    => 'terms#show'
  get  '/login'    => 'sessions#new'
  post 'login'     => 'sessions#create'
  get  '/logout'   => 'sessions#destroy'
  get  '/checkout' => 'carts#checkout'
  get  '/charlie'  => 'products#edit'
end
