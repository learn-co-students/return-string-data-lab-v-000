class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :invoice_id

      t.timestamps null: false
    end
  end
end
