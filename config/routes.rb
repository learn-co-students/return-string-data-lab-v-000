Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :products
  get '/products/:id/description' => 'products#description'
  get '/products/:id/inventory' => 'products#inventory'
  resources :orders
  resources :invoices
end
