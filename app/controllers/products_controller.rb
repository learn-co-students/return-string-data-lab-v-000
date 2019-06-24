class ProductsController < ApplicationController

  def index
    @products = Product.all
    # render plain: @products.description
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def inventory
    @product = Product.find(params[:id])
    resp = @product.inventory > 0 ? "true" : "false"
    render plain: resp


  end

  def description
    product = Product.find_by_id(params[:id])
    render plain: product.description
  end


private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end
