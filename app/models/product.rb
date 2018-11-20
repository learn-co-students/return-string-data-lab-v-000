class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def available? 
    if self.inventory > 1 
      "true"
    else
      "false"
    end
  end


end
