class ProductsController < ApplicationController

def index
    @products = Product.all
end

    def create
     @products = Product.new

    end

end
