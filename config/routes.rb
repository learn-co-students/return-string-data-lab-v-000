Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products

  get 'inventory', to: 'products#inventory'
  get 'description', to: 'products#description'
  get 'products/:id/details', to: 'products#details'
  get 'products/:id/inventory', to: 'products#inventory'
end
