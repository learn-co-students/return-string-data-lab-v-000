class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :products, :inventory_count, :inventory
  end
end
