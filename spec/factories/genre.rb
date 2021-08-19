FactoryBot.define do
  factory :genre do
    name { Faker::Lorem.characters(number: 10) }
    label { Faker::Lorem.characters(number: 10) }
  end
end