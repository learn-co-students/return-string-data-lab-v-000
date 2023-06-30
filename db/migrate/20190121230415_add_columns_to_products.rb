class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :description, :string
    add_column :products, :inventory, :integer
  end
end
