Rails.application.routes.draw do
  get 'home', to: 'static#home'
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/inventory', to: 'products#inventory'
  get '/products/:id/truncated-description', to: 'products#truncated_description'
  resources :products, only: [:new, :create, :index]
  resources :orders
  resources :invoices
end
