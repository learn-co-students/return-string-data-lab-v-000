class ProductsController < ApplicationController
    
    def new
        @prod = Product.new
    end

    def create
        @prod = Product.create(prod_params)
        redirect_to products_path
    end
    
    def index
        @prods = Product.all
    end
    
    def inventory
        @prod = Product.find_by(id: params[:id])
        a = @prod.inventory > 0
        render plain: a.to_s
    end
    
    def description
        @prod = Product.find_by(id: params[:id])
        render plain: @prod.description
    end
    
    private
    
    def prod_params
        params.require(:product).permit(:name, :price, :description, :inventory)
    end

end
