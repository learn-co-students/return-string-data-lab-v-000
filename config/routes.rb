Rails.application.routes.draw do
  get 'home', to: 'static#home'
  get 'products/:id/description', to: "products#description"
  resources :orders
  resources :invoices
  resources :products
end
