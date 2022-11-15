Rails.application.routes.draw do
  devise_for :users
  resources :clients do
    resources :services, only: [:new, :create]
  end
  resources :services
  resources :medicines
  resources :doctors
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
