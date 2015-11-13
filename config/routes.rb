Rails.application.routes.draw do

  # get 'sessions/new'

  root 'cities#index'

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy]
  resources :cities, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  delete 'logout'  => 'sessions#destroy'
end
