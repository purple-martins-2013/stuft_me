require "spec_helper"

describe Plate do
  it "requires a url" do
    expect { Plate.create! }.to raise_error
  end

end
