class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def inventory_available?
    self.inventory > 0 ? true : false
  end
end
