Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products, :only => [:index, :new, :create]
  get  '/products/:id/description' => 'products#description'
  get  '/products/:id/inventory'   => 'products#inventory'
end
