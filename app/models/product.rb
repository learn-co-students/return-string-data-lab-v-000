class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def truncated_desc
    if self.description
      return self.description[0..30]
    end
  end
end
