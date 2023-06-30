class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new # instance for form_for to wrap around
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def description # get "/products/:id/description", to: "products#description"
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory # get "/products/:id/inventory", to: "products#inventory"
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? "true" : "false"
  end

  private

    def product_params # strong params
      params.require(:product).permit(:name, :description, :price, :inventory)
    end
end
