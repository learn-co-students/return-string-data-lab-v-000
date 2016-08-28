class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product
      @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    test = (product.inventory > 0) ? true :false
    render plain: test
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
