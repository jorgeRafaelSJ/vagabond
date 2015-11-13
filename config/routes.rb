Rails.application.routes.draw do

  root 'cities#index'

  resources :users, only: [:new, :create, :edit, :show, :update]
  resources :sessions, only: [:new, :create, :destroy]
  delete 'logout'  => 'sessions#destroy'


resources :cities, only: [:new, :create, :index, :show] do
  resources :posts, only: [:new, :create, :show, :destroy]
end

post "users/:id/edit"    => "users#edit"
end
