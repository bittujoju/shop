require 'rails_helper'

RSpec.describe Product, :type => :model do

  subject {
    described_class.new(
        brand: Brand.new,
        name: "Product A",
        cost_price: 20
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid Name" do
    subject.name = "$$AAddd III%"
    expect(subject).to_not be_valid
  end

  it "is not valid without a cost price" do
    subject.cost_price = nil
    expect(subject).to_not be_valid
  end

end
