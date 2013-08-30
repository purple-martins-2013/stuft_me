require 'spec_helper'

describe SessionsController do

  before { request.env["omniauth.auth"] = omniauth_credentials }
  let(:uid_code) {1234567}

  let(:omniauth_credentials) { {"provider" => "instagram", "uid" => uid_code, "info" => { "name" => "test-user"}} }
  

  describe 'POST #create' do
    context 'When ommiauth.auth is invalid' do
      let(:omniauth_credentials) { {"provider" => nil, "uid" => nil, "info" => { "name" => nil}} } 
      it "should raise an error " do      
        expect{post :create , :provider => "instagram" }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'When #create is successful' do
      it "user is created in database" do
        post :create , :provider => "instagram"
        User.find_by_uid(uid_code).should_not be_nil
      end

      it "user id is stored in session" do
        post :create , :provider => "instagram"
        session[:user_id].should_not be_nil
      end
    end
  end

  describe 'DELETE #destroy' do
    it "should set session[:user_id] to nil" do
      post :create , :provider => "instagram"
      session[:user_id].should_not be_nil 
      delete :destroy
      session[:user_id].should be_nil 
    end
  end

end
