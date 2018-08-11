class AddDescriptionAndInventoryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :description, :string
    add_column :products, :inventory, :string 
  end
end
