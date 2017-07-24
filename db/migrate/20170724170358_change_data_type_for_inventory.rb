class ChangeDataTypeForInventory < ActiveRecord::Migration
  def change

	change_column :products, :inventory, :string
  end
end
