class ChangeInventoryTypeInProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :inventory, :boolean

  end
end
