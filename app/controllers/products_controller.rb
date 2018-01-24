class ProductsController < ApplicationController

	def index
		@products = Product.all;
	end

	def new
		@product = Product.new
	end

	def create
	    @product = Product.create(product_params)
	    @product.save
	    redirect_to products_path
	end

	def edit

	end

	def update
		@product.update(product_params)
		redirect_to product_path(@product)
	end

	def inventory
		set_product
		render plain: @product.inventory > 0
	end

	def description
		set_product
		render plain: @product.description
	end

	private

	# Use callbacks to share common setup or constraints between actions.
	  def set_product
	    @product = Product.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def product_params
	    params.require(:product).permit(:name, :description)
	  end

end
