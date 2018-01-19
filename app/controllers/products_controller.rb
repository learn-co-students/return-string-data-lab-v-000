class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new(product_params)
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def inventory
    product = Product.find_by(id: params[:id])
    resp = product.inventory > 0 ? "true" : "false"
    render plain: resp
  end

  def description
    product = Product.find_by(id: params[:id])
    resp = product.description
    render plain: resp
  end

  def details
    product = Product.find_by(id: params[:id])
    render plain: product.description
  end



  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :inventory)
    end

end
