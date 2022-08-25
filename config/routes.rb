Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "properties", to: "properties#index"
  get "properties", to: "properties#show"
  post "properties", to: "properties#create"
  delete "properties", to: "properties#destroy"
  patch "properties", to: "properties#update"


  get "account", to: "pages#account"
  get "account", to: "account#edit"
  post "account", to: "account#create"

  get "reservations", to: "reservations#index"
  get "reservations", to: "reservations#show"
  get "reservations", to: "reservations#edit"
  get "reservations", to: "reservations#new"
  post "reservations", to: "reservations#create"
  delete "reservations", to: "reservations#show"

  get "reviews", to: "reviews#new"
  post "reviews", to: "reviews#create"
  get "reviews", to: "reviews#show"

  get "host", to: "host#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
