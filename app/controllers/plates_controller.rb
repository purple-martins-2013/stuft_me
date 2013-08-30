class PlatesController < ApplicationController
  before_filter :check_logged_in!, only: [:create, :new]

  def index
    @all_plates = Plate.all
  end

  def show
    @plate = Plate.find(params[:id])
  end

  def new
    @instagram_urls = InstagramService.unique_instagram_urls_for(current_user)
  end

  def create
    @user = current_user
    current_user.plates.create(url: params[:plate_url], description: params[:plate_description], location: params[:plate_location], price: params[:plate_price])
  end
end

