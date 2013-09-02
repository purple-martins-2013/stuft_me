class User < ActiveRecord::Base

  has_many :plates
  has_many :drools

  validates_presence_of :username, :uid, :provider

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["name"]
      user.profile_pic =  Instagram.user(user.uid).profile_picture
    end
  end


  def instagram_url
    Instagram.user_recent_media(self.uid).each do |instagram|
      @instagram_url = instagram.caption.from.username if instagram.caption
    end
    @instagram_url = '//instagram.com/' + @instagram_url if @instagram_url
    @instagram_url ||= "//instagram.com/"
  end

end
