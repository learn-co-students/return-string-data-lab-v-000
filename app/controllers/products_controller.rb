class ProductsController < ApplicationController
  before_action :find_products, only: [:show, :edit, :update, :inventory, :description]

  def description
    render plain: @product.description
  end

  def inventory
    render plain: @product.inventory > 0 ? true : false
  end

  def new
    @product = Product.new
  end

  def index
    @products = Product.all 
  end

  def create
    @product = Product.create(product_params)
    @product.save

    redirect_to products_path
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)

    redirect_to product_params(@product)
  end

  private

  def find_products
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end

end