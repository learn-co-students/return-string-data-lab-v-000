class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def index
    @products = Product.order(:name)
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: (product.inventory > 0)
  end

  private
    def products_params
      params.require(:product).permit(:name, :price, :description, :inventory)
    end
end
