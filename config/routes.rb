Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products

  get '/products/:id/inventory', to: 'products#inventory' 
  get '/products/:id/description', to: 'products#description' 
end



# Prefix Verb   URI Pattern                  Controller#Action
#         home GET    /home(.:format)              static#home
#       orders GET    /orders(.:format)            orders#index
#              POST   /orders(.:format)            orders#create
#    new_order GET    /orders/new(.:format)        orders#new
#   edit_order GET    /orders/:id/edit(.:format)   orders#edit
#        order GET    /orders/:id(.:format)        orders#show
#              PATCH  /orders/:id(.:format)        orders#update
#              PUT    /orders/:id(.:format)        orders#update
#              DELETE /orders/:id(.:format)        orders#destroy
#     invoices GET    /invoices(.:format)          invoices#index
#              POST   /invoices(.:format)          invoices#create
#  new_invoice GET    /invoices/new(.:format)      invoices#new
# edit_invoice GET    /invoices/:id/edit(.:format) invoices#edit
#      invoice GET    /invoices/:id(.:format)      invoices#show
#              PATCH  /invoices/:id(.:format)      invoices#update
#              PUT    /invoices/:id(.:format)      invoices#update
#              DELETE /invoices/:id(.:format)      invoices#destroy
#     products POST   /products(.:format)          products#create