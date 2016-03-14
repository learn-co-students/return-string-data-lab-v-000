class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    end
  end

  def description
    @product = Product.find_by(id: params[:id])
    if !@product.nil?
      render plain: @product.description
    end
  end

  def inventory
    @product = Product.find_by(id: params[:id])
    if !@product.nil?
      instock = false
      if @product.inventory>0
        instock = true
      end
      render plain: "#{instock}"
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :description, :inventory)
    end

end
