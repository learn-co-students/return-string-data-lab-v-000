class ProductsController < ApplicationController
  def new
    @product = Product.new
  end
  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def index 
    @products = Product.all
  end
  
  def show
    @product = Product.find_by_id(params[:id])
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  private

  def product_params
    params.require(:product).permit(:name,:price,:inventory,:description)
  end

end
