Rails.application.routes.draw do
  root 'welcome#index'
  get '/login' => 'sessions#new'

  resources :resumes, only: [:index, :show]
  resources :users
  resources :sessions
end
