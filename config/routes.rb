Rails.application.routes.draw do
  get 'home', to: 'static#home'

  resources :orders
  resources :invoices

  resources :products, only: [:index, :new, :create] do
    member do
      get 'inventory'
      get 'description'
    end
  end

end
