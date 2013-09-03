require "spec_helper"

describe "views" do
  let(:user) { FactoryGirl.create(:user) }
  before(:each) do
    2.times do |index|
      FactoryGirl.create(:plate, user: user)
    end
  end

  let(:all_plates)  { Plate.all }
  let(:plate) { Plate.last }

  describe "plates/index" do

    it "should allow users to click on plates for more information" do
      visit root_path
      click_link("#{plate.id}")
      expect(current_url).to eq plate_path(plate)
    end
  end

  describe "plates/show" do
    before(:each) do
      visit plate_path(plate)
    end

    it "shows plate information" do
      page.should have_content plate.description
      page.should have_content plate.location
      expect(page).to have_selector('#star3.active_star')
    end
  end

end
