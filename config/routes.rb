Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products

  get 'product/:id/inventory', to: 'products#inventory'
  get 'product/:id/inventory', to: 'products#description'
end
