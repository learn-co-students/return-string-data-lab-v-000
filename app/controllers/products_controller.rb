class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def inventory
    @product = Product.find(params[:id])
    render plain: @product.inventory_status
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def new
    @product = Product.new
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :inventory)
    end
end
