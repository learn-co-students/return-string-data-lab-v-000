class RemoveDescriptionAndInventoryFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :inventory
    remove_column :products, :description
  end
end
