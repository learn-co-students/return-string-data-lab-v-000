class AddInventoryAndDescriptionToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :inventory, :integer
    add_column :products, :description, :string
  end
end
