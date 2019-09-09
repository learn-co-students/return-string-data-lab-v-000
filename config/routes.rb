Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'static#home'
  get 'products/:id/description', to: 'products#description'
  get '/:id/inventory', to: 'products#inventory'
  resources :orders
  resources :invoices
  resources :products
end
