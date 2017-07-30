class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def inventory?
    inventory == 0? false : true
  end

  def stock
    inventory?? "true" : "false"
  end
end
