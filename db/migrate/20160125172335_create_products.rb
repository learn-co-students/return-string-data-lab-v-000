class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :inventory
      t.text :description
      t.timestamps null: false
    end
  end
end
