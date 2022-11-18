Rails.application.routes.draw do
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users
  resources :products
  resources :pictures
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/hello", to: "hello#index"
  get "/menu/toggleon", to: "menu#toggleon"
  get "/menu/toggleoff", to: "menu#toggleoff"
  #get "/menu/togglemobilemenuon", to: "menu#togglemobilemenuon"
  get "/menu/toggleoff", to: "menu#toggleoff"
  get "/sessions/destroy", to: "sessions#destroy"
  get "/store", to: "products#index"
  get "/", to: "store#index"
  get "/admin", to: "admin#index"
  get "/admin/upload", to: "pictures#new"
  get "/about", to: "about#index"
  get "/gallery", to: "pictures#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
