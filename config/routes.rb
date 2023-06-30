Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products, only: [:index, :new, :create]

  get '/products/:id/description' => 'products#description'
  get '/products/:id/inventory' => 'products#inventory'
end
