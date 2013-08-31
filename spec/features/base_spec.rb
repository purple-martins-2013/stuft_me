require "spec_helper"

describe "views" do
  let(:user) { FactoryGirl.create(:user) }
  before(:each) do
    2.times do |index|
      Plate.create(user: user, url: "http://gallery.photo.net/photo/175115#{sprintf '%02d', index}-md.jpg", description: "Once in a lifetime #{index}", location: "Walla Walla #{index}", price: "3")
    end
  end

  let(:all_plates)  { Plate.all }
  let(:plate) { Plate.last }

  describe "plates/index" do

    it "should allow users to click on plates for more information" do
      visit root_path
      click_link("#{plate.id}")
      current_url == plate_path(plate)
    end
  end

  describe "plates/show" do
    before(:each) do
      visit plate_path(plate)
    end

    it "shows plate description" do
      page.should have_content plate.description
    end

    it "shows plate location" do
      page.should have_content plate.location
    end

    it "shows plate price" do
      expect(page).to have_selector('#star3.active_star')
    end
  end

end
