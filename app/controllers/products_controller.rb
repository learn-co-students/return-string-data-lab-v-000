class ProductsController < ApplicationController

  def create
    product = Product.create(product_params)
    # @product.name = params[:product][:name]
    # @product.price = params[:product][:price]
    redirect_to products_path
  end

  def inventory
    # binding.pry
    @product = Product.find_by(id: params[:id])
    if @product.inventory < 1
      response = "false"
    else
      response = "true"
    end
    render plain: response
  end

  def description
    product = Product.find_by(id: params[:id])
    render plain: product.description
  end

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end


private
  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end
