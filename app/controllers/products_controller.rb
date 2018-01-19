class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    @product = Product.create(product_attributes)
    @product.save
    redirect_to products_path
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory && product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def product_attributes
    params.require(:product).permit(:name, :price, :inventory, :description)
  end

end
