require "spec_helper"

describe Plate do

  let(:plate) { FactoryGirl.build(:plate) }
  let(:invalid_plate) { FactoryGirl.build(:invalid_plate)}

  it "is valid if url is include" do
    plate.should be_valid
  end

  it "requires a url" do
    invalid_plate.should_not be_valid
  end

  it "validates the uniqueness of a url" do
    plate_two = plate.dup
    plate.save
    plate_two.should_not be_valid
  end

  it { should belong_to(:user) }
  it { should have_many(:drools) }
  it { should have_many(:comments) }
  it { should have_and_belong_to_many(:tags) }

end
