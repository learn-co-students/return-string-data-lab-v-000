require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should respond_to :description }
  it { should respond_to :inventory }
end
