class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def body
    @product = find_product

    render layout:false
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_param)
    redirect_to products_path
  end

  def inventory
    @product = find_product
    if @product.inventory && @product.inventory != 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def description
    @product = find_product
    if @product.description
      render plain: @product.description
    end
  end

  private

  def find_product
    Product.find_by(id: params[:id])
  end

  def product_param
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end
