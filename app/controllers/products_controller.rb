class ProductsController < ApplicationController

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory.to_i > 0 ? true : false
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
      Product.create(product_params)
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:price, :name, :description, :inventory)
  end
end
