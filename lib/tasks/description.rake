namespace :db do
  desc 'add product description'
  task description: :environment do
    Product.all.each do |product|
      des = @des[rand(0..5)]
      product.description = des
      product.save
    end
  end
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
  