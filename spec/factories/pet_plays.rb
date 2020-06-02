FactoryBot.define do
  factory :pet_play do
    association :user

    title { Faker::Book.title }
    pet_players { "List of users attending" }
    location { "Burberry Park" }
  end
end
