Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products
  get 'products/:id/plain' => 'products#plain'
  get 'products/:id/inventory' => 'products#inventory'
end
