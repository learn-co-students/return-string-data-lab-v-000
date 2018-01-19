class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to '/products'
  end

  def description
    product = Product.find_by(id: params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find_by(id: params[:id])
    stock = true
    stock = false unless product.inventory > 0
    render plain: stock.to_s
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :description, :inventory)
    end

end
