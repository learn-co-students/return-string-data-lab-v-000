Rails.application.routes.draw do

  resources :orders
  resources :invoices
  resources :products
  get 'home', to: 'products'

  get '/products/:id/description', to: 'products#description'
  get '/products/:id/inventory', to: 'products#inventory'
end
