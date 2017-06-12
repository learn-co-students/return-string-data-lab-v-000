Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices

  get "/products", to: 'products#index'
  get "/products/new", to: 'products#new'
  post "/products" , to: 'products#create'
end
