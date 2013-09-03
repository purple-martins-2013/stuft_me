# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include ApplicationHelper

SampleUsers = [
  {username: "ashrod", provider: "instagram", uid: "3956455"},
  {username: "cannellevanille", provider: "instagram", uid: "3619966"},
  {username: "alxgrossmn", provider: "instagram", uid: "52757402"},
  {username: "topwithcinnamon", provider: "instagram", uid: "32655024"},
  {username: "julieskitchen", provider: "instagram", uid: "1357551"},
  {username: "idafrosk", provider: "instagram", uid: "582820"},
  {username: "aprilbloomfield", provider: "instagram", uid: "26494772"},
  {username: "tracyshutterbean", provider: "instagram", uid: "28599339"},
  {username: "davidlebovitz", provider: "instagram", uid: "2209896"},
  {username: "sternmanrule", provider: "instagram", uid: "6247873"},
  {username: "doriegreenspan", provider: "instagram", uid: "9960677"},
  {username: "jamieoliver", provider: "instagram", uid: "3532778"},
  {username: "eeddbbmm", provider: "instagram", uid: "1840409"},
  {username: "thekitchn", provider: "instagram", uid: "386916469"},
]

SampleUsers.each do |sample_user|
  sample_user[:profile_pic] = Instagram.user(sample_user[:uid]).profile_picture
  sample_user[:profile_url] = "//instagram.com/" + sample_user[:username]
  User.create(sample_user)
end

User.all.each do |user|
  unique_instagram_urls_for(user).each do |url|
    user.plates.create(url: url[0], drool_count: rand(975), description: ["Ratatouille", "Mom's Homemade Lasagna", "Corn on the Cob", "Raspberry Pie"].sample, location: ["Outback Steakhouse", "Cheesecake Factory", "California Pizza Kitchen", "Nobu"].sample)
  end
end