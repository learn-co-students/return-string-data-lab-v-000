class ChangeInventoryTypeForProducts < ActiveRecord::Migration
  def change
    change_column :products, :inventory, :float
  end
end
