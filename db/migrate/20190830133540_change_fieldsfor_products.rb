class ChangeFieldsforProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :description, :string
    add_column :products, :description, :string
  end
end
