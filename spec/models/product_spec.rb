require 'rails_helper'
driver = Selenium::WebDriver.for :chrome

RSpec.describe Product, type: :model do
  it { should respond_to :description }
  it { should respond_to :inventory }
end
