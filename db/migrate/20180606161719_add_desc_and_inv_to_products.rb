class AddDescAndInvToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.string :description
      t.integer :inventory
    end
  end
end
