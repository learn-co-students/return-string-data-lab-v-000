Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products
  get 'products/:id/plain' => 'product#plain'
  get 'products/:id/inventory' => 'product#inventory'
end
