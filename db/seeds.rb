# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]

descriptions = [
  "A system for transmitting visual images and sound that are reproduced on screens, chiefly used to broadcast programs for entertainment, information, and education.",
  "A device that, when linked to a television set, can be used for recording on and playing videotapes.",
  "MacBook is a term used for a brand of Mac notebook computers that Apple started producing in 2006.",
  "The MacBook Air is a line of Macintosh subnotebook computers developed and manufactured by Apple Inc. It consists of a full-size keyboard, a machined aluminum case, and a thin light structure.",
  "A computer mouse is a hand-held pointing device that detects two-dimensional motion relative to a surface.",
  "A separate seat for one person, typically with a back and four legs.",
  "A piece of furniture with a flat or sloped surface and typically with drawers, at which one can read, write, or do other work.",
  "A device for giving light, either one consisting of an electric bulb together with its holder and shade or cover, or one burning gas or a liquid fuel and consisting of a wick or mantle and a glass shade.",
  "A water bottle is a container that is used to hold water, liquids or other beverages for consumption."
]

products.each_with_index do |product, index|
  Product.create(
    name: product, 
    description: descriptions[index], 
    price: Faker::Number.between(1,1500),
    inventory: Faker::Number.between(0, 10)
  )
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

