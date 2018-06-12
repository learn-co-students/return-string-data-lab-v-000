Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products
  get 'products/:id/inventory' => 'products#inventory'
  get 'products/:id/description' => 'products#description'
end
