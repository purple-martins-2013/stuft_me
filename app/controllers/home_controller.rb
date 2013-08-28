class HomeController < ApplicationController
  def index
    @instagram = Instagram.user_recent_media(21484856)
  end
end
