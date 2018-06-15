class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def in_stock?
    if self.inventory
      if self.inventory > 0
        return true
      else
        false
      end
    else
      false
    end
  end
end
