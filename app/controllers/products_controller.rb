class ProductsController < ApplicationController

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find(params[:id])

    if @product.inventory > 0
      render plain: "true", layout: false
    else
      render plain: "false", layout: false
    end
  end

  def index
    @products = Product.all
  end

  def new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :description, :inventory)
    end
end
