Rails.application.routes.draw do
  root to: 'home#index'

  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
  # get 'users/new',  to:'users#new'
  # post 'users', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :rooms, only: [:show, :create]
  mount ActionCable.server => '/cable'
  # get 'room/:id', to: 'rooms#show'
  # post 'rooms', to: 'rooms#create'
end
