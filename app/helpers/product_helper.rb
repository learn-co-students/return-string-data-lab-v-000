module ProductHelper

  def in_stock?(product)
    if product.inventory > 0
      true
    else
      false
    end
  end
  
end
