class ProductsController < ApplicationController

	def index
		@products = Product.all
	end
	
	def create
		Product.create(product_params)
		redirect_to products_path
	end

	def inventory
		render plain: Product.find_by_id(params[:id]).inventory > 0	
	end

	def description
		render plain: Product.find_by_id(params[:id]).description
	end

private
    def product_params
      params.require(:product).permit(:id, :name, :description, :inventory, :price)
    end
end
