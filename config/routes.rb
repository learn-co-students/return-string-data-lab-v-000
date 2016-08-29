Rails.application.routes.draw do
  resources :products
  get 'home', to: 'static#home'
  get 'products/:id/inventory', to: 'products#inventory'
  get 'products/:id/description', to: 'products#description'
  resources :orders
  resources :invoices
end
