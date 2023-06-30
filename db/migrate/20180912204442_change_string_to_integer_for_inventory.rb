class ChangeStringToIntegerForInventory < ActiveRecord::Migration
  def change
    remove_column :products, :inventory, :string
    add_column :products, :inventory, :integer
  end
end

