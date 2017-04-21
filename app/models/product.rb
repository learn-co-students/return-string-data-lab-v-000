class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def has_inventory?
    inventory > 0 ? true : false
  end
end
