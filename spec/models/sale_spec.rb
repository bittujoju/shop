require 'rails_helper'

RSpec.describe Sale, :type => :model do

  let(:brand) { Brand.create(:name => "Brand A") }
  let(:county) { County.create(:name => "County A",
                               :tax => 10,
                               :mark_up => 30) }
  let(:product1) { Product.create(:name => "Product A",
                                 :cost_price => 10,
                                 :brand => brand) }
  let(:product2) { Product.create(:name => "Product B",
                                  :cost_price => 20,
                                  :brand => brand) }
  let(:item1) { Item.new(:product => product1,
                            :quantity => 100,
                            :county => county) }
  let(:item2) { Item.new(:product => product2,
                            :quantity => 100,
                            :county => county) }
  subject {
    described_class.create(
        items: [item1, item2]
        )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "sets right value as sold price" do
    subject.set_sold_price
    expect(subject.sold_price).to eq(3900)
  end

  it "sets right value as tax" do
    subject.set_tax
    expect(subject.tax).to eq(390)
  end

  it "sets right value as profit" do
    subject.set_profit
    expect(subject.profit).to eq(3900 - (390 + 3000))
  end

end
