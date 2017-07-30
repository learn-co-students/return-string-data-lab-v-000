# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]

10.times do
  products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]
  ipsum = "Stumptown air plant try-hard affogato ramps. Ennui poutine selfies you probably haven't heard of them man braid vaporware. Aesthetic vexillologist kitsch vape, bitters raw denim scenester quinoa squid pop-up 90's asymmetrical hot chicken authentic lumbersexual. Cold-pressed beard semiotics vinyl marfa, meditation 8-bit artisan banjo. Ennui selfies food truck tofu, keffiyeh affogato wolf."
  Product.create(:name => products.sample, :price => Faker::Number.between(1,1500), :description => ipsum)
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
