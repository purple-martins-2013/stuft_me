require "spec_helper"

describe Tag do

  it {should validate_presence_of(:name)}

  context "#initialize" do
    it "Downcases the name of the tag before saving" do
      tag = Tag.create(name: "This Is A Tag")
      tag.name.should eq "this is a tag"
    end
  end

  context "#tokens" do

    before do
      @great = Tag.create(name:'great')
      @yellow = Tag.create(name:'yellow')
      @green = Tag.create(name:'green')
    end

    it "returns an array" do
      Tag.tokens('query').class.should eq Array
    end

    it "returns an array with the existing matching tags" do
      Tag.tokens('Gre').should include(@great, @green)
    end

    it "doesn't return non matching tags" do
      Tag.tokens('Gre').should_not include(@yellow)
    end

    it "suggest creation of a new tag if the tag doesn't exist yet" do
      Tag.tokens('White').should include({:id=>"White", :name=>"New: White"})
    end
  end
end