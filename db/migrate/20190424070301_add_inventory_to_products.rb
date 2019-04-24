class AddInventoryToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :inventory, :integer
  end
end
