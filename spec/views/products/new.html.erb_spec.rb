require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :index => "MyString",
      :new => "MyString",
      :create => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_index[name=?]", "product[index]"

      assert_select "input#product_new[name=?]", "product[new]"

      assert_select "input#product_create[name=?]", "product[create]"
    end
  end
end
