class ProductsController < ApplicationController

  def index
    @products = Product.all
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

  def description
    product = Product.find_by_id(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find_by_id(params[:id])
    render plain: (!product.inventory.nil? && product.inventory > 0).to_s
  end

  private

  def product_params
    params.require(:product).permit(:name, :inventory, :description, :price)
  end

end
