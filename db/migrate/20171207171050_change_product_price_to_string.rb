class ChangeProductPriceToString < ActiveRecord::Migration
  def up
    change_column :products, :price, :string
  end

  def down
    change_column :products, :price, :integer
  end
end
