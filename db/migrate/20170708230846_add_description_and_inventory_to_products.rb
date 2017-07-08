class AddDescriptionAndInventoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :description, :text
    add_column :products, :inventory, :string
  end
end
