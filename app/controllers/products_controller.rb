class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    @available = !product.inventory == 0 || !product.inventory == nil
    return @available
  end

  def available
    product = Product.find(params[:id])
    if @available
      render plain: "Available"
    else
      render plain: "Sold Out"
    end
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :price, :inventory)
    end
end
