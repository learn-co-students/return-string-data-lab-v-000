Rails.application.routes.draw do
  get 'home' => 'static#home'
  resources :orders
  resources :invoices
  resources :products
  get 'products/:id/description' => 'products#description', as: 'product_desc'
  get 'products/:id/inventory' => 'products#inventory', as: 'product_inv'
end
