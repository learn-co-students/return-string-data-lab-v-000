Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  get '/products/:id/inventory', to: 'products#inventory'
  get '/products/:id/description', to: 'products#description'
  resources :products, only:[:create,:index, :new]
end
