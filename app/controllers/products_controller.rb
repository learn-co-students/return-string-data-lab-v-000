class ProductsController < ApplicationController

  def index
       @products = Product.all
   end

    def create
       @product = Product.create(post_params)
       @product.save
       redirect_to products_path
   end

    def new
       @product = Product.new
   end

    def description
       product = Product.find(params[:id])
       render plain: product.description
   end

    def inventory
       product = Product.find(params[:id])
       render plain: product.inventory > 0 ? true : false
   end
   
    private

    def post_params
       params.require(:product).permit(:name, :price, :description, :inventory)
   end
end
