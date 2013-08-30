class User < ActiveRecord::Base

  has_many :plates

  validates_presence_of :username, :uid, :provider

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["name"]
    end
  end

  def profile_pic
    Instagram.user_recent_media(self.uid).last.caption.from.profile_picture
  end

  def instagram_url
    '//instagram.com/' + Instagram.user_recent_media(self.uid).last.caption.from.username
  end

end
