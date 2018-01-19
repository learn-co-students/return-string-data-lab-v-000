Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products
  get 'products/:id/description' => 'products#description'
  post 'products/new' => 'products#create'
  get 'products/:id/inventory' => 'products#inventory'
end
