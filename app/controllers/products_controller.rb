class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end


  def create

    Product.create(product_params)
    redirect_to '/products'
  end

  def inventory
    p = "true"
    if Product.find(params[:id]).inventory <= 0
      p = "false"
    end
    render plain: p
  end

  def description
    description = Product.find(params[:id])
    render plain: description.description
  end

private
  def product_params
    params.require(:product).permit(:name, :inventory, :price, :description)
  end
end
