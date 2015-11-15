Rails.application.routes.draw do

root 'cities#index'

resources :users, only: [:new, :create, :edit, :show, :update]
resources :sessions, only: [:new, :create, :destroy]
delete 'logout'  => 'sessions#destroy'


resources :cities, only: [:new, :create, :index, :show] do
  resources :posts
end

post "users/:id/edit"    => "users#edit"
post "cities/:city_id/posts/:id/edit" => "posts#edit"

# delete "/cities/:city_id/posts/:id"  => "posts#destroy", as: :city_posts_delete
end

