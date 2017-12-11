class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def inventory?
    if self.inventory.nil? || self.inventory < 1
      "false"
    else
      "true"
    end
  end

end
