Rails.application.routes.draw do
  get 'home', to: 'static#home'
    resources :orders
    resources :invoices

    get 'products/inventory/:id', to: 'products#inventory'
    get 'products/description/:id', to: 'products#description', as: 'description'
    resources :products, only: [:new,:create,:index]
end
