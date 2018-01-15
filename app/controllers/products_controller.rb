class ProductsController < ApplicationController
   def create
     @product = Product.new(products_params)
     if @product.save
       redirect_to products_path
     else
     end

   end

   def description
     product = Product.find(params[:id])
     render plain: product.description
   end

   def inventory
     product = Product.find(params[:id])
     render plain: product.available?
   end

   def index
     @products = Product.all
   end

   def new
     @product = Product.new
   end

   private

   def products_params
     params.require(:product).permit(:inventory, :description, :name, :price)
   end

end
