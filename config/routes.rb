Rails.application.routes.draw do
  devise_for :users
  resources :clients do
    resources :services, only: [:new, :create]
  end
  resources :services
  resources :medicines
  resources :doctors
  root to: "pages#home"
  get "clients/:id/upload", to: "clients#upload"
  get "clients/:id/client_photos", to: "clients#client_photos"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
