class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new
    values = create_params
    product.name = values[:name]
    product.price = values[:price]
    product.inventory = values[:inventory]
    product.description = values[:description]
    product.save
    redirect_to products_path
  end

  def inventory
    id = id_params
    p = Product.find_by(id: id)
    render plain: p.inventory > 0 ? true : false
  end

  def description
    id = id_params
    p = Product.find_by(id: id)
    render plain: p.description
  end
  protected
    def create_params
      #name: "Test", price: "3.99", inventory: 12, description: "This is a great thing"
      params.permit(:name, :price, :inventory, :description)
    end

    def id_params
      params.require(:id)
    end
end
