class Invoice < ActiveRecord::Base
  has_many :orders
end
