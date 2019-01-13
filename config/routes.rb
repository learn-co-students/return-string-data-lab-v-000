Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products, only: [:index, :show, :new, :create, :edit]
  #1.) set up route to get the body of the post 
  get '/products/:id/description', to: 'products#description'


  #5 .) Add another route to evaluate whether inventory exists
  get '/products/:id/inventory', to: 'products#inventory'
end
