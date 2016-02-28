class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to :products
  end

  def inventory
    if Product.find(params[:id]).inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def description
    # get description just as plain string

    if product = Product.find(params[:id])
      render plain: product.description
    else
      render status: 404
    end
  end

  def index
    @products = Product.all
  end

private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end

end
