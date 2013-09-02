# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username: "brianbordainick", uid: "227527731", provider: "instagram")
user = User.create(username: "flavorsonfire", uid: "344832453", provider: "instagram")
user = User.create(username: "cristacalfa", uid: "256327949", provider: "instagram")
user = User.create(username: "xyeeelaine", uid: "2076035", provider: "instagram")
user = User.create(username: "iluvpoets", uid: "183786822", provider: "instagram")
user = User.create(username: "thegreenmamba", uid: "245831518", provider: "instagram")
user = User.create(username: "sandytangy", uid: "22601437", provider: "instagram")
user = User.create(username: "yichuk918", uid: "6665055", provider: "instagram")
user = User.create(username: "mythyhuynh", uid: "7465403", provider: "instagram")



# 10.times do |index|
# 	User.create(username: "FirstUser", uid: "stuff#{index}", provider: "yea#{index}")
# end

# 40.times do |index|
#   Plate.create(user: user, url: "http://gallery.photo.net/photo/175115#{sprintf '%02d', index}-md.jpg", description: "Once in a lifetime #{index}", location: "Walla Walla #{index}", price: "Bora Bora #{index}")
# end

# def self.create_with_omniauth(auth)
#     create! do |user|
#       user.provider = auth["provider"]
#       user.uid = auth["uid"]
#       user.username = auth["info"]["name"]
#       user.profile_pic =  Instagram.user(user.uid).profile_picture
#     end
#   end

#   def instagram_url
#     # Instagram.user_recent_media(self.uid).each do |instagram|
#     #   @instagram_url = instagram.caption.from.username if instagram.caption
#     # end
#     # @instagram_url = '//instagram.com/' + @instagram_url if @instagram_url
#     @instagram_url ||= "//instagram.com/"
#   end