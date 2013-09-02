require "spec_helper"

describe User do


  it {should validate_presence_of(:provider)}
  it {should validate_presence_of(:uid)}
  it {should validate_presence_of(:username)}
  it {should have_many(:plates)}
  it {should have_many(:drools)}

  context '#create_with_omniauth' do

    let (:mock_omniauth) { {"provider" => "instagram", "uid" => "1234567", "info" => { "name" => "test-user"}}}

    it "creates a new user" do
      User.create_with_omniauth(mock_omniauth)
      User.find_by_username("test-user").should_not be nil
    end
  end

  context 'Profile picture placeholder' do
    it "has a valid placeholder in case user doesn't have a profile picture" do
      File.exists?(File.expand_path( Rails.root + 'public/images/placeholder.jpg')).should be_true
    end
  end
end
