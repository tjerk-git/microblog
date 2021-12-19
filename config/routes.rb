Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  get 'stats', to: 'posts#stats', as: 'stats'
  put '/posts/heart/:id', to: 'posts#heart', as: 'heart'
end
