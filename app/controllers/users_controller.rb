class UsersController < ApplicationController
  def show
    @user = current_user
    @plates = Plate.where(user_id: @user.id)
  end

  def index
    
  end

end
