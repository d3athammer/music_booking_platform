Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :studios do
    resources :reservations, only: %i[show create new update edit]
  end

  # *TODO pundit
  resources :studios do
    resources :reviews, only: %i[create new]
  end

  resources :studios, only: %i[destroy]

  # *TODO pundit
  resources :reviews, only: %i[destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
