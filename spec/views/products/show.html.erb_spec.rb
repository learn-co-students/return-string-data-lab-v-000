require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :index => "Index",
      :new => "New",
      :create => "Create"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Index/)
    expect(rendered).to match(/New/)
    expect(rendered).to match(/Create/)
  end
end
