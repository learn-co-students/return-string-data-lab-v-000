class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    end
  end

  def index
    @products = Product.all
  end

  def inventory
    if find.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def description
    render plain: find.description
  end

  private

  def find
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory_count)
  end
end
