Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  get 'products/:id/inventory', to: 'products#inventory'
  get '/products/:id/description', to: 'products#description'
  resources :products, only: [:new,:create,:index]
end
