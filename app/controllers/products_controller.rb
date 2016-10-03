class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def description
    set_product
    render plain: @product.description
  end

  def price
    set_product
    render plain: @product.price
  end

  def inventory
    set_product
    if @product.inventory > 0
      render plain: true
    else
      render plain: false
    end
  end

  def show
    set_product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def edit
    set_product
  end

  def update
    set_product
    @product.update(product_params)
    redirect_to products_path(@products)
  end

private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end
