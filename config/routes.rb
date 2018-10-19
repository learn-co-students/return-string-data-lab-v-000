Rails.application.routes.draw do

  # there is no static controller, ignore this route
  # get 'home', to: 'static#home'

  resources :orders
  resources :invoices
  resources :products

  get 'products/:id/description' => 'products#description'
  get 'products/:id/inventory' => 'products#inventory'
end
