require 'rails_helper'

RSpec.describe Brand, :type => :model do

  subject {
    described_class.new(
        name: "Brand A",
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

end
