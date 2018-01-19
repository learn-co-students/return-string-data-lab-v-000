class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def in_stock?
     self.inventory.to_i > 0 ? "true" : "false"
  end

end
