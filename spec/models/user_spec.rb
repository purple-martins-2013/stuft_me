require "spec_helper"

describe User do

  let (:mock_omniauth) { {"provider" => "instagram", "uid" => "1234567", "info" => { "name" => "test-user"}}}

  context '#create_with_omniauth' do

    it "creates a new user" do
      User.create_with_omniauth(mock_omniauth)
      new_user = User.find_by_username("test-user")
      new_user.should_not be nil
    end

    it "does not create a user if username is missing" do
      mock_omniauth["info"]["name"] = nil
      expect { User.create_with_omniauth(mock_omniauth) }.to raise_error(ActiveRecord::RecordInvalid)
    end

     it "does not create a user if uid is missing" do
      mock_omniauth["uid"] = nil
      expect { User.create_with_omniauth(mock_omniauth) }.to raise_error(ActiveRecord::RecordInvalid)
    end

     it "does not create a user if username is missing" do
      mock_omniauth["provider"] = nil
      expect { User.create_with_omniauth(mock_omniauth) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

end
