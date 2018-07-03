class AddInventoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :inventory, :string
  end
end
