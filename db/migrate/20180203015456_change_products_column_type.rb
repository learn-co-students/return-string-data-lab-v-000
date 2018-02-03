class ChangeProductsColumnType < ActiveRecord::Migration
  def change
    change_column :products, :inventory, :integer
  end
end
