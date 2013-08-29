require 'spec_helper'

describe PlatesController do

  let(:plate) { FactoryGirl.create :plate }

  describe "GET #index" do

    it "populates an array of plates" do
      get :index
      assigns(:all_plates).should eq([plate])
    end
    it "renders the :index view" do
      get :index
      response.should render_template("index")
    end

  end

  describe "GET #show" do
    it "assigns the requested plate to @plate" do
      get :show, id: plate.id
      assigns(:plate).should eq(plate)
    end
    it "renders the :show template" do
      get :show, id: plate.id
      response.should render_template("show")
    end
  end

  describe "GET #new" do

    before(:each) do
      controller.stub_chain(:current_user, :uid).and_return("13171423")
      get :new
    end

    it "requests the correct URLs from Instagram API" do
      assigns(:instagrams).length > 0
    end
    it "removes URLs that have already been plated" do
      assigns(:instagrams).length > assigns(:instagram_urls).length
    end
    it "renders the :new template" do
      response.should render_template("new")
    end
  end

  describe "POST #create" do
    include LoginHelper
    let(:user) { FactoryGirl.create(:user)}
    before { login_as(user) }
    context "with unique url" do
      it "saves the new plate in the database" do
        post :create, plate_url: plate.url+"z"
        Plate.all.length.should eq 2
      end
    end

    context "with repeat url" do
      it "does not save the new plate in the database" do
        post :create, plate_url: plate.url
        Plate.all.length.should eq 1
      end
    end

    context "with user id" do
      it "saves the plate with the user id" do
        plate.user_id.should eq 1
      end
    end
  end

end
