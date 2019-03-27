Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products, only: [:index, :new, :create]
  get '/inventory/:id', to: 'products#inventory'
  get '/description/:id', to: 'products#description'
  get '/quantity/:id', to: 'products#quantity'
end
