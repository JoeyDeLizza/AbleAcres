Rails.application.routes.draw do
  get 'products/create'
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/hello", to: "hello#index"
  get "/menu/toggleon", to: "menu#toggleon"
  get "/menu/toggleoff", to: "menu#toggleoff"
  #get "/menu/togglemobilemenuon", to: "menu#togglemobilemenuon"
  get "/menu/toggleoff", to: "menu#toggleoff"
  get "/sessions/destroy", to: "sessions#destroy"
  get "/store", to: "store#index"
  get "/", to: "store#index"
  get "/admin", to: "admin#index"
  get "/about", to: "about#index"
  get "/gallery", to: "gallery#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
