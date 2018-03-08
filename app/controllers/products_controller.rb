class ProductsController < ApplicationController

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end
  def index
    @products = Product.all
  end
  def inventory
    @product = Product.find(params[:id])
    render plain: @product.inventory.to_i > 0 ? true : false
  end
  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end


  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end
