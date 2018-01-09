class AddInventoryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :inventory, :string
  end
end
