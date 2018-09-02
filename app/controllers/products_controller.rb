class ProductsController < ApplicationController

  def index
    #binding.pry
    @products = Product.all
    #binding.pry
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def inventory
    @prod = Product.find(params[:id])
    #binding.pry
    if @prod.inventory == 0
      @resp = "false"
    else
      @resp = "true"
    end
    #binding.pry
    render plain: @resp
    #redirect_to products_path
  end

  def description
    @prod = Product.find(params[:id])
    #binding.pry
    render plain: @prod.description
  end


  private
  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end

end
