class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def inventory_available?
    if self.inventory == 0
      return "false"
    else
      return "true"
    end
  end

end
