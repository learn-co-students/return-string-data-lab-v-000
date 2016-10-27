class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :description, :string
    add_column :products, :inventory, :integer, default: 0
  end
end
