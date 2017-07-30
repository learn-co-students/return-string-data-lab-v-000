Rails.application.routes.draw do
  get 'home', to: 'static#home'

  resources :orders
  resources :invoices
  resources :products, only: [:create, :index, :new]

  get "/products/:id/description" => "products#description"
  get 'products/:id/inventory' => 'products#inventory'
end
