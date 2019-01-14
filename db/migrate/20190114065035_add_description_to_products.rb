class AddDescriptionToProducts < ActiveRecord::Migration
  def 
        add_column :products, :inventory, :integer
    add_column :products, :description, :string
  end
end
