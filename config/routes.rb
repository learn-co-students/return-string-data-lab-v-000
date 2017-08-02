Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products

  get '/products/:id/body', to: 'products#body'
  # get 'products/:id/body'
  get 'products', to: 'products#inventory'
end
