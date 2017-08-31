class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :inventory, default: 0
      t.timestamps null: false
    end
  end
end
