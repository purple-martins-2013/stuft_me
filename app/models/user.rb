class User < ActiveRecord::Base

  has_many :plates
  has_many :drools
  has_many :comments

  validates_presence_of :username, :uid, :provider

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["name"]
    end
  end

  def profile_pic
    Instagram.user_recent_media(self.uid).each do |instagram|
      @profile_pic = instagram.caption.from.profile_picture if instagram.caption
    end
    @profile_pic ||= "/images/placeholder.jpg"
  end

  def instagram_url
    Instagram.user_recent_media(self.uid).each do |instagram|
      @instagram_url = instagram.caption.from.username if instagram.caption
    end
    @instagram_url = '//instagram.com/' + @instagram_url if @instagram_url
    @instagram_url ||= "//instagram.com/"
  end

end
