Rails.application.routes.draw do
  get 'timeslots/new'
  get 'timeslots/create'
  devise_for :users
  root to: "pages#home"

  resources :studios, except: [:destroy] do
    resources :rooms, only: %i[new create]
  end

  resources :rooms, except: %i[new create] do
    resources :reservations, only: %i[new create]
  end

  resources :studios, only: %i[destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
