Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products, only: [:index, :new, :create]
  root to: 'products#index'
  get 'products/:id/description', to: 'products#description'
  get 'products/:id/availability', to: 'products#availability'
end
