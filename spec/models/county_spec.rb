require 'rails_helper'

RSpec.describe County, :type => :model do

  subject {
    described_class.new(
        name: "County A",
        tax: 10,
        mark_up: 30
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

  it "is not valid without tax" do
    subject.tax = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without mark_up" do
    subject.mark_up = nil
    expect(subject).to_not be_valid
  end

end
