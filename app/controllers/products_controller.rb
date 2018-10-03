class ProductsController < ApplicationController
  def index
    #binding.pry
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    #binding.pry
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def inventory
    product = Product.find(params[:id])
    #binding.pry
    if product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def description
    product = Product.find(params[:id])
    #binding.pry
    render plain: product.description if product.description
  end


  private
  def product_params
      params.require(:product).permit(:name, :price, :inventory, :description)
  end

end
