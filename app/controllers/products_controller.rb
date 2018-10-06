class ProductsController < ApplicationController


    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.create(name: params[:product][:name], price: params[:product][:price], inventory: params[:product][:inventory].to_i, description: params[:product][:description])

        redirect_to products_path
    end

    def show
        @product = Product.find_by(id: params[:id].to_i)

    end

    def description
        # binding.pry
        @product = Product.find_by(id: params[:id].to_i)

        render plain: @product.description
    end

    def edit
    end

    def update
    end

    def inventory
        # binding.pry
        @product = Product.find(params[:id].to_i)
        if @product.inventory == nil || @product.inventory == 0
            render plain: "false"
        else
            render plain: "true"
        end
    end


end
