class ProductsController < ApplicationController

  def create
    @product = Product.create(product_params)
    @product.save
    # binding.pry
    redirect_to products_path#(@product)
  end

  def index
    @products = Product.all
  end

  def inventory
    # binding.pry
    @product = Product.find(params[:id])

    if @product.inventory === 0 #? "false"  "true"
      # binding.pry
      render plain: "false" #@product.inventory #return "false"
    else
      # binding.pry
      render plain: "true" #render plain: @product.inventory #return "true"
    end

  end

  def description
    @product = Product.find(params[:id])
    binding.pry
    render plain: @product.description
  end

  private
   def product_params
    params.require(:product).permit(:title, :price, :description, :inventory)
  end
end
