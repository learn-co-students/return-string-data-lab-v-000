class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save
		redirect_to products_path
	end

	def show
		product_id
	end

	def description
		product_id
		render plain: @product.description
	end

	def inventory
		product_id
		result = @product.inventory != 0 ? "true" : "false"
		render plain: result	
	end

	private

	def product_params
		params.require(:product).permit(:name, :description, :price, :inventory)
	end

	def product_id
		@product = Product.find(params[:id])
	end

end
