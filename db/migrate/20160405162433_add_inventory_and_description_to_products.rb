class AddInventoryAndDescriptionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :inventory, :integer, default: 0
    add_column :products, :description, :string
  end
end
