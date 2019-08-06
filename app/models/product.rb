class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products



  #def name
  #end

  #def price
  #end

  #def inventory
    #@product = Product.find(params[:id])
    #render plain: product.inventory
    #product.count
    #product.count.all
 
  #end

  #def description
    #product = Product.find(params[:id])
    #render plain: product.description
 
  #end

end
