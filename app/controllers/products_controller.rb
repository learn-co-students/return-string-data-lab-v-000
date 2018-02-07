class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def description
		description = Product.find(params[:id]).description
		render :plain => description
	end

	def inventory
		in_stock = Product.find(params[:id]).in_stock?
		render :plain => in_stock
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save

		redirect_to products_path
	end

	private

	def product_params
		params.require(:product).permit(:name, :description)
	end
end
