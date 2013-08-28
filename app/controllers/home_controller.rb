class HomeController < ApplicationController
  def index
    @instagram = Instagram.user_recent_media("21484856", :count => 1)
  end
end
