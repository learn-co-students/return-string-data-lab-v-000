class ProductsController < ApplicationController

  def new
    @product= Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory > 0
      product = "true"
    else
      product = "false"
    end
    render plain: product
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
