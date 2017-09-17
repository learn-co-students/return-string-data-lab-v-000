class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def show
		
	end

	def create
		@product = Product.create(product_params)

		if @product.save
			redirect_to products_path
		else
			render :new
		end
	end

	def edit
		
	end

	def destroy
		
	end

	def description
		product = Product.find_by(id: params[:id])
        render plain: product.description
	end

	def inventory
		product = Product.find_by(id: params[:id])
		render plain: product.inventory > 0 ? "true" : "false"
	end

	private

	def product_params
		params.require(:product).permit(:name, :price, :description,:inventory)
	end
end
