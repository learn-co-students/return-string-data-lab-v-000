class AddInventoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :inventory, :integer, :default => 0
  end
end
