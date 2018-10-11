Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  
  get '/products/:id/description', to: 'posts#description'
end
