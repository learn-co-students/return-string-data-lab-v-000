class ProductsController < ApplicationController
  def inventory
       product = Product.find(params[:id])
       render plain: product.inventory?.to_s
   end

   def description
       product = Product.find(params[:id])
       render plain: product.description
   end

   def new
       @product = Product.new
   end

   def create
       Product.create(product_params)
       redirect_to products_path
   end

   def index
       @products = Product.all
   end

   private
   def product_params
       params.require(:product).permit(:name, :price, :inventory, :description)
   end
end
