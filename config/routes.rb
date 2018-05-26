Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices

  resources :products, only: [:index, :show, :new, :create, :edit]
  # get '/products/:id/body', to: 'products#body'
  get '/products/:id/inventory', to: 'products#inventory'
  get '/products/:id/description', to: 'products#description'
end
