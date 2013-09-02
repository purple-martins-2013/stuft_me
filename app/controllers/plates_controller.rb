class PlatesController < ApplicationController
  before_filter :check_logged_in!, only: [:create, :new]

  def index
    @all_plates = Plate.all
  end

  def show
    @plate = Plate.find(params[:id])
  end

  def new
    @instagram_urls = unique_instagram_urls_for(current_user)
  end

  def create
    @user = current_user
    current_user.plates.create(url: params[:plate_url], description: params[:plate_description], location: params[:plate_location], price: params[:plate_price])
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

  def comment
    @plate = Plate.find(params[:id])
    @plate.comments.create(content: params[:content])
    render nothing: true
  end
end

