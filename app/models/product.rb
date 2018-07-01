class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products
  attr_accessor :description, :inventory

  def description
    return "description goes here"
  end


  def inventory
    self.all.count
  end
end
