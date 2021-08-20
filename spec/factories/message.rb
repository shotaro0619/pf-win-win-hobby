FactoryBot.define do
  factory :message do
    content { Faker::Lorem.characters(number: 10) }
    user
    room
  end
end