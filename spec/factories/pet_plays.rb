FactoryBot.define do
  factory :pet_play do
    association :user

    title { Faker::Book.title }
    pet_players { user.id }
    location { "Burberry Park" }
    date { "10/02/2020" }
    time { "10:00 AM" }
  end
end
