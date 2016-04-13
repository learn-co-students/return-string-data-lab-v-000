class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def description
    product = Product.find(params[:id])
    if product
      render plain: product.description
    else
      render plain: "Product not found."
    end
  end

  private

  def product_params
    params.require(:product).permit(:inventory, :description, :price)
  end

end
