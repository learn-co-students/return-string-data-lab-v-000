class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  	def self.available?(p)
		if p.inventory
			"Available"
		else
			"Sold Out"
		end
	end
end
