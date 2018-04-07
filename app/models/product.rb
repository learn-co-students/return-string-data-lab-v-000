class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  scope :item_quantity, ->(product_name){where(:name => product_name).count}

  # def self.products_inventory
  #   products = {}
  #   Product.all.collect do |product|
  #     Product.all.where(:name => product.name)
  #       products[product] = Product.item_quantity(product.name)
  #     end
  #   end
  #   return products
  # end
  
  def inventory?
    if !!self.inventory == true
      return "true"
    else
      return "false"
    end      
  end 
end
