class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :inventory, :integer
    add_column :products, :description, :string
    get '/products/:id/description', to: 'products#description'
    get '/products/:id/inventory', to: 'products#inventory'
  end
end
