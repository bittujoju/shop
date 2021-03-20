require 'rails_helper'

RSpec.describe Item, :type => :model do

  subject {
    described_class.new(
        product: Product.new(name: "Product A", cost_price: 20),
        county: County.new(name: "Adams", tax: 12, mark_up: 10),
        sale: Sale.new,
        quantity: 100
        )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a quantity" do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a product" do
    subject.product = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a county" do
    subject.county = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a sale" do
    subject.sale = nil
    expect(subject).to_not be_valid
  end

  it "returns products name as its name" do
    expect(subject.name).equal? "Product A"
  end

  it "set right amount as cost price" do
    expect(subject.cost_price).equal? 20*10
  end

  it "returns right amount for price" do
    subject.set_selling_price
    expect(subject.price).equal? 200 * 1.1
  end

  it "returns right amount for tax" do
    subject.set_selling_price
    subject.set_tax
    expect(subject.tax).equal? 220 * 0.12
  end
end
