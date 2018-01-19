class ProductsController < ApplicationController

  def index
    @products=Product.all
  end

  def new
    @product=Product.new
  end

  def create
    product=Product.new(product_params)
    if product.save!
      redirect_to products_path
    else
      redirect_to new_product_path, :alert=>"Something went wrong."
    end
  end

  def inventory
    prod=Product.find(params[:id])
    resp = prod.inventory != 0 
    render plain: resp
  end

  def description
    prod=Product.find(params[:id])
    render plain: prod.description
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :inventory)
    end

end
