Rails.application.routes.draw do
  get 'home', to: 'static#home'
  
  resources :orders
  resources :invoices
  
  get "/inventory", to: "products#inventory"
  get "/description", to: "products#description"

  resources :products do
    get "/inventory", to: "products#inventory"
    get "/description", to: "products#description"
  end
end
