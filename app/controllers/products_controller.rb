class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		@product = Product.new
		@product.name = params[:name]
		@product.price = params[:price]
		@product.inventory = params[:inventory]
		@product.description = params[:description]
		@product.save
		redirect_to(products_path)	
	end

	def inventory
		@product = Product.find(params[:id])
		if @product.inventory == 0
			render plain: "false"
		else
			render plain: "true"
		end
	end

	def description
		@product = Product.find(params[:id])
		render plain: @product.description
	end

	def index
		@products = Product.all
	end

end
