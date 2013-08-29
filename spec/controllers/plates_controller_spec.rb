require 'spec_helper'

describe PlatesController do

  describe "GET #index" do
    it "populates an array of plates"
    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested plate to @plate"
    it "renders the :show template"
  end

  describe "GET #new" do
    it "requests the correct URLs from Instagram API"
    it "removes URLs that have already been plated"
    it "renders the :new template"
  end

  describe "POST #create" do
    context "with unique url" do
      it "saves the new plate in the database"
      it "stays on the same page"
    end

    context "with repeat url" do
      it "does not save the new plate in the database"
      it "stays on the same page"
    end
  end
  
end