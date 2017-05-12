class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :inventory 
      t.string :description
      t.string :name
      t.integer :price
      t.timestamps null: false
    end
  end
end
