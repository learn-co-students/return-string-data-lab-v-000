Rails.application.routes.draw do

  get 'home', to: 'static#home'
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/available', to: 'products#available'
  get '/products/:id/inventory', to: 'products#inventory'

  post '/products', to: 'products#create'

  resources :orders
  resources :invoices
  resources :products, only: [:index, :new, :create]
end