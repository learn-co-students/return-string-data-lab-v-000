class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.timestamps null: false
      t.string :description
      t.integer :inventory
    end
  end
end
