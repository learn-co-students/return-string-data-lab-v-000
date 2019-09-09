require "rails_helper"

RSpec.describe "invoices_index_view" do
  # let(:classroom) { Classroom.create(course_name: 'Math', semester: "Spring #{Time.now.year}") }

  before do
    products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]

    10.times do
      products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]
      Product.create(:name => products.sample, :price => Faker::Number.between(from: 1, to: 1500))
    end
    5.times do
      Customer.create(:name => Faker::Name.name)
    end

    5.times do
      Invoice.create
    end
    10.times do
      order = Order.create(:customer_id => Customer.all.collect(&:id).sample, :invoice_id => Invoice.all.collect(&:id).sample)
      order.products << Product.find(Product.all.collect(&:id).sample)
    end

  end

  it "renders the invoice partial" do
    invoices = Invoice.first
    assign(:invoices, invoices)
    render :template => "invoices/index.html.erb"
    expect(rendered).to render_template(:partial => "invoices/_invoice")
  end

  it "renders the invoice partial using the abstract method of rendering collection" do
    invoices = Invoice.first
    assign(:invoices, invoices)
    expect_any_instance_of(Invoice).to receive(:to_partial_path).and_call_original
    render :template => "invoices/index.html.erb"
  end

  it "handles empty collections" do
    assign(:invoices, [])
    render :template => "invoices/index.html.erb"
    expect(rendered).to match(/No Invoices/)
  end

end
