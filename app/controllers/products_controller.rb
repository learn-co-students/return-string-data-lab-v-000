class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :description, :inventory]

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

  def description
    render plain: @product.description
  end

  def inventory
    check_inventory
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :inventory)
    end

    def set_product
      @product = Product.find_by_id(params[:id])
    end

    def check_inventory
      if !@product.inventory.nil? && @product.inventory > 0
        render plain: true
      else
        render plain: false
      end
    end

end
