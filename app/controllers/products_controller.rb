class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    end
  end

  def inventory
    set_product
    if @product.inventory > 0
      render plain: true
    else
      render plain: false
    end
  end

  def description
    set_product
    render plain: @product.description
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
