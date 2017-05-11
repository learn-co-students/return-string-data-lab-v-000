class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    @product = Product.find(params[:id])
    render plain: @product.inventory > 0 ? true : false
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end

end
