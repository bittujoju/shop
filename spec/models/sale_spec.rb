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
                                  :cost_price => 10,
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

end
