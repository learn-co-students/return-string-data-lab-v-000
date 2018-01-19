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

  def show
    @product = Product.find(params[:id])
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory == 0
      render plain: "false"
    else
      render plain: "true"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end

end
