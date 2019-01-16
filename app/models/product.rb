class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products
  
  # def description
  #   self.description
  # end
  
  # def inventory
  #   self.inventory
  # end
end
