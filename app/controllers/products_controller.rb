class ProductsController < ApplicationController
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

	def index
		@products = Product.all
	end

	def inventory
		product = Product.find(params[:id])
		render plain: (product.inventory > 0)
	end

	def description
		product = Product.find(params[:id])
		render plain: product.description
	end

	def quantity
		product = Product.find(params[:id])
		render plain: product.inventory
	end

	private
	def product_params
		params.require(:product).permit(:name, :description, :price)
	end
end
