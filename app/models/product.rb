class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def availability
    if self.inventory.nil? || self.inventory < 1
      "Sold Out"
    else
      "Available"
    end
  end

end
