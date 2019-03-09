class AddDetailsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :description, :text
    add_column :products, :inventory, :integer, :default => 0
  end
end
