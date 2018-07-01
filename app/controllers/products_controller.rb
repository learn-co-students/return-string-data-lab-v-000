class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def description
    product = set_product
    render plain: product.description
  end

  def inventory
    product = set_product
    render plain: product.inventory>0
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory)
  end

  def set_product
    Product.find(params[:id])
  end

end
