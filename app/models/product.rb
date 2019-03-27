class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  after_create :set_description

  private
  def set_description
  	if self.description.nil?
  		self.description = "Lorem ipsum #{self.id} dolor sit amet, consectetur adipisicing elit. Quo repudiandae explicabo, atque. Vero ipsa quas, dolor sequi sapiente provident at, nesciunt ex maiores eligendi impedit tempora possimus perferendis, nobis cum!"
  		self.save
  	end
  end
end
