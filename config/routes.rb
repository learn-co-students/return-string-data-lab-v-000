Rails.application.routes.draw do
  root 'products#index'
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/inventory', to: 'products#inventory'
end
