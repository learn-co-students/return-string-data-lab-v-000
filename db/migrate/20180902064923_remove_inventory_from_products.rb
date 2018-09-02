class RemoveInventoryFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :inventory, :string
  end
end
