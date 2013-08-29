class PlatesController < ApplicationController
  def index
    @all_plates = Plate.all
  end

  def show
    @plate = Plate.find(params[:id])
  end

  def new
    current_user
    @instagram = Instagram.user_recent_media(current_user.uid) if current_user
  end

  def create
    Plate.create(url: params[:url], description: params[:description], location: params[:location], price: params[:price])
  end
end
