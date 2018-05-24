class AddDescriptionAndInventoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :description, :string
    add_column :products, :inventory, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
