class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_path
		else
			render :home
		end
	end

	def inventory
		if current_product.inventory == 0 || current_product.inventory == nil
			render plain: "false"
		else
			render plain: "true"
		end
	end

	def description
		render plain: current_product.description
	end

	def current_product
		Product.find(params[:id])
	end

	private
	def product_params
		params.require(:product).permit(:name, :price, :inventory, :description)
	end

end
