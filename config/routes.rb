Rails.application.routes.draw do
  get '/terms' => 'terms#show'

  get 'carts/index'

  get 'carts/new'

  get 'carts/show'

  get 'carts/edit'

  get 'carts/update'

  get 'carts/destroy'

  root 'welcome#index'
  get '/login' => 'sessions#new'

  resources :resumes, only: [:index, :show]
  resources :users
  resources :sessions
end
