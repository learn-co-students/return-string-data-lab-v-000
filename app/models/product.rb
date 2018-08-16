class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  attr_accessor :inventory

  def self.find_all(id)
    @name = Product.find(id).name
    self.where(name: @name)
  end
end
