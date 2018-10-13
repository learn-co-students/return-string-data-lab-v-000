Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products

  get 'inventory/:id', to: 'products#inventory'
  get 'description/:id', to: 'products#description'
end
