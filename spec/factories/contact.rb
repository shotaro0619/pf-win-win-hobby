FactoryBot. define do
  factory :contact do
    name { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    phone_number { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    message { Faker::Lorem.characters(number: 30) }
  end
end