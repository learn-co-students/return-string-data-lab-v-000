class AddColumnInventoryToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :inventory, :integer, :default => 1
  end
end
