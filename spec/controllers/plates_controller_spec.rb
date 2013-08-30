require 'spec_helper'

describe PlatesController do



  describe "GET #index" do
    let(:plate) { FactoryGirl.create :plate }
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
    let(:plate) { FactoryGirl.create :plate }
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
    context "When logged in" do
      include LoginHelper
      let(:user) { FactoryGirl.create(:user)}
      let(:instagram_urls) { ["url1", "url2"] }
      before(:each) do
        login_as(user)
        InstagramService.stub(:unique_instagram_urls_for).with(user).and_return(instagram_urls)
        get :new
      end
      it "renders the :new template" do
        response.should render_template("new")
      end
      it "assigns @instagram_urls from the InstagramService" do
        expect(assigns(:instagram_urls)).to eq instagram_urls
      end
    end
    context "when not logged in" do
      it "redirects to the root path" do
        post :new
        response.should redirect_to(root_path)
      end

      it "flashes a you must signin to create a plate" do
        post :new
        flash[:error].should eq 'You must be signed in to do that!'
      end
    end
  end

  describe "POST #create" do
    let(:plate) { FactoryGirl.build :plate }
    context "when logged in" do 
      include LoginHelper
      let(:user) { FactoryGirl.create(:user)}
      before { login_as(user) }
      context "with unique url" do
        it "saves the new plate for the user" do
          post :create, plate_url: plate.url
          user.plates.first.url.should eq plate.url
        end
      end


      context "with repeat url" do
        it "does not save the new plate in the database" do
          duplicate_plate = FactoryGirl.create :plate, url: plate.url
          post :create, plate_url: plate.url
          Plate.all.length.should eq 1
        end
      end
    end

    context "when not logged in" do
      it "redirects to the root path" do
        post :create, plate_url: plate.url
        response.should redirect_to(root_path)
      end

      it "flashes a you must signin to create a plate" do
        post :create, plate_url: plate.url
        flash[:error].should eq 'You must be signed in to do that!'
      end
    end
  end

end
