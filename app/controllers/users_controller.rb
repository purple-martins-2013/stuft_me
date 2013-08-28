class UsersController < ApplicationController
  def show
    current_user
    @instagram = Instagram.user_recent_media(current_user.uid) if current_user
  end

  def index
    
  end

end
