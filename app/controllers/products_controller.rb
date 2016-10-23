class ProductsController < ApplicationController

  def index
    @products = Product.all
    @products.first.inventory = 0
    @products.first.save
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def description
    set_product
    render plain: @product.description
  end

  def inventory
    set_product
    if @product.inventory == 0
      render plain: "false"
    else
      render plain: "true"
    end
  end

private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end

end
