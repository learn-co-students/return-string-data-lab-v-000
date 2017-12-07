Rails.application.routes.draw do
  get 'home', to: 'static#home'
  get '/products/:id/body', to: 'products#body'
  get '/products/:id/inventory', to: 'products#inventory'
  resources :orders
  resources :invoices
  resources :products, only: [:index, :new, :create, :show]
end
