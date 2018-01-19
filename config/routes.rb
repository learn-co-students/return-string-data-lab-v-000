Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products
  #get '/products/new', to: 'products'
  #post '/products', to: 'products#create'
  get '/inventory/:id', to: 'products#inventory'
  get '/description/:id', to: 'products#description'
end
