class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def inventory
    render plain: Product.find(params[:id]).inventory > 0
  end

  def description
    render plain: Product.find(params[:id]).description
  end

  def index
    @products = Product.all
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :inventory, :description)
    end
end
