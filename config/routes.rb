Rails.application.routes.draw do
  get 'home', to: 'static#home'
  get '/orders/:id/body' , to: 'products#create'
  resources :orders
  resources :invoices
end
