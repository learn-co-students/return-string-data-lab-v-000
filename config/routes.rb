Rails.application.routes.draw do
  get '/', to: 'products#index'
  get 'products/:id/description', to: 'products#description'
  get 'products/:id/inventory', to: 'products#inventory'
  resources :orders
  resources :invoices
  resources :products
end
