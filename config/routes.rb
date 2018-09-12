Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products

  get '/products/:id/inventory', to: 'products#inventory'
  get '/products/:id/description', to: 'products#description'

  # No route matches {:action=>"create", :controller=>"products", :product=>{:name=>"Test", :price=>"3.99", :inventory=>"12", :description=>"This is a great thing"}}
end
