class ProductsController < ApplicationController
  before_action :set_product, only: [ :edit, :update]

  def index
    @products = Product.all
  end

  def new
    @product.new
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? "true" : "false"
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :inventory)
    end
end
