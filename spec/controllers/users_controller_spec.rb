require 'spec_helper'

describe UsersController do

  let(:valid_user) { FactoryGirl.create(:user) }
  let(:invalid_user) { FactoryGirl.build(:user) }

  user2 = FactoryGirl.build(:user)
  puts "*"*50
  p user2

  describe "GET #show" do
    context "When User is invalid" do
      it "should raise error" do
       expect { get :show , :id => invalid_user.id }.to raise_error
      end 
    end

    context "When User is valid" do
      it "should render the #show view" do
        get :show, id: valid_user.id
        response.should render_template :show
      end
    end
  end

  describe "GET #index" do
    it "should render the #index view" do
      get :index
      response.should render_template :index
    end 
  end
end

