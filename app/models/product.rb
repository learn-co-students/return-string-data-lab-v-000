class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def any_products?
    if self.inventory.nil?
      "false"
    elsif self.inventory > 0
      "true"
    else
      "false"
    end 
  end
end
