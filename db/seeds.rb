# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username: "FirstUser", uid: "stuff", provider: "yea")

10.times do |index|
	User.create(username: "FirstUser", uid: "stuff#{index}", provider: "yea#{index}")
end

40.times do |index|
  Plate.create(user: user, url: "http://gallery.photo.net/photo/175115#{sprintf '%02d', index}-md.jpg", description: "Once in a lifetime #{index}", location: "Walla Walla #{index}", price: "Bora Bora #{index}")
end

