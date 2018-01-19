class AddDescriptionAndInventoryToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.text :description
      t.integer :inventory
    end
  end
end
