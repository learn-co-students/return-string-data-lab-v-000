class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def inventory?
    if self.inventory > 0
      return "true"
    else
      return "false"
    end
  end

end
