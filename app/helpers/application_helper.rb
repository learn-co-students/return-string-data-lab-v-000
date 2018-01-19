module ApplicationHelper
    
    def product_helper_inventory(product)
      if product.inventory == 0  
          return "Sold Out" 
      else 
          return "Available"
      end 
    end 
end
