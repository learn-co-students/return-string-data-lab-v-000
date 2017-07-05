class ProductsController < ApplicationController

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def index
    @products = Product.all
  end

  def show
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end


  def new
    @product = Product.new
  end

  def delete
  end

  def inventory
     product = Product.find(params[:id])
     render plain: product.inventory > 0 ? true : false
   end

 def product_params
   params.require(:product).permit(:name, :description, :inventory, :price)
 end

end
