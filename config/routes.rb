Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  get '/products/:id/description', to: 'products#description'
  #post '/products/create' => 'products#create'
  #root 'products#index'
  get '/products/:id/inventory', to: 'products#inventory'
  resources :products, only: [:index, :new, :create]
  #resources :products
end
