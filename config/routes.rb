Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products

  # Add a route and action that gets just a product description as a plain string.
  get 'product/:id/description', to: 'products#description'

  #Add another route and action that checks if inventory is available.
  #This route should return just "true" or "false" as strings
  get 'product/:id/inventory', to: 'products#inventory'
  
end
