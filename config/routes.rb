Rails.application.routes.draw do

  get 'home', to: 'static#home'
  resources [:orders, :invoices]
  resources :products, only: [:index, :show, :new, :create]
	
	post '/products', to: 'products#create'
	
	get '/products/:id/description', to: 'products#description'
  get '/products/:id/available', to: 'products#available'
  get '/products/:id/inventory', to: 'products#inventory'
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/inventory', to: 'products#inventory'
end