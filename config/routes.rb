Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products, only: [:index, :create]

  get '/products/:id/description', to: 'products#description'
  get '/products/:id/available',   to: 'products#inventory'
end
