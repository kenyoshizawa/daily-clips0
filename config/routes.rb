Rails.application.routes.draw do
  root to: 'home#index'

  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create, :edit, :update]
  # get 'users/new',  to:'users#new'
  # post 'users', to: 'users#create'
  # get 'users/:id/edit', to: 'users#edit'
  # put 'users/:id', to: 'users#update'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :rooms, only: [:show, :new, :create]
  mount ActionCable.server => '/cable'
  # get 'rooms/:id', to: 'rooms#show'
  # get 'rooms/new', to: 'rooms#new'
  # post 'rooms', to: 'rooms#create'
end
