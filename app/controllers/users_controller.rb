class UsersController < ApplicationController
  def show
    @user = current_user
    @plates = Plate.find_all_by_user_id(@user.id)

    p '*' * 88
    p params
    p "user"
    p @user
    p "plates"
    p @plates
  end

  def index
    
  end

end
