require "spec_helper"

describe User do
  it "requires a username" do
    expect { User.create! }.to raise_error
  end

  it "will automatically populate with the user's token and secret"
end
