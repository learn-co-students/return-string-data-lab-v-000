class AddDefaultOf0ToInventory < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :inventory, :integer, :default => 0
  end
end
