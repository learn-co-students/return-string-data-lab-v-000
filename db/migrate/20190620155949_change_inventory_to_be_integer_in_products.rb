class ChangeInventoryToBeIntegerInProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :inventory, :integer
  end
end
