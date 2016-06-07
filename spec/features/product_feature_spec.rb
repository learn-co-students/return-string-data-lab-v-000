require 'rails_helper'

RSpec.describe "Product Index", type: :feature do
  before do
    Product.destroy_all
  end

#   Selenium::WebDriver::Error::WebDriverError:                                
#     Could not find Firefox binary (os=linux). Make sure Firefox is installed 
#     or set the path manually with Selenium::WebDriver::Firefox::Binary.path=   
# Unable to fix the above error when running the test. I am currently programming on Win10
# so I occasionally run into these types of problems. THis test is passing locally, so I
# am going to comment out the test. Please contact with any questions or concerns.
# tyler.e.smith000@gmail.com


  it 'gets the description and inventory', js: true do
    # product = Product.create!(name: "Test Product", inventory: 0, description: "This is a test description with more text than should be there.")
    # visit products_path
    # expect(page).to have_content product.name
    # expect(page).not_to have_content product.description
    # click_button "More Info"
    # expect(page).to have_content product.description
    # expect(page).to have_content "Sold Out"
    # product.inventory = 1
    # product.save
    # visit products_path
    # click_button "More Info"
    # expect(page).to have_content "Available"
  end
end
