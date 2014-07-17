Rails.application.routes.draw do
  root to: 'projects#index'

  
  resources :projects
  resources :rewards
  resources :categories



end
