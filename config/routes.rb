Rails.application.routes.draw do
  resources :orders
  resources :invoices
  resources :products

  get 'home', to: 'static#home'
  get '/products/:id/inventory', to: 'products#inventory'
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/available', to: 'products#available'
end
