class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def inventory
    @product = Product.find(params[:id])
    binding.pry
    # render plain: @product.inventory > 0 ? true : false
    if @product.inventory === 0
      return render plain: true
    else
       return render plain: false
    end

  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

private


  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description)
  end

end
