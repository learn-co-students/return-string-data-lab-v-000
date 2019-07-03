Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'static#home'

  resources :orders
  resources :invoices

  post '/products',  to: 'products#create'
  get '/products',  to: 'products#inventory'
  get '/products',  to: 'products#description'
end
