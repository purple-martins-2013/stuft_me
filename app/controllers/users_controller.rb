class UsersController < ApplicationController
  def show
    @user = current_user
    @plates = Plate.find_all_by_user_id(@user.id)
  end

  def index
    
  end

end
