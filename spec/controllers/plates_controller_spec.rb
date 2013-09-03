require 'spec_helper'

describe PlatesController do

  describe "GET #index" do
    let(:plate) { FactoryGirl.create :plate }
    it "populates an array of plates" do
      get :index
      assigns(:plates).should eq([plate])
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
        PlatesController.stub(:unique_instagram_urls_for).with(user).and_return(instagram_urls)
        get :new
      end
      it "renders the :new template" do
        response.should render_template("new")
      end
      it "assigns @instagram_urls from the InstagramService" do
        expect(assigns(:instagram_urls)).to eq [["http://distilleryimage6.s3.amazonaws.com/766bc54c96f011e2967b22000aa80146_7.jpg", "Just for FUN"]]
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

  describe "GET #edit" do
    let(:plate) { FactoryGirl.create(:plate)}
    it "renders a json plate object" do
      get :edit, id: plate.id
      _expected = plate.to_json
      response["description"] == _expected["description"]
    end
  end

  describe "PUT #update" do
    before(:each) do
      @plate = FactoryGirl.create(:plate)
      put :update, id: @plate.id, tokens: "Russian,Indian,Chinese,American,Thai", plate_url: "http://www.google.com", plate_description: "A quick plate", plate_location: "San Francisco", plate_price: "4"
    end

    it "saves plate url" do
      Plate.find(@plate.id).url.should_not eq @plate.url
    end

    it "saves plate description" do
      Plate.find(@plate.id).description.should_not eq @plate.description
    end

    it "saves plate location" do
      Plate.find(@plate.id).description.should_not eq @plate.description
    end

    it "saves plate price" do
      Plate.find(@plate.id).price.should_not eq @plate.price
    end

    it "creates new tags" do
      Tag.all.length.should eq 5
    end

    it "saves tags for the given plate" do
      Plate.find(@plate.id).tags.length.should eq 5
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @plate = FactoryGirl.create(:plate)
      @user = FactoryGirl.create(:user)
      @plate.user_id = @user.id
      @plate.save
    end

    it "does not destroy a plate if the incorrect user is logged in" do
      delete :destroy, id: @plate.id
      Plate.all.length.should eq 1
    end

    it "fails to render the user profile without a signed in user" do
      response.should_not render_template(user_path(@user.id))
    end
  end

  describe "GET #get_tags" do
    before(:each) do
      @plate = FactoryGirl.create(:plate)
      @plate.tags << Tag.create(name: "Lollipop")
    end

    it "renders a json tags object" do
      get :get_tags, id: @plate.id
      _expected = @plate.ordered_tags.to_json
      response["Lollipop"] == _expected["Lollipop"]
    end
  end

  describe "POST #create" do
    let(:plate) { FactoryGirl.build(:plate) }
    context "when logged in" do 
      include LoginHelper
      let(:user) { FactoryGirl.create(:user)}
      before { login_as(user) }

      context "with unique url" do
        it "saves the new plate for the user" do
          plate.user = user
          plate.save
          post :create, plate_url: plate.url, :tokens => ""
          user.plates.first.url.should eq plate.url
        end
      end


      context "with repeat url" do
        it "does not save the new plate in the database" do
          duplicate_plate = FactoryGirl.create :plate, url: plate.url
          post :create, plate_url: plate.url, :tokens => ""
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

  describe "drool" do

    context "drool and undrool count" do
      before(:each) do
        @plate = FactoryGirl.create(:plate)
        @user = FactoryGirl.create(:user)
      end
    end

    context "drool creation" do
    end

    context "rendering" do
    end

  end

end
