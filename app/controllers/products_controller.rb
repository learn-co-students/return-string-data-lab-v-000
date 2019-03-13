class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if !product.inventory.nil? && product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :inventory)
    end
end
