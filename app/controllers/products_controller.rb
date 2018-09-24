class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(products_params)
    @product.save
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
    render plain:
    if product.inventory > 0
      "true"
    else
      "false"
    end
  end



  private

  def products_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end
