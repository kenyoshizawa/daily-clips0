Rails.application.routes.draw do
  root to: 'users#index'
  get 'signup', to: 'users#new'

  resources :users, only: [:index, :show, :new, :create]
  #   get 'users', to: 'users#index'
  #   post 'users', to: 'users#create'
  #   get 'users/new',  to:'users#new'
  #   get 'user/:id', to: 'users#show'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
