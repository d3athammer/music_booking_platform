Rails.application.routes.draw do
  get 'timeslots/new'
  get 'timeslots/create'
  devise_for :users
  root to: "pages#home"

  resources :studios do
    resources :rooms, only: %i[new create show]
  end

  resources :rooms, except: %i[new create show destroy] do
    resources :reservations, only: %i[new create index destroy show]
  end

  resources :rooms, only: [:destroy]

  # get "", to: "#"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
