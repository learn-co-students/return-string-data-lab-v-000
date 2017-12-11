class AddDescriptionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :description, :string, default: "No description yet."
  end
end
