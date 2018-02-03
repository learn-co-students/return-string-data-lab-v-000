class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def inventory_status
  	inventory > 0 ? "Available" : "Sold Out"
  end
end
