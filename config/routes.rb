Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'static#home'
  #post 'new', to: 'products#create'
  resources :products
  resources :orders
  resources :invoices
  get '/products/:id', to: 'products#inventory'
  get '/description/:id', to: 'products#description'
end
