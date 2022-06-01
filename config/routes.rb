Rails.application.routes.draw do
  devise_for :users
  resources :todos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "todos#index"
end
