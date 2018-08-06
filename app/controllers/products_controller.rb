class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def inventory
    set_product
    render plain: @product.inventory > 0
  end

  def description
    set_product
    render plain: @product.description
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end
