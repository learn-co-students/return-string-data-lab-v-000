Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :products, only: [:index, :show, :create, :new]
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/inventory', to: 'products#inventory'

  resources :orders
  resources :invoices
end
