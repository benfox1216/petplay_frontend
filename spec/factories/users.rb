FactoryBot.define do
  factory :user do
    # association :pet
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    image { "string" }
  end
end