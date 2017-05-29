class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
    	redirect_to products_path
    else
    	render :new
    end
  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def inventory
  	@product = Product.find(params[:id])
  	if @product.inventory > 0
  		render plain: 'true'
  	else
  		render plain: 'false'
  	end
  end


private
  # Use callbacks to share common setup or constraints between actions.
  # def set_post
  #   @post = Post.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end
end

