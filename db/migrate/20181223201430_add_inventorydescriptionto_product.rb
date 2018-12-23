class AddInventorydescriptiontoProduct < ActiveRecord::Migration
  def change
    add_column :products do |t|
     t.string :description
     t.integer :inventory
 end
end

end
