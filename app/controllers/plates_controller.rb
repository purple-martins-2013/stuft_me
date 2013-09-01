class PlatesController < ApplicationController
  before_filter :check_logged_in!, only: [:create, :new]

  def index
    @all_plates = Plate.all
    Tag.find_or_create_by(name: "Indian")
    Tag.find_or_create_by(name: "Spanish")
    Tag.find_or_create_by(name: "Tibetan")
  end

  def show
    @plate = Plate.find(params[:id])
  end

  def new
    @instagram_urls = unique_instagram_urls_for(current_user)
  end

  def create
    @user = current_user
    new_tags = []
    params[:plate_tags].each {|tag| new_tags << Tag.find_or_create_by(name: tag)}
    new_plate = current_user.plates.create(url: params[:plate_url], description: params[:plate_description], location: params[:plate_location], price: params[:plate_price], tags: new_tags)
  end

  def drool
    @plate = Plate.find(params[:id])

    @plate.drool_count += 1

    Drool.create(user_id: current_user.id, plate_id: @plate.id, drool_status: true)
    #current_user.drool!(@plate)
    redirect_to plate_path(@plate)
  end

  def undrool
    @plate = Plate.find(params[:id])
    current_user.undrool(@plate)
    redirect_to plate_path(@plate)
  end
end

