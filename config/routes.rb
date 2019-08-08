Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'static#home'
  #get '/inventory', to: 'products#inventory'
  #get '/description', to: 'products#description'
  get 'products/:id/inventory', to: 'products#inventory'
  get 'products/:id/description', to: 'products#description'

  resources :orders
  resources :invoices
  resources :products

  #resources :inventories

end
