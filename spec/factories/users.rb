FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    image { "string" }
    zipcode { Faker::Number.number(digits: 5) }
  end
end