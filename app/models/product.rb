class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def availability
    if self.inventory > 0
      "Available"
    else
      "Sold Out"
    end
  end
end
