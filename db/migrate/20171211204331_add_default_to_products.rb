class AddDefaultToProducts < ActiveRecord::Migration
  def change
    change_column :products, :inventory, :integer, :default => 0
  end
end
