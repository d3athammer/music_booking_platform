Rails.application.routes.draw do
  get 'timeslots/new'
  get 'timeslots/create'
  devise_for :users
  root to: "pages#home"

  resources :studios do
    resources :rooms, only: %i[new create show]
    resources :reviews, only: %i[new create show]
  end

  resources :rooms, except: %i[new create show destroy] do
    resources :reservations, only: %i[new create show]
  end

  resources :pages, only: %i[show index update edit]
  # Show will be booking page

  resources :reservations, only: %i[edit update index destroy]
  resources :rooms, only: [:destroy]

  # get "", to: "#"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
