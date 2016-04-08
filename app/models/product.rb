class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products
end

=begin

create_table "products", force: :cascade do |t|
  t.string   "name"
  t.integer  "price"
  t.datetime "created_at",  null: false
  t.datetime "updated_at",  null: false
  t.text     "description"
  t.integer  "inventory"
end

=end
