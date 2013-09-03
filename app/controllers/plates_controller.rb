class PlatesController < ApplicationController
  before_filter :check_logged_in!, only: [:create, :new]
  respond_to :html, :json

  def index
    @plates = Plate.all
    @all_plates = @plates.order(:drool_count).reverse
  end

  def show
    @plate = Plate.find(params[:id])
  end

  def new
    @instagram_urls = unique_instagram_urls_for(current_user)
  end

  def create
    plate = current_user.plates.create(url: params[:plate_url], description: params[:plate_description], location: params[:plate_location], price: params[:plate_price])
    plate.add_tags(params[:tokens])
    plate.save
  end

  def edit
    @plate = Plate.find(params[:id])
    render json: @plate
  end

  def update
    plate = Plate.find(params[:id])
    plate.url, plate.description, plate.location, plate.price = params[:plate_url], params[:plate_description], params[:plate_location], params[:plate_price]
    plate.add_tags(params[:tokens])
    plate.save
    render nothing: true
  end

  def destroy
    plate = Plate.find(params[:id])
    plate.destroy if plate.user == current_user
    render "users/show"
  end

  def get_tags
    plate = Plate.find(params[:id])
    render json: (plate.ordered_tags)
  end

  def drool
    @plate = Plate.find(params[:id])

    @plate.drool_count += 1
    @plate.save
    drool = Drool.find_by_user_id_and_plate_id(current_user.id, @plate.id)
    if drool
      drool.drool_status = true
      drool.save
    else
      drool = Drool.create(user_id: current_user.id, plate_id: @plate.id, drool_status: true)
    end

    render :partial => 'drool_bar'
  end

  def undrool
    @plate = Plate.find(params[:id])

    @plate.drool_count -= 1
    @plate.save

    drool = Drool.find_by_user_id_and_plate_id(current_user.id, @plate.id)
    drool.drool_status = false
    drool.save

    render :partial => 'drool_bar'
  end

  def comment
    @plate = Plate.find(params[:id])
    @plate.comments.create(content: params[:content])
    render nothing: true
  end
end

