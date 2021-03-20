require 'rails_helper'

RSpec.describe Item, :type => :model do

  let(:brand) { Brand.create(:name => "Brand A") }
  let(:county) { County.create(:name => "County A",
                               :tax => 12,
                               :mark_up => 10) }
  let(:product1) { Product.create(:name => "Product A",
                                  :cost_price => 20,
                                  :brand => brand) }
  subject {
    described_class.new(
        product: product1,
        county: county,
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
    expect(subject.name).to eq("Product A")
  end

  it "set right amount as cost price" do
    expect(subject.cost_price).to eq(2000)
  end

  it "returns right amount for price" do
    subject.set_selling_price
    expect(subject.price).to eq(2200)
  end

  it "returns right amount for tax" do
    subject.set_selling_price
    subject.set_tax
    expect(subject.tax).to eq(264)
  end
end
