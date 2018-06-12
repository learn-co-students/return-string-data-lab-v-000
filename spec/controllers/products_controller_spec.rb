require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before do
    Product.destroy_all
    @product_attributes = {name: "Test", price: "3.99", inventory: 12, description: "This is a great thing"}
  end

  describe "POST create" do

    it 'creates a new product' do
      post :create, product: @product_attributes
      expect(response).to redirect_to(products_path)
      expect(Product.count).to eq 1
    end

  end

  describe "GET inventory" do
   

end
end