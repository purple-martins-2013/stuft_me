class PlatesController < ApplicationController
  def index
    @all_plates = Plate.all
  end

  def show
    @plate = Plate.find(params[:id])
  end
end
