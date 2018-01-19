class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def inv_available
    (inventory =="0") ? "Sold Out": "Available"
  end

  def inv_available_tf
    (inventory =="0") ? false : true
  end
end
