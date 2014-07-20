Rails.application.routes.draw do

  root to: 'projects#index'

  resources :sessions, :only => [:destroy, :create, :new]
  
  resources :projects do #, :only =>[:new, :create, :index, :show] 
    resources :reviews, :only => [:index, :show, :create]
  end

  resources :pledges, :only =>[:create]

  resources :categories, :only =>[:index, :show]

  resources :users, :only =>[:new, :create, :show, :edit, :update]

  resources :user_sessions, :only=>[:new,:create, :destroy]
	get 'login' => 'user_sessions#new', :as => :login
	post 'logout' => 'user_sessions#destroy', :as => :logout


end
