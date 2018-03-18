class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory && product.inventory > 0
      render plain: 'true'
    else
      render plain: 'false'
    end
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  private

  def set_product
    product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end
