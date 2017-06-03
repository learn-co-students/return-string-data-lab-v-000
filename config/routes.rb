Rails.application.routes.draw do
  root to: 'products#index'
  resources :orders
  resources :invoices
  resources :products
  
  get '/products/:id/description' => 'products#description'
  get '/products/:id/inventory' => 'products#inventory'
end
  