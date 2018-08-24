Rails.application.routes.draw do
  get 'home', to: 'static#home'
  get 'products', to: 'products#index'
  get 'products/new', to: 'products#new'
  get 'products/:id/description', to: 'products#description'
  get 'products/:id/inventory', to: 'products#inventory'
  post 'products', to: 'products#create'
  resources :orders
  resources :invoices

end
