class AddDescriptionAndInventoryCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :description, :text
    add_column :products, :inventory_count, :integer
  end
end
