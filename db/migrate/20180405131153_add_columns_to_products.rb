class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :inventory, :string
    add_column :products, :description, :string
  end
end
