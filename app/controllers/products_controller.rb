class ProductsController < ApplicationController
	require 'pry'
	def create
		product = Product.create(product_params)
		redirect_to products_path
	end

	def index
		@products = Product.all
	end

	def inventory
		product = Product.find(params[:id])
	
		inventory = product.inventory !=nil && product.inventory > 0 ? true : false
		render plain: inventory
	
	end

	def description
		# binding.pry
		product = Product.find(params[:id])
		render plain: product.description
	end


	private
	def product_params
		params.require(:product).permit(:name, :price, :description, :inventory)
	end

end
