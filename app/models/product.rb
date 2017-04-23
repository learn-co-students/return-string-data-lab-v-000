class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def get_inventory
    self.inventory = Product.all.where(name: self.name).count
    self.save
  end
end
