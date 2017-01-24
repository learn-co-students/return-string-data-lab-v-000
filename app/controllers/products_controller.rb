class ProductsController < ApplicationController
  def index
    @products = Product.all
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
    render plain: product.description
  end

  def new

  end

  def create
    product = Product.create(product_params_checker)
    redirect_to products_path
  end

  private

  def product_params_checker
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end
