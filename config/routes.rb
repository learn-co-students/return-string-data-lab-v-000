Rails.application.routes.draw do
  get 'home', to: 'static#home'
  # resources :products do
  #   get 'description', to: 'products#description'
  #   get 'inventory', to: 'products#inventory'
  # end
  resources :products
  get 'products/:id/description', to: 'products#description'
  get 'products/:id/inventory', to: 'products#inventory'
  resources :orders
  resources :invoices
end
