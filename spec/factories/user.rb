FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 10) }
    nickname { Faker::Lorem.characters(number: 10) }
    category { "先生" }
    email { Faker::Internet.email }
    password { "xxxxxx" }
    password_confirmation { 'xxxxxx' }
  end
end
