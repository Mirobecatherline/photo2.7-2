Rails.application.routes.draw do
  get 'authentication/firebase_auth'
  resources :featured_images
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :images
  # resources :users
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  get "/user_images", to: "images#show"
  post 'firebase_auth', to: 'authentication#firebase_auth'
  get "/users", to: "users#index"

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
