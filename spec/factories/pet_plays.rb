FactoryBot.define do
  factory :pet_play do
    association :user

    title { Faker::Book.title }
    pet_players { user.id }
    location { "Burberry Park" }
  end
end
