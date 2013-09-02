FactoryGirl.define do
  factory :user do
    username "James Dean"
    uid "12345"
    provider "instagram"
    profile_pic "/images/placeholder.jpg"
    profile_url "//instagram.com"
  end
end
