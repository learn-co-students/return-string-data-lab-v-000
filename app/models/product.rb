class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products



  # def index
  #   @products = Product.all
  # end
  
  # def new
  #   @product = Product.new
  # end
  
  # def create
  #   product = Product.create(product_params)
  #   redirect_to products_path
  # end
  

  

  
  # private
  # def product_params
  #   params.require(:product).permit(:name, :description, :inventory, :price)
  # end
end
