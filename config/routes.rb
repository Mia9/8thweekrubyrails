Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  root "posts#index"
  # resources :posts #---looking at posts folder cointaining erb files

  resources :posts do
    resources :comments
  end
  
  # post "/posts/:id/like", to: "posts#like", as: "like_post"

  resources :likes, only: [:create, :destroy]
  resources :users, only: [:show]
  post "/users/:id/follow", to: "users#follow", as: "follow_user"
  post "/users/:id/unfollow", to: "users#unfollow", as: "unfollow_user"


end