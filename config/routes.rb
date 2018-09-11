Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products

  # No route matches {:action=>"create", :controller=>"products", :product=>{:name=>"Test", :price=>"3.99", :inventory=>"12", :description=>"This is a great thing"}}
end
