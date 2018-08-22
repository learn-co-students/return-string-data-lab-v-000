Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices

  resources :products
  # get '/products/:id', to: 'controller#action'
  get '/products/:id/description', to: 'products#description'

  # want a route that returns if a product has inventory, as a string 'true' or 'false'
  get '/products/:id/inventory', to: 'products#inventory'

end
