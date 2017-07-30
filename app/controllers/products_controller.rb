class ProductsController < ApplicationController
  before_action :set_product!, only: [:show, :inventory, :description]


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
    else
      render :new
    end
  end

  def show
  end

  def inventory
    if @product.inventory == 0
      render plain: "false"
    else
      render plain: "true"
    end
  end

  def description
    render plain: @product.description
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :description, :inventory)
    end

    def set_product!
      @product = Product.find(params[:id])
    end
end
