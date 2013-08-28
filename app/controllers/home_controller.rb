class HomeController < ApplicationController
  def index
    current_user
    @instagram = Instagram.user_recent_media(current_user.uid) if current_user
  end
end
