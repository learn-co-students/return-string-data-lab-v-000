class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :inventory, presence: true, numericality: { greater_than_or_equal_to: 0}
end
