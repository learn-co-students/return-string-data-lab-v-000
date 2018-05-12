class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def available?
    if self.inventory.to_i > 0
      return true
    else
      return false
    end
  end
end
