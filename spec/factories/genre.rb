FactoryBot.define do
  factory :genre do
    name { Faker::Lorem.characters(number: 10) }
    label { "音楽系" }
  end
end