class ProductsController < ApplicationController
  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end
  def index
    @products = Product.all
  end
  def inventory
    product = Product.find_by(id: params[:id])
    render plain: product.inventory != 0
  end
  def description
    # binding.pry
    @product = Product.find_by(id: params[:id])
    render plain: @product.description
  end
    private
    def product_params
      params.require(:product).permit( :inventory, :description, :name, :price,)
    end
end
