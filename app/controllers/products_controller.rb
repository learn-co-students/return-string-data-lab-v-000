class ProductsController < ApplicationController

	def index 
		@products = Product.all
	end

	def new 
		@product = Product.new
	end

	def create
		
		redirect_to products_path
	end

end
