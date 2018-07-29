Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products
  get '/inventory/:id' => 'products#inventory'
  get '/description/:id' => 'products#description'
end
