class ProductsController < ApplicationController
    
    def new 
        @product = Product.new
    end 
    
    def create 
        # binding.pry
        @product = Product.create(product_params)
        @product.save
        redirect_to products_path
    end 

    def index
        @products = Product.all
    end 
    
    def show
       @product = Product.find(params[:id]) 
    
    end 

    private
    # Use callbacks to share common setup or constraints between actions.
    #   def set_post
    #     @post = Post.find(params[:id])
    #   end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
        params.require(:product).permit(:name, :price, :description, :inventory)
    end

end
