# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

description1 = <<-DESCRIPTION1
  Last night I dreamt there is more to life than to bully friends.
  What has that got to do with Democrats, you probably wonder...
  The answer is here. Right here. Back in school my hair was silly.
  Nevermind about the details, but... In a nut-shell: And still,
  it was strange. Using Google, I found a 12-sided dice.
  Which would be nothing special but...
  DESCRIPTION1

description2 = <<-DESCRIPTION2
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dui urna, dapibus ac massa sed, tincidunt aliquet enim. Quisque tincidunt, magna in vehicula tempor, est ante lacinia odio, vitae consequat lacus dolor sed ex. Phasellus sit amet pulvinar lectus, ut malesuada tellus. 
  DESCRIPTION2

description3 = <<-DESCRIPTION3
Praesent cursus, dolor vel malesuada congue, purus tortor suscipit velit, vel tempor libero sapien ac sapien. Nullam blandit, dui aliquet aliquet euismod, augue sem feugiat dui, eu facilisis nulla justo vel leo.
  DESCRIPTION3

description4 = <<-DESCRIPTION4
Nullam et velit non erat fringilla sollicitudin. Nam nec consectetur libero. Nunc consequat sagittis orci, in pretium mi facilisis et. Interdum et malesuada fames ac ante ipsum primis in faucibus.
DESCRIPTION4

description5 = <<-DESCRIPTION5
Fusce eu est tortor. Duis consequat egestas nulla vitae aliquam. Nullam tempus ligula metus. Sed nec pulvinar urna, et bibendum lectus. Fusce ullamcorper lacinia nisi, at eleifend elit vestibulum sed.
DESCRIPTION5

  products = [
      {name: "tv", description: description1},
      {name: "vcr", description: description2},
      {name: "macbook", description: description3},
      {name: "macbook air", description: description4},
      {name: "mouse", description: description5},
      {name: "chair", description: description1},
      {name: "desk", description: description2},
      {name: "lamp", description: description3},
      {name: "water bottle", description: description4},
      {name: 'test', description: description5}
  ]

10.times do |index|
  Product.create(:name => products[index][:name], :price => Faker::Number.between(1,1500), :description => products[index][:description])

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

