class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    binding.pry
    @prod = Product.new(product_params)
    if @prod.save
      render :index
    else
      redirect :new
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :description)
    end

end
