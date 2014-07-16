Rails.application.routes.draw do
  get 'projects/index'

  get 'projects/show'

  get 'projects/create'

  root to: 'visitors#index'
end
