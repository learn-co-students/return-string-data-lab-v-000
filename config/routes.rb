Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products
  get '/product/:id/description', to: 'products#description'
  get 'products/:id/inventory', to: 'products#inventory'
end
