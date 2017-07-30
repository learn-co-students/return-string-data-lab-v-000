class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :inventory, default: 0
      t.text :description
      t.timestamps null: false
    end
  end
end
