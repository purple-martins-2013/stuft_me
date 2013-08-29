class PlatesController < ApplicationController
  def index
    @all_plates = Plate.all
  end

  def show
    @plate = Plate.find(params[:id])
  end

  def new
    current_user
    @instagrams = Instagram.user_recent_media(current_user.uid) if current_user
    @instagram_urls = @instagrams.map {|instagram| instagram.images.standard_resolution.url}
    plate_urls = Plate.all.map {|plate| plate.url}
    @instagram_urls -= plate_urls
  end

  def create
    @user = current_user
    Plate.create(url: params[:plate_url], description: params[:plate_description], location: params[:plate_location], price: params[:plate_price], user_id: @user.id)
  end
end

