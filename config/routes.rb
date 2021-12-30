Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'newsletters/latest', to: 'newsletters#latest', as: 'latest'

  devise_for :users
  resources :users
  resources :posts, param: :slug

  resources :newsletters

  # Defines the root path route ("/")
  root "posts#index"

  get 'stats', to: 'posts#stats', as: 'stats'
  get '404', :to => 'errors#not_found'
  post 'delete/image/:slug', :to => 'posts#remove_image', as: 'delete_photo'

  put '/posts/heart/:id', to: 'posts#heart', as: 'heart' 
  patch '/posts/edit/:slug', to: 'posts#update', as: 'post_slug_update'


  match "/500", to: "errors#not_found", via: :all
end
