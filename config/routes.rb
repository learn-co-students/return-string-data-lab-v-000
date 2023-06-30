Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices

  resources :products
  get '/products/:id/description', to: 'products#description', as: 'product_description'
  get '/products/:id/inventory', to: 'products#inventory', as: 'product_inventory'
end
