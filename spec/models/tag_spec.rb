require "spec_helper"

describe Tag do

  it {should validate_presence_of(:name)}

  context "#tokens" do

    before do
      @blue = Tag.create(name:'Blue')
      @yellow = Tag.create(name:'Yellow')
      @green = Tag.create(name:'Green')
    end

    it "returns an array" do
      Tag.tokens('query').class.should eq Array
    end

    it "returns an array with the existing matching tags" do
      Tag.tokens('e').should include(@blue, @green)
    end

    it "doesn't return non matching tags" do
      Tag.tokens('e').should_not include(@yellow)
    end

    it "suggest creation of a new tag if the tag doesn't exist yet" do
      Tag.tokens('White').should include({:id=>"White", :name=>"New: White"})
    end
  end
end