Rails.application.routes.draw do

  root 'products#index'
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products 
end
