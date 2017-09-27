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
  Product.create(:name => products.sample, :price => Faker::Number.between(1,1500))
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

@des = ["the cat in the hat loved this one", 
  "there are seven of these on the shelf you have time", 
  "why is it so hard to find an elvis themed blender?", 
  "if you want this one, be sure to disinfect it first", 
  "no, that is not an authentic Roy Rogers shoe lace", 
  "they ate these in world war 2 because of the fiber", 
  "this was worn by the late, great Shirley Temple in Bannanas",
  "if you buy this with the scarf, you'll have the scarf too",
  "that requires a charger, and no you can't try it first"]

Product.all.each do |product|
  des = @des[rand(0..8)]
  product.description = des
  product.get_inventory
  product.save
end

