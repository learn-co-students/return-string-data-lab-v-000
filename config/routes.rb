Rails.application.routes.draw do
  get 'home', to: 'static#home'
  get 'products/:id/description', to: 'products#description'
  get 'products/:id/inventory', to: 'products#inventory'
  resources :products
  resources :orders
  resources :invoices
end
