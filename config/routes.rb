Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/inventory', to: 'products#inventory'
  get '/products/:id/stock', to: 'products#stock'
  get '/products', to: 'products#index'
  post '/products', to: 'products#create'
end
