Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :posts, param: :slug
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  get 'stats', to: 'posts#stats', as: 'stats'
  put '/posts/heart/:id', to: 'posts#heart', as: 'heart'

  get '404', :to => 'errors#not_found'
  
  match "/500", to: "errors#not_found", via: :all
end
