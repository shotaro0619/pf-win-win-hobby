FactoryBot.define do
  factory :hobby do
    name { Faker::Lorem.characters(number: 10) }
    comment { Faker::Lorem.characters(number: 10) }
    user
    genre_id { 1 }
  end
end
