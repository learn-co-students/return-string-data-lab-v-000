class AddInventoryProducts < ActiveRecord::Migration
  def change
  	add_column :products, :inventory, :integer
  end
end
