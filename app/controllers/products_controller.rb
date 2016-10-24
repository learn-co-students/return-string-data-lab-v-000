class ProductsController < ApplicationController
  before_action :find_product, only: [:inventory, :description]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def inventory
    @product.inventory.to_i > 0 ? (render plain: 'true') : (render plain: 'false')    
  end

  def description
    render plain: @product.description
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end  

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end