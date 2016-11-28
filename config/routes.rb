Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products, only: [:index, :show, :new, :create]

  get '/products/:id/inventory' => 'products#inventory', as: :product_inventory
  get '/products/:id/description' => 'products#description', as: :product_description
end
