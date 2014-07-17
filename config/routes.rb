Rails.application.routes.draw do

  root to: 'projects#index'

  resources :projects, :only =>[:new, :create, :index, :show]

  resources :pledge, :only =>[:create]

  resources :categories, :only =>[:index, :show]

  resources :user, :only =>[:new,:create, :show, :edit,:update]

  resources :user_sessions, :only=>[:new,:create, :destroy]
	get 'login' => 'user_sessions#new', :as => :login
	post 'logout' => 'user_sessions#destroy', :as => :logout

end
