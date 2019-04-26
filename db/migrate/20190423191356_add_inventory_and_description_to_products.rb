class AddInventoryAndDescriptionToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :inventory, :integer, :default => 0 
    add_column :products, :description, :string, :default => "No description found."
  end
end
