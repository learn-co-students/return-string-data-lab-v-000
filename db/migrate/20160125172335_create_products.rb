class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.timestamps null: false
      t.integer :inventory
      t.string :description
    end
  end
end
