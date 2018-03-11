class ProductsController < ApplicationController

  def create
    @product = Product.new(params.require(:product).permit(:name, :price, :inventory, :description))
    @product.save
    redirect_to products_path
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end
end
