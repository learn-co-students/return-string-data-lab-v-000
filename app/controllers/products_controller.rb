class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = set_product
  end

  def new
    @product = Product.new
  end

  def edit
    @product = set_product
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    end

  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def inventory
    product = set_product
    product.inventory > 0 ? response = 'true' : response = 'false'
    render plain: response
  end

  def description
    product = set_product
    render plain: product.description
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :description, :inventory)
    end
end
