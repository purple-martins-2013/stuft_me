class User < ActiveRecord::Base

  has_many :plates
  has_many :drools
  has_many :comments

  validates_presence_of :username, :uid, :provider, :profile_pic, :profile_url

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["name"]
      user.profile_pic =  Instagram.user(user.uid).profile_picture || "/images/placeholder.jpg"
      user.profile_url = "//instagram.com/" + (user.username || "")
    end
  end
end
