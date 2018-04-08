class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def available_inventory?
    if inventory > 1
      "Available"
    else
      "Sold Out"
    end
  end
end
