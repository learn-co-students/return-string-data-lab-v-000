class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products


  def inventory_status
    if inventory.nil?
      "false"
    elsif inventory == 0 
      "false"
    else
      "true"
    end
  end
end
