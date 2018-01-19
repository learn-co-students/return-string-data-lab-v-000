class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :inventory, :description, :update]

  def index
   @products = Product.all
  end

  def new
   @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save ? redirect_to(products_path) : render('new')
  end

  def show

  end

  def inventory
    if @product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def description
    render plain: @product.description
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
