class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
=begin
    if product.inventory == nil
      answer = "false"
    else
      if product.inventory <= 1
        answer = "true"
      else
        answer = "false"
      end
    end
=end
  if product.inventory >= 1
    answer = "true"
  else
    answer = "false"
  end
    render plain: answer
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params)
    redirect_to products_url
  end

  private
  def product_params
    params.require(:product).permit(:name,:description)
  end
end
