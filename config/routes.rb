Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products, only: [:new, :create, :index]

  #power AJAX request to replace truncated content on /posts with full body of post
  get '/products/:id/description', to: 'products#description'

  get '/products/:id/inventory', to: 'products#inventory'
end
