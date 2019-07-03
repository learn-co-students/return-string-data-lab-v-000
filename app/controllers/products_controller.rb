class ProductsController < ApplicationController

  def index
    @products = Product.all
  end


  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to '/products'
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory == false
      render plain: false
    else
      render plain: true
  end
end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end


private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end

end
