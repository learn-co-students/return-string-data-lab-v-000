class AddDetailsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :inventory, :integer, null: false, default: 0
    add_column :products, :description, :text
  end
end
