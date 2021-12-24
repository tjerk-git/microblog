Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users
  resources :users
  resources :posts, param: :slug

  # Defines the root path route ("/")
  root "posts#index"

  get 'stats', to: 'posts#stats', as: 'stats'
  get 'subscribe', to:'subscriptions#index', as: 'subscriptions'
  get '404', :to => 'errors#not_found'

  put '/posts/heart/:id', to: 'posts#heart', as: 'heart' 
  patch '/posts/edit/:slug', to: 'posts#update', as: 'post_slug_update'


  match "/500", to: "errors#not_found", via: :all
end
