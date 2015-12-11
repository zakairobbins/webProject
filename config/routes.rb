Rails.application.routes.draw do
  root 'welcome#index'
  resources :resumes, only: [:index, :show]
  resources :users 
end
