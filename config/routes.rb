Rails.application.routes.draw do
  get 'home', to: 'static#home'
  get 'inventory', to: 'products#inventory'
  get 'description', to: 'products#description'
  resources :orders
  resources :invoices
  resources :products
end
