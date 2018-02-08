Rails.application.routes.draw do
  get 'home', to: 'static#home'
  root 'products#index'
  resources :products
  get 'products/:id/body', to: 'products#body'
  get 'products/:id/available', to: 'products#available'
  resources :orders
  resources :invoices

end
