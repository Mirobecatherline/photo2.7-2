Rails.application.routes.draw do
  # get 'authentication/firebase_auth'
  # resources :featured_images
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # resources :images
  # # resources :users
  # post "/signup", to: "users#create"
  # get "/me", to: "users#show"
  # get "/user_images", to: "images#show"
  # post 'firebase_auth', to: 'authentication#firebase_auth'
  # get "/users", to: "users#index"

  # post "/login", to: "sessions#create"
  # delete "/logout", to: "sessions#destroy"

  post "users/register", to: "users#register"
  get "users", to: "users#index"
  patch "users/:id/update_role", to: "users#update_role"

  resources :images, only: [:index, :create]
  patch "images/:id/assign", to: "images#assign_image"

  resources :comments, only: [:create]
  resources :likes, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
