class ProductsController < ApplicationController

  def index
     @products = Product.all
  end
  def create
     Product.create!(product_params)
     redirect_to products_path
  end
  def show
    @product = Product.find(params[:id])
  end
  def inventory
     inventory_id = params[:id]
     @inventory_empty = (Product.find(inventory_id).inventory > 0).to_s
     render plain:@inventory_empty
  end

  def description
     product_id = params[:id]
     render plain: Product.find(product_id).description
  end
   private

    def product_params
      params.permit(:name, :price, :inventory, :description)
    end
end
