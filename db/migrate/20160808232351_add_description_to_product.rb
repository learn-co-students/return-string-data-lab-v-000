class AddDescriptionToProduct < ActiveRecord::Migration
  def change
    add_column :customers, :description, :string
    add_column :customers, :inventory, :integer
  end
end
