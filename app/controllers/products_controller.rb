class ProductsController < ApplicationController
 before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.all
  end

  def new 
    @product = Product.new
  end

  def show
  end

  def create
    @product = Product.new(product_params)

    @product.save
    redirect_to products_path
  end

  def inventory
    product = Product.find(params[:id])

    if product.inventory > 0 
      @data = "true"
    else
      @data = "false"
    end
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  private 

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end
