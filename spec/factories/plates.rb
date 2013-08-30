FactoryGirl.define do

  factory :plate do |f|
    f.url { Faker::Internet.url }
    f.description { Faker::Company.bs }
    f.location { Faker::Company.bs }
    f.price { Faker::Company.bs }
    f.user_id { 1 }
  end

  factory :invalid_plate, parent: :plate do |f|
    f.url nil
  end
end
