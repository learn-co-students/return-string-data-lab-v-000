class ChangeColumnTypeInProducts < ActiveRecord::Migration
  def change
     change_column :products, :inventory, :boolean
  end
end
