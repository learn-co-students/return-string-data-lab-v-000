Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices

  resources :products, only: [:index, :show, :new, :create, :edit, :update]

  get '/products/:id/description', to: 'products#description'
  get '/products/:id/inventory', to: 'products#inventory'
end
