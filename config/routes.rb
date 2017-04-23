Rails.application.routes.draw do

  get 'home', to: 'static#home'
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/available', to: 'products#available'
  get '/products/:id/inventory', to: 'products#inventory'

  post '/products', to: 'products#create'

  resources :orders
  resources :invoices
<<<<<<< HEAD
  resources :products, only: [:index, :show, :new, :create]
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/inventory', to: 'products#inventory'
=======
  resources :products, only: [:index, :new, :create]
>>>>>>> 443ac024a8933692eddc29e4fef18f0f5b8994da
end