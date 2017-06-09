Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders, :invoices, :products
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/inventory', to: 'products#inventory'
end
