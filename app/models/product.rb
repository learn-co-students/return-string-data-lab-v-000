class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def description_display
    # self.name + ": $#{self.price}"
    if self.description.nil?
      self.description = "Once upon a time, Grandma bought a " + self.name + ". But back then, the price was $" + "#{self.price/24}" + "."
    else
      self.description
    end
  end

  def ordered_products_count
    ordered_products = OrderedProduct.all.where(product_id: self.id).count
  end

  def check_inventory
    self.inventory = 0 if self.inventory.nil?
    self.inventory - self.ordered_products_count
  end

  def available?
    if self.inventory >= 1
      "Sold Out"
    else
      "Available"
    end
  end
end
