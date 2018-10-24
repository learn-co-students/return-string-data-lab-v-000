class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products
  def inventory_check
    if self.inventory == 0
      "Sold Out"
    else
      "Available"
    end
  end
end
