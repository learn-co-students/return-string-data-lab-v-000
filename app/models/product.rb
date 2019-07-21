class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products
  belongs_to :despriction
  has_many :inventories
end
