class ProductsController < ApplicationController
  def index
    @product = Product.new
    @products = Product.all
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def stock
    product = Product.find(params[:id])
    render plain: product.status
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.in_stock?
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :inventory)
    end
end
