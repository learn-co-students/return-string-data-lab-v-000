class AddDescandInventoryCounttoProducts < ActiveRecord::Migration
  def change
    add_column :products, :description, :string
    add_column :products, :inventory_count, :integer
  end
end
