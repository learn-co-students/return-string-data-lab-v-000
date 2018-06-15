Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products
  get 'products/:id/description' => 'products#description'
  get 'inventory/:id' => 'products#inventory'
end
