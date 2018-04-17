class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def inventory
    @product = Product.find_by(id: params[:id])
    if @product.inventory > 0
      render plain: true
    else
      render plain: false
    end
    # render plain: post.description
  end

  def description
    @product = Product.find_by(id: params[:id])
    render plain: @product.description
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def show
    @product = Product.find_by(id: params[:id])
  end


  private

    def product_params
      params.require(:product).permit(:name, :price, :inventory, :description)
    end

end
