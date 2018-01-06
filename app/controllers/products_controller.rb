class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path #not render...you want index to reload products
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    status = product.inventory > 0 ? "true" : "false"
    render plain: status
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory)
  end
end
