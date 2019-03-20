Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'static#home'
  resources :orders, :invoices, :products

  get '/products/:id/inventory' => 'products#inventory'
  get '/products/:id/description' => 'products#description'
end
