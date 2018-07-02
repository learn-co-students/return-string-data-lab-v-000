class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products
end
