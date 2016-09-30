require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :index => "Index",
        :new => "New",
        :create => "Create"
      ),
      Product.create!(
        :index => "Index",
        :new => "New",
        :create => "Create"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "New".to_s, :count => 2
    assert_select "tr>td", :text => "Create".to_s, :count => 2
  end
end
